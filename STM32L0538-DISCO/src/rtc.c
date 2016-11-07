/*
 * rtc.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "rtc.h"

void RTC_Configure(void)
{
  /* Enable the peripheral clock RTC */
  /* (1) Enable the LSI */
  /* (2) Wait while it is not ready */
  /* (3) Enable PWR clock */
  /* (4) Enable write in RTC domain control register */
  /* (5) LSI for RTC clock */
  /* (6) Disable PWR clock */
  RCC->CSR |= RCC_CSR_LSION; /* (1) */
  while((RCC->CSR & RCC_CSR_LSIRDY)!=RCC_CSR_LSIRDY) /* (2) */
  {
    /* add time out here for a robust application */
  }
  RCC->APB1ENR |= RCC_APB1ENR_PWREN; /* (3) */
  PWR->CR |= PWR_CR_DBP; /* (4) */
  RCC->CSR = (RCC->CSR & ~RCC_CSR_RTCSEL) | RCC_CSR_RTCEN | RCC_CSR_RTCSEL_1; /* (5) */
  RCC->APB1ENR &=~ RCC_APB1ENR_PWREN; /* (7) */

  /* Configure RTC */
  /* (7) Write access for RTC regsiters */
  /* (8) Disable alarm A to modify it */
  /* (9) Wait until it is allow to modify alarm A value */
  /* (10) Modify alarm A mask to have an interrupt each 1Hz */
  /* (11) Enable alarm A and alarm A interrupt */
  /* (12) Disable write access */
  RTC->WPR = 0xCA; /* (7) */
  RTC->WPR = 0x53; /* (7) */
  RTC->CR &=~ RTC_CR_ALRAE; /* (8) */
  while((RTC->ISR & RTC_ISR_ALRAWF) != RTC_ISR_ALRAWF) /* (9) */
  {
    /* add time out here for a robust application */
  }
  RTC->ALRMAR = RTC_ALRMAR_MSK4 | RTC_ALRMAR_MSK3 | RTC_ALRMAR_MSK2 | RTC_ALRMAR_MSK1; /* (10) */
  RTC->CR = RTC_CR_ALRAIE | RTC_CR_ALRAE; /* (11) */
  RTC->WPR = 0xFE; /* (12) */
  RTC->WPR = 0x64; /* (12) */

  /* Configure exti and nvic for RTC IT */
  /* (13) unmask line 17 */
  /* (14) Rising edge for line 17 */
  /* (15) Set priority */
  /* (16) Enable RTC_IRQn */
  EXTI->IMR |= EXTI_IMR_IM17; /* (13) */
  EXTI->RTSR |= EXTI_RTSR_TR17; /* (14) */
  NVIC_SetPriority(RTC_IRQn, 0); /* (15) */
  NVIC_EnableIRQ(RTC_IRQn); /* (16) */
}

/**
  * Brief   This function configures RTC.
  * Param   uint32_t New time
  * Retval  None
  */
void RTC_Init(uint32_t Time)
{
  /* RTC init mode */
  /* Configure RTC */
  /* (1) Write access for RTC registers */
  /* (2) Enable init phase */
  /* (3) Wait until it is allow to modify RTC register values */
  /* (4) set prescaler, 40kHz/64 => 625 Hz, 625Hz/625 => 1Hz */
  /* (5) New time in TR */
  /* (6) Disable init phase */
  /* (7) Disable write access for RTC registers */
  RTC->WPR = 0xCA; /* (1) */
  RTC->WPR = 0x53; /* (1) */
  RTC->ISR = RTC_ISR_INIT; /* (2) */
  while((RTC->ISR & RTC_ISR_INITF)!=RTC_ISR_INITF) /* (3) */
  {
    /* add time out here for a robust application */
  }
  RTC->PRER = 0x003F0270; /* (4) */
  RTC->TR = RTC_TR_PM | Time; /* (5) */
  RTC->ISR =~ RTC_ISR_INIT; /* (6) */
  RTC->WPR = 0xFE; /* (7) */
  RTC->WPR = 0x64; /* (7) */
}

void RTC_Get()
{
  uint8_t stringtosend[20] = "\n00 : 00 : 00 ";
  uint32_t TimeToCompute = 0;

  TimeToCompute = RTC->TR; /* get time */
  RTC->DR; /* need to read date also */

  stringtosend[1] = (uint8_t)(((TimeToCompute & RTC_TR_HT)>>20) + 48);/* hour tens */
  stringtosend[2] = (uint8_t)(((TimeToCompute & RTC_TR_HU)>>16) + 48);/* hour units */
  stringtosend[6] = (uint8_t)(((TimeToCompute & RTC_TR_MNT)>>12) + 48);/* minute tens */
  stringtosend[7] = (uint8_t)(((TimeToCompute & RTC_TR_MNU)>>8) + 48);/* minute units */
  stringtosend[11] = (uint8_t)(((TimeToCompute & RTC_TR_ST)>>4) + 48);/* second tens */
  stringtosend[12] = (uint8_t)((TimeToCompute & RTC_TR_SU) + 48);/* second units */

  /* start USART transmission */
//  USART1->TDR = stringtosend[send++]; /* Will inititiate TC if TXE */
}
