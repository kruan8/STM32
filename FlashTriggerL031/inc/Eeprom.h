/*
 * Eeprom.h
 *
 *  Created on: 26. 8. 2016
 *      Author: priesolv
 */

#ifndef EEPROM_H_
#define EEPROM_H_


#include "stm32l0xx.h"

#define DATA_E2_ADDR   ((uint32_t)0x08080000)  /* Data EEPROM address */

void Eeprom_UnlockPELOCK(void);
void Eeprom_WriteUint32(uint32_t nAddr, uint32_t nValue);
uint32_t Eeprom_ReadUint32(uint32_t nAddr);
void Eeprom_WriteBuffer(uint16_t nAddr, uint8_t pBuffer, uint16_t nSize);
void Eeprom_LockNVM(void);
void Eeprom_Erase(uint32_t addr);


#endif /* EEPROM_H_ */
