/*
 * technology_095.h
 *
 *  Created on: 23. 9. 2015
 *      Author: priesolv
 */

#ifndef TECHNOLOGY_095_H_
#define TECHNOLOGY_095_H_

#include "share_f4/types.h"
#include "stm32f4xx.h"

#ifdef __cplusplus
 extern "C" {
#endif

typedef struct
{
	s16 nVoltageM1;   // 0,1 V
	s16 nCurrentM1;   // 0,1 A
	s16 nVoltageM2;   // 0,1 V
  s16 nCurrentM2;   // 0,1 A
} tech_data;



void Tech095_Init();
void Tech095_Exec();
void Tech095_Timer_2ms();

tech_data* Tech095_GetData();
void Tech095_SetParams(uint8_t motor, uint32_t nCycles, uint16_t nSpeed, uint16_t nRamp);
uint32_t Tech095_GetCycles(uint8_t motor);
void Tech095_Start(uint8_t motor);
void Tech095_Stop(uint8_t motor);

void Tech095_QueueInit(void);
bool Tech095_QueuePut(tech_data* sample);
tech_data* Tech095_QueueGet();
tech_data* Tech095_QueueCopy(u16 index);
tech_data* Tech095_QueueReset();
uint16_t Tech095_QueueGetCopyCount();


#ifdef __cplusplus
}
#endif

#endif /* TECHNOLOGY_095_H_ */
