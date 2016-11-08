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

  RTC->PRER = 0x007F00FF;               // set prescaler, 32768/128 => 256 Hz, 256Hz/256 => 1Hz
  RTC->CR &=~ RTC_CR_WUTE;

  RTC->ISR =~ RTC_ISR_INIT; // Disable init phase

  // Disable write access for RTC registers
  RTC->WPR = 0xFE;
  RTC->WPR = 0x64;
}

void RTC_SetWakeUp(uint16_t nInterval)
{
  RTC->WPR = 0xCA; /* (7) */
  RTC->WPR = 0x53; /* (7) */
  RTC->CR &=~ RTC_CR_WUTE; /* (8) */
  while((RTC->ISR & RTC_ISR_WUTWF) != RTC_ISR_WUTWF) /* (9) */
  {
    /* add time out here for a robust application */
  }

  RTC->WUTR = nInterval;
  RTC->CR = RTC_CR_WUCKSEL_2 | RTC_CR_WUCKSEL_1 | RTC_CR_WUTE | RTC_CR_WUTIE; /* (11) */
  RTC->WPR = 0xFE; /* (12) */
  RTC->WPR = 0x64; /* (12) */

  EXTI->IMR |= EXTI_IMR_IM20;       // unmask line 20
  EXTI->RTSR |= EXTI_RTSR_TR20;     // Rising edge for line 20
  NVIC_SetPriority(RTC_IRQn, 0);    // Set priority
  NVIC_EnableIRQ(RTC_IRQn);         // Enable RTC_IRQn
}

void RTC_StopMode(void)
{
  PWR->CR |= PWR_CR_CWUF;  // Clear Wakeup flag
  SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk; // Set SLEEPDEEP bit of Cortex-M0 System Control Register

  __ASM volatile ("wfi");
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

void RTC_IRQHandler(void)
{
  // Check WUT flag
  if(RTC->ISR & RTC_ISR_WUTF)
  {
    RTC->ISR =~ RTC_ISR_WUTF; /* Reset Wake up flag */
    EXTI->PR = EXTI_PR_PR20; /* clear exti line 20 flag */
  }
}
