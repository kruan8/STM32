/*
 * rtc.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "rtc.h"
#include <string.h>
#include <stdio.h>
#include "adc.h"

#define RTC_TR_RESERVED_MASK    ((uint32_t)0x007F7F7F)
#define RTC_DR_RESERVED_MASK    ((uint32_t)0x00FFFF3F)

/* Internal RTC defines */
#define RTC_LEAP_YEAR(year)             ((((year) % 4 == 0) && ((year) % 100 != 0)) || ((year) % 400 == 0))
#define RTC_DAYS_IN_YEAR(x)             RTC_LEAP_YEAR(x) ? 366 : 365
#define RTC_OFFSET_YEAR                 1970
#define RTC_SECONDS_PER_DAY             86400
#define RTC_SECONDS_PER_HOUR            3600
#define RTC_SECONDS_PER_MINUTE          60
#define RTC_BCD2BIN(x)                  ((((x) >> 4) & 0x0F) * 10 + ((x) & 0x0F))
#define RTC_CHAR2NUM(x)                 ((x) - '0')
#define RTC_CHARISNUM(x)                ((x) >= '0' && (x) <= '9')

/* Days in a month */
const uint8_t TM_RTC_Months[2][12] = {
  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, /* Not leap year */
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}  /* Leap year */
};

static volatile uint32_t g_nTicks = 0;
static volatile uint32_t g_nUsartTimer;

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

  RTC->WUTR = nInterval - 1;  // WUTR je delicka, takže 0 znamena 1 impulz
  RTC->CR = RTC_CR_WUCKSEL_2 | RTC_CR_WUTE | RTC_CR_WUTIE; /* (11) */
  RTC->WPR = 0xFE; /* (12) */
  RTC->WPR = 0x64; /* (12) */

  EXTI->IMR |= EXTI_IMR_IM20;       // unmask line 20
  EXTI->RTSR |= EXTI_RTSR_TR20;     // Rising edge for line 20
  NVIC_SetPriority(RTC_IRQn, 0);    // Set priority
  NVIC_EnableIRQ(RTC_IRQn);         // Enable RTC_IRQn
}

void RTC_Set(rtc_record_time_t *dt, bool bDate, bool bTime)
{
  // Write access for RTC registers
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;
  RTC->ISR = RTC_ISR_INIT; // Enable init phase
  while((RTC->ISR & RTC_ISR_INITF)!=RTC_ISR_INITF) // Wait until it is allow to modify RTC register values
  {
    /* add time out here for a robust application */
  }

  if (bDate)
  {
    RTC->DR = RTC_ByteToBcd2(dt->year) << 16 | 1 << 13 | RTC_ByteToBcd2(dt->month) << 8 | RTC_ByteToBcd2(dt->day);
  }

  if (bTime)
  {
    RTC->TR = RTC_ByteToBcd2(dt->hour) << 16 | RTC_ByteToBcd2(dt->min) << 8 | RTC_ByteToBcd2(dt->sec);
  }

  RTC->ISR =~ RTC_ISR_INIT; // Disable init phase

  // Disable write access for RTC registers
  RTC->WPR = 0xFE;
  RTC->WPR = 0x64;

  while (!(RTC->ISR & RTC_ISR_RSF));
}

void RTC_Get(rtc_record_time_t *dt)
{
  uint32_t value = (uint32_t)(RTC->TR & RTC_TR_RESERVED_MASK);

  dt->hour = (uint8_t)(RTC_BCD2BIN((value >> 16) & 0x3F));
  dt->min = (uint8_t)(RTC_BCD2BIN((value >> 8) & 0x7F));
  dt->sec = (uint8_t)(RTC_BCD2BIN(value & 0x7F));

  value = (uint32_t)(RTC->DR & RTC_DR_RESERVED_MASK);
  dt->year = (uint8_t)(RTC_BCD2BIN((value >> 16) & 0xFF));
  dt->month = (uint8_t)(RTC_BCD2BIN((value >> 8) & 0x1F));
  dt->day = (uint8_t)(RTC_BCD2BIN(value & 0x3F));
}

