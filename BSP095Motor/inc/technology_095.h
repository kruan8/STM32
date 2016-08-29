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
	s16 posX;
	s16 posY;
	u16 weight;
	s16 angleX;
	s16 angleY;
} tech_data;


void Tech095_Init();
void Tech095_Exec();
void Tech095_Timer_10ms();

tech_data* Tech095_GetData();

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
