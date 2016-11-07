/*
 * spi1.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "spi1.h"


// SPI1 on PA5, PA6, PA7
void SPI2Init(void)
{
  /* Enable the peripheral clock of GPIOA and GPIOB */
  RCC->IOPENR |= RCC_IOPENR_GPIOBEN;

// set GPIO PB13, PB14, PB15 to AF function
  GPIOB->MODER = (GPIOB->MODER
                  & ~(GPIO_MODER_MODE13 | \
                      GPIO_MODER_MODE14 | GPIO_MODER_MODE15))\
                  | (GPIO_MODER_MODE13_1 | \
                     GPIO_MODER_MODE14_1 | GPIO_MODER_MODE15_1);
  GPIOB->AFR[0] = (GPIOB->AFR[0] & ~((0xF<<(4*13)) | (0xF<<(4*14)) | ((uint32_t)0xF<<(4*15))));
  GPIOB->OSPEEDR = (GPIOB->OSPEEDR & ~(GPIO_OSPEEDER_OSPEED13 | GPIO_OSPEEDER_OSPEED14 | GPIO_OSPEEDER_OSPEED15))\
                  | (GPIO_OSPEEDER_OSPEED13_1 | GPIO_OSPEEDER_OSPEED14_1 | GPIO_OSPEEDER_OSPEED15_1); // set speed 10 Mhz


  /* Enable the peripheral clock SPI2 */
  RCC->APB1ENR |= RCC_APB1ENR_SPI2EN;

  /* Configure SPI1 in master */
  /* (1) Master selection, BR: Fpclk/256 (due to C13 on the board, SPI_CLK is set to the minimum)
        CPOL and CPHA at zero (rising first edge), 8-bit data frame */
  /* (2) Slave select output enabled, RXNE IT */
  SPI2->CR1 = SPI_CR1_MSTR; // | SPI_CR1_BR_0; /* (1) */  // (16MHz) :2
  SPI2->CR2 = SPI_CR2_SSOE; // | SPI_CR2_RXNEIE; /* (2) */
  SPI2->CR1 |= SPI_CR1_SPE; // Enable SPI

  /* Configure IT */
  /* (4) Set priority for SPI2_IRQn */
  /* (5) Enable SPI1_IRQn */
//  NVIC_SetPriority(SPI2_IRQn, 0); /* (4) */
//  NVIC_EnableIRQ(SPI2_IRQn); /* (5) */
}

uint8_t SPI2Write(uint8_t value)
{
  /*!< Loop while DR register in not empty */
  while (!(SPI2->SR & SPI_SR_TXE));
  SPI2->DR = value;

  // Wait to receive a byte
  while (!(SPI2->SR & SPI_SR_RXNE));
  return (uint8_t)(SPI2->DR);
}
