/*
 * LEddriver.h
 *
 *  Created on: 10. 11. 2015
 *      Author: priesolv
 */

#ifndef WS2812DRIVER_H__H_
#define WS2812DRIVER_H_VER_H_

#include "stm32f0xx.h"

#define RED {0x10, 0x00, 0x00}
#define GREEN {0x00, 0x10, 0x00}
#define BLUE {0x00, 0x00, 0x10}
#define WHITE {0xff, 0xff, 0xff}
#define BLACK {0x00, 0x00, 0x00}


void WS2812_Init();
void WS2812_Send(uint8_t *buffer, uint8_t len);
void WS2812_Fill(uint8_t *buffer, uint8_t *color);
void WS2812_SetBrightness(uint8_t nBrightness);
uint8_t WS2812_GetBrightness();
uint8_t WS2812_GetBrightnessMax();

#endif /* WS2812DRIVER_H_VER_H_ */
