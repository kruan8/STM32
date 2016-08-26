/*
 * RGBlibrary.c
 *
 *  Created on: 11. 11. 2015
 *      Author: priesolv
 */

#include "RGBlibrary.h"
//#include "stm32f0xx_adc.h"
#include "WS2812driver.h"

#define LEDS 60
#define BUFF_SIZE (LEDS * 3)

typedef enum
{
	rainbow_white  = 0x969696,	//    colors[0].r=150; colors[0].g=150; colors[0].b=150;
	rainbow_red    = 0xFF0000,	//    colors[1].r=255; colors[1].g=000; colors[1].b=000;//red
	rainbow_orange = 0xFF6400,	//    colors[2].r=255; colors[2].g=100; colors[2].b=000;//orange
	rainbow_yellow = 0x64FF00,	//    colors[3].r=100; colors[3].g=255; colors[3].b=000;//yellow
	rainbow_green  = 0x00ff00,	//    colors[4].r=000; colors[4].g=255; colors[4].b=000;//green
	rainbow_tyrkis = 0x0064FF,	//    colors[5].r=000; colors[5].g=100; colors[5].b=255;//light blue (türkis)
	rainbow_blue   = 0x0000FF,	//    colors[6].r=000; colors[6].g=000; colors[6].b=255;//blue
	rainbow_violet = 0x6400FF,	//    colors[7].r=100; colors[7].g=000; colors[7].b=255;//violet
}rainbow_colors_e;

RGB_colors_e colors[] = { COLOR_RED, COLOR_GREEN, COLOR_BLUE, COLOR_WHITE_DARK, COLOR_VIOLET };

uint8_t RGBbuff[BUFF_SIZE];
static volatile uint32_t nDelayTimer;

void RGBlib_Init()
{
	if (SysTick_Config(SystemCoreClock / 1000))
	{
	     /* Capture error */
	     while (1);
	}

	WS2812_Init();
	RGBlib_Clear();
}

// postupne rozsvecovani LED
void RGBlib_ColorWipe(RGB_colors_e color, uint16_t wait_ms, bool bClear)
{
  if (bClear)
  {
      RGBlib_SetColorAll(COLOR_BLACK, 0);
  }

  for (uint16_t i = 0; i < LEDS; i++)
  {
	  RGBlib_SetColor(i, color);
	  RGBlib_Show();
	  RGBlib_Delay_ms(wait_ms);
  }
}

// color wipe from center
void RGBlib_ColorWipeCenter(RGB_colors_e color, uint16_t wait_ms)
{
  RGBlib_Clear();

	uint8_t mid = LEDS / 2;
	RGBlib_SetColor(mid, color);
	for (uint16_t i = 0; i <= LEDS / 2; i++)
	{
		RGBlib_SetColor(mid + i, color);
		RGBlib_SetColor(mid - i, color);
		RGBlib_Show();
		RGBlib_Delay_ms(wait_ms);
	}

	RGBlib_SetColor(mid, COLOR_BLACK);
	for (uint16_t i = 0; i <= LEDS / 2; i++)
	{
		RGBlib_SetColor(mid + i, COLOR_BLACK);
		RGBlib_SetColor(mid - i, COLOR_BLACK);
		RGBlib_Show();
		RGBlib_Delay_ms(wait_ms);
	}
}

void RGBlib_Scanner(RGB_colors_e color, uint16_t wait_ms, bool bReturn)
{
  RGBlib_Clear();
  for(uint16_t i = 0; i < LEDS; i++)
  {
	  RGBlib_SetColorAll(COLOR_BLACK, 0);
	  RGBlib_SetColor(i, color);
	  RGBlib_Show();
	  RGBlib_Delay_ms(wait_ms);
  }

  if (bReturn)
  {
    for(int16_t i = LEDS; i > 0; i--)
    {
      RGBlib_SetColorAll(COLOR_BLACK, 0);
      RGBlib_SetColor(i - 1, color);
      RGBlib_Show();
      RGBlib_Delay_ms(wait_ms);
    }
  }

  RGBlib_SetColorAll(COLOR_BLACK, 0);
}

