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
} rtc_time_t;

typedef struct
{
  uint8_t day: 4;
  uint8_t day10: 4;
  uint8_t month: 4;
  uint8_t month10: 1;
  uint8_t week_day: 3;
  uint8_t year: 4;
  uint8_t year10: 4;
} rtc_date_t;

void RTC_Init(void);
void RTC_Set(rtc_time_t* time, rtc_date_t* date);
void RTC_GetDT(uint8_t *pBuffer, uint8_t length);

void RTC_ClearTimeStruct(rtc_time_t* time);
void RTC_ClearDateStruct(rtc_date_t* date);

uint8_t RTC_GetSecond(rtc_time_t* time);
uint8_t RTC_GetMinute(rtc_time_t* time);
uint8_t RTC_GetHour(rtc_time_t* time);
uint8_t RTC_GetDay(rtc_date_t* date);
uint8_t RTC_GetMonth(rtc_date_t* date);
uint8_t RTC_GetYear(rtc_date_t* date);

void RTC_Init(void);
void RTC_Set(rtc_time_t* time, rtc_date_t* date);
void RTC_Get(uint8_t *pBuffer, uint8_t length);


#endif /* RTC_H_ */
