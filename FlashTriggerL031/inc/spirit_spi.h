/*
 * spirit_spi.h
 *
 *  Created on: 24. 8. 2016
 *      Author: priesolv
 */

#ifndef SPIRIT_SPI_H_
#define SPIRIT_SPI_H_

#include "stm32l0xx.h"
#include "SPIRIT_Types.h"

typedef SpiritStatus StatusBytes;

void SPIspirit_init();
uint8_t SPIspirit_write(uint8_t value);
void SPIspirit_Deactive();

uint16_t SPIspirit_SendHeader(uint8_t nHeader, uint8_t nValue);
StatusBytes SPIspirit_WriteRegisters(uint8_t cRegAddress, uint8_t cNbBytes, uint8_t* pcBuffer);
StatusBytes SPIspirit_ReadRegisters(uint8_t cRegAddress, uint8_t cNbBytes, uint8_t* pcBuffer);
StatusBytes SPIspirit_CommandStrobes(uint8_t cCommandCode);
StatusBytes SPIspirit_WriteFifo(uint8_t cNbBytes, uint8_t* pcBuffer);
StatusBytes SPIspirit_ReadFifo(uint8_t cNbBytes, uint8_t* pcBuffer);

#endif /* SPIRIT_SPI_H_ */
