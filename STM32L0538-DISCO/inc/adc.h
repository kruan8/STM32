/*
 * adc.h
 *
 *  Created on: 7. 11. 2016
 *      Author: priesolv
 */

#ifndef ADC_H_
#define ADC_H_

#include "stm32l0xx.h"

void Adc_Init(void);
void Adc_Disable();
void Adc_Enable();
uint16_t Adc_MeasureTemperature(void);
int16_t Adc_CalcTemperature(uint16_t nValue);
uint16_t Adc_MeasureRefInt(void);

#endif /* ADC_H_ */
