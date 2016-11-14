/*
 * FlashG25D10B.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */


#include "flashg25d10b.h"
#include "spi1.h"

#define CS_PIN              (1 << 4)
#define CS_GPIO_PORT        GPIOA

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
  SPI1Init();

  // set CS for output
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE4)) | GPIO_MODER_MODE4_0;
  GPIOA->PUPDR = (GPIOA->PUPDR & ~(GPIO_PUPDR_PUPD4)) | GPIO_PUPDR_PUPD4_0;
  GPIOA->OSPEEDR = (GPIOA->OSPEEDR & ~(GPIO_OSPEEDER_OSPEED4)) | (GPIO_OSPEEDER_OSPEED4_1); // set speed 10 Mhz

  CS_DISABLE;
}

FlashG25D10Status_t FlashG25D10_GetStatus()
{
  CS_ENABLE;
  SPI1Write(G25D10_COMID_READ_SR);
  uint8_t sr = SPI1Write(DUMMY_BYTE);
  CS_DISABLE;

  FlashG25D10Status_t *pStatus = (FlashG25D10Status_t *) &sr;
  return *pStatus;
}

void FlashG25D10_ReadData(uint32_t nAddr, uint8_t* pBuffer, uint8_t length)
{
  CS_ENABLE;
  SPI1Write(G25D10_COMID_READ_DATA);
  SPI1Write(nAddr >> 16);
  SPI1Write(nAddr >> 8);
  SPI1Write(nAddr);
  while (length--)
  {
    *pBuffer++ = SPI1Write(DUMMY_BYTE);
  }

  CS_DISABLE;
}

void FlashG25D10_PageProgram(uint32_t nAddr, uint8_t* pBuffer, uint8_t length)
{
  uint16_t nBlockSize;
  uint16_t nPhysSize;
  while (length)
  {
    nBlockSize = length;
    nPhysSize = G25D10_PAGE_SIZE - (nAddr % G25D10_PAGE_SIZE);  // hranice fyzické stránky (PAGE SIZE)
    if (length > nPhysSize)
    {
      nBlockSize = nPhysSize;
    }

    FlashG25D10_WriteEnable();
    CS_ENABLE;
    SPI1Write(G25D10_COMID_PAGE_PROGRAM);
    SPI1Write(nAddr >> 16);
    SPI1Write(nAddr >> 8);
    SPI1Write(nAddr);
    uint16_t nSize = nBlockSize;
    while (nSize--)
    {
      SPI1Write(*pBuffer++);
    }

    CS_DISABLE;

    while (FlashG25D10_GetStatus().WIP);
    nAddr += nBlockSize;
    length -= nBlockSize;
  }
}

void FlashG25D10_SectorErase(uint32_t nAddr)
{
  nAddr *= G25D10_SECTOR_SIZE;
  FlashG25D10_WriteEnable();
  CS_ENABLE;
  SPI1Write(G25D10_COMID_SECTOR_ERASE);
  SPI1Write(nAddr >> 16);
  SPI1Write(nAddr >> 8);
  SPI1Write(nAddr);
  CS_DISABLE;

  while (FlashG25D10_GetStatus().WIP);
}

void FlashG25D10_WriteEnable()
{
  CS_ENABLE;
  SPI1Write(G25D10_COMID_WRITE_ENABLE);
  CS_DISABLE;
}

void FlashG25D10_WriteDisable()
{
  CS_ENABLE;
  SPI1Write(G25D10_COMID_WRITE_DISABLE);
  CS_DISABLE;
}

uint32_t FlashG25D10_GetID()
{
  CS_ENABLE;

  uint32_t nID = 0;
  SPI1Write(G25D10_COMID_IDENTIFICATION);
  nID = SPI1Write(DUMMY_BYTE) << 16;
  nID |= SPI1Write(DUMMY_BYTE) << 8;
  nID |= SPI1Write(DUMMY_BYTE);

  CS_DISABLE;

  return nID;
}

bool FlashG25D10_IsPresent()
{
  return (FlashG25D10_GetID() == 0xC84011) ? true : false;
}
