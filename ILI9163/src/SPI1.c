/*
 * SPI1.c
 *
 *  Created on: 23. 1. 2017
 *      Author: priesolv
 */

#include "SPI1.h"

void SPI1_Init()
{
  GPIO_InitTypeDef GPIO_InitStructure;

  /* Enable the SPI periph */
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);

  /* Enable GPIO clocks */
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_Level_3;

  /* SPI SCK pin configuration */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* SPI  MOSI pin configuration */
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_7;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  /* SPI  MISO pin configuration */
  GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_6;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_0);
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource7, GPIO_AF_0);
  GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_0);

  /* SPI configuration -------------------------------------------------------*/
  SPI_I2S_DeInit(SPI1);

  SPI_InitTypeDef  SPI_InitStructure;
  SPI_InitStructure.SPI_Direction = SPI_Direction_1Line_Tx;
  SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
  SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;  // SCK freq=48/2=24Mhz
  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(SPI1, &SPI_InitStructure);

  SPI_Cmd(SPI1, ENABLE);
}

void SPI1_SendData16(uint16_t nValue)
{
  SPI_SendData8(SPI1, nValue >> 8);
  while (!(SPI1->SR & SPI_I2S_FLAG_TXE));
  SPI_SendData8(SPI1, nValue);
  while (SPI1->SR & SPI_I2S_FLAG_BSY);
}

uint8_t SPI1_SendData8(uint8_t nValue)
{
  SPI1->DR = nValue;
  while (SPI1->SR & SPI_I2S_FLAG_BSY);

  return SPI1->DR;
}

void SPI1_SetPrescaler(spi_br_e ePrescaler)
{
  // stop SPI peripherial
  SPI1->CR1 &= (uint16_t)~((uint16_t)SPI_CR1_SPE);

  SPI1->CR1 = (SPI1->CR1 & ~(SPI_CR1_BR)) | ePrescaler;

  // start SPI peripherial
  SPI1->CR1 |= SPI_CR1_SPE;
}

void SPI1_SetMode(spi_mode_e eMode)
{
  // stop SPI peripherial
  SPI1->CR1 &= (uint16_t)~((uint16_t)SPI_CR1_SPE);

  SPI1->CR1 = (SPI1->CR1 & ~(SPI_CR1_CPHA | SPI_CR1_CPOL)) | eMode;

  // start SPI peripherial
  SPI1->CR1 |= SPI_CR1_SPE;
}