//Theatre-style crawling lights.
void RGBlib_TheaterChase(RGB_colors_e color, uint8_t cycles, uint8_t space, uint16_t wait_ms)
{
  RGBlib_Clear();
	while (cycles--)
	{
		for (uint8_t q = 0; q < space; q++)
		{
			for (uint8_t i = 0; i < LEDS; i += space)
			{
				RGBlib_SetColor(i + q, color);    //turn every third pixel on
			}

			RGBlib_Show();
			RGBlib_Delay_ms(wait_ms);

			for (uint8_t i = 0; i < LEDS; i += space)
			{
				RGBlib_SetColor(i + q, COLOR_BLACK);        //turn every third pixel off
			}
		}
	}
}

void RGBlib_TheaterChaseTwoColor(RGB_colors_e color1, RGB_colors_e color2, uint8_t cycles, uint16_t wait_ms)
{
  RGBlib_Clear();
	while (cycles--)
	{
        for (uint8_t i = 0; i < LEDS; i += 2)
        {
            RGBlib_SetColor(i, color1);
            RGBlib_SetColor(i + 1, color2);
        }

        RGBlib_Show();
        RGBlib_Delay_ms(wait_ms);

        for (uint8_t i = 0; i < LEDS; i += 2)
        {
            RGBlib_SetColor(i, color2);
            RGBlib_SetColor(i + 1, color1);
        }

        RGBlib_Show();
        RGBlib_Delay_ms(wait_ms);

	}
}

void RGBlib_TheaterChaseTwoColorRotate(RGB_colors_e color1, RGB_colors_e color2, uint8_t cycles, uint16_t wait_ms)
{
    RGBlib_Clear();
    while (cycles--)
    {
        for (uint8_t space = 0; space < LEDS / 2; space++)
        {
          for (uint8_t i = 0; i < LEDS; i += (LEDS / 2))
          {
              RGBlib_SetColor(i + space, color1);
              RGBlib_SetColor(i + 3 - space, color2);
          }

          RGBlib_Show();
          RGBlib_Delay_ms(wait_ms);
          RGBlib_Clear();
        }
    }
}

void RGBlib_Rainbow(uint8_t cycles, uint16_t wait_ms)
{
  RGBlib_Clear();
  for (uint16_t j = 0; j < 256 * cycles; j++)
  {
    for (uint16_t i = 0; i < LEDS; i++)
    {
    	RGBlib_SetColor(i, RGBlib_Wheel((i + j) & 255));
    }

    RGBlib_Show();
    RGBlib_Delay_ms(wait_ms);
  }
}

void RGBlib_RainbowCycle(uint8_t cycles, uint16_t wait_ms)
{
  RGBlib_Clear();
	for (uint16_t j = 0; j < 256 * cycles; j++)
	{
		for (uint16_t i = 0; i < LEDS; i++)
		{
			RGBlib_SetColor(i, RGBlib_Wheel(((i * 256 / LEDS) + j) & 255));
		}

		RGBlib_Show();
		RGBlib_Delay_ms(wait_ms);
	}

	RGBlib_Clear();
}

// //Theatre-style crawling lights with rainbow effect
void RGBlib_TheaterChaseRainbow(uint16_t wait_ms)
{

	for (uint8_t j = 0; j < 256; j++)	// cycle all 256 colors in the wheel
	{
		for (uint8_t q = 0; q < 3; q++)
		{
			for (uint8_t i = 0; i < LEDS; i = i + 3)
			{
				RGBlib_SetColor(i + q, RGBlib_Wheel((i + j) % 255));    //turn every third pixel on
			}

			RGBlib_Show();
			RGBlib_Delay_ms(wait_ms);

			for (uint8_t i = 0; i < LEDS; i = i + 3)
			{
				RGBlib_SetColor(i + q, 0);        //turn every third pixel off
			}
		}
	}
}

// Input a value 0 to 255 to get a color value.
// The colours are a transition r - g - b - back to r.
uint32_t RGBlib_Wheel(uint8_t nWheelPos)
{
	if (nWheelPos < 85)
	{
		return RGBlib_GetColorFromRGB(nWheelPos * 3, 255 - nWheelPos * 3, 0);
	}
	else if (nWheelPos < 170)
	{
		nWheelPos -= 85;
		return RGBlib_GetColorFromRGB(255 - nWheelPos * 3, 0, nWheelPos * 3);
	}
	else
	{
		nWheelPos -= 170;
		return RGBlib_GetColorFromRGB(0, nWheelPos * 3, 255 - nWheelPos * 3);
	}
}

