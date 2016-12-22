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

#define EEPROM_TEMP_OFFSET    0                                      // int32
#define EEPROM_TEMP_ADC      (EEPROM_TEMP_OFFSET + sizeof(int32_t))      // uint32
#define EEPROM_INTERVAL_S    (EEPROM_TEMP_ADC + sizeof(int32_t))    // uint32

typedef enum
{
  err_ok,
  err_full_memory,
  err_flash_error,
} app_error_t;

typedef struct
{
  uint32_t time;
  int16_t  temperature;
} __attribute__((packed)) app_record_t;

void APP_Init(void);
void APP_Measure(void);
uint32_t APP_GetRecords();
uint32_t APP_FindFlashPosition();
void APP_PrintRecords();
void APP_SupplyOnAndWait();
void APP_SupplyOff();
void APP_StopMode(void);
void APP_SaveTempOffset(int16_t nOffset);
void APP_SaveInterval(uint32_t nInterval);
uint32_t APP_GetInterval_s(void);

#endif /* APP_H_ */
