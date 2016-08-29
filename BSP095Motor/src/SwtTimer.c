/**
  ******************************************************************************
  * @file    H043_SwtTimer.c
  * @author  Tejas H
  * @version V1.0.0
  * @date
  * @brief   This is second layer of HwtTimer, one service of HWT timer serves multiple SWT timer services
  * 		 How is this different from HWT timer?:
  * 		 	In HWT timer on reaching service count zero the function is immediately executed,
  * 		 	but in SWT timer the counter is decremented till 0, on reaching 0 the function is not executed immediately but waits for
  * 		 	routine call in while loop SwtExec
  ******************************************************************************
  */


/*Includes*********************************************************************/
#include <string.h>
#include "SwtTimer.h"
#include "HwtTimer.h"

/*Variables********************************************************************/
static volatile SWT_SERVICE SwtServices[SWT_MAX_SERVICES_COUNT];
static volatile uint16_t SwtServicesCount = 0;
static volatile bool bSwtInit = false;


/*Functions*******************************************************************/


/*******************************************************************************
* Function Name  : SwtOnTimerInterrupt
* Description    : Called by Hwt interrupt as processing the service : modifying this function name needs modification in Hwt add service
* 				   Decrements the count of swt timer and if counter of service hits 0 the function pertaining to that service is executed
* 				   by swt_exec placed in while loop.
* Input          : None
* Return         : None
*******************************************************************************/
void SwtOnTimerInterrupt(void)
{
	/*loop to execute the services in Que*/
	for (uint8_t loopCnt = 0; loopCnt < SwtServicesCount; loopCnt++)
	{
		if (SwtServices[loopCnt].Enable == true)									// if service in cue enabled, Decrement its counter
		{
			if (SwtServices[loopCnt].Counter)
               SwtServices[loopCnt].Counter--;
		}
	}
}

/*******************************************************************************
* Function Name  : SwtInit
* Description    : Initialise SWt timer: inserts Hwt timer service and clears all variable of structure
* Input          : None
* Return         : None
*******************************************************************************/
void SwtInit(void)
{
	SwtServicesCount = 0;

	/*loop to clear all variable of the structure of all services*/
	for (uint8_t loopCnt = 0; loopCnt < SWT_MAX_SERVICES_COUNT; loopCnt++)
	{
		SwtServices[loopCnt].Enable = false;
		SwtServices[loopCnt].Counter = 0;
		SwtServices[loopCnt].Period = 0;
		SwtServices[loopCnt].Func = NULL;
	}

	bSwtInit = HwtInsertService(SwtOnTimerInterrupt, 1, true);				//Insert service to Hwt timer, this calls SwtOnTimerInterrupt function every 1ms
}


/*******************************************************************************
* Function Name  : SwtInsertService
* Description    : Insert Service to served on swt timer interrupt
* Input          : pointer function,: function that needs to be called
* 				   period :time period for execution
* 				   Enable status
* 				   	True- function enabled
* 				   	False- Funcion disabled
*
* Return         : Insert Result
* 					True- Service inserted successfully
* 					False-Service was not inserted
*******************************************************************************/
bool SwtInsertService(VOID_FUNC Func, uint32_t Period, bool Enable)
{
	if (SwtServicesCount >= SWT_MAX_SERVICES_COUNT || bSwtInit == false)				// Check for service count has not increased to max services count, and Swt initialised
		return false;

	SwtServices[SwtServicesCount].Enable = Enable;
	SwtServices[SwtServicesCount].Counter = Period+1;
	SwtServices[SwtServicesCount].Period = Period;
	SwtServices[SwtServicesCount].Func = Func;

	SwtServicesCount++;																//After addition increment the counter

	return true;
}