// ---------------------------------------------------------------------------------------
// --------------------- DETONATE --------------------------------------------------
// I added this one just to demonstrate how quickly you can flash the string.
// Flashes get faster and faster until *boom* and fade to black.

void RGBlib_Detonate(RGB_colors_e color, uint16_t nStartDelay_ms)
{
	while (nStartDelay_ms)
	{
		RGBlib_SetColorAll(color, 0);		// Flash the color
		RGBlib_Delay_ms(6);
		RGBlib_Clear();
		RGBlib_Delay_ms(nStartDelay_ms);
		nStartDelay_ms = (nStartDelay_ms * 10) / 11;    // delay between flashes is halved each time until zero
	}

  RGBlib_SetColorAll(color, 0);
  RGBlib_Delay_ms(1000);

	// Then we fade to black....
	for (uint16_t nBrightness = RGBlib_GetBrightnessMax(); nBrightness > 0; nBrightness--)
	{
		RGBlib_SetBrightness(nBrightness);
		RGBlib_Delay_ms(100);
	}

  RGBlib_SetColorAll(COLOR_BLACK, 500);
  RGBlib_SetBrightness(RGBlib_GetBrightnessMax());
}

void RGBlib_Fade(RGB_colors_e color)
{
  RGBlib_SetBrightness(0);
  RGBlib_SetColorAll(color, 0);
  for (uint8_t nBrightness = 0; nBrightness <= RGBlib_GetBrightnessMax(); nBrightness++)
	{
		RGBlib_SetBrightness(nBrightness);
		RGBlib_Delay_ms(100);
	}

	RGBlib_Delay_ms(500);

	for (uint8_t nBrightness = RGBlib_GetBrightnessMax() - 1; nBrightness > 0; nBrightness--)
	{
		RGBlib_SetBrightness(nBrightness + 1);
		RGBlib_Delay_ms(100);
	}

  RGBlib_SetColorAll(COLOR_BLACK, 0);
	RGBlib_SetBrightness(RGBlib_GetBrightnessMax());
}

// ------------------------------------------------------------
void RGBlib_SetColor(uint8_t position, RGB_colors_e color)
{
  if (position < LEDS)
  {
	  RGBbuff[position * 3] = (uint8_t)(color >> 16);
	  RGBbuff[position * 3 + 1] = (uint8_t)(color >> 8);
	  RGBbuff[position * 3 + 2] = (uint8_t)color;
  }
}

uint32_t RGBlib_GetColor(uint8_t position)
{
  if (position < LEDS)
  {
	  return (RGBbuff[position++] << 16) + (RGBbuff[position++] << 8) + RGBbuff[position];
  }

  return 0;
}

void RGBlib_SetColorAll(RGB_colors_e color, uint16_t wait_ms)
{
	for (uint16_t i = 0; i < LEDS; i++)
	{
		RGBlib_SetColor(i, color);
		RGBlib_Show();
	}

	RGBlib_Delay_ms(wait_ms);
}

void RGBlib_Clear()
{
  RGBlib_SetColorAll(COLOR_BLACK, 0);
}

void RGBlib_WaitAndClear(uint16_t wait_ms)
{
	RGBlib_Delay_ms(wait_ms);
	RGBlib_SetColorAll(COLOR_BLACK, 0);
}

uint32_t RGBlib_GetColorFromRGB(uint8_t r, uint8_t g, uint8_t b)
{
	return (r << 16) + (g << 8) + b;
}

void RGBlib_Show()
{
	WS2812_Send(RGBbuff, sizeof(RGBbuff));
}

void RGBlib_SetBrightness(uint8_t nBrightness)
{
	WS2812_SetBrightness(nBrightness);
	RGBlib_Show();
}

uint8_t RGBlib_GetBrightness()
{
	return WS2812_GetBrightness();
}

uint8_t RGBlib_GetBrightnessMax()
{
	return WS2812_GetBrightnessMax();
}

void SysTick_Handler(void)
{
  if (nDelayTimer)
  {
    nDelayTimer--;
  }
}

