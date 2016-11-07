/*
 * FlashG25D10B.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */


#include "flashg25d10b.h"
#include "spi2.h"

#define CS_PIN              (1 << 6)
#define CS_GPIO_PORT        GPIOB

#define CS_ENABLE           (CS_GPIO_PORT->BRR = CS_PIN)
#define CS_DISABLE          (CS_GPIO_PORT->BSRR = CS_PIN)

#define DUMMY_BYTE          0xFF


#define G25D10_COMID_WRITE_ENABLE      0x06
#define G25D10_COMID_WRITE_DISABLE     0x04
#define G25D10_COMID_READ_SR           0x05
#define G25D10_COMID_WRITE_SR          0x01
#define G25D10_COMID_READ_DATA         0x03
#define G25D10_COMID_PAGE_PROGRAM      0x02
#define G25D10_COMID_SECTOR_ERASE      0x20
#define G25D10_COMID_DEVICE_ID         0x90
#define G25D10_COMID_IDENTIFICATION    0x9F

#define G25D10_STATUS_WIP              0x01     // write in progress
#define G25D10_STATUS_WEL              0x02
#define G25D10_STATUS_SRP              0x80

void FlashG25D10_Init(void)
{
  SPI2Init();

  // set CS for output
  RCC->IOPENR |= RCC_IOPENR_GPIOBEN;
  GPIOB->MODER = (GPIOB->MODER & ~(GPIO_MODER_MODE6)) | GPIO_MODER_MODE6_0;
  GPIOB->PUPDR = (GPIOB->PUPDR & ~(GPIO_PUPDR_PUPD6)) | GPIO_PUPDR_PUPD6_0;
  GPIOB->OSPEEDR = (GPIOB->OSPEEDR & ~(GPIO_OSPEEDER_OSPEED6)) | (GPIO_OSPEEDER_OSPEED6_1); // set speed 10 Mhz

  CS_DISABLE;
}

FlashG25D10Status_t FlashG25D10_GetStatus()
{
  CS_ENABLE;
  SPI2Write(G25D10_COMID_READ_SR);
  uint8_t sr = SPI2Write(DUMMY_BYTE);
  CS_DISABLE;

  FlashG25D10Status_t *pStatus = (FlashG25D10Status_t *) &sr;
  return *pStatus;
}

void FlashG25D10_ReadData(uint32_t nAddr, uint8_t* pBuffer, uint8_t length)
{
  CS_ENABLE;
  SPI2Write(G25D10_COMID_READ_DATA);
  SPI2Write(nAddr >> 16);
  SPI2Write(nAddr >> 8);
  SPI2Write(nAddr);
  while (length--)
  {
    *pBuffer++ = SPI2Write(DUMMY_BYTE);
  }

  CS_DISABLE;
}

void FlashG25D10_PageProgram(uint32_t nAddr, uint8_t* pBuffer, uint8_t length)
{
  CS_ENABLE;
  SPI2Write(G25D10_COMID_PAGE_PROGRAM);
  SPI2Write(nAddr >> 16);
  SPI2Write(nAddr >> 8);
  SPI2Write(nAddr);
  while (length--)
  {
    SPI2Write(*pBuffer++);
  }

  CS_DISABLE;

  while (FlashG25D10_GetStatus().WIP);
}

void FlashG25D10_SectorErase(uint32_t nAddr)
{
  FlashG25D10_WriteEnable();
  CS_ENABLE;
  SPI2Write(G25D10_COMID_SECTOR_ERASE);
  CS_DISABLE;

  while (FlashG25D10_GetStatus().WIP);
}

void FlashG25D10_WriteEnable()
{
  CS_ENABLE;
  SPI2Write(G25D10_COMID_WRITE_ENABLE);
  CS_DISABLE;
}

void FlashG25D10_WriteDisable()
{
  CS_ENABLE;
  SPI2Write(G25D10_COMID_WRITE_DISABLE);
  CS_DISABLE;
}

uint32_t FlashG25D10_GetID()
{
  CS_ENABLE;

  uint32_t nID = 0;
  SPI2Write(G25D10_COMID_IDENTIFICATION);
  nID = SPI2Write(DUMMY_BYTE) << 16;
  nID |= SPI2Write(DUMMY_BYTE) << 8;
  nID |= SPI2Write(DUMMY_BYTE);

  CS_DISABLE;

  return nID;
}
