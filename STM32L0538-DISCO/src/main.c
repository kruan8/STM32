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


int main(void)
{
  SystemCoreClockUpdate();
  SysTick_Config(2097);

  USART_Configure_GPIO();
  USART_Configure();

  RTC_Init();

  Adc_Init();



//  FlashG25D10_Init();
//
//  uint32_t id = FlashG25D10_GetID();
//  if (id != 0xC84011)
//  {
//    while(1);
//  }
//
//  uint8_t dataIn[] = {1, 2, 3, 4, 5};
//  uint8_t dataOut[5];
//
//  FlashG25D10Status_t status = FlashG25D10_GetStatus();
//
//  FlashG25D10_SectorErase(0);
//
//  FlashG25D10_WriteEnable();
//  FlashG25D10_PageProgram(0, dataIn, sizeof(dataIn));
//
//  FlashG25D10_ReadData(0, dataOut, sizeof (dataOut));
//
//  FlashG25D10_SectorErase(0);


  RTC_SetUsartTimer(10000);
  USART_PrintHeader();

  while (RTC_GetUsartTimer())
  {
    USART_ProcessCommand();
  }

//  DBGMCU->CR = DBGMCU_CR_DBG_STOP;

  USART_PrintLine((uint8_t*)"Exit to measure mode");
  RTC_SetWakeUp(USART_GetWakeUpInterval());
  while (1)
  {
    // zmerit napajeci napeti VDDA
    uint16_t nVDDA = Adc_MeasureRefInt();

    // namerit teplotu
    int16_t temp = Adc_CalcTemperature(Adc_MeasureTemperature());

    uint8_t text[30];
    snprintf((char*)text, sizeof(text), "VDDA:%d(mV)  TEMP:%d.%d", nVDDA, temp / 10, temp % 10);
    USART_Puts(text);
    USART_WaitForTC();

    // ulozit do Flash

    RTC_StopMode();

    USART_PrintNewLine();
  }
}
