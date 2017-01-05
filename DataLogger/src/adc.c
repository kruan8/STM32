/*
 * adc.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "adc.h"

#define TEMP_INPUT_PIN                  (1 << 0)  // in
#define TEMP_INPUT_GPIO_PORT            GPIOA

#define ADC_INPUT_TEMPERATURE           ADC_CHSELR_CHSEL0
#define ADC_INPUT_REFINT                ADC_CHSELR_CHSEL17
#define ADC_INPUT_TEMP_INT              ADC_CHSELR_CHSEL18

#define ADC_SAMPLES                    10

#define TEMP_VDD_CALIB ((uint16_t) (3000))
#define TEMP30_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FF8007A))
#define TEMP130_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FF8007E))
#define VREFINT_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FF80078))

#define REF_MV     3000L

#define OVERSAMPLING

static int16_t g_nTempOffset = 0;

void Adc_Init(void)
{
  // Configure ADC INPUT pins as analog input
  // asi neni treba konfigurovat, po resetu jsou vstupy v analog input
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
//  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE4)) | GPIO_MODER_MODE4;

  // Configure ADC
  RCC->APB2ENR |= RCC_APB2ENR_ADC1EN;  // clock for ADC

  // ADC clock from APB (PCLK/2)
  ADC1->CFGR2 = (ADC1->CFGR2 & ~(ADC_CFGR2_CKMODE)) | ADC_CFGR2_CKMODE_0; // 01: PCLK/2 (Synchronous clock mode) (ADC clock = 1MHz)

#ifdef OVERSAMPLING
  // set oversampling, ! bity CKMODE registru CFGR2 musi byt nastaveny pred jakymkoliv nastaveni ADC - viz datasheet !
  ADC1->CFGR2 = ADC1->CFGR2 & (~ADC_CFGR2_OVSR);
  ADC1->CFGR2 |= ADC_CFGR2_OVSR_1 | ADC_CFGR2_OVSR_0; // sampling ratio
  ADC1->CFGR2 = (ADC1->CFGR2 & ~ADC_CFGR2_OVSS) | ADC_CFGR2_OVSS_2;         // sampling shift
  ADC1->CFGR2 |= ADC_CFGR2_OVSE;
#endif

  ADC1->SMPR |= ADC_SMPR_SMP_0 | ADC_SMPR_SMP_1 | ADC_SMPR_SMP_2; /* (4) */ //160 ADC clock cycles
//  ADC1->IER = ADC_IER_EOCIE; // interrupt enable 'end of conversion'  (ADC_IER_EOSEQIE | ADC_IER_OVRIE)

  // Calibrate ADC
  if ((ADC1->CR & ADC_CR_ADEN) != 0) // Ensure that ADEN = 0
  {
    ADC1->CR &= (uint32_t)(~ADC_CR_ADEN);  // Clear ADEN
  }

  ADC1->CR |= ADC_CR_ADCAL; // Set ADCAL=1
  while ((ADC1->ISR & ADC_ISR_EOCAL) == 0) // Clear EOCAL
  {
    /* For robust implementation, add here time-out management */
  }

  ADC->CCR |= ADC_CCR_VREFEN;     // enable VREFINT

  ADC1->ISR |= ADC_ISR_EOCAL; /* (5) */

  Adc_Enable();
}

void Adc_Disable()
{
  /* (1) Ensure that no conversion on going */
  /* (2) Stop any ongoing conversion */
  /* (3) Wait until ADSTP is reset by hardware i.e. conversion is stopped */
  /* (4) Disable the ADC */
  /* (5) Wait until the ADC is fully disabled */
  if ((ADC1->CR & ADC_CR_ADSTART) != 0) /* (1) */
  {
    ADC1->CR |= ADC_CR_ADSTP; /* (2) */
  }
  while ((ADC1->CR & ADC_CR_ADSTP) != 0) /* (3) */
  {
     /* For robust implementation, add here time-out management */
  }
  ADC1->CR |= ADC_CR_ADDIS; /* (4) */
  while ((ADC1->CR & ADC_CR_ADEN) != 0) /* (5) */
  {
    /* For robust implementation, add here time-out management */
  }
}

