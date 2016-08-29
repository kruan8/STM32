/**
  ******************************************************************************
  * @file    H043_HostUsartRxTx.c
  * @author  Tejas H
  * @version V1.0.0
  * @date    17-November-2014
  * @brief   USART-Transmission/Reception functions
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "BTL_USART.h"

/* Defines ------------------------------------------------------------------*/
#define USART_BAUD	 			 	115200  			//USART Baud Rate


typedef struct
{
	USART_TypeDef* 	USARTx;				// port name
	GPIO_TypeDef* 	port_RX_GPIOx;		// port RX pinu
	uint16_t 		    port_RX_GPIO_Pin;	// RX pin
	uint8_t		    	pinSource_RX;		// pins source for alternate function RX
	GPIO_TypeDef* 	port_TX_GPIOx;		// port TX pinu
	uint16_t 		    port_TX_GPIO_Pin;	// TX pin
	uint8_t		    	pinSource_TX;		// pins source for alternate function TX
	uint8_t		    	GPIO_AFSelection;	// AF selection
	IRQn_Type   		IRQn;				// cislo preruseni
}serial_port_t;

// Todo: zauvazovat a doplnit ruzne mapovani na GPIO piny
// konfigurace UARTU pro inicializaci portu
const serial_port_t port_config[] =	{
//  USART   RXport RXpin        RX pin source     TXport TXpin        TX pin source     AF selection    IRQn
	{ USART1, GPIOA, GPIO_Pin_10, GPIO_PinSource10, GPIOA, GPIO_Pin_9,  GPIO_PinSource9,  GPIO_AF_USART1, USART1_IRQn},
	{ USART2, GPIOD, GPIO_Pin_6,  GPIO_PinSource6 , GPIOD, GPIO_Pin_5,  GPIO_PinSource5,  GPIO_AF_USART2, USART2_IRQn},
	{ USART3, GPIOB, GPIO_Pin_11, GPIO_PinSource11, GPIOB, GPIO_Pin_10, GPIO_PinSource10, GPIO_AF_USART3, USART3_IRQn},
	{ UART4,  GPIOC, GPIO_Pin_11, GPIO_PinSource11, GPIOC, GPIO_Pin_10, GPIO_PinSource10, GPIO_AF_UART4,  UART4_IRQn},
	{ UART5,  GPIOD, GPIO_Pin_2,  GPIO_PinSource2,  GPIOC, GPIO_Pin_12, GPIO_PinSource12, GPIO_AF_UART5,  UART5_IRQn},
};

/* variables ---------------------------------------------------------*/
uint8_t g_nPort;
OnRxByteFuncPtr g_OnRxByteFunction = 0;
OnTxByteFuncPtr g_OnTxByteFunction = 0;

GPIO_TypeDef* g_dir_gpio;
uint16_t g_dir_pin;

/*  functions ---------------------------------------------------------*/

/*******************************************************************************
* Function Name  : BTL_USART_Init
* Description    : Intialize Gpio, Interrupt for USART
* Input          : port number (index 0)
* Return         : None
*******************************************************************************/
void BTL_USART_Init(serial_port_e ePort, GPIO_TypeDef* dir_gpio, uint16_t dir_pin)
{
  g_nPort = (uint8_t) ePort;
  g_dir_gpio = dir_gpio;
  g_dir_pin = dir_pin;

  BTL_USART_GpioConfig(g_nPort);                    //Gpio configuration
  BTL_USART_Config(g_nPort);                      //Host Usart configuration
  BTL_USART_NvicConfig(g_nPort);                    //Interrupt vector configuration

  USART_ITConfig(port_config[g_nPort].USARTx, USART_IT_RXNE, ENABLE);   //Enable Reception interrupt
  USART_ITConfig(port_config[g_nPort].USARTx, USART_IT_TC, ENABLE);   //Enable Transimission complete interrupt
}

/*******************************************************************************
* Function Name  : BTL_USART_GpioConfig
* Description    : Configures the different GPIO ports and enables clock to the GPIO
* Input          : None
* Return         : None
*******************************************************************************/

