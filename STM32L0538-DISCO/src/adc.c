/*
 * adc.c
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#include "adc.h"

#define OPTO_INPUT_PIN                  (1 << 1)  // in
#define OPTO_INPUT_GPIO_PORT            GPIOA

#define ADC_INPUT_TEMPERATURE           ADC_CHSELR_CHSEL4
#define ADC_INPUT_REFINT                ADC_CHSELR_CHSEL17

#define ADC_SAMPLES                   10

#define TEMP30_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FF8007A))
#define TEMP130_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FF8007E))
#define VREFINT_CAL_ADDR ((uint16_t*) ((uint32_t) 0x1FF80078))

void Adc_Init(void)
{
  // Configure ADC INPUT pins as analog input
  // asi neni treba konfigurovat, po resetu jsou vstupu v analog input
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
//  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE4)) | GPIO_MODER_MODE4;

  // Configure ADC
  RCC->APB2ENR |= RCC_APB2ENR_ADC1EN;  // clock for ADC

  /* (1) Select HSI16 by writing 00 in CKMODE (reset value) */
  /* (2) Select the external trigger on falling edge and external trigger on TIM22_TRGO
         by selecting TRG4 (EXTSEL = 100)*/
  /* (4) Select a sampling mode of 111 i.e. 239.5 ADC clk to be greater than 5us */
  /* (5) Wake-up the VREFINT (only for VLCD, Temp sensor and VRefInt) */
  ADC1->CFGR2 = (ADC1->CFGR2 & ~(ADC_CFGR2_CKMODE)) | ADC_CFGR2_CKMODE_0; // 01: PCLK/2 (Synchronous clock mode)
//  ADC1->CFGR1 |= ADC_CFGR1_EXTEN_0 | ADC_CFGR1_EXTSEL_2 ; /* (2) */
//  ADC1->CHSELR = ADC_INPUT; // channel
  ADC1->SMPR |= ADC_SMPR_SMP_0 | ADC_SMPR_SMP_1; /* (4) */
//  ADC1->IER = ADC_IER_EOCIE; // interrupt enable 'end of conversion'  (ADC_IER_EOSEQIE | ADC_IER_OVRIE)

  ADC1->CFGR1 |= ADC_CFGR1_AUTOFF;

  // Calibrate ADC
  /* (1) Ensure that ADEN = 0 */
  /* (2) Clear ADEN */
  /* (3) Set ADCAL=1 */
  /* (4) Wait until EOCAL=1 */
  /* (5) Clear EOCAL */
  if ((ADC1->CR & ADC_CR_ADEN) != 0) /* (1) */
  {
    ADC1->CR &= (uint32_t)(~ADC_CR_ADEN);  /* (2) */
  }

  ADC1->CR |= ADC_CR_ADCAL; /* (3) */
  while ((ADC1->ISR & ADC_ISR_EOCAL) == 0) /* (4) */
  {
    /* For robust implementation, add here time-out management */
  }

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

uint16_t Adc_MeasureTemperature(void)
{
  uint32_t nSumValue = 0;
  ADC1->CHSELR = ADC_INPUT_TEMPERATURE;       // channel
  for (uint8_t i = 0; i < ADC_SAMPLES; i++)
  {
    ADC1->CR |= ADC_CR_ADSTART; /* Start the ADC conversion */
    while (ADC1->CR & ADC_CR_ADSTART);
    nSumValue += ADC1->DR;
  }

  return (uint16_t) (nSumValue / ADC_SAMPLES);
}

int16_t Adc_CalcTemperature(uint16_t nValue)
{
  int32_t temp = (nValue * 3300 / 4095) - 500;
  return (int16_t)temp;
}

uint16_t Adc_MeasureRefInt(void)
{
  uint32_t nSumValue = 0;
  ADC->CCR |= ADC_CCR_VREFEN;
  ADC1->CHSELR = ADC_INPUT_REFINT;       // channel
  for (uint8_t i = 0; i < ADC_SAMPLES; i++)
  {
    ADC1->CR |= ADC_CR_ADSTART; /* Start the ADC conversion */
    while (ADC1->CR & ADC_CR_ADSTART);
    nSumValue += ADC1->DR;
  }

  ADC->CCR &= ~ADC_CCR_VREFEN;

  nSumValue /= ADC_SAMPLES;

  uint16_t nVrefIntCal = *VREFINT_CAL_ADDR;

  // VDDA = 3 V x VREFINT_CAL / VREFINT_DATA
  uint16_t nVDD = 3000 * nVrefIntCal / nSumValue;

  return (uint16_t) nVDD;
}
