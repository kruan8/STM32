/**
  ******************************************************************************
  * @file    HwtTimer.c
  * @author  Tejas H
  * @version V1.0.0
  * @date
  * @brief   Hardware timer that call's interupt every 1ms and process the timer dependent services.
  *   Interrupt routine for SysTick timer ensures LED blinking.
  *  How is this different from SWT timer?:
  * 		 	In HWT timer on reaching service count zero the function is immediately executed,
  * 		 	but in SWT timer the counter is decremented till 0, on reaching 0 the function is not executed immediately but waits for
  * 		 	routine call in while loop SwtExec
  ******************************************************************************
  */


/*Includes*********************************************************************/
#include <string.h>
#include "HwtTimer.h"
#include "share_f4/common.h"

/*Variables*******************************************************************/
static volatile HWT_SERVICE HwtServices[HWT_MAX_SERVICES_COUNT];
static volatile uint8_t HwtServicesCount = 0;
static volatile bool bHwtInit = false;

static volatile uint32_t nDelayTimer;
static volatile uint32_t nTicks;			// pocet 1ms ticku od startu programu (vynuluje se po 49 dnech!!!)

static GPIO_TypeDef* g_LedGpio;
static uint16_t g_LedPin;
static volatile uint16_t g_LedBlinkCounter;

/*Functions*******************************************************************/

/*******************************************************************************
* Function Name  :
* Description    : Interrupt function, executes functions in que
* Input          : None
* Return         : None
*******************************************************************************/

// Interrupt function for timer
/*REVIEW COMMENT: rename below function name with timer IRQ function name, and ensure the timer is configured to generater interrupt every 1ms*/
void SysTick_Handler(void)
{
	/*Increment the count of every service added and process the function after reaching service count*/
	for (uint8_t loopCnt = 0; loopCnt < HwtServicesCount; loopCnt++)
	{
		if (HwtServices[loopCnt].Enable == true)
		{
			HwtServices[loopCnt].Counter--;
			if (HwtServices[loopCnt].Counter == 0)										//Number of counts reached
			{
				HwtServices[loopCnt].Counter = HwtServices[loopCnt].Period;
				HwtServices[loopCnt].Func();											//service the function
			}
		}
	}

	// obsluha Delay funkce
	if (nDelayTimer)
	{
		nDelayTimer--;
	}

	// ticks 1ms
	nTicks++;

	if (g_LedGpio)
	{
	  g_LedBlinkCounter++;
	  if (g_LedBlinkCounter > 500)
	  {
	    g_LedGpio->ODR ^= g_LedPin;
	    g_LedBlinkCounter = 0;
	  }
	}
}

/*******************************************************************************
* Function Name  : HwtInit
* Description    : Peripheral timer initialisation for 1ms interrupt and initialisation of structure values
* Input          : None
* Return         : None
*******************************************************************************/

void HwtInit(GPIO_TypeDef* LedGpio, uint16_t LedPin)
{
	//maintains the count of functions in HWT que, so needs to be cleared on initialisation
	HwtServicesCount = 0;
	nTicks = 0;
	g_LedGpio = LedGpio;
	g_LedPin = LedPin;
	     
	/*Initialise all structure value to Null */
	for (uint8_t loopCnt = 0; loopCnt < HWT_MAX_SERVICES_COUNT; loopCnt++)
	{
		HwtServices[loopCnt].Enable = false;
		HwtServices[loopCnt].Counter = 0;
		HwtServices[loopCnt].Period = 0;
		HwtServices[loopCnt].Func = NULL;
	}
        
	// this flag is used while inserting the function to que to ensure the array was cleaned on first startup
  bHwtInit = true;

	// Initialize hardware timer to produce 1ms interrupt
	SystemCoreClockUpdate(); // nastavi spravne 'SystemCoreClock'
	if (SysTick_Config(SystemCoreClock / 1000)) // nastavi prioritu preruseni na 15 (nizka)
	{
	   while (1);
	}

	// configure LED port
	if (g_LedGpio)
	{
	  SetGpioClock(g_LedGpio, ENABLE);

	  GPIO_InitTypeDef GPIO_InitStructure;
    GPIO_InitStructure.GPIO_Pin = g_LedPin;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_Init(g_LedGpio, &GPIO_InitStructure);
	}
}

/*******************************************************************************
* Function Name  : HwtInsertService
* Description    : Add service to be executed on timer interrupt
* Input          : pointer function: that needs to be called for the service
* 				   period : time delay from enabling to the instance before calling the pointer function
* 				   Enable : function execution control
* 				   			-True: Execute
* 				   			-False: Dont Execute
* Return         : Service insertion result
* 					-True : Service inserted
* 					-False: could'nt insert service
*******************************************************************************/

