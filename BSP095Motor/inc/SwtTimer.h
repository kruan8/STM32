/**
  ******************************************************************************
  * @file    SwtTimer.h
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
#ifndef H043_SWTTIMMER_H
#define H043_SWTTIMMER_H

#include "stm32f4xx.h"
#include "share_f4/types.h"

#ifdef __cplusplus
 extern "C" {
#endif

/*Defines************************************/
#define SWT_MAX_SERVICES_COUNT 10

/*Type Define*******************************/

/*SWT Service Variables*/
typedef struct
{
	bool 		Enable;
	uint32_t	Counter;
	uint32_t 	Period;
	VOID_FUNC 	Func;
} 	SWT_SERVICE;


/*Function prototyping**********************/
void SwtOnTimerInterrupt(void);
void SwtInit(void);
bool SwtInsertService(VOID_FUNC Func, uint32_t Period, bool Enable);
bool SwtRemoveService(VOID_FUNC Func);
bool SwtGetEnable(VOID_FUNC Func);
bool SwtSetEnable(VOID_FUNC Func, bool Enable);
bool SwtSetPeriod(VOID_FUNC Func, uint32_t Period, bool Enable);
void SwtExec(void);

#ifdef __cplusplus
}
#endif

#endif
