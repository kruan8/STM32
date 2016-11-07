/*
 * rtc.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef RTC_H_
#define RTC_H_

#include "stm32l0xx.h"

typedef struct
{
  uint8_t second: 4;
  uint8_t second10: 4;
  uint8_t minute: 4;
  uint8_t minute10: 4;
  uint8_t hour: 4;
  uint8_t hour10: 4;
  uint8_t day: 4;
  uint8_t day10: 4;
  uint8_t month: 4;
  uint8_t month10: 4;
  uint8_t year: 4;
  uint8_t year10: 4;
} rtc_t;

void RTC_Init(void);
void RTC_Set(rtc_t* dt);
void RTC_Get(uint8_t *pBuffer, uint8_t length);

#endif /* RTC_H_ */
