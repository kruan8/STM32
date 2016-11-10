/*
 * clock.c
 *
 *  Created on: 10. 8. 2016
 *      Author: priesolv
 */

#include "clock.h"

//  // pri behu na MSI 2,1 MHz je spotreba 261 uA
//
//  // pri behu na HSI 16MHz je spotreba cca 1 mA

void SetHSI16(void)
{
  RCC->CR |= RCC_CR_HSION;  // HSI osc ON
  RCC->CFGR = (RCC->CFGR & (~RCC_CFGR_SW)) | RCC_CFGR_SW_HSI; // set HSI as SYSCLK
  while ((RCC->CFGR & RCC_CFGR_SWS) != RCC_CFGR_SWS_HSI);  // wait for change

  RCC->CR &= ~RCC_CR_MSION;   // MSI oscilator OFF
}

void SetMSI(msi_cloks_e eMsiRange)
{
  RCC->CR |= RCC_CR_MSION;    // MSI oscilator ON
  RCC->CFGR = (RCC->CFGR & (~RCC_CFGR_SW)) | RCC_CFGR_SW_MSI; // set MSI as SYSCLK
  RCC->ICSCR = (RCC->ICSCR & (~RCC_ICSCR_MSIRANGE)) | (uint32_t) eMsiRange;
  RCC->CR &= (~RCC_CR_HSION);   // HSI oscilator OFF
}
