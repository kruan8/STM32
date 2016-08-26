/*
 * LEDdriver.c
 *
 *  Created on: 10. 11. 2015
 *      Author: priesolv
 *
 *      DMA driver pro generovaní impulsu pro WS2812.
 *      Pulzy jsou vytvoreny pomoci PWM1 casovase TIM3 na vystupu OC1, capture registr je krmen pomoci DMA.
 *      DMA pouziva kruhovy buffer a je velky minimalne pro 2 LED,
 *      po preruseni poloviny DMA prenosu (IT_HT, IT_TC) je zapsan do pulky buffery stav dalsi(ch) LED.
 *
 *      Vytvoreno na zaklade:
 *      https://www.bitcraze.io/2014/04/neopixel-driver-for-the-crazyflies-stm32/
 *      source:
 *      https://github.com/bitcraze/crazyflie-firmware/blob/neopixel_dev/drivers/src/ws2812.c
 */

#include "WS2812driver.h"
#include <string.h>

#define LED_PER_HALF 1

#define TIMER_CAPTURE_L		17			// hodnota capture registru pro impuls L
#define TIMER_CAPTURE_H    	34			// hodnota capture registru pro impuls H

#define BRIGHTNESS_MAX  31

static uint8_t g_nBrightness = BRIGHTNESS_MAX;		// nastaveni jasu, aplikuje se pri plneni bufferu
static int current_led = 0;
static int total_led = 0;
static uint8_t *led_buffer = 0;		// pointer na buffer s RGB hodnotami LED
static uint8_t bDMAInProcess = 0;	// flag prenosu DMA

static union
{
    uint8_t dma_buffer[2 * LED_PER_HALF * 24];
    struct
    {
        uint8_t begin[LED_PER_HALF * 24];
        uint8_t end[LED_PER_HALF * 24];
    } __attribute__((packed));
} led_dma;

// prevod pro 8 bitove nastaveni jasu
uint8_t GammaBrightness8[] = {
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2,
		2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5,
		6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 11, 11,
		11, 12, 12, 13, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18, 18,
		19, 19, 20, 21, 21, 22, 22, 23, 23, 24, 25, 25, 26, 27, 27, 28,
		29, 29, 30, 31, 31, 32, 33, 34, 34, 35, 36, 37, 37, 38, 39, 40,
		40, 41, 42, 43, 44, 45, 46, 46, 47, 48, 49, 50, 51, 52, 53, 54,
		55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
		71, 72, 73, 74, 76, 77, 78, 79, 80, 81, 83, 84, 85, 86, 88, 89,
		90, 91, 93, 94, 95, 96, 98, 99,100,102,103,104,106,107,109,110,
		111,113,114,116,117,119,120,121,123,124,126,128,129,131,132,134,
		135,137,138,140,142,143,145,146,148,150,151,153,155,157,158,160,
		162,163,165,167,169,170,172,174,176,178,179,181,183,185,187,189,
		191,193,194,196,198,200,202,204,206,208,210,212,214,216,218,220,
		222,224,227,229,231,233,235,237,239,241,244,246,248,250,252,255
};

//prevod pro 5-bitove nastaveni jasu
uint8_t GammaBrightness5[] = {
    0, 1, 2, 3, 4, 5, 7, 9,
	12, 15, 18, 22, 27, 32, 38, 44,
	51, 58, 67, 76, 86, 96, 108, 120,
	134, 148, 163, 180, 197, 216, 235, 255
};

void WS2812_Init()
{
    GPIO_InitTypeDef InitStruct;
    GPIO_StructInit(&InitStruct);

    // pin pro TIM3_CH1
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

    /* GPIOA Configuration: TIM3 Channel 1 as alternate function push-pull */
    InitStruct.GPIO_Pin = GPIO_Pin_6;
    InitStruct.GPIO_Mode = GPIO_Mode_AF;
    InitStruct.GPIO_OType = GPIO_OType_PP;
    InitStruct.GPIO_PuPd = GPIO_PuPd_UP;
    InitStruct.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOA, &InitStruct);

    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM3, ENABLE);

    /* Time base configuration */
    TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
    // hodnoty pro PCLK = 48 MHz
    // sirka pulsu (hodnota pro Compare registr): 370ns(L) = 17;  700ns(H) = 34 (viz TIMER_CAPTURE_H/TIMER_CAPTURE_L)
    TIM_TimeBaseStructure.TIM_Period = 59; //29; // 800kHz
    TIM_TimeBaseStructure.TIM_Prescaler = 0; //old values: (uint16_t) (48000000 / 24000000) - 1;
    TIM_TimeBaseStructure.TIM_ClockDivision = 0;
    TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
    TIM_TimeBaseInit(TIM3, &TIM_TimeBaseStructure);

    // PWM1 Mode configuration: Channel1
    // PWM puls zacina urovni L a po dosazeni hodnoty v Capture registru se zmeni na H, po vynulovani timeru znovu na L
    TIM_OCInitTypeDef  TIM_OCInitStructure;
    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Disable;
    TIM_OCInitStructure.TIM_Pulse = 0;
     TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
    // TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
    // TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCNIdleState_Set;
    TIM_OC1Init(TIM3, &TIM_OCInitStructure);

    TIM_OC1PreloadConfig(TIM3, TIM_OCPreload_Enable);

    // kdy tohle bylo hned po konfiguraci portu, tak se na vystupu objevila H dokud nebyl nakonfigurovan OC vystup timeru
    // proto je presunuto sem
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource6, GPIO_AF_1);  // TIM3_CH1

    // Configure DMA
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

    DMA_InitTypeDef DMA_InitStructure;
    DMA_DeInit(DMA1_Channel4);

    DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)&TIM3->CCR1; //TIM3_CCR1_Address;	// physical address of Timer 3 CCR1
    DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t)led_dma.dma_buffer;		// this is the buffer memory
    DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;						// data shifted from memory to peripheral
    DMA_InitStructure.DMA_BufferSize = sizeof(led_dma.dma_buffer);
    DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
    DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;					// automatically increase buffer index
    DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
    DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_Byte;
    DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;
    DMA_InitStructure.DMA_Priority = DMA_Priority_High;
    DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;

    DMA_Init(DMA1_Channel4, &DMA_InitStructure);

    NVIC_InitTypeDef NVIC_InitStructure;
    NVIC_InitStructure.NVIC_IRQChannel = DMA1_Channel4_5_IRQn;
    NVIC_InitStructure.NVIC_IRQChannelPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);

    DMA_ITConfig(DMA1_Channel4, DMA_IT_TC, ENABLE);
	DMA_ITConfig(DMA1_Channel4, DMA_IT_HT, ENABLE);

	TIM_DMACmd(TIM3, TIM_DMA_CC1, ENABLE);

    // --------- TEST PWM --------------
