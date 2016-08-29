/**
  ******************************************************************************
  * @file    H043_HostUsartRxTx.h
  * @author  Tejas H
  * @version V1.0.0
  * @date    17-November-2014
  * @brief   USART-Transmission/Reception declaration
  ******************************************************************************
  */


#ifndef BTL_USART_H
#define BTL_USART_H

/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx.h"
#include "share_f4/types.h"
#include "share_f4/common.h"

#ifdef __cplusplus
 extern "C" {
#endif

#define USART						USART2

typedef enum
{
	usart1 = 0,
	usart2,
	usart3,
	uart4,
	uart5,
}serial_port_e;

typedef  void (*OnRxByteFuncPtr)(uint8_t byte);
typedef  void (*OnTxByteFuncPtr)(void);

/*Function prototypes -----------------------------------------------*/

void BTL_USART_Init(serial_port_e ePort, GPIO_TypeDef* dir_gpio, uint16_t dir_pin);

void USART_SetRxFunction(OnRxByteFuncPtr funcPtr);
void USART_SetTxFunction(OnTxByteFuncPtr funcPtr);
void USART_SetDIR(uint8_t active);
void BTL_USART_Send(const uint8_t *Buffer, uint32_t Count);
void BTL_USART_SendByte(uint16_t txByte);

static void BTL_USART_GpioConfig(uint8_t nPort);
static void BTL_USART_Config(uint8_t nPort);
static void BTL_USART_NvicConfig(uint8_t nPort);
//static void BTL_USART_GpioClock(GPIO_TypeDef* gpio, FunctionalState state);
static void BTL_USART_Clock(USART_TypeDef* usart, FunctionalState state);

void USART_IRQHandler(uint8_t nPort);
void USART1_IRQHandler(void);
void USART2_IRQHandler(void);
void USART3_IRQHandler(void);
void UART4_IRQHandler(void);
void UART5_IRQHandler(void);


#ifdef __cplusplus
}
#endif

#endif
