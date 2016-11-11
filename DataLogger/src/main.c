/*
 * main.c
 *
 *  Created on: 10. 8. 2016
 *      Author: priesolv
 */

#include "stm32l0xx.h"
#include <stdio.h>
#include "clock.h"
#include "usart.h"

#include "adc.h"
#include "FlashG25D10B.h"
#include "rtc.h"
#include "App.h"


int main(void)
{
  SystemCoreClockUpdate();
  SysTick_Config(2097);

  App_Init();

  while (RTC_GetUsartTimer())
  {
    USART_ProcessCommand();
  }

  USART_PrintLine((uint8_t*)"Exit to measure mode");
  RTC_SetWakeUp(USART_GetWakeUpInterval());
  while (1)
  {
    App_Measure();
    RTC_StopMode();
  }
}
