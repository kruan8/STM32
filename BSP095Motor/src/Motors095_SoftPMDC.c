/*
 * Motors095_SoftPMDC.c
 *
 *  Created on: 23. 8. 2016
 *      Author: priesolv
 */

#include "Motors095_SoftPMDC.h"
#include "share_f4/common.h"
#include "SwtTimer.h"
#include "stdlib.h"

#define SOFTPMDC_PWM_RESOLUTION    1000
#define SOFTPMDC_PWM_FREQ         200

typedef struct
{
  GPIO_TypeDef* gpio;
  uint16_t      pin;
  uint16_t      pin_source;
  uint8_t       pin_function;
}mot_softpmdc_pins_t;

typedef struct
{
  int32_t nReqPwm;         // pozadovana frekvence motoru
  int32_t nActualPwm;          // aktualni frekvence motoru (pro frekvenci rampu)
  mot_direction_e eDirection;       // smer aktivniho pohybu
}mot_softpmdc_state_t;

static mot_softpmdc_pins_t mot_pins[] =
{
 //   GPIO |  pin       | pin_source      | AF
    { GPIOE, GPIO_Pin_9,  GPIO_PinSource9,  GPIO_AF_TIM1 }, // IGBT1 Motor1
    { GPIOE, GPIO_Pin_11, GPIO_PinSource11, GPIO_AF_TIM1 }, // IGBT2
    { GPIOE, GPIO_Pin_13, GPIO_PinSource13, GPIO_AF_TIM1 }, // IGBT3
    { GPIOE, GPIO_Pin_14, GPIO_PinSource14, GPIO_AF_TIM1 }, // IGBT4
    { GPIOE, GPIO_Pin_15, GPIO_PinSource15, GPIO_AF_TIM1 }, // BKIN

    { GPIOC, GPIO_Pin_6, GPIO_PinSource6, GPIO_AF_TIM8 }, // IGBT1 Motor2
    { GPIOC, GPIO_Pin_7, GPIO_PinSource7, GPIO_AF_TIM8 }, // IGBT2
    { GPIOC, GPIO_Pin_8, GPIO_PinSource8, GPIO_AF_TIM8 }, // IGBT3
    { GPIOC, GPIO_Pin_9, GPIO_PinSource9, GPIO_AF_TIM8 }, // IGBT4
    { GPIOA, GPIO_Pin_6, GPIO_PinSource6, GPIO_AF_TIM8 }, // BKIN
};

//#define MOT_SOFTPMDC_M1T1_ON        (mot_pins[0].gpio->BSRRL = mot_pins[0].pin)
//#define MOT_SOFTPMDC_M1T1_OFF       (mot_pins[0].gpio->BSRRH = mot_pins[0].pin)

#define MOT_SOFTPMDC_M1T1_ON        (GPIOE->BSRRL = GPIO_Pin_9)
#define MOT_SOFTPMDC_M1T1_OFF       (GPIOE->BSRRH = GPIO_Pin_9)

#define MOT_SOFTPMDC_M1T2_ON        (mot_pins[1].gpio->BSRRL = mot_pins[1].pin)
#define MOT_SOFTPMDC_M1T2_OFF       (mot_pins[1].gpio->BSRRH = mot_pins[1].pin)

#define MOT_SOFTPMDC_M1T3_ON        (mot_pins[2].gpio->BSRRL = mot_pins[2].pin)
#define MOT_SOFTPMDC_M1T3_OFF       (mot_pins[2].gpio->BSRRH = mot_pins[2].pin)

#define MOT_SOFTPMDC_M1T4_ON        (mot_pins[3].gpio->BSRRL = mot_pins[3].pin)
#define MOT_SOFTPMDC_M1T4_OFF       (mot_pins[3].gpio->BSRRH = mot_pins[3].pin)

#define MOT_SOFTPMDC_M2T1_ON        (mot_pins[4].gpio->BSRRL = mot_pins[4].pin)
#define MOT_SOFTPMDC_M2T1_OFF       (mot_pins[4].gpio->BSRRH = mot_pins[4].pin)

