/*
 * spirit_gpio.h
 *
 *  Created on: 24. 8. 2016
 *      Author: priesolv
 */

#ifndef SPIRIT_H_
#define SPIRIT_H_


#include "stm32l0xx.h"
#include <stdbool.h>
#include "SPIRIT_Types.h"

typedef void(*Ptr_OnGPIO3_EXTI)(void);

void Spirit_Init(Ptr_OnGPIO3_EXTI pOnGPIO3Exti);

void Spirit_EnterShutdown(void);
void Spirit_ExitShutdown(void);

void Spirit_EnableIRQ(void);
void Spirit_DisableIRQ(void);

void Spirit_WriteReg(uint8_t nRegAddr, uint8_t nValue);
void Spirit_WriteCommand(uint8_t nCommand, SpiritState state);

void Spirit_InitRegs();
void Spirit_SetPowerRegs(void);
void Spirit_ProtocolInitRegs(void);
void Spirit_EnableSQIRegs(void);
void Spirit_SetRssiTHRegs(void);

#endif /* SPIRIT_H_ */
