/*
 * adc.h
 *
 *  Created on: 27. 10. 2015
 *      Author: priesolv
 */

#ifndef ADC_095_H_
#define ADC_095_H_

#include "stm32f4xx.h"
#include "share_f4/types.h"

#ifdef __cplusplus
 extern "C" {
#endif



void Adc095_Init(void);
void Adc095_TIM_Configuration(void);
void Adc095_InitMultiplex();

uint32_t Adc095_GetAngleM1();
uint32_t Adc095_GetAngleM2();
float Adc095_GetCurrentM1_mA();
float Adc095_GetCurrentM2_mA();
uint32_t Adc095_GetUdc_mV();
int16_t Adc095_GetTempMCU_C();

uint32_t Adc095_GetAcLineIn_mV();
uint32_t Adc095_GetAcLineOut_mV();
uint32_t Adc095_GetAdaptor_mV();
uint16_t Adc095_GetTempM1_K();
uint16_t Adc095_GetTempM2_K();
uint16_t Adc095_GetTempHeatsinkM1_K();
uint16_t Adc095_GetTempHeatsinkM2_K();
uint32_t Adc095_GetBrakeCurrent_mA();
uint32_t Adc095_GetPFC_mV();

int16_t Adc095_GetTempGener_C();

uint32_t Adc095_GetFan1Current_mA();
uint32_t Adc095_GetFan2Current_mA();


#ifdef __cplusplus
}
#endif

#endif /* ADC_095_H_ */
