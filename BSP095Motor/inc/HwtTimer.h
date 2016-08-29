/**
  ******************************************************************************
  * @file    HwtTimer.h
  * @author  Tejas H
  * @version V1.0.0
  * @date
  * @brief   Hardware timer that call's interrupt every 1ms and process the timer dependent services.
  ******************************************************************************
  */

#ifndef H043_HWTTIMER_H
#define H043_HWTTIMER_H


#include "stm32f4xx.h"
#include "share_f4/types.h"

#ifdef __cplusplus
 extern "C" {
#endif

/* Defines***************************************/
#define HWT_MAX_SERVICES_COUNT 10

/*TypeDef *************************************/

/*HWT service variables*/
typedef struct
{
	bool Enable;
	uint32_t Counter;
	uint32_t Period;
	VOID_FUNC Func;
} 	HWT_SERVICE;

/*Function Prototype****************************/
void HwtTime_interrupt(void);
void HwtInit(GPIO_TypeDef* LedGpio, uint16_t LedPin);
bool HwtInsertService(VOID_FUNC Func, uint32_t Period, bool Enable);
bool HwtRemoveService(VOID_FUNC Func);
bool HwtGetEnable(VOID_FUNC Func);
bool HwtSetEnable(VOID_FUNC Func, bool Enable);
bool HwtSetPeriod(VOID_FUNC Func, uint32_t Period, bool Enable);

void HwtDelay_ms(uint32_t delay_ms);
uint32_t HwtGetTicks_1ms();

#ifdef __cplusplus
}
#endif

#endif
