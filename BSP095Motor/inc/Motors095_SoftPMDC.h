/*
 * Motors095_SoftPMDC.h
 *
 *  Created on: 23. 8. 2016
 *      Author: priesolv
 */

#ifndef MOTORS095_SOFTPMDC_H_
#define MOTORS095_SOFTPMDC_H_

#include "motors_095.h"

#ifdef __cplusplus
 extern "C" {
#endif


void Mot095_SoftPMDC_Init(void);
void Mot095_SoftPMDC_SetPWM(motors_e motor, int16_t nPwmPerc);
void Mot095_SoftPMDC_Timer_1ms(void);

void Mot095_SoftPMDC_ConfigureSwitches();
mot_limit_e Mot095_SoftPMDC_IsLimit(motors_e eMotor);
void Mot095_SoftPMDC_SetParam(motors_e motor, uint16_t nRamp, uint32_t nCycles);
uint32_t Mot095_SoftPMDC_GetCycles(motors_e motor);

#ifdef __cplusplus
}
#endif


#endif /* MOTORS095_SOFTPMDC_H_ */