void Adc_Enable()
{
//  ADC1->CFGR1 |= ADC_CFGR1_AUTOFF;
  // Enable ADC
  /* (1) Enable the ADC */
  /* (2) Wait until ADC ready if AUTOFF is not set */
  ADC1->CR |= ADC_CR_ADEN; /* (1) */
  if ((ADC1->CFGR1 &  ADC_CFGR1_AUTOFF) == 0)
  {
    while ((ADC1->ISR & ADC_ISR_ADRDY) == 0) /* (2) */
    {
      /* For robust implementation, add here time-out management */
    }
  }
}

int16_t Adc_MeasureTemperatureInternal(uint16_t nVDDA)
{
  ADC1->CHSELR = ADC_INPUT_TEMP_INT;
  uint16_t nValue = Adc_Measure();

  int32_t temperature;
  temperature = ((nValue * nVDDA / TEMP_VDD_CALIB) - (int32_t) *TEMP30_CAL_ADDR );
  temperature = temperature * (int32_t)(1300 - 300);
  temperature = temperature / (int32_t)(*TEMP130_CAL_ADDR - *TEMP30_CAL_ADDR);
  temperature = temperature + 300;

  return (int16_t)temperature;
}

uint16_t Adc_MeasureTemperature(void)
{
  ADC1->CHSELR = ADC_INPUT_TEMPERATURE;       // channel
  return Adc_Measure();
}

uint16_t Adc_CalcValueFromVDDA(uint16_t nValue, uint16_t nVDDA)
{
  return (uint32_t)nVDDA * nValue / REF_MV;
}

int16_t Adc_CalcTemperature(uint16_t nValue, bool bOffsetEnable)
{
  // temperature coefficient MCP9700A = 10mV/C, 0C = 500mV
  int32_t temp = (nValue * REF_MV / 4095) - 500;

  if (bOffsetEnable)
  {
    temp += g_nTempOffset;      // pricteni kalibracniho offsetu
  }

  return (int16_t)temp;
}

int16_t Adc_GetTemperature(bool bOffsetEnable)
{
  // zmerit napajeci napeti VDDA
  uint16_t nVDDA = Adc_MeasureRefInt();

  // zmerit teplotu
  uint16_t tempADC = Adc_CalcValueFromVDDA(Adc_MeasureTemperature(), nVDDA);
  return Adc_CalcTemperature(tempADC, bOffsetEnable);
}

void Adc_SetTempOffset(int16_t nOffset)
{
  g_nTempOffset = nOffset;
}

int16_t Adc_GetTempOffset()
{
  return g_nTempOffset;
}

uint16_t Adc_MeasureRefInt(void)
{
  ADC1->CHSELR = ADC_INPUT_REFINT;       // channel

  uint16_t nAdcValue = Adc_Measure();

  uint16_t nVrefIntCal = *VREFINT_CAL_ADDR;

  // VDDA = 3 V x VREFINT_CAL / VREFINT_DATA
  uint32_t nVDD = 3000L * nVrefIntCal / nAdcValue;

  return (uint16_t) nVDD;
}

uint16_t Adc_Measure()
{
#ifdef OVERSAMPLING
  ADC1->CR |= ADC_CR_ADSTART;
  while (ADC1->CR & ADC_CR_ADSTART);
  return ADC1->DR;
#else

  uint32_t nSumValue = 0;
  for (uint8_t i = 0; i < ADC_SAMPLES; i++)
  {
    ADC1->CR |= ADC_CR_ADSTART; /* Start the ADC conversion */
    while (ADC1->CR & ADC_CR_ADSTART);
    nSumValue += ADC1->DR;
  }

  return (uint16_t) (nSumValue / ADC_SAMPLES);
#endif
}

