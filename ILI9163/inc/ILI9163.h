/*
 * ILI9163.h
 *
 *  Created on: 7. 1. 2016
 *      Author: priesolv
 */

#ifndef ILI9163_H_
#define ILI9163_H_

#include "stm32f0xx.h"

//#define LCD_128x160
//#define LCD_128x128
#define LCD_240x320

#ifdef LCD_128x128
 #define ILI9163_RES_X		128
 #define ILI9163_RES_Y		128
 #define ILI9163_OFFSET  32
#endif

#ifdef LCD_240x320
 #define ILI9163_RES_X		240
 #define ILI9163_RES_Y		320
 #define ILI9163_OFFSET  0
#endif

#ifdef LCD_128x160
 #define ILI9163_RES_X		128
 #define ILI9163_RES_Y		160
 #define ILI9163_OFFSET  0
#endif

typedef enum
{
  white =   0xFFFF,
  silver =  0xC618,
  gray =    0x8410,
  black =   0x0000,
  red =     0xF800,
  maroon =  0x5000,
  yellow =  0xFFE0,
  olive =   0x5280,
  lime =    0x07E0,
  green =   0x0280,
  aqua =    0x07FF,
  teal =    0x0410,
  blue =    0x001F,
  navy =    0x0010,
  fuchsia = 0xF81F,
  purple =  0x8010,
}COLORS;

typedef struct{
	uint16_t xPos;
	uint16_t yPos;
	uint16_t txtColor;
	uint16_t bkgColor;
} TextParam;

void ILI9163_Init();
void ILI9163_WritePixel(uint16_t x, uint16_t y, uint16_t color);
void ILI9163_SetAddress(uint16_t xStart, uint16_t yStart, uint16_t xStop, uint16_t yStop);
void ILI9163_WriteToReg(uint8_t value);
void ILI9163_WriteData8(uint8_t value);
void ILI9163_WriteData16(uint16_t value);

void ILI9163_FillScreen(uint16_t color);
void ILI9163_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color);
void ILI9163_SetTextParams(	uint16_t txtColor,	uint16_t bkgColor);
void ILI9163_PrintText(uint16_t x, uint16_t y, char* text);
void ILI9163_PrintChar(uint16_t x, uint16_t y, char c);

void ILI9163_Delay_ms(uint32_t delay_ms);
uint32_t ILI9163_GetTicks_ms();

void ILI9163_ConfigDMA();
void ILI9163_StartDMA(uint32_t nMemAddr, uint16_t nLength);

void ILI9163_PixelSetRGB565(int16_t x, int16_t y, uint16_t color);
uint8_t ILI9163_FillFrame(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color);

#endif /* ILI9163_H_ */
