/*
 * Power.h
 *
 *  Created on: 16. 8. 2016
 *      Author: priesolv
 */

#ifndef POWER_H_
#define POWER_H_

#include "stm32f4xx.h"
#include <share_f4/types.h>

#ifdef __cplusplus
 extern "C" {
#endif

typedef enum
{
  power_off = 0,
  power_re2_on,
  power_wait_interval,
  power_brake_off,
  power_on,
}power_state_e;

bool Power_DriverOn(bool bPmdcControl);
void Power_OnDriverOn(void);
bool Power_IsOn(void);

#ifdef __cplusplus
}
#endif

#endif /* POWER_H_ */
