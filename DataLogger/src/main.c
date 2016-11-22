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

/*
 * MCU bezi z MSI oscilatoru a pri freq 2,1 Mhz ma spotrebu cca 440 uA.
 * Po zmene rozsahu napajeni na Range3 (PWR->CR) se spotreba snizila na 362 uA.
 * Pred merenim spotreby je potreba prerusit napajeni, jinak STOP mod ma
 * spotrebu pres 100 uA (asi zustane napajeny DEBUG modul).
 *
 * Po uvedeni do STOP modu a odpojeni napajeni (PA2) od MCP9700 a G25D10,
 * se spotreba snizi na 1uA. Bylo potreba uvest do analogoveho vstupu i pin PA7
 * pres ktery tekl proud (asi PULLUP od SPI) a na PA2 se objevilo napeti 2,8 V.
 *
 * Merici cyklus trva cca 35 ms.
 *
 */

int main(void)
{
  SystemCoreClockUpdate();
  SysTick_Config(2097);

  APP_Init();

  while (RTC_GetUsartTimer())
  {
    USART_ProcessCommand();
  }

  USART_PrintLine((uint8_t*)"Exit to measure mode");
  USART_WaitForTC();
  RTC_SetWakeUp(USART_GetWakeUpInterval());
  while (1)
  {
    APP_Measure();
    APP_StopMode();
  }
}