#define MOT_SOFTPMDC_M2T2_ON        (mot_pins[5].gpio->BSRRL = mot_pins[5].pin)
#define MOT_SOFTPMDC_M2T2_OFF       (mot_pins[5].gpio->BSRRH = mot_pins[5].pin)

#define MOT_SOFTPMDC_M2T3_ON        (mot_pins[6].gpio->BSRRL = mot_pins[6].pin)
#define MOT_SOFTPMDC_M2T3_OFF       (mot_pins[6].gpio->BSRRH = mot_pins[6].pin)

#define MOT_SOFTPMDC_M2T4_ON        (mot_pins[7].gpio->BSRRL = mot_pins[7].pin)
#define MOT_SOFTPMDC_M2T4_OFF       (mot_pins[7].gpio->BSRRH = mot_pins[7].pin)

static TIM_TypeDef* timDef[MOTORS] = { TIM1, TIM8 };

static uint32_t g_nPwmPeriod[MOTORS];

static mot_softpmdc_state_t g_motor[MOTORS];
static uint16_t g_nPwmRamp = 10;               // dynamicka rampa zmeny rychlosti pohybu

void Mot09_SoftPMDC_Init(void)
{
  // GPIO configuration
  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_StructInit(&GPIO_InitStructure);

  // Configure GPIO pins for TIM alternative functions
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;

  uint16_t nSize = sizeof (mot_pins) / sizeof(mot_pins[0]);
  for (uint16_t i = 0; i < nSize; i++)
  {
    SetGpioClock(mot_pins[i].gpio, ENABLE);
    GPIO_InitStructure.GPIO_Pin = mot_pins[i].pin;
    GPIO_Init(mot_pins[i].gpio, &GPIO_InitStructure);
//    GPIO_PinAFConfig(mot_pins[i].gpio, mot_pins[i].pin_source, mot_pins[i].pin_function);
  }

  // TIM configuration
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM1, ENABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM8, ENABLE);

  TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;
  TIM_TimeBaseStructInit(&TIM_TimeBaseStructure);

  TIM_TimeBaseStructure.TIM_Prescaler = 168000000 / SOFTPMDC_PWM_RESOLUTION / SOFTPMDC_PWM_FREQ; // HCLK = 168000000
  TIM_TimeBaseStructure.TIM_Period = SOFTPMDC_PWM_RESOLUTION;

  TIM_OCInitTypeDef  TIM_OCInitStructure;
  TIM_OCStructInit(&TIM_OCInitStructure);

  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Disable;
  TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
  TIM_OCInitStructure.TIM_Pulse = 0;
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;

  for (uint8_t i = 0; i < MOTORS; i++)
  {
    TIM_TimeBaseInit(timDef[i], &TIM_TimeBaseStructure);
    g_nPwmPeriod[i] = TIM_TimeBaseStructure.TIM_Period;

    TIM_OC1Init(timDef[i], &TIM_OCInitStructure);
    TIM_OC2Init(timDef[i], &TIM_OCInitStructure);

    TIM_BDTRInitTypeDef     TIM_BDTRInitStructure;
    TIM_BDTRInitStructure.TIM_OSSRState = TIM_OSSRState_Enable;
    TIM_BDTRInitStructure.TIM_OSSIState = TIM_OSSIState_Enable;
    TIM_BDTRInitStructure.TIM_LOCKLevel = TIM_LOCKLevel_OFF;      // tady muzeme uzamknout nastaveni proti soft chybam
    TIM_BDTRInitStructure.TIM_DeadTime = 10;
    TIM_BDTRInitStructure.TIM_Break = TIM_Break_Disable;
    TIM_BDTRInitStructure.TIM_BreakPolarity = TIM_BreakPolarity_High;
    TIM_BDTRInitStructure.TIM_AutomaticOutput = TIM_AutomaticOutput_Disable;

    TIM_BDTRConfig(timDef[i], &TIM_BDTRInitStructure);
    // TIM1/8 need extra command for BDTR register
    TIM_CtrlPWMOutputs(timDef[i], ENABLE);

    TIM_Cmd(timDef[i], ENABLE);
  }

  // povoleni preruseni od TIM 1
  NVIC_InitTypeDef NVIC_InitStructure;
  NVIC_InitStructure.NVIC_IRQChannel = TIM1_CC_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 1;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

  // povoleni preruseni od TIM 8
  NVIC_InitStructure.NVIC_IRQChannel = TIM8_CC_IRQn;
  NVIC_Init(&NVIC_InitStructure);

