/*
 * rtc.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "rtc.h"
#include <string.h>
#include <stdio.h>

void RTC_Init(void)
{
  RCC->APB1ENR |= RCC_APB1ENR_PWREN; // Enable PWR clock
  PWR->CR |= PWR_CR_DBP; // Enable write in RTC domain control register
  RCC->CSR |= RCC_CSR_LSEON; // Enable the LSE
  while(!(RCC->CSR & RCC_CSR_LSERDY)) // Wait while it is not ready
  {
    /* add time out here for a robust application */
  }

  RCC->CSR = (RCC->CSR & ~RCC_CSR_RTCSEL) | RCC_CSR_RTCEN | RCC_CSR_RTCSEL_LSE; // LSE for RTC clock
  RCC->APB1ENR &=~ RCC_APB1ENR_PWREN; // Disable PWR clock

  // Write access for RTC registers
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;
  RTC->ISR = RTC_ISR_INIT; // Enable init phase
  while((RTC->ISR & RTC_ISR_INITF)!=RTC_ISR_INITF) // Wait until it is allow to modify RTC register values
  {
    /* add time out here for a robust application */
  }

  RTC->PRER = 0x007F00FF; // set prescaler, 32768/128 => 256 Hz, 256Hz/256 => 1Hz

  RTC->ISR =~ RTC_ISR_INIT; // Disable init phase

  // Disable write access for RTC registers
  RTC->WPR = 0xFE;
  RTC->WPR = 0x64;

//  // Write access for RTC regsiters
//  RTC->WPR = 0xCA;
//  RTC->WPR = 0x53;
//  RTC->CR &=~ RTC_CR_ALRAE; // Disable alarm A to modify it
//  while((RTC->ISR & RTC_ISR_ALRAWF) != RTC_ISR_ALRAWF) // Wait until it is allow to modify alarm A value
//  {
//    /* add time out here for a robust application */
//  }
//
//  // Modify alarm A mask to have an interrupt each 1Hz
//  RTC->ALRMAR = RTC_ALRMAR_MSK4 | RTC_ALRMAR_MSK3 | RTC_ALRMAR_MSK2 | RTC_ALRMAR_MSK1;
//  RTC->CR = RTC_CR_ALRAIE | RTC_CR_ALRAE; // Enable alarm A and alarm A interrupt
//
//  // Disable write access
//  RTC->WPR = 0xFE;
//  RTC->WPR = 0x64;
//
//  // Configure exti and nvic for RTC IT
//  EXTI->IMR |= EXTI_IMR_IM17; // unmask line 17
//  EXTI->RTSR |= EXTI_RTSR_TR17; // Rising edge for line 17
//  NVIC_SetPriority(RTC_IRQn, 0); /* (15) */
//  NVIC_EnableIRQ(RTC_IRQn); /* (16) */
}

/**
  * Brief   This function configures RTC.
  * Param   uint32_t New time
  * Retval  None
  */
void RTC_Set(rtc_time_t* time, rtc_date_t* date)
{
  // Write access for RTC registers
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;
  RTC->ISR = RTC_ISR_INIT; // Enable init phase
  while((RTC->ISR & RTC_ISR_INITF)!=RTC_ISR_INITF) // Wait until it is allow to modify RTC register values
  {
    /* add time out here for a robust application */
  }

  if (time != NULL)
  {
    uint32_t RegTime;
    memcpy (&RegTime, time, sizeof (RegTime));
    RTC->TR = RegTime;
  }

  if (date != NULL)
  {
    uint32_t RegDate;
    memcpy (&RegDate, date, sizeof (RegDate));
    RTC->DR = RegDate;
  }

  RTC->ISR =~ RTC_ISR_INIT; // Disable init phase

  // Disable write access for RTC registers
  RTC->WPR = 0xFE;
  RTC->WPR = 0x64;
}

void RTC_GetDT(uint8_t *pBuffer, uint8_t length)
{
  rtc_time_t time;
  uint32_t TimeToCompute = RTC->TR; // get time
  memcpy (&time, &TimeToCompute, sizeof (TimeToCompute));

  rtc_date_t date;
  uint32_t DateToCompute = RTC->DR; // get date
  memcpy (&date, &DateToCompute, sizeof (DateToCompute));

  snprintf((char*)pBuffer, length, "%d.%d.%d %d:%d:%d",
        RTC_GetDay(&date), RTC_GetMonth(&date), RTC_GetYear(&date),
        RTC_GetHour(&time), RTC_GetMinute(&time), RTC_GetSecond(&time));
}

void RTC_ClearTimeStruct(rtc_time_t* time)
{
  memset (time, 0, sizeof(rtc_time_t));
}

void RTC_ClearDateStruct(rtc_date_t* date)
{
  memset (date, 0, sizeof(rtc_date_t));
  date->week_day = 1;
}

uint8_t RTC_GetSecond(rtc_time_t* time)
{
  return time->second10 * 10 + time->second;
}

uint8_t RTC_GetMinute(rtc_time_t* time)
{
  return time->minute10 * 10 + time->minute;
}

uint8_t RTC_GetHour(rtc_time_t* time)
{
  return time->hour10 * 10 + time->hour;
}

uint8_t RTC_GetDay(rtc_date_t* date)
{
  return date->day10 * 10 + date->day;
}

uint8_t RTC_GetMonth(rtc_date_t* date)
{
  return date->month10 * 10 + date->month;
}

uint8_t RTC_GetYear(rtc_date_t* date)
{
  return date->year10 * 10 + date->year;
}
