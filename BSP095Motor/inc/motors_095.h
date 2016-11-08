/*
 * motors_095.h
 *
 *  Created on: 30. 10. 2015
 *      Author: priesolv
 */

#ifndef MOTORS_095_H_
#define MOTORS_095_H_

#include "stm32f4xx.h"
#include <share_f4/types.h>

#ifdef __cplusplus
 extern "C" {
#endif

#define PULSES_PER_MOTOR_REVOLUTION    20000     // pocet pulzu na otacku motoru
#define GEAR_RATIO                    32        // prevodni pomer prevodovky
#define PULSES_PER_AXIS_REVOLUTION    (PULSES_PER_MOTOR_REVOLUTION * GEAR_RATIO)
#define MAXIMUM_PULSES_VELOCITY       700000   // maximalni frekvence pulzu
#define MAXIMUM_CONTROL_VELOCITY      32767     // maximalni hodnota v registru motoru

typedef enum
{
	motor_1 = 0,
	motor_2 = 1,
	motor_max,
}motors_e;

typedef enum
{
  mot_dir_none = 0,
	mot_dir_down = 1,
	mot_dir_up = -1,
} mot_direction_e;

typedef enum
{
	mot_limit_none = 0,
	mot_limit_up,
	mot_limit_down,
} mot_limit_e;

typedef enum
{
  mot_ready = 0,
  mot_driver2_on = 1,       // je zapnut druhy stykac (cekani cca 100ms)
  mot_softstart = 2,            // ceka se na start menicu (cca 3s)
  mot_brake_off = 3,            // vypnuta brzda, ceka se na jeji mechanicke uvolneni (cca 300ms)
  mot_driver_off = 4,
}mot_driveState_e;

typedef struct
{
	TIM_TypeDef* pTimPWM;					// ukazatel na casovac PWM
	TIM_TypeDef* pTimMeasure;				// ukazatel na casovac mereni pulzu
	int32_t nPosition;						// impulsy poslane do motoru
	int32_t nMotorFreq;					// pozadovana frekvence motoru
	int32_t nActualFreq;					// aktualni frekvence motoru (pro frekvenci rampu)
	mot_direction_e g_eDirection;  			// smer aktivniho pohybu
	bool bMoving;							// flag pohybu motoru
}motor_state_t;

#define MOTORS            2

void Mot095_Init();
void Mot095_TimInit();
void Mot095_Timer_1ms();
void Mot095_MoveMotorPulse(motors_e eMotor, int32_t nPulses, uint32_t nFreq_Hz);
void Mot095_MoveMotor(motors_e eMotor, int32_t nFreq_Hz);
void Mot095_SetActualFreq(motors_e eMotor);
int32_t Mot095_GetMotorFreq(motors_e eMotor);

bool Mot095_DriverOn();
void Mot095_OnDriverOn();
void Mot095_DriverOff();
void Mot095_BrakeOff(bool bOff);
bool Mot095_IsBrakeOff();
bool Mot095_IsMotorMoving(motors_e motor);
mot_driveState_e Mot095_GetDriveState();
mot_limit_e Mot095_IsLimit(motors_e eMotor);
void Mot095_Cycling();

void Mot095_SetConfigDefault();
void Mot095_SetConfig(uint16_t nRamp, bool bSave);
void Mot095_GetConfig(uint16_t* nRamp);
void Mot095_LogEnable(bool bEnable);

#ifdef __cplusplus
}
#endif

#endif /* MOTORS_095_H_ */
