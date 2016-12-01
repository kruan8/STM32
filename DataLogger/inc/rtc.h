/*
 * rtc.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef RTC_H_
#define RTC_H_

#include "stm32l0xx.h"
#include <stdbool.h>

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

typedef struct
{
  uint8_t sec;
  uint8_t min;
  uint8_t hour;
  uint8_t day;
  uint8_t month;
  uint16_t year;
}rtc_record_time_t;

void RTC_Init(void);
void RTC_Set(rtc_record_time_t *dt, bool bDate, bool bTime);
void RTC_Get(rtc_record_time_t *dt);
void RTC_SetWakeUp(uint16_t nInterval);
void RTC_PrintDT(uint8_t *pBuffer, uint8_t length);

void RTC_GetDT(rtc_time_t* time, rtc_date_t* date);

uint32_t RTC_GetTicks();
uint32_t RTC_GetUsartTimer();
void RTC_SetUsartTimer(uint32_t nInterval_ms);

int32_t RTC_GetUnixTimeStamp(rtc_record_time_t* data);
void RTC_GetDateTimeFromUnix(rtc_record_time_t* data, uint32_t unix);

uint8_t RTC_ByteToBcd2(uint8_t Value);
uint8_t RTC_Bcd2ToByte(uint8_t Value);

#endif /* RTC_H_ */
