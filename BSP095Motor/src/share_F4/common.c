/*
 * common.c
 *
 *  Created on: 9. 8. 2016
 *      Author: priesolv
 */

#include "share_f4/common.h"

/*******************************************************************************
* Function Name  : BTL_USART_GpioClock
* Description    : Enable GPIO clock
* Input          : - gpio: GPIO port
*          : - state: new clock state
* Return         : None
*******************************************************************************/
void SetGpioClock(GPIO_TypeDef* gpio, FunctionalState state)
{
  if (gpio == GPIOA)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, state);
  }
  else if (gpio == GPIOB)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, state);
  }
  else if (gpio == GPIOC)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, state);
  }
  else if (gpio == GPIOD)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, state);
  }
  else if (gpio == GPIOE)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, state);
  }
  else if (gpio == GPIOF)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, state);
  }
  else if (gpio == GPIOG)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOG, state);
  }
  else if (gpio == GPIOH)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOH, state);
  }
  else if (gpio == GPIOI)
  {
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOI, state);
  }
}