/*******************************************************************************
* Function Name  : H043_SwtRemoveService
* Description    : Remove services from the que
* Input          : pointer function of the service to be removed
* Return         : Remove Result
* 					True- service removed
* 					False- service not removed/not found
*******************************************************************************/
bool SwtRemoveService(VOID_FUNC Func)
{
	uint16_t LastItemIndex = SwtServicesCount - 1;

	/*Loop to check the function  in all added services to remove it*/
	for (uint8_t loopCnt = 0; loopCnt < SwtServicesCount; loopCnt++)
	{
		if (SwtServices[loopCnt].Func == Func)											//function to be removed found
		{
			if (loopCnt != LastItemIndex)												// if the function to be removed is not last item index'd replace it with last item indexed
			{
				SwtServices[loopCnt].Enable = SwtServices[LastItemIndex].Enable;
				SwtServices[loopCnt].Counter = SwtServices[LastItemIndex].Counter;
				SwtServices[loopCnt].Period = SwtServices[LastItemIndex].Period;
				SwtServices[loopCnt].Func = SwtServices[LastItemIndex].Func;
			}

			/* clear last item indexed	*/
			SwtServices[LastItemIndex].Enable = false;
			SwtServices[LastItemIndex].Counter = 0;
			SwtServices[LastItemIndex].Period = 0;
			SwtServices[LastItemIndex].Func = NULL;
			SwtServicesCount--;

			return true;
		}
	}

	return false;
}


/*******************************************************************************
* Function Name  : H043_SwtGetEnable
* Description    : Get the enable status of a function in Que
* Input          : pointer function
* Return         : Enable status of the function
* 					True: Function execution enabled
* 					False:Function execution Disabled
*******************************************************************************/
bool SwtGetEnable(VOID_FUNC Func)
{
	/*loop to check for function in  all added services*/
	for (uint8_t loopCnt = 0; loopCnt < SwtServicesCount; loopCnt++)
	{
		if (SwtServices[loopCnt].Func == Func)									//if function requested match the function of service
		{
			return  SwtServices[loopCnt].Enable;								// Return the enable status of the function
		}
	}

	return false;
}


/*******************************************************************************
* Function Name  : H043_SwtSetEnable
* Description    : Enables or Disables certain function in the Que
* Input          : pointer function,
* 				   New enable State
* 				   		True: Function is enabled for execution
* 				   		False: Function is disabled for execution
* Return         : Change in enable state result
* 						True: Changes were successful
* 						False: Changes were not successful
*******************************************************************************/
bool SwtSetEnable(VOID_FUNC Func, bool Enable)
{
	/*loop to check for function in  all added services*/
	for (uint8_t loopCnt = 0; loopCnt < SwtServicesCount; loopCnt++)
	{
		if (SwtServices[loopCnt].Func == Func)									//if function requested match the function of service
		{
			SwtServices[loopCnt].Counter = SwtServices[loopCnt].Period+1;
			SwtServices[loopCnt].Enable = Enable;								//New state : Enable or Diable
			return true;
		}
	}

	return false;
}


/*******************************************************************************
* Function Name  : SwtSetPeriod
* Description    : Sets or modifies the period of certain service
* Input          : pointer function,
* 				   period : time period for calling function
* 				   enable state:
* 				   		True: Enable fucntion execution
* 				   		False: Disable function execution
* Return         : Changes result
* 						True: Changes Successful
* 						False: Changes were not successful
*******************************************************************************/
bool SwtSetPeriod(VOID_FUNC Func, uint32_t Period, bool Enable)
{
	/*loop to check for function in  all added services*/
	for(uint8_t i = 0; i < SwtServicesCount; i++)
	{
		if (SwtServices[i].Func == Func)											//if function requested match the function of service
		{
			SwtServices[i].Period = Period;										//New period
			SwtServices[i].Counter = Period+1;
			SwtServices[i].Enable = Enable;										//New Enbale state
			return true;
		}
	}

	return false;
}


/*******************************************************************************
* Function Name  : SwtExec
* Description    : routine call, any counter of service has reached 0 function pertaining to that service is executed
* 				  this routine execution is called from while loop
* Input          : None
* Return         : None
*******************************************************************************/
void SwtExec(void)
{
	/* loop to execute all the servives in Que*/
	for (uint8_t loopCnt = 0; loopCnt < SwtServicesCount; loopCnt++)
	{
		if (SwtServices[loopCnt].Enable == true)									//go ahead only if service is enabled
		{
			if (SwtServices[loopCnt].Counter == 0)								// only if particular service counter reached 0
			{
				SwtServices[loopCnt].Counter = SwtServices[loopCnt].Period;
				SwtServices[loopCnt].Func();									//Execute the function pointed by the service
			}
		}
	}
}


/***End of File *****************************/
