/*
 * usart.c
 *
 *  Created on: 2. 11. 2016
 *      Author: priesolv
 */

#include "usart.h"
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "rtc.h"
#include "FlashG25.h"
#include "adc.h"

#ifdef DEBUG
#define WAKEUP_INTERVAL_S    10  // 10 seconds
#elif
#define WAKEUP_INTERVAL_S    (30 * 60)  // 30 minut
#endif

#define BUFFER_SIZE  128

static uint8_t g_BufferIn[BUFFER_SIZE];
static uint8_t g_BufferInPos;
static bool    g_bCommandReady;
static uint16_t g_nWakeUpInterval_s = WAKEUP_INTERVAL_S;

static uint32_t g_nRecords;
static uint32_t g_nFreeRecords;
static uint32_t g_nBatVoltage;

static const uint8_t T_Version[] = "---- DATA LOGGER v0.1 ----";
static const uint8_t T_NewLine[] = "\r\n";

void USART_Init(void)
{
  /* Enable the peripheral clock of GPIOA */
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

  /* GPIO configuration for USART2 signals */
  /* (1) Select AF mode (10) on PA9 and PA10 */
  /* (2) AF4 for USART2 signals */
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE9|GPIO_MODER_MODE10))\
                | (GPIO_MODER_MODE9_1 | GPIO_MODER_MODE10_1); /* (1) */
  GPIOA->AFR[1] = (GPIOA->AFR[1] &~ (0x00000FF0))\
                 | (4 << (1 * 4)) | (4 << (2 * 4)); /* (2) */

  /* Enable the peripheral clock USART2 */
  RCC->APB1ENR |= RCC_APB1ENR_USART2EN;

  /* Configure USART2 */
  /* (1) oversampling by 16, 9600 baud */
  /* (2) 8 data bit, 1 start bit, 1 stop bit, no parity */
  //  USART2->BRR = 160000 / 96; /* (1) */
  USART2->BRR = 218;
  USART2->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_UE; /* (2) */

  /* polling idle frame Transmission */
  while((USART2->ISR & USART_ISR_TC) != USART_ISR_TC)
  {
    /* add time out here for a robust application */
  }

  g_bCommandReady = false;

  USART2->CR1 |= USART_CR1_RXNEIE;      // enable RX INT

  //  USART2->ICR = USART_ICR_TCCF;/* clear TC flag */
  //  USART2->CR1 |= USART_CR1_TCIE;/* enable TC interrupt */

  NVIC_SetPriority(USART2_IRQn, 1);
  NVIC_EnableIRQ(USART2_IRQn);
}

void USART_DeInit(void)
{
  USART2->CR1 = 0;      // enable RX INT
  NVIC_DisableIRQ(USART2_IRQn);
  RCC->APB1ENR &= ~RCC_APB1ENR_USART2EN;

  // Set GPIOs to analog mode
  GPIOA->MODER |= (GPIO_MODER_MODE9_1 | GPIO_MODER_MODE9_0 | GPIO_MODER_MODE10_1 | GPIO_MODER_MODE10_0);
}

void USART_ProcessCommand()
{
  if (!g_bCommandReady)
  {
    return;
  }

  strupr((char*)g_BufferIn);
  USART_PrintLine(g_BufferIn);
  switch (g_BufferIn[0])
  {
    case 0:
      USART_PrintHelp();
      break;
    case 'S':
      USART_PrintStatus();
      break;
    case 'L':
      APP_PrintRecords();
      break;
    case 'D':
      USART_SetDate();
      break;
    case 'T':
      USART_SetTime();
      break;
    case 'I':
      USART_SetWakeUpInterval();
      break;
    case 'X':
      USART_EraseMemory();
      break;
    case 'C':
      USART_CalTemp();
      break;
    default:
      USART_PrintLine((uint8_t*)"???");
      break;
  }

  g_BufferInPos = 0;
  g_bCommandReady = false;
  USART2->CR1 |= USART_CR1_RXNEIE;
  USART_Putc('>');
}

void USART_PrintHeader(uint32_t nRecords, uint32_t nFreeRecords, uint32_t nBatVoltage, app_error_t eErr)
{
  g_nRecords = nRecords;
  g_nFreeRecords = nFreeRecords;
  g_nBatVoltage = nBatVoltage;

  USART_PrintNewLine();
  USART_PrintLine(T_Version);

  USART_PrintStatus();
  USART_PrintNewLine();
//  USART_PrintHelp();
//  USART_PrintNewLine();

  switch (eErr)
  {
  case err_flash_error:
    USART_PrintLine((uint8_t*)"FLASH memory ERROR!");
    break;
  case err_full_memory:
    USART_PrintLine((uint8_t*)"FULL MEMORY!");
    break;
  case err_ok:
    break;
  }
}

void USART_PrintStatus()
{
  uint8_t text[50];

  snprintf((char*)text, sizeof (text), "Date&time: ");
  USART_Print(text);
  USART_PrintDateTime();
  uint16_t nVDDA = Adc_MeasureRefInt();
  snprintf((char*)text, sizeof (text), "Battery:%d(mV)", nVDDA);
  USART_PrintLine(text);
  int16_t temp = Adc_CalcTemperature(Adc_CalcValueFromVDDA(Adc_MeasureTemperature(), nVDDA));
  snprintf((char*)text, sizeof (text), "Temperature:%d,%d(C)", temp / 10, temp % 10);
  USART_PrintLine(text);
  snprintf((char*)text, sizeof (text), "Interval:%d(min)", g_nWakeUpInterval_s / 60);
  USART_PrintLine(text);
  snprintf((char*)text, sizeof (text), "Number of records:%lu", g_nRecords);
  USART_PrintLine(text);
  uint32_t nDays = g_nFreeRecords / (86400 / g_nWakeUpInterval_s);
  snprintf((char*)text, sizeof (text), "Free memory:%lu records (%lu days)", g_nFreeRecords, nDays);
  USART_PrintLine(text);
}

