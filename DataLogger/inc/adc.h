/*
 * adc.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef ADC_H_
#define ADC_H_

#include "stm32l0xx.h"
#include <stdbool.h>

void Adc_Init(void);
void Adc_Disable();
void Adc_Enable();
uint16_t Adc_MeasureTemperature(void);
int16_t Adc_MeasureTemperatureInternal(uint16_t nVDDA);
uint16_t Adc_CalcValueFromVDDA(uint16_t nValue, uint16_t nVDAA);
int16_t Adc_CalcTemperature(uint16_t nValue, bool bOffsetEnable);
int16_t Adc_GetTemperature(bool bOffsetEnable);
void Adc_SetTempOffset(int16_t nOffset);
int16_t Adc_GetTempOffset();
uint16_t Adc_MeasureRefInt(void);
uint16_t Adc_Measure();
uint16_t Adc_Oversampling();

#endif /* ADC_H_ */
