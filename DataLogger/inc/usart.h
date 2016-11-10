/*
 * usart.h
 *
 *  Created on: 2. 11. 2016
 *      Author: priesolv
 */

#ifndef USART_H_
#define USART_H_

#include "stm32l0xx.h"

void USART_Configure(void);
void USART_Configure_GPIO(void);

void USART_ProcessCommand();
void USART_PrintHeader();
void USART_SendStatus();
void USART_SendList();
void USART_SetDate();
void USART_SetTime();
void USART_SetWakeUpInterval();
uint16_t USART_GetWakeUpInterval();
void USART_PrintDateTime();
void USART_EraseMemory();

void USART_Putc(uint8_t ch);
void USART_Puts(const uint8_t *text);
void USART_PrintLine(const uint8_t * text);
void USART_PrintNewLine();
void USART_WaitForTC();

#endif /* USART_H_ */