//    TIM_SetCompare1(TIM3, 17);
//	DMA_Cmd(DMA1_Channel4, ENABLE);
//    TIM_Cmd(TIM3, ENABLE);
    // ---------------------------------
}

void WS2812_Send(uint8_t *buffer, uint8_t len)
{
    int i;
	if (len < 1)
	{
		return;
	}

	current_led = 0;
	total_led = len / 3;
	led_buffer = buffer;

    for (i = 0; (i < LED_PER_HALF) && (current_led < total_led + 2); i++, current_led++)
    {
        if (current_led < total_led)
        {
        	WS2812_Fill(led_dma.begin + (24 * i), &led_buffer[current_led * 3]);
        }
        else
        {
            memset(led_dma.begin + (24 * i), 0, 24);
        }
    }

    for (i = 0; (i < LED_PER_HALF) && (current_led < total_led + 2); i++, current_led++)
    {
        if (current_led < total_led)
        {
        	WS2812_Fill(led_dma.end + (24 * i), &led_buffer[current_led * 3]);
        }
        else
        {
            memset(led_dma.end + (24 * i), 0, 24);
        }
    }

    bDMAInProcess = 1;
	DMA1_Channel4->CNDTR = sizeof(led_dma.dma_buffer); 	// load number of bytes to be transferred
	DMA_Cmd(DMA1_Channel4, ENABLE); 					// enable DMA channel 4
	TIM_Cmd(TIM3, ENABLE);                      		// Go!!!

	// cekani na ukonceni predchoziho prenosu
	while (bDMAInProcess);
}


void WS2812_Fill(uint8_t *buffer, uint8_t *color)
{
	int i;

  uint8_t r = (color[0] * GammaBrightness5[g_nBrightness]) >> 8;
  uint8_t g = (color[1] * GammaBrightness5[g_nBrightness]) >> 8;
  uint8_t b = (color[2] * GammaBrightness5[g_nBrightness]) >> 8;

//	color[0] = (color[0] * GammaBrightness5[g_nBrightness]) >> 8;
//	color[1] = (color[1] * GammaBrightness5[g_nBrightness]) >> 8;
//	color[2] = (color[2] * GammaBrightness5[g_nBrightness]) >> 8;

    for(i = 0; i < 8; i++) // GREEN data
 	{
 	    buffer[i] = ((g << i) & 0x80) ? TIMER_CAPTURE_H : TIMER_CAPTURE_L;
 	}

 	for(i = 0; i < 8; i++) // RED
 	{
 		buffer[8 + i] = ((r << i) & 0x80) ? TIMER_CAPTURE_H : TIMER_CAPTURE_L;
 	}

 	for(i = 0; i < 8; i++) // BLUE
 	{
 		buffer[16 + i] = ((b << i) & 0x80) ? TIMER_CAPTURE_H : TIMER_CAPTURE_L;
 	}
 }

void WS2812_SetBrightness(uint8_t nBrightness)
{
  if (nBrightness > BRIGHTNESS_MAX)
  {
    nBrightness = BRIGHTNESS_MAX;
  }

	g_nBrightness = nBrightness;
}

uint8_t WS2812_GetBrightness()
{
	return g_nBrightness;
}

uint8_t WS2812_GetBrightnessMax()
{
	return BRIGHTNESS_MAX;
}

void DMA1_Channel4_5_IRQHandler(void)
{
	uint8_t * buffer;
	int i;

	if (total_led == 0)
	{
	    TIM_Cmd(TIM3, DISABLE);
		DMA_Cmd(DMA1_Channel4, DISABLE);
	}

	if (DMA_GetITStatus(DMA1_IT_HT4))
	{
	    DMA_ClearITPendingBit(DMA1_IT_HT4);
	    buffer = led_dma.begin;
	}

	if (DMA_GetITStatus(DMA1_IT_TC4))
	{
	    DMA_ClearITPendingBit(DMA1_IT_TC4);
	    buffer = led_dma.end;
	}


	for (i = 0; (i < LED_PER_HALF) && (current_led < total_led + 2); i++, current_led++)
	{
		if (current_led < total_led)
		{
			WS2812_Fill(buffer + (24 * i), &led_buffer[current_led * 3]);
		}
		else
		{
			memset(buffer + (24 * i), 0, 24);
		}
	}

	if (current_led >= total_led + 2)
	{
		TIM_Cmd(TIM3, DISABLE); 					// disable Timer 1
		DMA_Cmd(DMA1_Channel4, DISABLE); 			// disable DMA channel 2

		total_led = 0;
		bDMAInProcess = 0;
	}

}
