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
#include "clock.h"

#define SUPPLY_PIN              (1 << 2)
#define SUPPLY_GPIO_PORT        GPIOA

#define SUPPLY_ENABLE           (SUPPLY_GPIO_PORT->BSRR = SUPPLY_PIN)
#define SUPPLY_DISABLE          (SUPPLY_GPIO_PORT->BRR = SUPPLY_PIN)

#define RECORD_SIZE           5
#define RECORDS_PER_SECTOR    (4096 / RECORD_SIZE)
#define FULL_SECTOR           (RECORDS_PER_SECTOR * RECORD_SIZE)

static const uint8_t EmptyRecord[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF};

uint32_t g_nSector;
uint16_t g_nSectorPosition;

app_error_t g_eError = err_ok;

void App_Init(void)
{
  // prepnuti CORE na Range3 (nelze flashovat)
  RCC->APB1ENR |= RCC_APB1ENR_PWREN; // Enable PWR clock
  while (PWR->CSR & PWR_CSR_VOSF);
  PWR->CR |= PWR_CR_VOS_0 | PWR_CR_VOS_1;
  while (PWR->CSR & PWR_CSR_VOSF);
  RCC->APB1ENR &= ~RCC_APB1ENR_PWREN;

  Adc_Init();
  RTC_Init();

  App_SupplyOnAndWait();  // set SUPPLY pin for output

  USART_Configure_GPIO();
  USART_Configure();

  FlashG25D10_Init();
  if (FlashG25D10_IsPresent())
  {
    App_FindFlashPosition();
  }
  else
  {
    g_eError = err_flash_error;
  }

  RTC_SetUsartTimer(10000);

  USART_PrintHeader(App_GetRecords(), Adc_MeasureRefInt(), g_eError);
  USART_Putc('>');
}

void App_Measure(void)
{
  if (g_eError)
  {
    return;
  }

  App_SupplyOnAndWait();

  rtc_time_t time;
  rtc_date_t date;
  rtc_record_time_t rtime;

  // -------------------------------------------------------
//  date.day = 5;
//  date.day10 = 1;
//  date.month = 1;
//  date.month10 = 1;
//  date.year = 6;
//  date.year10 = 1;
//
//  memset(&time, 0, sizeof(time));
//  time.hour10 = 1;
//  time.minute = 8;
//  RTC_Set(&time, &date);
//  RTC_GetDT(&time, &date);
//  RTC_ConvertFromRtc(&time, &date, &rtime);
//  uint32_t dt = RTC_ConvertFromStruct(&rtime);
//  /****/ RTC_ConvertToStruct(dt, &rtime); /****/  // spatne pocita prestupny rok !!!
// ---------------------------------------------------------------------------------------

  RTC_GetDT(&time, &date);
  RTC_ConvertFromRtc(&time, &date, &rtime);
  uint32_t dt = RTC_ConvertFromStruct(&rtime);

  // zmerit napajeci napeti VDDA
  uint16_t nVDDA = Adc_MeasureRefInt();

  // namerit teplotu


  uint16_t tempADC = Adc_CalcValueFromVDDA(Adc_MeasureTemperature(), nVDDA);
  int16_t temp = Adc_CalcTemperature(tempADC);

#ifdef DEBUG
  uint8_t text[30];
  snprintf((char*)text, sizeof(text), "VDDA:%d(mV)  TEMP:%d.%d", nVDDA, temp / 10, temp % 10);
  USART_PrintLine(text);
  USART_WaitForTC();
#endif

  uint8_t buff[RECORD_SIZE];
  memcpy(buff, &dt, sizeof(dt));
  buff[3] |= (tempADC >> 4) & 0xF0;
  buff[4] = (uint8_t)tempADC;

  // ulozit do Flash
  if (g_nSectorPosition == 0)  // zacatek noveho sektoru, tak ho smazat
  {
    FlashG25D10_SectorErase(g_nSector);
  }

  FlashG25D10_PageProgram(g_nSector + g_nSectorPosition, buff, sizeof(buff));
  g_nSectorPosition += RECORD_SIZE;
  if (g_nSectorPosition >= FULL_SECTOR)
  {
    g_nSectorPosition = 0;
    g_nSector++;
    if (g_nSector >= G25D10_SECTORS)
    {
      g_eError = err_full_memory;
    }
  }

  App_SupplyOff();
}