void RGBlib_Delay_ms(uint32_t delay_ms)
{
	nDelayTimer = delay_ms;
	while (nDelayTimer);
}

uint16_t RGBlib_GetLedsCount()
{
	return LEDS;
}

uint32_t RGBlib_Rand(uint32_t nMin, uint32_t nMax)
{
  uint32_t rnd = RGBlib_GetRandomNumber();
  rnd = (rnd % (nMax - nMin + 1)) + nMin;
  return rnd;
}

RGB_colors_e RGBlib_GetRandomColor()
{
	uint8_t c = RGBlib_Rand(1, sizeof(colors));
	return colors[--c];
}

uint32_t RGBlib_GetRandomNumber()
{
  ADC_InitTypeDef ADC_InitStructure;

  //enable ADC1 clock
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);

  // Initialize ADC 14MHz RC
  RCC_ADCCLKConfig(RCC_ADCCLK_HSI14);
  RCC_HSI14Cmd(ENABLE);
  while (!RCC_GetFlagStatus(RCC_FLAG_HSI14RDY))
    ;

  ADC_DeInit(ADC1);
  ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
  ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
  ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;
  ADC_InitStructure.ADC_ScanDirection = ADC_ScanDirection_Backward;
  ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
  ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_TRGO; //default
  ADC_Init(ADC1, &ADC_InitStructure);

  //enable internal channel
  ADC_TempSensorCmd(ENABLE);

  // Enable ADCperipheral
  ADC_Cmd(ADC1, ENABLE);
  while (ADC_GetFlagStatus(ADC1, ADC_FLAG_ADEN) == RESET)
    ;

  ADC1->CHSELR = 0; //no channel selected
  //Convert the ADC1 temperature sensor, user shortest sample time to generate most noise
  ADC_ChannelConfig(ADC1, ADC_Channel_TempSensor, ADC_SampleTime_1_5Cycles);

  // Enable CRC clock
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_CRC, ENABLE);

  uint8_t i;
  for (i = 0; i < 8; i++) {
    //Start ADC1 Software Conversion
    ADC_StartOfConversion(ADC1);
    //wait for conversion complete
    while (!ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC)) {
    }

    CRC_CalcCRC(ADC_GetConversionValue(ADC1));
    //clear EOC flag
    ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
  }

  //disable ADC1 to save power
  ADC_Cmd(ADC1, DISABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, DISABLE);

  return CRC_CalcCRC(0xBADA55E5);
}

// ---------------------------------------------------------------------------------------------------------
// ------------- RAINBOW --------------------------------------
// vypada to, ze se vysouvaji barvy duhy (rainbowcolors) z nulove pozice a pritom se upravuje jejich jas
//#define MAXPIX 253
//#define COLORLENGTH 100
//#define FADE 5
//
//
//struct cRGB colors[8];
//struct cRGB led[MAXPIX];
//
//
//int main(void)
//{
//
//	uint8_t j = 1;
//	uint8_t k = 1;
//
//
//	DDRB|=_BV(ws2812_pin);
//
//    uint8_t i;
//    for(i=MAXPIX; i>0; i--)
//    {
//        led[i-1].r=0;led[i-1].g=0;led[i-1].b=0;
//    }
//
//    //Rainbowcolors
//    colors[0].r=150; colors[0].g=150; colors[0].b=150;
//    colors[1].r=255; colors[1].g=000; colors[1].b=000;//red
//    colors[2].r=255; colors[2].g=100; colors[2].b=000;//orange
//    colors[3].r=100; colors[3].g=255; colors[3].b=000;//yellow
//    colors[4].r=000; colors[4].g=255; colors[4].b=000;//green
//    colors[5].r=000; colors[5].g=100; colors[5].b=255;//light blue (türkis)
//    colors[6].r=000; colors[6].g=000; colors[6].b=255;//blue
//    colors[7].r=100; colors[7].g=000; colors[7].b=255;//violet
//
//	while(1)
//    {
//        //shift all vallues by one led
//        uint8_t i=0;
//        for(i=MAXPIX; i>1; i--)
//            led[i-1]=led[i-2];
//        //change colour when colourlength is reached
//        if(k>COLORLENGTH)
//        {
//            j++;
//           k=0;
//       }
//       k++;
//       //loop colouers
//       if(j>8)
//           j=0;
//
//       //fade red
//       if(led[0].r<colors[j].r)
//           led[0].r+=FADE;
//       if(led[0].r>255.r)
//           led[0].r=255;
//
//       if(led[0].r>colors[j].r)
//           led[0].r-=FADE;
//   //    if(led[0].r<0)
//   //        led[0].r=0;
//       //fade green
//       if(led[0].g<colors[j].g)
//           led[0].g+=FADE;
//       if(led[0].g>255)
//           led[0].g=255;
//
//       if(led[0].g>colors[j].g)
//           led[0].g-=FADE;
//   //    if(led[0].g<0)
//   //        led[0].g=0;
//       //fade blue
//       if(led[0].b<colors[j].b)
//           led[0].b+=FADE;
//       if(led[0].b>255)
//           led[0].b=255;
//
//       if(led[0].b>colors[j].b)
//           led[0].b-=FADE;
//   //    if(led[0].b<0)
//   //        led[0].b=0;
//
//
//		 _delay_ms(10);
//		 ws2812_sendarray((uint8_t *)led,MAXPIX*3);
//    }
//}


