/*
 * App.c
 *
 *  Created on: 9. 11. 2016
 *      Author: vladicek
 */

#include <stdio.h>
#include <string.h>
#include "App.h"
#include "usart.h"
#include "rtc.h"
#include "adc.h"
#include "FlashG25D10B.h"

uint32_t g_nRecordPosition;

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

  //  FlashG25D10Status_t status = FlashG25D10_GetStatus();
  //
  //  FlashG25D10_ReadData(0, dataOut, sizeof (dataOut));

  RTC_SetUsartTimer(10000);
  USART_PrintHeader();
}

void App_Measure(void)
{
  rtc_time_t time;
  rtc_date_t date;
  rtc_record_time_t rtime;

  RTC_GetDT(&time, &date);
  RTC_ConvertFromRtc(&time, &date, &rtime);

  uint32_t t = RTC_ConvertFromStruct(&rtime);

  // zmerit napajeci napeti VDDA
  uint16_t nVDDA = Adc_MeasureRefInt();

  // namerit teplotu
  int16_t temp = Adc_CalcTemperature(Adc_MeasureTemperature());

  uint8_t text[30];
  snprintf((char*)text, sizeof(text), "VDDA:%d(mV)  TEMP:%d.%d", nVDDA, temp / 10, temp % 10);
  USART_Puts(text);
  USART_WaitForTC();

  uint8_t buff[5];
  memcpy(buff, &t, sizeof(t));
  buff[3] |= (t >> 4) & 0xF0;
  buff[4] = t & 0xFF;

  // ulozit do Flash (512 pages)
  FlashG25D10_PageProgram(g_nRecordPosition * 5, buff, sizeof(buff));
}