//  DBGMCU_APB1PeriphConfig(DBGMCU_TIM1_STOP, ENABLE);
//  DBGMCU_APB1PeriphConfig(DBGMCU_TIM8_STOP, ENABLE);

  SwtInsertService(Mot09_SoftPMDC_Timer_1ms, 1, true);

  TIM_ITConfig(timDef[0], TIM_IT_CC1, ENABLE);
  TIM_ITConfig(timDef[0], TIM_IT_CC2, ENABLE);

  TIM_ITConfig(timDef[1], TIM_IT_CC1, ENABLE);
  TIM_ITConfig(timDef[1], TIM_IT_CC2, ENABLE);
}

void Mot09_SoftPMDC_SetPWM(motors_e motor, int16_t nPwmPerc)
{
  g_motor[motor].nReqPwm = (int32_t)SOFTPMDC_PWM_RESOLUTION * nPwmPerc / 100;
}

void Mot09_SoftPMDC_Timer_1ms()
{
  for (uint8_t i = 0; i < MOTORS; i++)
  {
    if (g_motor[i].nActualPwm != g_motor[i].nReqPwm)
    {
      if ((g_motor[i].nActualPwm * g_motor[i].nReqPwm) < 0)
      {
        g_motor[i].nActualPwm = 0;
      }

      int32_t nDiff = g_motor[i].nReqPwm - g_motor[i].nActualPwm;
      if (nDiff > g_nPwmRamp)
      {
        nDiff = g_nPwmRamp;
      }
      else if (nDiff < -g_nPwmRamp)
      {
        nDiff = -g_nPwmRamp;
      }

      g_motor[i].nActualPwm += nDiff;
      uint16_t nPwm = (uint16_t)abs(g_motor[i].nActualPwm);

      TIM_SetCompare2(timDef[i], nPwm);

      g_motor[i].eDirection = (g_motor[i].nActualPwm > 0) ? dir_down : dir_up;
    }
  }

}

void TIM1_CC_IRQHandler()
{
  // PWM pulse ON
  if ((TIM1->SR & TIM_IT_CC1) && (TIM1->DIER & TIM_IT_CC1))
  {
    TIM1->SR = (uint16_t)~TIM_IT_CC1;  // clear pending bit

    if (g_motor[0].eDirection == dir_down)
    {
      MOT_SOFTPMDC_M1T2_OFF;
      MOT_SOFTPMDC_M1T3_OFF;
      MOT_SOFTPMDC_M1T4_ON;
      MOT_SOFTPMDC_M1T1_ON;
    }
    else
    {
      MOT_SOFTPMDC_M1T4_OFF;
      MOT_SOFTPMDC_M1T1_OFF;
      MOT_SOFTPMDC_M1T2_ON;
      MOT_SOFTPMDC_M1T3_ON;
    }
  }
  // PWM pulse OFF
  else if ((TIM1->SR & TIM_IT_CC2) && (TIM1->DIER & TIM_IT_CC2))
  {
    TIM1->SR = (uint16_t)~TIM_IT_CC2;  // clear pending bit

    // pro oba smery
    MOT_SOFTPMDC_M1T1_OFF;
    MOT_SOFTPMDC_M1T3_OFF;
    MOT_SOFTPMDC_M1T2_ON;
    MOT_SOFTPMDC_M1T4_ON;
  }
}

