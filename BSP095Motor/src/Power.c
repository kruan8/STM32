/*
 * Power.c
 *
 *  Created on: 16. 8. 2016
 *      Author: priesolv
 *  Driver pro ovladani napajeni generu
 */

#include "Power.h"
#include "share_F4/common.h"
#include "Adc_095.h"
#include "HwtTimer.h"
#include "SwtTimer.h"


// MOTOR 1 DRIVER ENABLE
#define PWR_RELE1_PIN             GPIO_Pin_10
#define PWR_RELE1_GPIO_PORT       GPIOB

// MOTOR 2 DRIVER ENABLE
#define PWR_RELE2_PIN             GPIO_Pin_11
#define PWR_RELE2_GPIO_PORT       GPIOB

// MOTOR BRAKE ON
#define PWR_BRAKE_PIN             GPIO_Pin_4
#define PWR_BRAKE_GPIO_PORT       GPIOG

// supply 48V ON
#define PWR_48ON_PIN             GPIO_Pin_15
#define PWR_48ON_GPIO_PORT       GPIOD

#define PWR_RE1_ON        (PWR_RELE1_GPIO_PORT->BSRRL = PWR_RELE1_PIN)
#define PWR_RE1_OFF       (PWR_RELE1_GPIO_PORT->BSRRH = PWR_RELE1_PIN)

#define PWR_RE2_ON        (PWR_RELE2_GPIO_PORT->BSRRL = PWR_RELE2_PIN)
#define PWR_RE2_OFF       (PWR_RELE2_GPIO_PORT->BSRRH = PWR_RELE2_PIN)

#define PWR_BRAKE_OFF     (PWR_BRAKE_GPIO_PORT->BSRRL = PWR_BRAKE_PIN)
#define PWR_BRAKE_ON      (PWR_BRAKE_GPIO_PORT->BSRRH = PWR_BRAKE_PIN)

#define PWR_48ON_OFF      (PWR_48ON_GPIO_PORT->BSRRL = PWR_48ON_PIN)
#define PWR_48ON_ON       (PWR_48ON_GPIO_PORT->BSRRH = PWR_48ON_PIN)

// limity pro AC 230V
#define POWER_SUPPLY_MIN          207     // 230 - 10%
#define POWER_SUPPLY_MAX          253     // 230 + 10%

power_state_e g_eState = power_off;
bool g_bPmdcControl;

bool Power_DriverOn(bool bPmdcControl)
{
/* Postup zapinani vykonnove elekroniky:
 * Timto postupem se zkontroluje funkcnost rele RE1, ktery spina proudovy impulz do zdroje menicu
 *
 *                           --------                  --------
 *      AC (230V)           |        |                |        |     Napajeni motoru
 *     >------------------->|        |--------------->|        |------------------------->
 *           |              |  Rele  |                |  Rele  |                |
 *           |              |  RE1   |                |  RE2   |                |
 *           |               --------                  --------                 |
 *           |                     |                         |                  |
 *           |                     |                         |                  |
 *           |                     | MOTOR                   | MOTOR            |
 *           | AC LINE1            | DRIVE                   | DRIVE            | AC LINE2
 *           | (SS RE1)            | ENABLE1                 | ENABLE2          | (SS RE2)
 *
 * 1. zkontrolovat napeti AC LINE1 230V (+-10%)
 * 2. zkontrolovat napeti AC LINE2 (melo by byt 0)
 * 3. sepnout MOTOR DRIVE ENABLE2
 * 4. delay cca 500ms
 * 5. sepnout MOTOR DRIVE ENABLE1
 *
 * 6. sepnout PFC pomoci PFC ON
 * 7. pockat max 200 ms, PFC RDY (1, 2, 3) nabehnou ON
 * 8. zmerit napeti PFC na UDC (390V +- 10%)
 *
 */

  g_bPmdcControl = bPmdcControl;

  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_StructInit(&GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

  // konfigurace RE1 pinu
  SetGpioClock(PWR_RELE1_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = PWR_RELE1_PIN;
  GPIO_Init(PWR_RELE1_GPIO_PORT, &GPIO_InitStructure);

  // konfigurace RE2 pinu
  SetGpioClock(PWR_RELE2_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = PWR_RELE2_PIN;
  GPIO_Init(PWR_RELE2_GPIO_PORT, &GPIO_InitStructure);

  // brake configuration
  SetGpioClock(PWR_BRAKE_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = PWR_BRAKE_PIN;
  GPIO_Init(PWR_BRAKE_GPIO_PORT, &GPIO_InitStructure);

  if (g_bPmdcControl)
  {
    // supply 48V ON configuration
    SetGpioClock(PWR_48ON_GPIO_PORT, ENABLE);
    GPIO_InitStructure.GPIO_Pin = PWR_48ON_PIN;
    GPIO_Init(PWR_48ON_GPIO_PORT, &GPIO_InitStructure);
  }

  // bod 1. - zkontrolovat napeti AC LINE IN
//  uint32_t nU1_V = Adc095_GetAcLineIn_mV() / 1000;
//  if (nU1_V < POWER_SUPPLY_MIN || nU1_V > POWER_SUPPLY_MAX)
//  {
//    return false;
//  }
//
//  // bod 2. - zkontrolovat napeti AC LINE OUT
//  uint32_t nU2_V = Adc095_GetAcLineOut_mV() / 1000;
//  if (nU2_V > 1)
//  {
//    return false;
//  }

  // bod 3. - sepnout RE2
  PWR_RE2_ON;


  g_eState = power_re2_on;
  SwtInsertService(Power_OnDriverOn, 1000, true);

  return true;
}

// postup odbrzdeni PMDC motoru:
// zapnout zdroj 48V ON, wait 200ms, odbrzdit brzdu, cekat 500 ms, vypnout zdroj

void Power_OnDriverOn()
{
  if (g_eState == power_re2_on)
  {
    PWR_RE1_ON;
    g_eState = power_wait_interval;
    if (g_bPmdcControl)
    {
      PWR_48ON_ON;
    }

    SwtSetPeriod(Power_OnDriverOn, 3000, true);
    return;
  }
  else if (g_eState == power_wait_interval)
  {
    PWR_BRAKE_OFF;    // odbrzdeni motoru
    g_eState = power_brake_off;
    SwtSetPeriod(Power_OnDriverOn, 1000, true);
    return;
  }
  else if (g_eState == power_brake_off)
  {
    if (g_bPmdcControl)
    {
      PWR_48ON_OFF;
    }

    g_eState = power_on;
  }

  SwtRemoveService(Power_OnDriverOn);
}

/*
 * Postup vypinani vykonove casti
 * 1. vypnout S1
 * 2. vypnout S2
 */
void Power_DriverOff()
{
  PWR_RE1_OFF;
  PWR_RE2_OFF;
}

bool Power_IsOn(void)
{
  return (g_eState == power_on) ? true : false;
}

