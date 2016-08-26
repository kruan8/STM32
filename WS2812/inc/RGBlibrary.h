/*
 * RGBlibrary.h
 *
 *  Created on: 11. 11. 2015
 *      Author: priesolv
 */

#ifndef RGBLIBRARY_H_
#define RGBLIBRARY_H_

#include "stm32f0xx.h"
#include <stdbool.h>

typedef enum
{
    COLOR_RED = 0xFF0000,
    COLOR_GREEN = 0x00FF00,
    COLOR_BLUE = 0x0000FF,
    COLOR_YELLOW = 0x707000,
    COLOR_BLACK = 0x000000,
    COLOR_WHITE = 0xFFFFFF,
    COLOR_WHITE_DARK = 0x505050,
	COLOR_VIOLET = 0x6400FF,
    COLOR_X = 0x007070,
}RGB_colors_e;


void RGBlib_Init();

void RGBlib_ColorWipe(RGB_colors_e color, uint16_t wait_ms, bool bClear);
void RGBlib_ColorWipeCenter(RGB_colors_e color, uint16_t wait_ms);
void RGBlib_Scanner(RGB_colors_e color, uint16_t wait_ms, bool bReturn);
void RGBlib_TheaterChase(RGB_colors_e color, uint8_t cycles, uint8_t space, uint16_t wait_ms);
void RGBlib_TheaterChaseTwoColor(RGB_colors_e color1, RGB_colors_e color2, uint8_t cycles, uint16_t wait_ms);
void RGBlib_TheaterChaseTwoColorRotate(RGB_colors_e color1, RGB_colors_e color2, uint8_t cycles, uint16_t wait_ms);
void RGBlib_Rainbow(uint8_t cycles, uint16_t wait_ms);
void RGBlib_RainbowCycle(uint8_t cycles, uint16_t wait_ms);
void RGBlib_TheaterChaseRainbow(uint16_t wait_ms);
uint32_t RGBlib_Wheel(uint8_t nWheelPos);
void RGBlib_Detonate(RGB_colors_e color, uint16_t nStartDelay_ms);
void RGBlib_Fade(RGB_colors_e color);
uint32_t RGBlib_Rand(uint32_t nMin, uint32_t nMax);

void RGBlib_SetColor(uint8_t position, RGB_colors_e color);
uint32_t RGBlib_GetColor(uint8_t position);
void RGBlib_SetColorAll(RGB_colors_e color, uint16_t wait_ms);
void RGBlib_Clear();
void RGBlib_WaitAndClear(uint16_t wait_ms);
uint32_t RGBlib_GetColorFromRGB(uint8_t r, uint8_t g, uint8_t b);
void RGBlib_SetBrightness(uint8_t nBrightness);
uint8_t RGBlib_GetBrightness();
uint8_t RGBlib_GetBrightnessMax();
uint16_t RGBlib_GetLedsCount();
void RGBlib_Show();
void RGBlib_Delay_ms(uint32_t delay_ms);
uint32_t RGBlib_GetRandomNumber();
RGB_colors_e RGBlib_GetRandomColor();

#endif /* RGBLIBRARY_H_ */
