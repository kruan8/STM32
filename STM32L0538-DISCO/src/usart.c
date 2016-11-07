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

#define BUFFER_SIZE  128

uint8_t g_BufferIn[BUFFER_SIZE];
uint8_t g_BufferInPos;
bool    g_bCommandReady;

/**
  * Brief   This function :
             - Enables GPIO clock
             - Configures the USART1 pins on GPIO PA9 PA10
  * Param   None
  * Retval  None
  */
void USART_Configure_GPIO(void)
{
  /* Enable the peripheral clock of GPIOA */
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

  /* GPIO configuration for USART1 signals */
  /* (1) Select AF mode (10) on PA9 and PA10 */
  /* (2) AF4 for USART1 signals */
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE9|GPIO_MODER_MODE10))\
                 | (GPIO_MODER_MODE9_1 | GPIO_MODER_MODE10_1); /* (1) */
  GPIOA->AFR[1] = (GPIOA->AFR[1] &~ (0x00000FF0))\
                  | (4 << (1 * 4)) | (4 << (2 * 4)); /* (2) */
}

void USART_Configure(void)
{
  /* Enable the peripheral clock USART1 */
  RCC->APB2ENR |= RCC_APB2ENR_USART1EN;

  /* Configure USART1 */
  /* (1) oversampling by 16, 9600 baud */
  /* (2) 8 data bit, 1 start bit, 1 stop bit, no parity */
//  USART1->BRR = 160000 / 96; /* (1) */
  USART1->BRR = 218;
  USART1->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_UE; /* (2) */

  /* polling idle frame Transmission */
  while((USART1->ISR & USART_ISR_TC) != USART_ISR_TC)
  {
    /* add time out here for a robust application */
  }

  g_bCommandReady = false;

  USART1->CR1 |= USART_CR1_RXNEIE;      // ebale RX INT

//  USART1->ICR = USART_ICR_TCCF;/* clear TC flag */
//  USART1->CR1 |= USART_CR1_TCIE;/* enable TC interrupt */

  NVIC_SetPriority(USART1_IRQn, 1);
  NVIC_EnableIRQ(USART1_IRQn);
}


// https://gist.github.com/adnbr/2629767
void USART_ProcessCommand()
{
  if (!g_bCommandReady)
  {
    return;
  }

  strupr((char*)g_BufferIn);
  switch (g_BufferIn[0])
  {
    case 0:
    case 'S':
      USART_SendStatus();
      break;
    case 'L':
      USART_SendList();
      break;
    default:
       USART_Puts("???\r\n");
       break;
  }

  g_BufferInPos = 0;
  g_bCommandReady = false;
  USART1->CR1 |= USART_CR1_RXNEIE;
}

void USART_SendStatus()
{
  char text[128];
  USART_Puts("Data logger v0.1\r\n");
  snprintf(text, sizeof (text), "Pocet zaznamu: %d\r\n", 0);
  USART_Puts(text);
}

void USART_SendList()
{
  USART_Puts("Zadne zaznamy\r\n");
}

void USART_Putc(char ch)
{
  while (!(USART1->ISR & USART_ISR_TXE));
  USART1->TDR = ch;
}

void USART_Puts(const char *text)
{
  while (*text)
  {
    USART_Putc(*text++);
  }
}

void USART1_IRQHandler(void)
{
  if (g_bCommandReady)
  {
    return;
  }

  if (USART1->ISR & USART_ISR_RXNE)
  {
    g_BufferIn[g_BufferInPos] = USART1->RDR;

    // End of line!
    if (g_BufferIn[g_BufferInPos] == '\r')
    {
      g_BufferIn[g_BufferInPos] = 0;
      USART1->CR1 &= ~USART_CR1_RXNEIE;     // disable RX INT
      g_bCommandReady = true;
    }

    if (g_BufferInPos < (BUFFER_SIZE - 1))
    {
      g_BufferInPos++;
    }
  }
}
