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

typedef enum
{
  err_ok,
  err_full_memory,
  err_flash_error,
} app_error_t;


void APP_Init(void);
void APP_Measure(void);
uint32_t APP_GetRecords();
void APP_FindFlashPosition();
void APP_PrintRecords();
void APP_SupplyOnAndWait();
void APP_SupplyOff();
void APP_StopMode(void);

#endif /* APP_H_ */
