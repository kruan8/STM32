/*
 * ILI9163.c
 * code for STM32F0
 */

/*
 *		Zapojeni vyvodu pro displej:
 *
 *    SCK:    SPI1-SCK:  PA5  - (SPI clk)
 *    SDA:    SPI1-MOSI: PA7  - (SPI data)
 *
 *		A0:	    PA6 - (command/data)
 *		CS:     PA4 - (CS display)
 *		RESET:  PA2 - (reset)
 *		LED:    PA3 - (backlight LED)
 */

// vytvoreno podle:
// https://github.com/sumotoy/TFT_ILI9163C

#include "ILI9163.h"
#include "font.h"

#define ILI9163_A0_PIN                     GPIO_Pin_6
#define ILI9163_A0_GPIO_PORT               GPIOA
#define ILI9163_A0_SCK_GPIO_CLK            RCC_AHBPeriph_GPIOA

#define ILI9163_CS_PIN                     GPIO_Pin_4
#define ILI9163_CS_GPIO_PORT               GPIOA
#define ILI9163_CS_SCK_GPIO_CLK            RCC_AHBPeriph_GPIOA

#define ILI9163_RST_PIN                     GPIO_Pin_2
#define ILI9163_RST_GPIO_PORT               GPIOA
#define ILI9163_RST_SCK_GPIO_CLK            RCC_AHBPeriph_GPIOA

#define ILI9163_LED_PIN                     GPIO_Pin_3
#define ILI9163_LED_GPIO_PORT               GPIOA
#define ILI9163_LED_SCK_GPIO_CLK            RCC_AHBPeriph_GPIOA

#define ILI9163_RST_HIGH					(ILI9163_RST_GPIO_PORT->BSRR = ILI9163_RST_PIN)
#define ILI9163_RST_LOW			 			(ILI9163_RST_GPIO_PORT->BRR = ILI9163_RST_PIN)

#define ILI9163_CS_ENABLE					(ILI9163_CS_GPIO_PORT->BRR = ILI9163_CS_PIN)
#define ILI9163_CS_DISABLE		 			(ILI9163_CS_GPIO_PORT->BSRR = ILI9163_CS_PIN)

#define ILI9163_LED_ON						(ILI9163_LED_GPIO_PORT->BSRR = ILI9163_LED_PIN)
#define ILI9163_LED_OFF			 			(ILI9163_LED_GPIO_PORT->BRR = ILI9163_LED_PIN)

#define ILI9163_A0_DATA						(ILI9163_A0_GPIO_PORT->BSRR = ILI9163_A0_PIN)
#define ILI9163_A0_REG			 			(ILI9163_A0_GPIO_PORT->BRR = ILI9163_A0_PIN)

// chyba spatneho zadratovani displeje (128x160)
// je treba posunout zobrazovanou pamet o 32 radku nize
// s timto je potreba pocitat i pri aplikaci vertikalniho rolovani

static volatile uint32_t nDelayTimer;
TextParam params;
static volatile uint32_t g_nTicks;

#define DMA_ENABLE

void ILI9163_Init()
{
	if (SysTick_Config(SystemCoreClock / 1000))
	{
	     /* Capture error */
	     while (1);
	}

	g_nTicks = 0;

	GPIO_InitTypeDef GPIO_InitStructure;

	/* Enable the SPI periph */
	RCC_APB2PeriphClockCmd(RCC_APB2Periph_SPI1, ENABLE);

	/* Enable GPIO clocks */
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);

	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_NOPULL;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_Level_3;

	/* SPI SCK pin configuration */
	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_5;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	/* SPI  MOSI pin configuration */
	GPIO_InitStructure.GPIO_Pin =  GPIO_Pin_7;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	GPIO_PinAFConfig(GPIOA, GPIO_PinSource5, GPIO_AF_0);
	GPIO_PinAFConfig(GPIOA, GPIO_PinSource7, GPIO_AF_0);

	/* SPI configuration -------------------------------------------------------*/
	SPI_I2S_DeInit(SPI1);

	SPI_InitTypeDef  SPI_InitStructure;
	SPI_InitStructure.SPI_Direction = SPI_Direction_1Line_Tx;
	SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
	SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
	SPI_InitStructure.SPI_CPOL = SPI_CPOL_Low;
	SPI_InitStructure.SPI_CPHA = SPI_CPHA_1Edge;
	SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
	SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2;  // SCK freq=48/2=24Mhz
	SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
	SPI_InitStructure.SPI_CRCPolynomial = 7;
	SPI_Init(SPI1, &SPI_InitStructure);

	SPI_Cmd(SPI1, ENABLE);

	// next pins
	GPIO_InitStructure.GPIO_Pin = ILI9163_A0_PIN | ILI9163_CS_PIN | ILI9163_RST_PIN | ILI9163_LED_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_Level_3;
	GPIO_Init(GPIOA, &GPIO_InitStructure);

	ILI9163_CS_DISABLE;

	// display reset
	ILI9163_RST_LOW;
	ILI9163_Delay_ms(20);
	ILI9163_RST_HIGH;
	ILI9163_Delay_ms(20);

	ILI9163_LED_ON;

	// driver configuration
	ILI9163_WriteToReg(0x01); //Software reset
	ILI9163_WriteToReg(0x11); //Exit Sleep
	ILI9163_Delay_ms(20);

	ILI9163_WriteToReg(0x26); //Set default gamma
	ILI9163_WriteData8(0x04);

	ILI9163_WriteToReg(0xC0); //Set Power Control 1
	ILI9163_WriteData16(0x1F00);

	ILI9163_WriteToReg(0xC1); //Set Power Control 2
	ILI9163_WriteData8(0x00);

	ILI9163_WriteToReg(0xC2); //Set Power Control 3
	ILI9163_WriteData16(0x0007);

	ILI9163_WriteToReg(0xC3); //Set Power Control 4 (Idle mode)
	ILI9163_WriteData16(0x0007);

	ILI9163_WriteToReg(0xC5); //Set VCom Control 1
	ILI9163_WriteData8(0x24); // VComH = 3v
	ILI9163_WriteData8(0xC8); // VComL = 0v

	ILI9163_WriteToReg(0x13); // normal mode

	ILI9163_WriteToReg(0x38); //Idle mode off
	//SB(0x39, Reg); //Enable idle mode

	ILI9163_WriteToReg(0x3A);	//Set pixel mode
	ILI9163_WriteData8(0x05);	// (16bit/pixel)

	ILI9163_WriteToReg(0x36);  //Set Memory access mode