// ------------------------------------------------------------------------------------
// Theatre-style crawling lights.
// Changes spacing to be dynmaic based on string size


//#define THEATER_SPACING (PIXELS/20)
//
//
//void theaterChase( unsigned char r , unsigned char g, unsigned char b, unsigned char wait ) {
//
//  for (int j=0; j< 3 ; j++) {
//
//    for (int q=0; q < THEATER_SPACING ; q++) {
//
//      unsigned int step=0;
//
//      cli();
//
//      for (int i=0; i < PIXELS ; i++) {
//
//        if (step==q) {
//
//          sendPixel( r , g , b );
//
//        } else {
//
//          sendPixel( 0 , 0 , 0 );
//
//        }
//
//        step++;
//
//        if (step==THEATER_SPACING) step =0;
//
//      }
//
//      sei();
//
//      show();
//      delay(wait);
//
//    }
//
//  }
//
//}

//---------------------------------------------------------------------------------------------
// -------------------------- RAINBOW_CYCLE ----------------------------
// I rewrite this one from scrtach to use high resolution for the color wheel to look nicer on a *much* bigger string

//void rainbowCycle(unsigned char frames , unsigned int frameAdvance, unsigned int pixelAdvance ) {
//
//  // Hue is a number between 0 and 3*256 than defines a mix of r->g->b where
//  // hue of 0 = Full red
//  // hue of 128 = 1/2 red and 1/2 green
//  // hue of 256 = Full Green
//  // hue of 384 = 1/2 green and 1/2 blue
//  // ...
//
//  unsigned int firstPixelHue = 0;     // Color for the first pixel in the string
//
//  for(unsigned int j=0; j<frames; j++) {
//
//    unsigned int currentPixelHue = firstPixelHue;
//
//    cli();
//
//    for(unsigned int i=0; i< PIXELS; i++) {
//
//      if (currentPixelHue>=(3*256)) {                  // Normalize back down incase we incremented and overflowed
//        currentPixelHue -= (3*256);
//      }
//
//      unsigned char phase = currentPixelHue >> 8;
//      unsigned char step = currentPixelHue & 0xff;
//
//      switch (phase) {
//
//        case 0:
//          sendPixel( ~step , step ,  0 );
//          break;
//
//        case 1:
//          sendPixel( 0 , ~step , step );
//          break;
//
//
//        case 2:
//          sendPixel(  step ,0 , ~step );
//          break;
//
//      }
//
//      currentPixelHue+=pixelAdvance;
//
//
//    }
//
//    sei();
//
//    show();
//
//    firstPixelHue += frameAdvance;
//
//  }
//}

// --------------------------------------------------------------------------------------
// ----  dalsi kody