void BTL_USART_GpioConfig(uint8_t nPort)
{
	SetGpioClock(port_config[nPort].port_TX_GPIOx, ENABLE);
	SetGpioClock(port_config[nPort].port_RX_GPIOx, ENABLE);

	GPIO_InitTypeDef GPIO_InitStructure;

	// Configure Tx pin as alternate function push-pull
	GPIO_InitStructure.GPIO_Pin = port_config[nPort].port_TX_GPIO_Pin;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(port_config[nPort].port_TX_GPIOx, &GPIO_InitStructure);

	// Configure RX pin
	GPIO_InitStructure.GPIO_Pin = port_config[nPort].port_RX_GPIO_Pin;;
	GPIO_Init(port_config[nPort].port_RX_GPIOx, &GPIO_InitStructure);

	// set alternate function for RX+TX pins
	GPIO_PinAFConfig(port_config[nPort].port_TX_GPIOx, port_config[nPort].pinSource_TX, port_config[nPort].GPIO_AFSelection);
	GPIO_PinAFConfig(port_config[nPort].port_RX_GPIOx, port_config[nPort].pinSource_RX, port_config[nPort].GPIO_AFSelection);

	/* Configure the GPIOC for enabing/diabling transciever */
	SetGpioClock(g_dir_gpio, ENABLE);

	GPIO_InitStructure.GPIO_Pin = g_dir_pin;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(g_dir_gpio, &GPIO_InitStructure);

	USART_SetDIR(0);
}

/*******************************************************************************
* Function Name  : BTL_USART_Config
* Description    : Configures the USART connected to master
* Input          : None
* Return         : None
*******************************************************************************/

void BTL_USART_Config(uint8_t nPort)
{
	BTL_USART_Clock(port_config[nPort].USARTx, ENABLE);

	USART_InitTypeDef USART_InitStructure;

	// USART configuration
  USART_InitStructure.USART_BaudRate = USART_BAUD;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

  USART_Init(port_config[nPort].USARTx, &USART_InitStructure);

  // Enable USART
  USART_Cmd(port_config[nPort].USARTx, ENABLE);
}

/*******************************************************************************
* Function Name  : BTL_USART_NvicConfig
* Description    : configures/enables the interrupt for (Host Uart)
* Input          : None
* Return         : None
*******************************************************************************/

void BTL_USART_NvicConfig(uint8_t nPort)
{
	// Enable the USARTx Interrupt
	NVIC_InitTypeDef NVIC_InitStructure;
	NVIC_InitStructure.NVIC_IRQChannel = port_config[nPort].IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 3;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);
}

///*******************************************************************************
//* Function Name  : BTL_USART_GpioClock
//* Description    : Enable GPIO clock
//* Input          : - gpio: GPIO port
//* 				 : - state: new clock state
//* Return         : None
//*******************************************************************************/
//void BTL_USART_GpioClock(GPIO_TypeDef* gpio, FunctionalState state)
//{
//	if (gpio == GPIOA)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, state);
//	}
//	else if (gpio == GPIOB)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, state);
//	}
//	else if (gpio == GPIOC)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, state);
//	}
//	else if (gpio == GPIOD)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, state);
//	}
//	else if (gpio == GPIOE)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, state);
//	}
//	else if (gpio == GPIOF)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, state);
//	}
//	else if (gpio == GPIOG)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, state);
//	}
//	else if (gpio == GPIOH)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOH, state);
//	}
//	else if (gpio == GPIOI)
//	{
//		RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOI, state);
//	}
//}

/*******************************************************************************
* Function Name  : BTL_USART_Clock
* Description    : Enable USART clock
* Input          : - usart: USART
* 				 : - state: new clock state
* Return         : None
*******************************************************************************/
void BTL_USART_Clock(USART_TypeDef* usart, FunctionalState state)
{
	if (usart == USART1)
	{
		RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, state);
	}
	else if (usart == USART2)
	{
		RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, state);
	}
	else if (usart == USART3)
	{
		RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, state);
	}
	else if (usart == UART4)
	{
		RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART4, state);
	}
	else if (usart == UART5)
	{
		RCC_APB1PeriphClockCmd(RCC_APB1Periph_UART5, state);
	}
}

