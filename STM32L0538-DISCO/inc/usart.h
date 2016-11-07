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
void USART_SendStatus();
void USART_SendList();

void USART_Putc(char ch);
void USART_Puts(const char *text);

#endif /* USART_H_ */
