/*
 * main.c
 *
 *  Created on: 10. 8. 2016
 *      Author: priesolv
 */

#include "stm32l0xx.h"
#include "clock.h"
#include "spirit_spi.h"
#include "timer.h"
#include "trigger_app.h"
#include "Gpio_utility.h"

#include "Eeprom.h"

int main(void)
{
  // pri behu na MSI 2,1 MHz je spotreba 261 uA

  // pri behu na HSI 16MHz je spotreba cca 1 mA
  SetHSI16();

//  SysTick_Config(1000);
  SystemCoreClockUpdate();



//  Eeprom_UnlockPELOCK();
//
//  *(uint8_t *)(DATA_E2_ADDR+1) = 0x55; /* (1) */
//  uint8_t v = (*(uint8_t *)(DATA_E2_ADDR+1));
//  Eeprom_LockNVM();

  App_Init();
  Gpio_LedBlink(500);

//  // po resetu jdeme do Standby
//  RCC->APB1ENR |= RCC_APB1ENR_PWREN;
//  if (!(PWR->CSR & PWR_CSR_SBF))
//  {
//    Gpio_StandbyMode();
//  }

//  uint8_t res = SpiritRadioSetFrequencyBase(915000000);
//  uint32_t freq = SpiritRadioGetFrequencyBase();
  while (1)
  {
    App_Exec();
  }

}

