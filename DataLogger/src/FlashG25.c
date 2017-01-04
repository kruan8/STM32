/*
 * FlashG25D10B.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */


#include "flashG25.h"
#include "spi1.h"

#define CS_PIN              (1 << 4)
#define CS_GPIO_PORT        GPIOA

#define CS_ENABLE           (CS_GPIO_PORT->BRR = CS_PIN)
#define CS_DISABLE          (CS_GPIO_PORT->BSRR = CS_PIN)

#define DUMMY_BYTE          0xFF

#define G25_COMID_WRITE_ENABLE      0x06
#define G25_COMID_WRITE_DISABLE     0x04
#define G25_COMID_READ_SR           0x05
#define G25_COMID_WRITE_SR          0x01
#define G25_COMID_READ_DATA         0x03
#define G25_COMID_PAGE_PROGRAM      0x02
#define G25_COMID_SECTOR_ERASE      0x20
#define G25_COMID_DEVICE_ID         0x90
#define G25_COMID_IDENTIFICATION    0x9F

#define G25_STATUS_WIP              0x01     // write in progress
#define G25_STATUS_WEL              0x02
#define G25_STATUS_SRP              0x80

static const FlashG25Identify_t g_G25types[] = {
    // ID      | pages | sectors
    { 0xC84011,   512,   32 },        // G25D10 1Mbit
    { 0xC84013,  2048,  128 },        // G25Q41 4Mbit
};

uint32_t g_nPages = 0;        // memory page count
uint32_t g_nSectors = 0;      // memory sector count

bool FlashG25_Init(void)
{
  SPI1Init();

  // set CS for output
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE4)) | GPIO_MODER_MODE4_0;
  GPIOA->PUPDR = (GPIOA->PUPDR & ~(GPIO_PUPDR_PUPD4)) | GPIO_PUPDR_PUPD4_0;
  GPIOA->OSPEEDR = (GPIOA->OSPEEDR & ~(GPIO_OSPEEDER_OSPEED4)) | (GPIO_OSPEEDER_OSPEED4_1); // set speed 10 Mhz

  CS_DISABLE;

  if (!FlashG25_IsPresent())
  {
    return false;
  }

  uint32_t nId = FlashG25_GetID();
  uint8_t nTabSize = sizeof (g_G25types) / sizeof(FlashG25Identify_t);
  for (uint8_t i = 0; i < nTabSize; i++)
  {
    if (g_G25types[i].identificationID == nId)
    {
      g_nPages = g_G25types[i].pages;
      g_nSectors = g_G25types[i].sectors;
      break;
    }
  }

  if (g_nSectors == 0)
  {
    return false;
  }

  return true;
}

FlashG25Status_t FlashG25_GetStatus()
{
  CS_ENABLE;
  SPI1Write(G25_COMID_READ_SR);
  uint8_t sr = SPI1Write(DUMMY_BYTE);
  CS_DISABLE;

  FlashG25Status_t *pStatus = (FlashG25Status_t *) &sr;
  return *pStatus;
}

void FlashG25_ReadData(uint32_t nAddr, uint8_t* pBuffer, uint8_t length)
{
  CS_ENABLE;
  SPI1Write(G25_COMID_READ_DATA);
  FlashG25_Send24bit(nAddr);
  while (length--)
  {
    *pBuffer++ = SPI1Write(DUMMY_BYTE);
  }

  CS_DISABLE;
}

void FlashG25_PageProgram(uint32_t nAddr, uint8_t* pBuffer, uint8_t length)
{
  uint16_t nBlockSize;
  uint16_t nPhysSize;
  while (length)
  {
    nBlockSize = length;
    nPhysSize = G25_PAGE_SIZE - (nAddr % G25_PAGE_SIZE);  // hranice fyzické stránky (PAGE SIZE)
    if (length > nPhysSize)
    {
      nBlockSize = nPhysSize;
    }

    FlashG25_WriteEnable();
    CS_ENABLE;
    SPI1Write(G25_COMID_PAGE_PROGRAM);
    FlashG25_Send24bit(nAddr);
    uint16_t nSize = nBlockSize;
    while (nSize--)
    {
      SPI1Write(*pBuffer++);
    }

    CS_DISABLE;

    // cekani na ukonceni programovaciho cyklu
    while (FlashG25_GetStatus().WIP);
    nAddr += nBlockSize;
    length -= nBlockSize;
  }
}

void FlashG25_SectorErase(uint32_t nSectorNumber)
{
  nSectorNumber *= G25_SECTOR_SIZE;
  FlashG25_WriteEnable();
  CS_ENABLE;
  SPI1Write(G25_COMID_SECTOR_ERASE);
  FlashG25_Send24bit(nSectorNumber);
  CS_DISABLE;

  while (FlashG25_GetStatus().WIP);
}

void FlashG25_WriteEnable()
{
  CS_ENABLE;
  SPI1Write(G25_COMID_WRITE_ENABLE);
  CS_DISABLE;
}

void FlashG25_WriteDisable()
{
  CS_ENABLE;
  SPI1Write(G25_COMID_WRITE_DISABLE);
  CS_DISABLE;
}

uint32_t FlashG25_GetID()
{
  CS_ENABLE;

  uint32_t nID = 0;
  SPI1Write(G25_COMID_IDENTIFICATION);
  nID = SPI1Write(DUMMY_BYTE) << 16;
  nID |= SPI1Write(DUMMY_BYTE) << 8;
  nID |= SPI1Write(DUMMY_BYTE);

  CS_DISABLE;

  return nID;
}

bool FlashG25_IsPresent()
{
  return ((FlashG25_GetID() >> 8) == 0xC840) ? true : false;
}

uint32_t FlashG25_GetSectors()
{
  return g_nSectors;
}

uint32_t FlashG25_GetPages()
{
  return g_nPages;
}

void FlashG25_Send24bit(uint32_t nValue)
{
  SPI1Write(nValue >> 16);
  SPI1Write(nValue >> 8);
  SPI1Write(nValue);
}