//void rainbow(uint8_t wait) {
//  uint16_t i, j;
//
//  for(j=0; j<256; j++) {
//    for(i=0; i<strip.numPixels(); i++) {
//      strip.setPixelColor(i, Wheel((i+j) & 255));
//    }
//    strip.show();
//    delay(wait);
//  }
//}
//
//// Slightly different, this makes the rainbow equally distributed throughout
//void rainbowCycle(uint8_t wait) {
//  uint16_t i, j;
//
//  for(j=0; j<256*5; j++) { // 5 cycles of all colors on wheel
//    for(i=0; i< strip.numPixels(); i++) {
//      strip.setPixelColor(i, Wheel(((i * 256 / strip.numPixels()) + j) & 255));
//    }
//    strip.show();
//    delay(wait);
//  }
//}
//
//// Input a value 0 to 255 to get a color value.
//// The colours are a transition r - g - b - back to r.
//uint32_t Wheel(byte WheelPos) {
//  if(WheelPos < 85) {
//   return strip.Color(WheelPos * 3, 255 - WheelPos * 3, 0);
//  } else if(WheelPos < 170) {
//   WheelPos -= 85;
//   return strip.Color(255 - WheelPos * 3, 0, WheelPos * 3);
//  } else {
//   WheelPos -= 170;
//   return strip.Color(0, WheelPos * 3, 255 - WheelPos * 3);
//  }
//}


// -----------------------------------------------------------------------------------

//void rainbow(uint8_t wait) {
//  uint16_t i, j;
//
//
//  for(j=0; j<256; j++) {
//    for(i=0; i<strip.numPixels(); i++) {
//      strip.setPixelColor(i, Wheel((i+j) & 255));
//    }
//    strip.show();
//    delay(wait);
//  }
//}
//
//
//// Slightly different, this makes the rainbow equally distributed throughout
//void rainbowCycle(uint8_t wait) {
//  uint16_t i, j;
//
//
//  for(j=0; j<256*5; j++) { // 5 cycles of all colors on wheel
//    for(i=0; i< strip.numPixels(); i++) {
//      strip.setPixelColor(i, Wheel(((i * 256 / strip.numPixels()) + j) & 255));
//    }
//    strip.show();
//    delay(wait);
//  }
//}
//
//
//
// //Theatre-style crawling lights with rainbow effect
// void theaterChaseRainbow(uint8_t wait) {
//   for (int j=0; j < 256; j++) {     // cycle all 256 colors in the wheel
//     for (int q=0; q < 3; q++) {
//       for (int i=0; i < strip.numPixels(); i=i+3) {
//         strip.setPixelColor(i+q, Wheel( (i+j) % 255));    //turn every third pixel on
//       }
//       strip.show();
//
//
//       delay(wait);
//
//
//       for (int i=0; i < strip.numPixels(); i=i+3) {
//         strip.setPixelColor(i+q, 0);        //turn every third pixel off
//       }
//     }
//   }
// }

// -----------------------------------------------------------------------------------
// Input a value 0 to 191 to get a color value.
// The colors are a transition red->yellow->green->aqua->blue->fuchsia->red...
//  Adapted from Wheel function in the Adafruit_NeoPixel library example sketch
//uint32_t rainbowOrder(byte position)
//{
//  // 6 total zones of color change:
//  if (position < 31)  // Red -> Yellow (Red = FF, blue = 0, green goes 00-FF)
//  {
//    return leds.Color(0xFF, position * 8, 0);
//  }
//  else if (position < 63)  // Yellow -> Green (Green = FF, blue = 0, red goes FF->00)
//  {
//    position -= 31;
//    return leds.Color(0xFF - position * 8, 0xFF, 0);
//  }
//  else if (position < 95)  // Green->Aqua (Green = FF, red = 0, blue goes 00->FF)
//  {
//    position -= 63;
//    return leds.Color(0, 0xFF, position * 8);
//  }
//  else if (position < 127)  // Aqua->Blue (Blue = FF, red = 0, green goes FF->00)
//  {
//    position -= 95;
//    return leds.Color(0, 0xFF - position * 8, 0xFF);
//  }
//  else if (position < 159)  // Blue->Fuchsia (Blue = FF, green = 0, red goes 00->FF)
//  {
//    position -= 127;
//    return leds.Color(position * 8, 0, 0xFF);
//  }
//  else  //160 <position< 191   Fuchsia->Red (Red = FF, green = 0, blue goes FF->00)
//  {
//    position -= 159;
//    return leds.Color(0xFF, 0x00, 0xFF - position * 8);
//  }
//}