void USART_PrintHelp()
{
  USART_PrintLine((uint8_t*)"COMMANDS:");
  USART_PrintLine((uint8_t*)"Print status: 'S'");
  USART_PrintLine((uint8_t*)"Set date: 'D dd.mm.yy' (25.3.16)");
  USART_PrintLine((uint8_t*)"Set time: 'T hh:mm' (14:10)");
  USART_PrintLine((uint8_t*)"Set interval: 'I mm' (30)");
  USART_PrintLine((uint8_t*)"Temperature list: 'L'");
  USART_PrintLine((uint8_t*)"Erase memory: 'X+X'");
  USART_PrintLine((uint8_t*)"Print help: ENTER");
}

void USART_EraseMemory()
{
  if (g_BufferIn[1] == '+' && g_BufferIn[2] == 'X')
  {
    // vymazat pamet
    for (uint8_t i = 0; i < 32; i++)
    {
      FlashG25_SectorErase(i);
      USART_Putc('.');
    }

    USART_PrintNewLine();
    USART_PrintLine((uint8_t*)"Memory is erased");
    APP_FindFlashPosition();
    g_nRecords = APP_GetRecords();
  }
}

void USART_SetDate()
{
  rtc_record_time_t rtime;

  if (atoi((char*)&g_BufferIn[1]))  // pokud je první hodnota platné èíslo
  {
    const char s[2] = ".";
    char *pos = strtok((char*)&g_BufferIn[1], s); // find first occure
    rtime.day = atoi(pos);

    pos = strtok(NULL, s); // find first occure
    rtime.month = atoi(pos);

    pos = strtok(NULL, s);
    rtime.year = atoi(pos);

    RTC_Set(&rtime, true, false);
  }

  USART_PrintDateTime();
}

void USART_SetTime()
{
  rtc_record_time_t rtime;

  if (atoi((char*)&g_BufferIn[1]))  // pokud je první hodnota platné èíslo
  {
    const char s[2] = ":";
    char *pos = strtok((char*)&g_BufferIn[1], s); // find first occure
    rtime.hour = atoi(pos);

    pos = strtok(NULL, s);  // find first occure
    rtime.min = atoi(pos);

    pos = strtok(NULL, s);
    rtime.sec = atoi(pos);

    RTC_Set(&rtime, false, true);
  }

  USART_PrintDateTime();
}

void USART_SetWakeUpInterval()
{
  if (g_BufferIn[1])
  {
    uint16_t nInterval = atoi((char*)&g_BufferIn[1]);
    if (nInterval)
    {
      g_nWakeUpInterval_s = nInterval * 60;
    }
  }

  uint8_t text[20];
  snprintf((char*)text, sizeof(text), "Interval=%d min", g_nWakeUpInterval_s / 60);
  USART_PrintLine(text);
}

uint16_t USART_GetWakeUpInterval()
{
  return g_nWakeUpInterval_s;
}

void USART_PrintDateTime()
{
  uint8_t text[20];
  RTC_PrintDT(text, sizeof(text));
  USART_PrintLine(text);
}

void USART_CalTemp()
{
  if (!strncmp((char*)g_BufferIn, "CAL", 3))
  {
    int16_t temp = 0;
    if (atoi((char*)&g_BufferIn[3]))  // pokud je první hodnota platné èíslo
    {
      const char s[2] = ".";
      char *pos = strtok((char*)&g_BufferIn[3], s); // find first occure
      temp = atoi(pos) * 10;

      pos = strtok(NULL, s); // find first occure
      temp += atoi(pos);
    }

    if (temp)
    {
      uint16_t nAdcValue = Adc_MeasureTemperature();
      APP_SaveCalTemp(temp, nAdcValue);
    }
  }
}

void USART_Putc(uint8_t ch)
{
  while (!(USART2->ISR & USART_ISR_TXE));
  USART2->TDR = ch;
}

void USART_Print(const uint8_t* text)
{
  while (*text)
  {
    USART_Putc(*text++);
  }
}

void USART_PrintLine(const uint8_t* text)
{
  USART_Print(text);
  USART_Print(T_NewLine);
}

void USART_PrintNewLine()
{
  USART_Print(T_NewLine);
}

void USART_WaitForTC()
{
  while (!(USART2->ISR & USART_ISR_TC));
}

void USART2_IRQHandler(void)
{
  if (g_bCommandReady)
  {
    return;
  }

  if (USART2->ISR & USART_ISR_RXNE)
  {
    RTC_SetUsartTimer(60000);       // timeout for command line
    g_BufferIn[g_BufferInPos] = USART2->RDR;

    // End of line!
    if (g_BufferIn[g_BufferInPos] == '\r')
    {
      g_BufferIn[g_BufferInPos] = 0;
      USART2->CR1 &= ~USART_CR1_RXNEIE;     // disable RX INT
      g_bCommandReady = true;
    }

    if (g_BufferInPos < (BUFFER_SIZE - 1))
    {
      g_BufferInPos++;
    }
  }
}
