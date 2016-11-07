/*
 * spi1.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef SPI1_H_
#define SPI1_H_

#include "stm32l0xx.h"

void SPI1Init(void);
uint8_t SPI1Write(uint8_t value);


#endif /* SPI1_H_ */