uint32_t App_GetRecords()
{
  return g_nSector * RECORDS_PER_SECTOR + g_nSectorPosition / RECORD_SIZE;
}

void App_FindFlashPosition()
{
  uint8_t buff[RECORD_SIZE];

  // find last used sector;
  bool bFullMemory = true;
  for (g_nSector = 0; g_nSector < G25D10_SECTORS; g_nSector++)
  {
    FlashG25D10_ReadData(G25D10_SECTOR_SIZE * g_nSector, buff, RECORD_SIZE);
    if (memcmp(buff, EmptyRecord, sizeof (EmptyRecord)) == 0)
    {
      bFullMemory = false;
      break;
    }
  }

  if (bFullMemory)
  {
    g_eError = err_full_memory;
    return;
  }

  // find last record in the sector
  g_nSectorPosition = 0;
  if (g_nSector != 0)
  {
    g_nSector--;
    while (g_nSectorPosition < FULL_SECTOR)
    {
      FlashG25D10_ReadData(g_nSector * G25D10_SECTOR_SIZE + g_nSectorPosition, buff, RECORD_SIZE);
      if (memcmp(buff, EmptyRecord, sizeof (EmptyRecord)) == 0)
      {
        break;
      }

      g_nSectorPosition += RECORD_SIZE;
    }

    if (g_nSectorPosition >= FULL_SECTOR)
    {
      g_nSector++;
      g_nSectorPosition = 0;
    }
  }

}

void App_PrintRecords()
{
  uint8_t buff[RECORD_SIZE];
  uint8_t text[30];
  uint32_t nRecords = 0;

  USART_PrintLine((uint8_t*)"Memory report:");

  for (uint16_t sect = 0; sect < G25D10_SECTORS; sect++)
  {
    for (uint16_t pos = 0; pos < FULL_SECTOR; pos += RECORD_SIZE)
    {
      FlashG25D10_ReadData(g_nSector * G25D10_SECTOR_SIZE + pos, buff, RECORD_SIZE);
      if (memcmp(buff, EmptyRecord, sizeof (EmptyRecord)) == 0)
      {
        snprintf((char*)text, sizeof(text), "Number of records:%lu", nRecords);
        USART_PrintLine(text);
        return;
      }

      nRecords++;
      uint16_t temp = (((uint16_t)buff[3] & 0xF0) << 4) | buff[4];

      uint32_t dt;
      buff[3] &= 0x0F;
      memcpy(&dt, buff, sizeof(dt));

      rtc_record_time_t rtime;
      RTC_ConvertToStruct(dt, &rtime);

      int16_t temperature = Adc_CalcTemperature(temp);
      snprintf((char*)text, sizeof(text), "%d.%d.%d %02d:%02d>%d.%d",
          rtime.day, rtime.month, rtime.year, rtime.hour, rtime.min, temperature / 10, temperature % 10);

      USART_PrintLine(text);
    }
  }
}

void App_SupplyOnAndWait()
{
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

  // output mode (napajeni MCP9700 + G25D10)
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE2)) | GPIO_MODER_MODE2_0;

  // vratit do AF (SPI1)
  GPIOA->MODER = (GPIOA->MODER & (~GPIO_MODER_MODE7)) | GPIO_MODER_MODE7_1;
  SUPPLY_ENABLE;

//  SetMSI(msi_65kHz);
  ADC->CCR |= ADC_CCR_VREFEN;     // enable VREFINT
  uint32_t start = RTC_GetTicks();
  while ((RTC_GetTicks() - start) < 4);   // wait min 4ms
//  SetMSI(msi_2Mhz);
}

void App_SupplyOff()
{
  ADC->CCR &= ~ADC_CCR_VREFEN;     // disable VREFINT

  GPIOA->MODER = (GPIOA->MODER & (~GPIO_MODER_MODE2)) | GPIO_MODER_MODE2_0 | GPIO_MODER_MODE2_1; // analog mode

  // tekl zde proud z PA7 (SPI MOSI), ktery se pres G25D10 objevil na PA2, na kterem vzniklo napeti 2,8V
  GPIOA->MODER = (GPIOA->MODER & (~GPIO_MODER_MODE7)) | GPIO_MODER_MODE7_0 | GPIO_MODER_MODE7_1; // analog mode
}