bool HwtInsertService(VOID_FUNC Func, uint32_t Period, bool Enable)
{
	if (HwtServicesCount >= HWT_MAX_SERVICES_COUNT || bHwtInit == false)					//check for max service count and initialisation status
	{
		return false;
	}

	else 													//Service count has not exceeded max service and initialisation done
	{
		HwtServices[HwtServicesCount].Enable = Enable;
		HwtServices[HwtServicesCount].Counter = Period+1;
		HwtServices[HwtServicesCount].Period = Period;
		HwtServices[HwtServicesCount].Func = Func;

		HwtServicesCount++;

		return true;
	}
}

/*******************************************************************************
* Function Name  : HwtRemoveService
* Description    : Remove service from the Que
* Input          : pointer function of ther service to be removed
* Return         : Service removal Result
* 					-True: Service Removed
* 					-False: Service not found/ not removed
*******************************************************************************/

bool HwtRemoveService(VOID_FUNC Func)
{
	uint8_t LastItemIndex = HwtServicesCount - 1;

	/*Loop to check the function  in all added services to remove it*/
	for (uint8_t loopCnt = 0; loopCnt < HwtServicesCount; loopCnt++)
	{
		if (HwtServices[loopCnt].Func == Func)											//function to be removed found
		{
			//Todo:disable base timer interrupt used for hardware timer

			if (loopCnt != LastItemIndex)												// if the function to be removed is not last item index'd replace it with last item indexed
			{
				HwtServices[loopCnt].Enable = HwtServices[LastItemIndex].Enable;
				HwtServices[loopCnt].Counter = HwtServices[LastItemIndex].Counter;
				HwtServices[loopCnt].Period = HwtServices[LastItemIndex].Period;
				HwtServices[loopCnt].Func = HwtServices[LastItemIndex].Func;
			}

			/* clear last item indexed*/
			HwtServices[LastItemIndex].Enable = false;
			HwtServices[LastItemIndex].Counter = 0;
			HwtServices[LastItemIndex].Period = 0;
			HwtServices[LastItemIndex].Func = NULL;
			HwtServicesCount--;

			//Todo:enable interrupt, for other service to function correctly

			return true;
		}
	}

	return false;
}


/*******************************************************************************
* Function Name  : HwtGetEnable
* Description    : Returns the enable state of the function requested
* Input          : pointer function
* Return         : Enable status
* 					-True: Requested pointer function is enabled
* 					-False: Requested pointer function is disabled
*******************************************************************************/

bool HwtGetEnable(VOID_FUNC Func)
{
	/*loop to check for function in  all added services*/
	for (uint8_t loopCnt = 0; loopCnt < HwtServicesCount; loopCnt++)
	{
		if (HwtServices[loopCnt].Func == Func)											//if function requested match the function of service
		{
			return  HwtServices[loopCnt].Enable;										// Return the enable status of the function
		}
	}

	return false;
}


/*******************************************************************************
* Function Name  : HwtSetEnable
* Description    : Enables or disable the function already added in the service que
* Input          : pointer function of which enable status has to be changed
* 				   Boolean state: new state
* 				   	True- Enables
* 				   	False- Disables
* Return         : change of enable state
* 					True- Changes Successful
* 					False- Changes could not happen
*******************************************************************************/

bool HwtSetEnable(VOID_FUNC Func, bool Enable)
{
	/*loop to check for function in  all added services*/
	for (uint8_t loopCnt= 0; loopCnt < HwtServicesCount; loopCnt++)
	{
		if (HwtServices[loopCnt].Func == Func)											//if function requested match the function of service
		{
			HwtServices[loopCnt].Counter = HwtServices[loopCnt].Period+1;
			HwtServices[loopCnt].Enable = Enable;										//New state : Enable or Diable
			return true;
		}
	}

	return false;
}

/*******************************************************************************
* Function Name  : HwtSetPeriod
* Description    : Sets/Changes the period of service already added in Que
* Input          : pointer function of which period has to be changed
* 				   Period : New Period
* 				   Boolean state:
* 				   	-True: Enabled
* 				   	-False : Disabled
* Return         : change result
* 					True:Changes successful
* 					False:Changes Not Successful
*******************************************************************************/

bool HwtSetPeriod(VOID_FUNC Func, uint32_t Period, bool Enable)
{
	/*loop to check for function in  all added services*/
	for (uint8_t loopCnt = 0; loopCnt < HwtServicesCount; loopCnt++)
	{
		if (HwtServices[loopCnt].Func == Func)											//if function requested match the function of service
		{
			HwtServices[loopCnt].Period = Period;										//New period
			HwtServices[loopCnt].Counter = Period+1;
			HwtServices[loopCnt].Enable = Enable;										//New Enbale state
			return true;
		}
	}

	return false;
}

// pro zoufale situace
void HwtDelay_ms(uint32_t delay_ms)
{
	nDelayTimer = delay_ms;
	while (nDelayTimer);
}

/*******************************************************************************
* Function Name  : HwtGetTicks_1ms
* Description    : Gets 1ms ticks count
* Input          : None
* Return         : ticks count
*******************************************************************************/
uint32_t HwtGetTicks_1ms()
{
	return nTicks;
}

/*End of file************************************/
