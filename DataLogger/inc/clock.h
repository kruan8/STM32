/*
 * clock.h
 *
 *  Created on: 10. 8. 2016
 *      Author: priesolv
 */

#ifndef CLOCK_H_
#define CLOCK_H_

#include "stm32l0xx.h"

typedef enum
{
  msi_65kHz = RCC_ICSCR_MSIRANGE_0,   // spotreba 38 uA
  msi_131kHz = RCC_ICSCR_MSIRANGE_1,  // 54
  msi_262kHz = RCC_ICSCR_MSIRANGE_2,  // 72
  msi_524kHz = RCC_ICSCR_MSIRANGE_3,  // 112
  msi_1Mhz = RCC_ICSCR_MSIRANGE_4,    // 184
  msi_2Mhz = RCC_ICSCR_MSIRANGE_5,    // spotreba 330 uA
  msi_4Mhz = RCC_ICSCR_MSIRANGE_6,    // 620
}msi_cloks_e;

void SetHSI16(void);
void SetMSI(msi_cloks_e eMsiRange);

#endif /* CLOCK_H_ */
