/*
 * main.c
 *
 *  Created on: 10. 8. 2016
 *      Author: priesolv
 */

#include "stm32l0xx.h"
#include "clock.h"
#include "usart.h"

#include "adc.h"
#include "FlashG25D10B.h"
#include "rtc.h"

int main(void)
{
//  SysTick_Config(1000);
  SystemCoreClockUpdate();
  USART_Configure_GPIO();
  USART_Configure();

  RTC_Init();
  rtc_t dt;
  RTC_Set(&dt);

  uint8_t text[20];
  RTC_Get(text, sizeof(text));

  Adc_Init();
  FlashG25D10_Init();

  uint32_t id = FlashG25D10_GetID();
  if (id != 0xC84011)
  {
    while(1);
  }

  uint8_t dataIn[] = {1, 2, 3, 4, 5};
  uint8_t dataOut[5];

  FlashG25D10Status_t status = FlashG25D10_GetStatus();

  FlashG25D10_SectorErase(0);

  FlashG25D10_WriteEnable();
  FlashG25D10_PageProgram(0, dataIn, sizeof(dataIn));

  FlashG25D10_ReadData(0, dataOut, sizeof (dataOut));

  FlashG25D10_SectorErase(0);

  uint16_t nVDDA = Adc_MeasureRefInt();


  while (1)
  {
    USART_ProcessCommand();
  }
}