#ifdef LCD_128x128
	ILI9163_WriteData8(0x08);
#endif
#ifdef LCD_240x320
//	ILI9163_WriteData8(0x48); // nalezato 0x48
	ILI9163_WriteData8(0x88);   // nastojato, konektor nahore
#endif
#ifdef LCD_128x160
	ILI9163_WriteData8(0x00);
#endif

//  ILI9163_WriteToReg(0x33); // set scroll offset
//	ILI9163_WriteData16(32);
//	ILI9163_WriteData16(128);
//	ILI9163_WriteData16(0);

	ILI9163_WriteToReg(0x29);  // Display on

	ILI9163_WriteToReg(0x20);  // off Inv mode

#ifdef DMA_ENABLE
	ILI9163_ConfigDMA();
#endif

	ILI9163_FillScreen(0x0000);

}

void ILI9163_WritePixel(uint16_t x, uint16_t y, uint16_t color)
{
	ILI9163_SetAddress(x, y, x, y);
	ILI9163_WriteData16(color);
}

void ILI9163_PrintChar(uint16_t x, uint16_t y, char c)
{
	if(x > ILI9163_RES_X - 5 || y > ILI9163_RES_Y - 8 || c < 0x20)
	{
		return;
	}

	c -= 0x20;
	c *= 5;

	ILI9163_SetAddress(x, y, x + 4 + 1, y + 7);
	for(uint8_t YCnt = 0; YCnt < 8; YCnt++)
	{
		for(uint8_t XCnt = 0; XCnt < 5 + 1; XCnt++)
		{
		  if(XCnt < 5 && (font[c + XCnt] & (1 << YCnt)))
		  {
			ILI9163_WriteData16(params.txtColor);
		  }
		  else
		  {
			ILI9163_WriteData16(params.bkgColor);
		  }
		}
	}
}

void ILI9163_PrintText(uint16_t x, uint16_t y, char* text)
{
  while (*text)
  {
    ILI9163_PrintChar(x, y, *text++);
    x += 5 + 1;
  }
}

void ILI9163_SetTextParams(	uint16_t txtColor,	uint16_t bkgColor)
{
  params.txtColor = txtColor;
  params.bkgColor = bkgColor;
}

void ILI9163_SetAddress(uint16_t xStart, uint16_t yStart, uint16_t xStop, uint16_t yStop)
{
  yStart += ILI9163_OFFSET;
  yStop += ILI9163_OFFSET;

	ILI9163_WriteToReg(0x2A);			// Column Address Set
	ILI9163_WriteData16(xStart);
	ILI9163_WriteData16(xStop);

	ILI9163_WriteToReg(0x2B);			// page address set
	ILI9163_WriteData16(yStart);
	ILI9163_WriteData16(yStop);

	ILI9163_WriteToReg(0x2C);			// memory write
}

void ILI9163_WriteToReg(uint8_t value)
{
	ILI9163_CS_ENABLE;
	ILI9163_A0_REG;

	SPI_SendData8(SPI1, value);
	while(SPI_I2S_GetFlagStatus(SPI1, SPI_I2S_FLAG_BSY) == SET);
	ILI9163_CS_DISABLE;
}

