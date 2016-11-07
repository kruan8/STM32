/*
 * spi1.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "spi1.h"


// SPI1 on PA5, PA6, PA7
void SPI1Init(void)
{
  /* Enable the peripheral clock of GPIOA and GPIOB */
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

  // set GPIO PA5, PA6, PA7 to AF function
  GPIOA->MODER = (GPIOA->MODER
                  & ~(GPIO_MODER_MODE5 | \
                      GPIO_MODER_MODE6 | GPIO_MODER_MODE7))\
                  | (GPIO_MODER_MODE5_1 | \
                     GPIO_MODER_MODE6_1 | GPIO_MODER_MODE7_1);
  GPIOA->AFR[0] = (GPIOA->AFR[0] & ~((0xF<<(4*5)) | (0xF<<(4*6)) | ((uint32_t)0xF<<(4*7))));
  GPIOA->OSPEEDR = (GPIOA->OSPEEDR & ~(GPIO_OSPEEDER_OSPEED5 | GPIO_OSPEEDER_OSPEED6 | GPIO_OSPEEDER_OSPEED7))\
                  | (GPIO_OSPEEDER_OSPEED5_1 | GPIO_OSPEEDER_OSPEED6_1 | GPIO_OSPEEDER_OSPEED7_1); // set speed 10 Mhz



  /* Enable the peripheral clock SPI1 */
  RCC->APB2ENR |= RCC_APB2ENR_SPI1EN;

  /* Configure SPI1 in master */
  /* (1) Master selection, BR: Fpclk/256 (due to C13 on the board, SPI_CLK is set to the minimum)
        CPOL and CPHA at zero (rising first edge), 8-bit data frame */
  /* (2) Slave select output enabled, RXNE IT */
  SPI1->CR1 = SPI_CR1_MSTR; // | SPI_CR1_BR_0; /* (1) */  // (16MHz) :2
  SPI1->CR2 = SPI_CR2_SSOE; // | SPI_CR2_RXNEIE; /* (2) */
  SPI1->CR1 |= SPI_CR1_SPE; // Enable SPI

  /* Configure IT */
  /* (4) Set priority for SPI1_IRQn */
  /* (5) Enable SPI1_IRQn */
//  NVIC_SetPriority(SPI1_IRQn, 0); /* (4) */
//  NVIC_EnableIRQ(SPI1_IRQn); /* (5) */
}

uint8_t SPI1Write(uint8_t value)
{
  /*!< Loop while DR register in not empty */
  while (!(SPI1->SR & SPI_SR_TXE));
  SPI1->DR = value;

  // Wait to receive a byte
  while (!(SPI1->SR & SPI_SR_RXNE));
  return (uint8_t)(SPI1->DR);
}