/*******************************************************************************
* Function Name  : BTL_USART_Send
* Description    : Send a string to the UART.
* Input          : - Buffer: buffers to be printed.
*                : - Count  : buffer's length : declared ulong in order to send data of large string size
* Return         : None
*******************************************************************************/
void BTL_USART_Send(const uint8_t *Buffer, uint32_t Count)
{
	// DIR enable (RS485 IC) for transmission
	USART_SetDIR(1);

  /*Loop while there are more characters to send.*/
  while(Count--)
  {
      USART_SendData(port_config[g_nPort].USARTx, *Buffer++);
      /* Loop until the end of transmission */
      while (!USART_GetFlagStatus(port_config[g_nPort].USARTx, USART_FLAG_TXE));          //waits till data is transmitted
  }

  // warning, DIR disable after emptying shift register (interrupt TC)
  while (!USART_GetFlagStatus(port_config[g_nPort].USARTx, USART_FLAG_TC));

	USART_SetDIR(0);
}


/*******************************************************************************
* Function Name  : BTL_USART_SendByte
* Description    : Send a byte
* Input          : single byte of data
* Return         : None
*******************************************************************************/
void BTL_USART_SendByte(uint16_t txByte)            //TODO: validate and change uint16_t to uint8_t
{
	USART_SetDIR(true);
	USART_SendData(port_config[g_nPort].USARTx, txByte);

//	/* Loop until the end of transmission */
//	while (!USART_GetFlagStatus(port_config[g_nPort].USARTx, USART_FLAG_TXE));                 //waits till data is transmitted.
//
//	// pozor, DIR schazovat teprve az bude prazdny i posuvny registr (interrupt TC)
//	while (!USART_GetFlagStatus(port_config[g_nPort].USARTx, USART_FLAG_TC));
//	USART_SetDIR(0);
}

void USART1_IRQHandler(void)
{
	USART_IRQHandler(0);
}

void USART2_IRQHandler(void)
{
	USART_IRQHandler(1);
}

void USART3_IRQHandler(void)
{
	USART_IRQHandler(2);
}

void UART4_IRQHandler(void)
{
	USART_IRQHandler(3);
}

void UART5_IRQHandler(void)
{
	USART_IRQHandler(4);
}


/*******************************************************************************
* Function Name  : USART2_IRQHandler
* Description    : USART2 Interrupt handler
* Input          : None
* Return         : None
*******************************************************************************/
void USART_IRQHandler(uint8_t nPort)
{
	/*Call to the function in commprotocl file's function*/
	if ((USART_GetFlagStatus(port_config[g_nPort].USARTx, USART_FLAG_RXNE)) != (u16)RESET)	//Reception interrupt has occurred
	{
		USART_ClearFlag(port_config[g_nPort].USARTx, USART_FLAG_RXNE);
		if (g_OnRxByteFunction)
		{
			g_OnRxByteFunction((uint8_t)port_config[g_nPort].USARTx->DR);
		}
	}

	if ((USART_GetFlagStatus(port_config[g_nPort].USARTx, USART_FLAG_TC)) != (u16)RESET)		//Transmission interrupt has occurred
	{
		/*to ensure complete data is moved through transreciever. this bit should be reset only after complete data transmission */
		USART_SetDIR(0);
		USART_ClearFlag(port_config[g_nPort].USARTx, USART_FLAG_TC);
		if (g_OnTxByteFunction)
		{
			g_OnTxByteFunction();
		}
	}
}

void USART_SetRxFunction(OnRxByteFuncPtr funcPtr)
{
	g_OnRxByteFunction = funcPtr;
}

void USART_SetTxFunction(OnTxByteFuncPtr funcPtr)
{
	g_OnTxByteFunction = funcPtr;
}

void USART_SetDIR(uint8_t active)
{
	if (active)
	{
		// DIR enable (RS485 IC) for transmission
	  g_dir_gpio->BSRRL = g_dir_pin;
	}
	else
	{
		// Reset the transreciever (RS485 IC) to Reciever mode
	  g_dir_gpio->BSRRH = g_dir_pin;
	}
}

/*****END OF FILE****/
