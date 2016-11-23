/*
 * FlashG25D10B.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef FLASHG25_H_
#define FLASHG25_H_

#include "stm32l0xx.h"
#include <stdbool.h>

#define G25_PAGE_SIZE               256
#define G25_PAGES_PER_SECTOR        16
#define G25_SECTOR_SIZE             (G25_PAGE_SIZE * G25_PAGES_PER_SECTOR)

typedef enum
{
  BP_NONE           =0x00,
} FlashG25_t;

typedef struct
{
  uint8_t WIP: 1;    // write in progress
  uint8_t WEL: 1;    // write enable latch
  FlashG25_t BP: 3;
  uint8_t reserved1: 1;
  uint8_t reserved2: 1;
  uint8_t SRP: 1;          // status register protect
}FlashG25Status_t;

typedef struct
{
  uint32_t identificationID;
  uint32_t pages;
  uint16_t sectors;
}FlashG25Identify_t;

bool FlashG25_Init(void);
uint32_t FlashG25_GetID();

FlashG25Status_t FlashG25_GetStatus();
void FlashG25_ReadData(uint32_t nAddr, uint8_t* pBuffer, uint8_t length);
void FlashG25_WriteEnable();
void FlashG25_WriteDisable();
void FlashG25_PageProgram(uint32_t nAddr, uint8_t* pBuffer, uint8_t length);
void FlashG25_SectorErase(uint32_t nAddr);
bool FlashG25_IsPresent();
uint32_t FlashG25_GetSectors();
uint32_t FlashG25_GetPages();
void FlashG25_Send24bit(uint32_t nValue);

#endif /* FLASHG25_H_ */
