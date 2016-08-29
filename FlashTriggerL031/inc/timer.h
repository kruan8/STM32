/*
 * timer.h
 *
 *  Created on: 24. 6. 2016
 *      Author: priesolv
 */

#ifndef TIMER_H_
#define TIMER_H_

#include "stm32l0xx.h"

typedef void(*PtrSysTickCallback) (void);

void TimerInit();
void Delay_ms(uint32_t delay_ms);
uint32_t GetTicks_ms();
void SetSysTickCallback(PtrSysTickCallback pFunction);
void SetOffInterval(uint32_t nInterval_ms);
uint32_t GetOffTime(void);

#endif /* TIMER_H_ */