void RTC_PrintDT(uint8_t *pBuffer, uint8_t length)
{
  rtc_record_time_t dt;

  RTC_Get(&dt);
  snprintf((char*)pBuffer, length, "%d.%d.%d %02d:%02d:%02d",
        dt.day, dt.month, dt.year, dt.hour, dt.min, dt.sec);
}

uint32_t RTC_GetTicks()
{
  return g_nTicks;
}

uint32_t RTC_GetUsartTimer()
{
  return g_nUsartTimer;
}

void RTC_SetUsartTimer(uint32_t nInterval_ms)
{
  g_nUsartTimer = nInterval_ms;
}

int32_t RTC_GetUnixTimeStamp(rtc_record_time_t* data)
{
  uint32_t days = 0, seconds = 0;
  uint16_t i;
  uint16_t year = (uint16_t) (data->year + 2000);
  /* Year is below offset year */
  if (year < RTC_OFFSET_YEAR) {
    return 0;
  }
  /* Days in back years */
  for (i = RTC_OFFSET_YEAR; i < year; i++) {
    days += RTC_DAYS_IN_YEAR(i);
  }
  /* Days in current year */
  for (i = 1; i < data->month; i++) {
    days += TM_RTC_Months[RTC_LEAP_YEAR(year)][i - 1];
  }
  /* Day starts with 1 */
  days += data->day - 1;
  seconds = days * RTC_SECONDS_PER_DAY;
  seconds += data->hour * RTC_SECONDS_PER_HOUR;
  seconds += data->min * RTC_SECONDS_PER_MINUTE;
  seconds += data->sec;

  /* seconds = days * 86400; */
  return seconds;
}

void RTC_GetDateTimeFromUnix(rtc_record_time_t* data, uint32_t unix)
{
  uint16_t year;

  /* Get seconds from unix */
  data->sec = unix % 60;
  /* Go to minutes */
  unix /= 60;
  /* Get minutes */
  data->min = unix % 60;
  /* Go to hours */
  unix /= 60;
  /* Get hours */
  data->hour = unix % 24;
  /* Go to days */
  unix /= 24;

  /* Get week day */
  /* Monday is day one */
  data->day = (unix + 3) % 7 + 1;

  /* Get year */
  year = 1970;
  while (1) {
    if (RTC_LEAP_YEAR(year)) {
      if (unix >= 366) {
        unix -= 366;
      } else {
        break;
      }
    } else if (unix >= 365) {
      unix -= 365;
    } else {
      break;
    }
    year++;
  }
  /* Get year in xx format */
  data->year = (uint8_t) (year - 2000);
  /* Get month */
  for (data->month = 0; data->month < 12; data->month++) {
    if (RTC_LEAP_YEAR(year)) {
      if (unix >= (uint32_t)TM_RTC_Months[1][data->month]) {
        unix -= TM_RTC_Months[1][data->month];
      } else {
        break;
      }
    } else if (unix >= (uint32_t)TM_RTC_Months[0][data->month]) {
      unix -= TM_RTC_Months[0][data->month];
    } else {
      break;
    }
  }
  /* Get month */
  /* Month starts with 1 */
  data->month++;
  /* Get date */
  /* Date starts with 1 */
  data->day = unix + 1;
}

uint8_t RTC_ByteToBcd2(uint8_t Value)
{
  uint8_t bcdhigh = 0;

  while (Value >= 10)
  {
    bcdhigh++;
    Value -= 10;
  }

  return  ((uint8_t)(bcdhigh << 4) | Value);
}

/**
  * @brief  Convert from 2 digit BCD to Binary.
  * @param  Value: BCD value to be converted.
  * @retval Converted word
  */
uint8_t RTC_Bcd2ToByte(uint8_t Value)
{
  uint8_t tmp = 0;
  tmp = ((uint8_t)(Value & (uint8_t)0xF0) >> (uint8_t)0x4) * 10;
  return (tmp + (Value & (uint8_t)0x0F));
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

void SysTick_Handler(void)
{
  g_nTicks++;
  if (g_nUsartTimer)
  {
    g_nUsartTimer--;
  }
}
