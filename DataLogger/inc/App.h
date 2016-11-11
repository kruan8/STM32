/*
 * App.h
 *
 *  Created on: 9. 11. 2016
 *      Author: vladicek
 */

#ifndef APP_H_
#define APP_H_

#include "stm32l0xx.h"
#include <stdbool.h>

typedef struct
{

} record_t;


void App_Init(void);
void App_Measure(void);
void App_FindFlashPosition();
void App_PrintRecords();

#endif /* APP_H_ */