void TIM8_CC_IRQHandler()
{
  // PWM pulse ON
  if ((TIM8->SR & TIM_IT_CC1) && (TIM8->DIER & TIM_IT_CC1))
  {
    TIM8->SR = (uint16_t)~TIM_IT_CC1;  // clear pending bit

    if (g_motor[0].eDirection == dir_down)
    {
      MOT_SOFTPMDC_M2T2_OFF;
      MOT_SOFTPMDC_M2T3_OFF;
      MOT_SOFTPMDC_M2T4_ON;
      MOT_SOFTPMDC_M2T1_ON;
    }
    else
    {
      MOT_SOFTPMDC_M2T4_OFF;
      MOT_SOFTPMDC_M2T1_OFF;
      MOT_SOFTPMDC_M2T2_ON;
      MOT_SOFTPMDC_M2T3_ON;
    }
  }
  // PWM pulse OFF
  else if ((TIM8->SR & TIM_IT_CC2) && (TIM8->DIER & TIM_IT_CC2))
  {
    TIM8->SR = (uint16_t)~TIM_IT_CC2;  // clear pending bit

    // pro oba smery
    MOT_SOFTPMDC_M2T1_OFF;
    MOT_SOFTPMDC_M2T3_OFF;
    MOT_SOFTPMDC_M2T2_ON;
    MOT_SOFTPMDC_M2T4_ON;
  }
}

// END SWITCH HIGH 1
#define SOFTPMDC_SWITCH_UP_1_PIN              GPIO_Pin_6
#define SOFTPMDC_SWITCH_UP_1_GPIO_PORT        GPIOG

// END SWITCH LOW 1
#define SOFTPMDC_SWITCH_DOWN_1_PIN            GPIO_Pin_5
#define SOFTPMDC_SWITCH_DOWN_1_GPIO_PORT      GPIOG

// END SWITCH HIGH 2
#define SOFTPMDC_SWITCH_UP_2_PIN              GPIO_Pin_7
#define SOFTPMDC_SWITCH_UP_2_GPIO_PORT        GPIOG

// END SWITCH LOW 2
#define SOFTPMDC_SWITCH_DOWN_2_PIN            GPIO_Pin_8
#define SOFTPMDC_SWITCH_DOWN_2_GPIO_PORT      GPIOG


void Mot09_SoftPMDC_ConfigureSwitches()
{
  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_StructInit(&GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;

  SetGpioClock(SOFTPMDC_SWITCH_UP_1_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = SOFTPMDC_SWITCH_UP_1_PIN;
  GPIO_Init(SOFTPMDC_SWITCH_UP_1_GPIO_PORT, &GPIO_InitStructure);

  SetGpioClock(SOFTPMDC_SWITCH_DOWN_1_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = SOFTPMDC_SWITCH_DOWN_1_PIN;
  GPIO_Init(SOFTPMDC_SWITCH_DOWN_1_GPIO_PORT, &GPIO_InitStructure);

  SetGpioClock(SOFTPMDC_SWITCH_UP_2_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = SOFTPMDC_SWITCH_UP_2_PIN;
  GPIO_Init(SOFTPMDC_SWITCH_UP_2_GPIO_PORT, &GPIO_InitStructure);

  SetGpioClock(SOFTPMDC_SWITCH_DOWN_2_GPIO_PORT, ENABLE);
  GPIO_InitStructure.GPIO_Pin = SOFTPMDC_SWITCH_DOWN_2_PIN;
  GPIO_Init(SOFTPMDC_SWITCH_DOWN_2_GPIO_PORT, &GPIO_InitStructure);
}

mot_limit_e Mot09_SoftPMDC_IsLimit(motors_e eMotor)
{
  mot_limit_e eStatus = mot_limit_none;
  if (eMotor == motor_1)
  {
    if (!(SOFTPMDC_SWITCH_UP_1_GPIO_PORT->IDR & SOFTPMDC_SWITCH_UP_1_PIN))
    {
      eStatus = mot_limit_up;
    }
    else if (!(SOFTPMDC_SWITCH_DOWN_1_GPIO_PORT->IDR & SOFTPMDC_SWITCH_DOWN_1_PIN))
    {
      eStatus = mot_limit_down;
    }
  }
  else
  {
    if (!(SOFTPMDC_SWITCH_UP_2_GPIO_PORT->IDR & SOFTPMDC_SWITCH_UP_2_PIN))
    {
      eStatus = mot_limit_up;
    }
    else if (!(SOFTPMDC_SWITCH_DOWN_2_GPIO_PORT->IDR & SOFTPMDC_SWITCH_DOWN_2_PIN))
    {
      eStatus = mot_limit_down;
    }
  }

  return eStatus;
}
