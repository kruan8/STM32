/*
 * timer.c
 *
 *  Created on: 24. 6. 2016
 *      Author: priesolv
 */

#include "timer.h"

typedef void(*Ptr_OnTxDataPacketResponse)(void);

static volatile uint32_t nDelayTimer;
static volatile uint32_t g_nTicks = 0;

PtrSysTickCallback pSysTickCallback = 0;

uint32_t g_nOffInterval;      // citani intervalu do vypnuti

void TimerInit()
{
  if (SysTick_Config(SystemCoreClock / 1000))
  {
    /* Capture error */
    while (1);
  }


}

void Delay_ms(uint32_t delay_ms)
{
  nDelayTimer = delay_ms;
  while (nDelayTimer);
}

uint32_t GetTicks_ms()
{
  return g_nTicks;
}

void SetSysTickCallback(PtrSysTickCallback pFunction)
{
  pSysTickCallback = pFunction;
}

void SysTick_Handler(void)
{
  g_nTicks++;
  if (nDelayTimer)
  {
    nDelayTimer--;
  }

  if (pSysTickCallback)
  {
    pSysTickCallback();
  }

  if (g_nOffInterval)
  {
    g_nOffInterval--;
  }

}

void SetOffInterval(uint32_t nInterval_ms)
{
  g_nOffInterval = nInterval_ms;
}

uint32_t GetOffTime(void)
{
  return g_nOffInterval;
}
