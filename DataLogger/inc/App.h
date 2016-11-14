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


void App_Init(void);
void App_Measure(void);
void App_FindFlashPosition();
void App_PrintRecords();
void App_SupplyOnAndWait();
void App_SupplyOff();

#endif /* APP_H_ */
