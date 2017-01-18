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
#include "FlashG25.h"
#include "rtc.h"
#include "App.h"

/*
 * MCU bezi z MSI oscilatoru a pri freq 2,1 Mhz ma spotrebu cca 440 uA.
 * Po zmene rozsahu napajeni na Range3 (PWR->CR) se spotreba snizila na 362 uA.
 * Pred merenim spotreby nestaci reset, ale je potreba prerusit napajeni,
 * jinak STOP mod ma spotrebu pres 100 uA (asi zustane napajeny DEBUG modul).
 *
 * Po uvedeni do STOP modu a odpojeni napajeni (PA2) od MCP9700 a G25D10,
 * se spotreba snizi na 1uA. Bylo potreba uvest do analogoveho vstupu i pin PA7
 * pres ktery tekl proud (asi PULLUP od SPI) a na PA2 se objevilo napeti 2,8 V.
 *
 * Merici cyklus trva v DEBUG konfiguraci (s vystupem výpisu na seriový port) cca 35 ms,
 * bez vypisu asi 6ms.
 *
 *
 * v0.1 - prvni verze
 * v0.2 - kalibrace nyni funguje jako ofset, ktery se uklada do EEPROM (CALxxx),
 *        ADC meri pomoci oversamplingu,
 *        oprava chyby cteni sektoru v 'APP_PrintRecords',
 *        pri inicializaci vynulovan ukazatel pozice USART bufferu (g_BufferInPos),
 *        oprava vymazu pameti (nepocital s ruznou velikosti FLASH pameti),
 *        vypis teplotniho ofsetu ve statusu + refresh ofsetu po kalibraci,
 *        timeout pred vstupem do mereni prodlouzen na 15s,
 *        snizeni hodnoty intervalu o 1s pred zapisem do RTC->WUTR,
 *
 *        9.1.2017: !!! projevuje se problem s mazanim pameti,
 *        po vycisteni napajecich kontaktu zavada odstranena, posilim napajeni pameti z pinu
 *        kapacitou 1M !!!
 *
 */


void Tests(void);

int main(void)
{
  SystemCoreClockUpdate();

  SysTick_Config(2097);

  APP_Init();

  // Tests();

  while (RTC_GetUsartTimer())
  {
    USART_ProcessCommand();
  }

  USART_PrintLine((uint8_t*)"Exit to measure mode");
  USART_WaitForTC();

#ifndef DEBUG
  USART_DeInit();
#endif

  RTC_SetWakeUp(APP_GetInterval_s());
  while (1)
  {
    APP_Measure();
    APP_StopMode();
  }
}

void Tests(void)
{
  // ---------- Test RTC ---------------
  rtc_record_time_t dt;

  dt.day = 15;
  dt.month = 11;
  dt.year = 16;
  dt.hour = 18;
  dt.min = 25;
  dt.sec = 0;
  RTC_Set(&dt, true, true);
  RTC_Get(&dt);
  uint32_t t = RTC_GetUnixTimeStamp(&dt);
  RTC_GetDateTimeFromUnix(&dt, t);
}
