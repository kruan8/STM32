/*
 * clock.c
 *
 *  Created on: 10. 8. 2016
 *      Author: priesolv
 */

#include "clock.h"

void SetHSI16(void)
{
//  RCC->APB1ENR |= (RCC_APB1ENR_PWREN); /* (1) */
//  PWR->CR = (PWR->CR & ~(PWR_CR_VOS)) | PWR_CR_VOS_0; /* (2) */

  RCC->CR |= RCC_CR_HSION;  // HSI osc ON
  while ((RCC->CR & (RCC_CR_HSIRDY)) != (RCC_CR_HSIRDY)); // wait for HSI ready
  RCC->CFGR = (RCC->CFGR & (~RCC_CFGR_SW)) | RCC_CFGR_SW_HSI; // set HSI as SYSCLK
  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_HSI);  // wait for change

  RCC->CR &= ~RCC_CR_MSION;   // MSI oscilator OFF
}

void SetMSI(msi_cloks_e eMsiRange)
{
  RCC->CR |= RCC_CR_MSION;    // MSI oscilator ON
  while ((RCC->CR & (RCC_CR_MSIRDY)) != (RCC_CR_MSIRDY)); // wait for MSI is ready
  RCC->CFGR = (RCC->CFGR & (~RCC_CFGR_SW)) | RCC_CFGR_SW_MSI; // set MSI as SYSCLK
  RCC->ICSCR = (RCC->ICSCR & (~RCC_ICSCR_MSIRANGE)) | (uint32_t) eMsiRange;
  RCC->CR &= (~RCC_CR_HSION);   // HSI oscilator OFF
}
