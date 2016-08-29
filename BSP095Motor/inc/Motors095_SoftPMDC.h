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


void Mot09_SoftPMDC_Init(void);
void Mot09_SoftPMDC_SetPWM(motors_e motor, int16_t nPwmPerc);
void Mot09_SoftPMDC_Timer_1ms(void);

void Mot09_SoftPMDC_ConfigureSwitches();
mot_limit_e Mot09_SoftPMDC_IsLimit(motors_e eMotor);

#ifdef __cplusplus
}
#endif


#endif /* MOTORS095_SOFTPMDC_H_ */