void ILI9163_WriteData8(uint8_t value)
{
	ILI9163_CS_ENABLE;
	ILI9163_A0_DATA;

	SPI1->DR = value;
	while (SPI1->SR & SPI_I2S_FLAG_BSY);
	ILI9163_CS_DISABLE;
}

void ILI9163_WriteData16(uint16_t value)
{
	ILI9163_CS_ENABLE;
	ILI9163_A0_DATA;

	SPI_SendData8(SPI1, value >> 8);
	while (!(SPI1->SR & SPI_I2S_FLAG_TXE));
	SPI_SendData8(SPI1, value);
	while (SPI1->SR & SPI_I2S_FLAG_BSY);
	ILI9163_CS_DISABLE;
}

void ILI9163_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color)
{
  if (x >= ILI9163_RES_X || y >= ILI9163_RES_Y)
  {
    return;
  }

  if (x + w - 1 >= ILI9163_RES_X)
  {
    w = ILI9163_RES_X - x;
  }

  if (y + h - 1 >= ILI9163_RES_Y)
  {
    h = ILI9163_RES_Y - y;
  }

  ILI9163_SetAddress(x, y, x + w - 1, y + h - 1);

#ifdef DMA_ENABLE
	SPI_Cmd(SPI1, DISABLE);
	SPI_DataSizeConfig(SPI1, SPI_DataSize_16b);
	SPI_Cmd(SPI1, ENABLE);
	ILI9163_CS_ENABLE;
	ILI9163_A0_DATA;
	uint32_t nSize = w * h;
	while (nSize)
	{
		uint16_t nLength = 0xFFFF;
		if (nSize < 0xFFFF)
		{
			nLength = nSize;
		}

		ILI9163_StartDMA((uint32_t)&color, nLength);
		while ((DMA_GetFlagStatus(DMA1_FLAG_TC3) == RESET));
		nSize -= nLength;
	}

	ILI9163_CS_DISABLE;
	SPI_Cmd(SPI1, DISABLE);
	SPI_DataSizeConfig(SPI1, SPI_DataSize_8b);
	SPI_Cmd(SPI1, ENABLE);
#else
	for (uint32_t i = w * h; i > 0; i--)
	{
		ILI9163_WriteData16(color);
	}
#endif
}

void ILI9163_FillScreen(uint16_t color)
{
	ILI9163_FillRect(0, 0, ILI9163_RES_X, ILI9163_RES_Y, color);
}

void ILI9163_Delay_ms(uint32_t delay_ms)
{
	nDelayTimer = delay_ms;
	while (nDelayTimer);
}

uint32_t ILI9163_GetTicks_ms()
{
	return g_nTicks;
}

void SysTick_Handler(void)
{
	g_nTicks++;
	if (nDelayTimer)
	{
		nDelayTimer--;
	}
}

void ILI9163_ConfigDMA()
{
	RCC_AHBPeriphClockCmd(RCC_AHBPeriph_DMA1, ENABLE);

	DMA_InitTypeDef DMA_InitStructure;
	DMA_InitStructure.DMA_BufferSize = (uint16_t)(1);
	DMA_InitStructure.DMA_MemoryBaseAddr = (uint32_t) 0;
	DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord;
	DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Disable;

	DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t)(&(SPI1->DR));
	DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord;
	DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;

	DMA_InitStructure.DMA_M2M = DMA_M2M_Disable;
	DMA_InitStructure.DMA_Mode = DMA_Mode_Normal;
	DMA_InitStructure.DMA_Priority = DMA_Priority_High;
	DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralDST;  	/* Configure Tx DMA */

	DMA_Init(DMA1_Channel3, &DMA_InitStructure);

	SPI_I2S_DMACmd(SPI1, SPI_I2S_DMAReq_Tx, ENABLE);
	DMA_ClearFlag(DMA1_FLAG_GL3);
}

void ILI9163_StartDMA(uint32_t nMemAddr, uint16_t nLength)
{
	DMA_Cmd(DMA1_Channel3, DISABLE);
	DMA_ClearFlag(DMA1_FLAG_GL3);
	DMA1_Channel3->CMAR = nMemAddr;
	DMA1_Channel3->CNDTR = nLength;
	DMA_Cmd(DMA1_Channel3, ENABLE);
}

void ILI9163_PixelSetRGB565(int16_t x, int16_t y, uint16_t color)
{
  ILI9163_WritePixel((uint16_t) x, (uint16_t)y, color);
}

uint8_t ILI9163_FillFrame(int16_t x1, int16_t y1, int16_t x2, int16_t y2, uint16_t color)
{
  ILI9163_FillRect(x1, y1, x2 - x1, y2 - y1, color);
  return 0;

}
