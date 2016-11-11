/*
 * FlashG25D10B.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef FLASHG25D10B_H_
#define FLASHG25D10B_H_

#include "stm32l0xx.h"

#define G25D10_PAGE_SIZE               0xFF
#define G25D10_MEM_SIZE                0x20000
#define G25D10_PAGES_PER_SECTOR        16
#define G25D10_SECTOR_SIZE             4096
#define G25D10_SECTORS                 32

typedef enum
{
  BP_NONE           =0x00,
} FlashG25D10BP_t;

typedef struct
{
  uint8_t WIP: 1;    // write in progress
  uint8_t WEL: 1;    // write enable latch
  FlashG25D10BP_t BP: 3;
  uint8_t reserved1: 1;
  uint8_t reserved2: 1;
  uint8_t SRP: 1;          // status register protect
}FlashG25D10Status_t;

void FlashG25D10_Init(void);
uint32_t FlashG25D10_GetID();

FlashG25D10Status_t FlashG25D10_GetStatus();
void FlashG25D10_ReadData(uint32_t nAddr, uint8_t* pBuffer, uint8_t length);
void FlashG25D10_WriteEnable();
void FlashG25D10_WriteDisable();
void FlashG25D10_PageProgram(uint32_t nAddr, uint8_t* pBuffer, uint8_t length);
void FlashG25D10_SectorErase(uint32_t nAddr);


#endif /* FLASHG25D10B_H_ */
