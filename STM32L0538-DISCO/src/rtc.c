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
void RTC_Set(rtc_t* dt)
{
  // Write access for RTC registers
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;
  RTC->ISR = RTC_ISR_INIT; // Enable init phase
  while((RTC->ISR & RTC_ISR_INITF)!=RTC_ISR_INITF) // Wait until it is allow to modify RTC register values
  {
    /* add time out here for a robust application */
  }

  RTC->PRER = 0x007F00FF; // set prescaler, 32768/128 => 256 Hz, 256Hz/256 => 1Hz
  RTC->TR =(2 << 20) | (0 << 16) | (3 << 12) | (5 << 8) | (0 << 4) | (0); // New time in TR
  RTC->ISR =~ RTC_ISR_INIT; // Disable init phase

  // Disable write access for RTC registers
  RTC->WPR = 0xFE;
  RTC->WPR = 0x64;
}

void RTC_Get(uint8_t *pBuffer, uint8_t length)
{
  uint8_t stringtosend[20] = "\n00 : 00 : 00 ";
  uint32_t TimeToCompute = 0;

  rtc_t rtc;
  TimeToCompute = RTC->TR; /* get time */
  memcpy (&rtc, &TimeToCompute, sizeof (TimeToCompute));
  RTC->DR; /* need to read date also */

  snprintf((char*)pBuffer, length, "%d.%d.%d %d:%d", 10, 8, 16, 13, 20);

  pBuffer[1] = (uint8_t)(((TimeToCompute & RTC_TR_HT) >> 20) + 48);/* hour tens */
  pBuffer[2] = (uint8_t)(((TimeToCompute & RTC_TR_HU) >> 16) + 48);/* hour units */
  pBuffer[6] = (uint8_t)(((TimeToCompute & RTC_TR_MNT) >> 12) + 48);/* minute tens */
  pBuffer[7] = (uint8_t)(((TimeToCompute & RTC_TR_MNU) >> 8) + 48);/* minute units */
  pBuffer[11] = (uint8_t)(((TimeToCompute & RTC_TR_ST) >> 4) + 48);/* second tens */
  pBuffer[12] = (uint8_t)((TimeToCompute & RTC_TR_SU) + 48);/* second units */

  /* start USART transmission */
//  USART1->TDR = stringtosend[send++]; /* Will inititiate TC if TXE */
}
