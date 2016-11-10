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


#define RTC_EPOCH_YR 2010            /* EPOCH = Jan 1 2010 00:00:00 */
#define RTC_SECS_DAY (24L * 60L * 60L)
#define RTC_MINUTES_DAY (24L * 60L)

#define LEAPYEAR(year)  (!((year) % 4) && (((year) % 100) || !((year) % 400)))  // zjisteni prestupneho roku
#define YEARSIZE(year)  (LEAPYEAR(year) ? 366 : 365)              // pocet dnu roku (prestupny/neprestupny)

// tabulka pro prevod z timestamp
static const uint8_t ytab[2][12] = {{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
                            {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}};

// tabulky pro prevod do timestamp
static const uint16_t mtha[12] = {0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334};
static const uint16_t mthb[12] = {0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335};


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

  RTC->WUTR = nInterval;
  RTC->CR = RTC_CR_WUCKSEL_2 | RTC_CR_WUTE | RTC_CR_WUTIE; /* (11) */
  RTC->WPR = 0xFE; /* (12) */
  RTC->WPR = 0x64; /* (12) */

  EXTI->IMR |= EXTI_IMR_IM20;       // unmask line 20
  EXTI->RTSR |= EXTI_RTSR_TR20;     // Rising edge for line 20
  NVIC_SetPriority(RTC_IRQn, 0);    // Set priority
  NVIC_EnableIRQ(RTC_IRQn);         // Enable RTC_IRQn
}

void RTC_StopMode(void)
{
//  Adc_Disable();

  RCC->APB1ENR |= RCC_APB1ENR_PWREN; // Enable PWR clock
  PWR->CR |= PWR_CR_ULP;

  SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
  PWR->CR |= PWR_CR_CWUF;  // Clear Wakeup flag
  PWR->CR |= PWR_CR_LPSDSR;
  SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk; // Set SLEEPDEEP bit of Cortex-M0 System Control Register

  __ASM volatile ("wfi");

  SCB->SCR &= (uint32_t)~((uint32_t)SCB_SCR_SLEEPDEEP_Msk);
  PWR->CR &= ~PWR_CR_LPSDSR;
  SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;

//  Adc_Enable();
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

void RTC_PrintDT(uint8_t *pBuffer, uint8_t length)
{
  rtc_time_t time;
  rtc_date_t date;

  RTC_GetDT(&time, &date);

  snprintf((char*)pBuffer, length, "%d.%d.%d %02d:%02d:%02d",
        RTC_GetDay(&date), RTC_GetMonth(&date), RTC_GetYear(&date),
        RTC_GetHour(&time), RTC_GetMinute(&time), RTC_GetSecond(&time));
}

void RTC_GetDT(rtc_time_t* time, rtc_date_t* date)
{
  uint32_t TimeToCompute = RTC->TR; // get time
  memcpy (time, &TimeToCompute, sizeof (TimeToCompute));

  uint32_t DateToCompute = RTC->DR; // get date
  memcpy (date, &DateToCompute, sizeof (DateToCompute));
}

//void RTC_ClearTimeStruct(rtc_time_t* time)
//{
//  memset (time, 0, sizeof(rtc_time_t));
//}
//
//void RTC_ClearDateStruct(rtc_date_t* date)
//{
//  memset (date, 0, sizeof(rtc_date_t));
//  date->week_day = 1;
//}

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

void RTC_ConvertToStruct (uint32_t time, rtc_record_time_t* stime)
{
  uint32_t dayclock, dayno;
  stime->year = RTC_EPOCH_YR;

  dayclock = time % RTC_MINUTES_DAY;
  dayno = time / RTC_MINUTES_DAY;

  stime->sec = 0;  // dayclock % 60;
  stime->min = dayclock % 60;
  stime->hour = dayclock / 60;

  while (dayno >= YEARSIZE(stime->year))
  {
    dayno -= YEARSIZE(stime->year);
    stime->year++;
  }

  stime->month = 0;
  while (dayno >= (ytab[LEAPYEAR(stime->year)][stime->month]))
  {
    dayno -= ytab[LEAPYEAR(stime->year)][stime->month];
    stime->month++;
  }

  stime->month++;
  stime->day = dayno + 1;
}

uint32_t RTC_ConvertFromStruct(rtc_record_time_t* stime)
{
  uint32_t time;
  uint8_t year1 = stime->year - RTC_EPOCH_YR;
  uint16_t year = (uint16_t)year1 + RTC_EPOCH_YR;
  uint32_t day_min = (uint32_t)stime->hour * 60 + (uint16_t)stime->min;
  time = (((!(year % 4)) && (year % 100)) || (!(year % 400)))?
        (((((unsigned long int) year1 + 2) / 4)) + year1 * 365 + mthb[stime->month - 1] + (stime->day - 1)) * 1440 + day_min:  // prestupny rok
        (((((unsigned long int) year1 + 2) / 4)) + year1 * 365 + mtha[stime->month - 1] + (stime->day - 1)) * 1440 + day_min;

  return time;
}

void RTC_ConvertFromRtc(rtc_time_t* time, rtc_date_t* date, rtc_record_time_t* rtime)
{
  rtime->day = date->day10 * 10 + date->day;
  rtime->month = date->month10 * 10 + date->month;
  rtime->year = date->year10 * 10 + date->year;
  rtime->hour = time->hour10 * 10 + time->hour;
  rtime->min = time->minute10 * 10 + time->minute;
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
