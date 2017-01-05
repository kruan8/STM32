/*
 * usart.h
 *
 *  Created on: 2. 11. 2016
 *      Author: priesolv
 */

#ifndef USART_H_
#define USART_H_

#include "stm32l0xx.h"
#include "App.h"

void USART_Init(void);
void USART_DeInit(void);

void USART_ProcessCommand();
void USART_PrintHeader(uint32_t nRecords, uint32_t nFreeRecords, uint32_t nBatVoltage, app_error_t eErr);
void USART_PrintStatus();
void USART_PrintHelp();
void USART_PrintTemperature(int16_t nTemp);
void USART_SetDate();
void USART_SetTime();
void USART_EraseMemory();
void USART_SetInterval();
void USART_PrintInterval();
void USART_PrintDateTime();
void USART_CalTemp();

void USART_Putc(uint8_t ch);
void USART_Print(const uint8_t *text);
void USART_PrintLine(const uint8_t * text);
void USART_PrintNewLine();
void USART_WaitForTC();

#endif /* USART_H_ */
