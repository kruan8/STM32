/*
 * App.c
 *
 *  Created on: 9. 11. 2016
 *      Author: vladicek
 */


#include "App.h"
#include "usart.h"
#include "rtc.h"
#include "adc.h"

void App_Init(void)
{
  USART_Configure_GPIO();
  USART_Configure();

  RTC_Init();

  Adc_Init();

  FlashG25D10_Init();

  uint32_t id = FlashG25D10_GetID();
  if (id != 0xC84011)
  {
    while(1);
  }

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

}

void App_Measure(void)
{
  rtc_record_time_t time;
  time.day = 11;
  time.month = 4;
  time.year = 2016;

  time.hour = 15;
  time.min = 8;

  uint32_t t = RTC_ConvertFromStruct(&time);
  RTC_ConvertToStruct(t, &time);

  // zmerit napajeci napeti VDDA
  uint16_t nVDDA = Adc_MeasureRefInt();

  // namerit teplotu
  int16_t temp = Adc_CalcTemperature(Adc_MeasureTemperature());

  uint8_t text[30];
  snprintf((char*)text, sizeof(text), "VDDA:%d(mV)  TEMP:%d.%d", nVDDA, temp / 10, temp % 10);
  USART_Puts(text);
  USART_WaitForTC();

  // ulozit do Flash
}
