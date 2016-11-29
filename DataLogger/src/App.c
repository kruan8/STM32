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
#include "FlashG25.h"
#include "clock.h"
#include "Eeprom.h"

#define SUPPLY_PIN              (1 << 2)
#define SUPPLY_GPIO_PORT        GPIOA

#define SUPPLY_ENABLE           (SUPPLY_GPIO_PORT->BSRR = SUPPLY_PIN)
#define SUPPLY_DISABLE          (SUPPLY_GPIO_PORT->BRR = SUPPLY_PIN)

#define RECORD_SIZE             (sizeof(app_record_t))   // 5
#define RECORDS_PER_SECTOR      (4096 / RECORD_SIZE)
#define FULL_SECTOR             (RECORDS_PER_SECTOR * RECORD_SIZE)

//static const uint8_t EmptyRecord[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
static const app_record_t EmptyRecord = { 0xFFFFFFFF, 0xFFFF};

static uint32_t g_nSector;
static uint16_t g_nSectorPosition;
static int16_t  g_nCalTemp;
static uint16_t  g_nCalTempAdc;

static app_error_t g_eError = err_ok;

void APP_Init(void)
{
  // prepnuti CORE na Range3 (nelze flashovat)
  RCC->APB1ENR |= RCC_APB1ENR_PWREN; // Enable PWR clock
  while (PWR->CSR & PWR_CSR_VOSF);
  PWR->CR |= PWR_CR_VOS_0 | PWR_CR_VOS_1;
  while (PWR->CSR & PWR_CSR_VOSF);
  RCC->APB1ENR &= ~RCC_APB1ENR_PWREN;

  Adc_Init();
  RTC_Init();

  g_nCalTemp = Eeprom_ReadUint32(EEPROM_TEMP_C);
  g_nCalTempAdc = Eeprom_ReadUint32(EEPROM_TEMP_ADC);

  APP_SupplyOnAndWait();  // set SUPPLY pin for output

  USART_Init();

  uint32_t nFreeRecords = 0;
  if (FlashG25_Init())
  {
    nFreeRecords = APP_FindFlashPosition();
  }
  else
  {
    g_eError = err_flash_error;
  }

  USART_PrintHeader(APP_GetRecords(), nFreeRecords, Adc_MeasureRefInt(), g_eError);
  USART_Putc('>');
  RTC_SetUsartTimer(10000);     // waiting for usart input
}

void APP_Measure(void)
{
  if (g_eError)
  {
    return;
  }

  APP_SupplyOnAndWait();

  rtc_record_time_t dt;

//  // ---------- Test RTC ---------------------------------------------------------
//  dt.day = 15;
//  dt.month = 11;
//  dt.year = 16;
//  dt.hour = 18;
//  dt.min = 25;
//  RTC_Set(&dt, true, true);
//  RTC_Get(&dt);
//  uint32_t t = RTC_ConvertFromStruct(&dt);
//  /****/ RTC_ConvertToStruct(t, &dt); /****/  // spatne pocita prestupny rok !!!
//  // --------------------------------------------------------------------------------

  RTC_Get(&dt);
//  RTC_ConvertFromRtc(&time, &date, &dt);
  uint32_t nDt = RTC_ConvertFromStruct(&dt);

  // zmerit napajeci napeti VDDA
  uint16_t nVDDA = Adc_MeasureRefInt();

  // namerit teplotu
  uint16_t tempADC = Adc_CalcValueFromVDDA(Adc_MeasureTemperature(), nVDDA);
  int16_t temp = Adc_CalcTemperature(tempADC);
  int16_t tempInt = Adc_MeasureTemperatureInternal(Adc_MeasureRefInt());

#ifdef DEBUG
  uint8_t text[35];
  snprintf((char*)text, sizeof(text), "VDDA:%d(mV)  TEMP:%d.%d / %d.%d", nVDDA, temp / 10, temp % 10,  tempInt / 10, tempInt % 10);
  USART_PrintLine(text);
  USART_WaitForTC();
#endif

  app_record_t record;
  record.time = nDt;
  record.temperature = temp;

  // ulozit do Flash
  if (g_nSectorPosition == 0)  // zacatek noveho sektoru, tak ho smazat
  {
    FlashG25_SectorErase(g_nSector);
  }

  FlashG25_PageProgram(g_nSector + g_nSectorPosition, (uint8_t*)&record, sizeof(app_record_t));
  g_nSectorPosition += RECORD_SIZE;
  if (g_nSectorPosition >= FULL_SECTOR)
  {
    g_nSectorPosition = 0;
    g_nSector++;
    if (g_nSector >= FlashG25_GetSectors())
    {
      g_eError = err_full_memory;
    }
  }

  APP_SupplyOff();
}

uint32_t APP_GetRecords()
{
  return g_nSector * RECORDS_PER_SECTOR + g_nSectorPosition / RECORD_SIZE;
}

