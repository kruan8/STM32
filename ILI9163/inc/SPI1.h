/*
 * SPI1.h
 *
 *  Created on: 23. 1. 2017
 *      Author: priesolv
 */

#ifndef SPI1_H_
#define SPI1_H_

#include "stm32f0xx.h"
#include <stdbool.h>

typedef enum
{
  spi_br_2 =   (0b000 << 3),   // fPCLK/2
  spi_br_4 =   (0b001 << 3),   // fPCLK/4
  spi_br_8 =   (0b010 << 3),   // fPCLK/8
  spi_br_16 =  (0b011 << 3),   // fPCLK/16
  spi_br_32 =  (0b100 << 3),   // fPCLK/32
  spi_br_64 =  (0b101 << 3),   // fPCLK/64
  spi_br_128 = (0b110 << 3),   // fPCLK/128
  spi_br_256 = (0b111 << 3),   // fPCLK/256
}spi_br_e;

typedef enum
{
  spi_mode_0 = 0b00,  // CPOL=0; CPHA=0 (clk idle L, pha 1. edge)
  spi_mode_1 = 0b01,  // CPOL=0; CPHA=1 (clk idle L, pha 2. edge)
  spi_mode_2 = 0b10,  // CPOL=1; CPHA=0 (clk idle H, pha 1. edge)
  spi_mode_3 = 0b11,  // CPOL=1; CPHA=1 (clk idle H, pha 2. edge)
}spi_mode_e;

void SPI1_Init();
void SPI1_SendData16(uint16_t nValue);
uint8_t SPI1_SendData8(uint8_t nValue);
void SPI1_SetPrescaler(spi_br_e ePrescaler);
void SPI1_SetMode(spi_mode_e eMode);

#endif /* SPI1_H_ */