uint32_t APP_FindFlashPosition()
{
  uint8_t buff[RECORD_SIZE];

  // find last used sector;
  bool bFullMemory = true;
  uint32_t nSectors = FlashG25_GetSectors();
  for (g_nSector = 0; g_nSector < nSectors; g_nSector++)
  {
    FlashG25_ReadData(G25_SECTOR_SIZE * g_nSector, buff, RECORD_SIZE);
    if (memcmp(buff, &EmptyRecord, sizeof (EmptyRecord)) == 0)
    {
      bFullMemory = false;
      break;
    }
  }

  if (bFullMemory)
  {
    g_eError = err_full_memory;
    return 0;
  }

  // find last record in the sector
  g_nSectorPosition = 0;
  if (g_nSector != 0)
  {
    g_nSector--;
    while (g_nSectorPosition < FULL_SECTOR)
    {
      FlashG25_ReadData(g_nSector * G25_SECTOR_SIZE + g_nSectorPosition, buff, RECORD_SIZE);
      if (memcmp(buff, &EmptyRecord, sizeof (EmptyRecord)) == 0)
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

  uint32_t nFreeRecords = ((nSectors - g_nSector) * G25_SECTOR_SIZE - g_nSectorPosition) / RECORD_SIZE;
  return nFreeRecords;
}

void APP_PrintRecords()
{
  app_record_t record;
  uint8_t text[30];
  uint32_t nRecords = 0;

  USART_PrintLine((uint8_t*)"Memory report:");

  uint32_t nSectors = FlashG25_GetSectors();
  for (uint16_t sect = 0; sect < nSectors; sect++)
  {
    for (uint16_t pos = 0; pos < FULL_SECTOR; pos += RECORD_SIZE)
    {
      FlashG25_ReadData(g_nSector * G25_SECTOR_SIZE + pos, (uint8_t*) &record, RECORD_SIZE);
      if (memcmp((uint8_t*) &record, &EmptyRecord, sizeof (EmptyRecord)) == 0)
      {
        snprintf((char*)text, sizeof(text), "Number of records:%lu", nRecords);
        USART_PrintLine(text);
        return;
      }

      nRecords++;

      rtc_record_time_t rtime;
      RTC_ConvertToStruct(record.time, &rtime);

      snprintf((char*)text, sizeof(text), "%d.%d.%d %02d:%02d>%d.%d",
          rtime.day, rtime.month, rtime.year, rtime.hour, rtime.min, record.temperature / 10, record.temperature % 10);

      USART_PrintLine(text);
    }
  }
}

void APP_SupplyOnAndWait()
{
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

  // output mode (napajeni MCP9700 + G25D10)
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE2)) | GPIO_MODER_MODE2_0;

  // vratit do AF (SPI1)
  GPIOA->MODER = (GPIOA->MODER & (~GPIO_MODER_MODE7)) | GPIO_MODER_MODE7_1;
  SUPPLY_ENABLE;

//  SetMSI(msi_65kHz);
  ADC->CCR |= ADC_CCR_VREFEN;     // enable VREFINT
  ADC->CCR |= ADC_CCR_TSEN;       // enable TEMP_INT

  uint32_t start = RTC_GetTicks();
  while ((RTC_GetTicks() - start) < 4);   // wait min 4ms
//  SetMSI(msi_2Mhz);
}

void APP_SupplyOff()
{
  ADC->CCR &= ~ADC_CCR_VREFEN;     // disable VREFINT
  ADC->CCR &= ~ADC_CCR_TSEN;       // disable TEMP_INT

  GPIOA->MODER = (GPIOA->MODER & (~GPIO_MODER_MODE2)) | GPIO_MODER_MODE2_0 | GPIO_MODER_MODE2_1; // analog mode

  // tekl zde proud z PA7 (SPI MOSI), ktery se pres G25D10 objevil na PA2, na kterem vzniklo napeti 2,8V
  GPIOA->MODER = (GPIOA->MODER & (~GPIO_MODER_MODE7)) | GPIO_MODER_MODE7_0 | GPIO_MODER_MODE7_1; // analog mode
}

void APP_StopMode(void)
{
  // Adc_Disable();
  RCC->APB1ENR |= RCC_APB1ENR_PWREN; // Enable PWR clock
  PWR->CR |= PWR_CR_ULP;

  SysTick->CTRL &= ~SysTick_CTRL_ENABLE_Msk;
  PWR->CR |= PWR_CR_CWUF;  // Clear Wakeup flag
  PWR->CR |= PWR_CR_LPSDSR;
  SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk; // Set SLEEPDEEP bit of Cortex-M0 System Control Register

  __asm volatile ("wfi");

  SCB->SCR &= (uint32_t)~((uint32_t)SCB_SCR_SLEEPDEEP_Msk);
  PWR->CR &= ~PWR_CR_LPSDSR;
  SysTick->VAL = 0;
  SysTick->CTRL |= SysTick_CTRL_ENABLE_Msk;

//  Adc_Enable();
}

void APP_SaveCalTemp(int16_t nTemp, uint16_t nAdcValue)
{
  // ulozit do EEPROM
  Eeprom_UnlockPELOCK();
  Eeprom_WriteUint32(EEPROM_TEMP_C, nTemp);
  Eeprom_WriteUint32(EEPROM_TEMP_ADC, nAdcValue);
  Eeprom_LockNVM();
}
