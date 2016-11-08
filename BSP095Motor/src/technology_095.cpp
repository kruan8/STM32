/*
 * technology_095.c
 *
 *  Created on: 23. 9. 2015
 *      Author: priesolv
 */

#include "technology_095.h"

#include <string.h>
#include <stdio.h>

#include "HwtTimer.h"
#include "SwtTimer.h"

#include "Motors_095.h"

#include "Adc_095.h"

#include "Motors095_SoftPMDC.h"
#include "Power.h"


// queue structure
#define DATA_QUEUE_ELEMENTS 100
#define DATA_QUEUE_SIZE DATA_QUEUE_ELEMENTS

tech_data Queue[DATA_QUEUE_SIZE];    // queue buffer
//tech_data g_data095[DATA_QUEUE_ELEMENTS];
u16 nQueueIn;           // pozice pro zapis
u16 nQueueOut;          // pozice pro cteni

u16 nCopySamples = 0;
tech_data g_data;           // vzorek dat stavu (pozice+acc) pro master

uint16_t g_nSpeed[MOTORS];   //


void Tech095_Init()
{
  Adc095_Init();

  Mot095_SoftPMDC_Init();

  Power_DriverOn(true);


//	Mot095_Init();
	Tech095_QueueInit();
//	Tenzo095_Init();

//	Pos095_Init();

	SwtInsertService(Tech095_Timer_10ms, 10, true);

}

void Tech095_Exec()
{
  if (Power_IsOn())
  {
    for (uint8_t i = 0; i < 1; i++)
    {
      mot_limit_e limit = Mot095_SoftPMDC_IsLimit((motors_e)i);
      if (limit == mot_limit_up)
      {
        Mot095_SoftPMDC_SetPWM((motors_e)i, -(int16_t)g_nSpeed[i]);
      }
      else if (limit == mot_limit_down)
      {
        Mot095_SoftPMDC_SetPWM((motors_e)i, (int16_t)g_nSpeed[i]);
      }
    }
  }
}

void Tech095_Timer_10ms()
{
  g_data.nCurrentM1 = Adc095_GetCurrentM1_mA() / 100;
  g_data.nCurrentM2 = Adc095_GetCurrentM2_mA() / 100;
  g_data.nVoltageM1 = -123;
  g_data.nVoltageM2 = -456;

	Tech095_QueuePut(&g_data);
}

tech_data* Tech095_GetData()
{
 return &g_data;
}

void Tech095_SetParams(uint8_t motor, uint32_t nCycles, uint16_t nSpeed, uint16_t nRamp)
{
  if (motor < MOTORS)
  {
    Mot095_SoftPMDC_SetParam((motors_e)motor, nRamp, nCycles);
    g_nSpeed[motor] = nSpeed;
  }
}

uint32_t Tech095_GetCycles(uint8_t motor)
{
  if (motor < MOTORS)
  {
    return Mot095_SoftPMDC_GetCycles((motors_e)motor);
  }

  return 0;
}

void Tech095_Start(uint8_t motor)
{
  Mot095_SoftPMDC_SetPWM((motors_e)motor, (int16_t)g_nSpeed[motor]);
}

void Tech095_Stop(uint8_t motor)
{
  Mot095_SoftPMDC_SetPWM((motors_e)motor, 0);
}

// -------------------------------------------------------------------------
/* Very simple queue
 * These are FIFO queues which discard the new data when full.
 *
 * Queue is empty when in == out.
 * If in != out, then
 *  - items are placed into in before incrementing in
 *  - items are removed from out before incrementing out
 * Queue is full when in == (out-1 + QUEUE_SIZE) % QUEUE_SIZE;
 *
 * The queue will hold QUEUE_ELEMENTS number of items before the
 * calls to QueuePut fail.
 *
 * Queue implementuje citac kopii (tzn. ze si pamatuje kolik kopii poskytnul)
 */

void Tech095_QueueInit(void)
{
	nQueueIn = 0;
	nQueueOut = 0;
}

// vlozi vzorek do fronty,
// v pripade, ze je plna, odstrani stary vzorek a dekrementuje citac kopii vzorku
bool Tech095_QueuePut(tech_data* sample)
{
    if(nQueueIn == (( nQueueOut - 1 + DATA_QUEUE_SIZE) % DATA_QUEUE_SIZE))
    {
        //return false; /* Queue Full*/
    	// nejstarsi vzorek smazat
    	nQueueOut = (nQueueOut + 1) % DATA_QUEUE_SIZE;

    	// jeste je potreba dekrementovat pocet byte, ktere se odeslaly v predchozim paketu
    	if (nCopySamples)
    	{
    		nCopySamples--;
    	}
    }

    memcpy (&Queue[nQueueIn], sample, sizeof(tech_data));
    nQueueIn = (nQueueIn + 1) % DATA_QUEUE_SIZE;
    return true;
}

// vytahuje vzorek z fronty, dekrementuje citac pouzitych kopii
tech_data* Tech095_QueueGet()
{
    if(nQueueIn == nQueueOut)
    {
        return NULL; /* Queue Empty - nothing to get*/
    }

    tech_data* data = &Queue[nQueueOut];
    nCopySamples--;
    nQueueOut = (nQueueOut + 1) % DATA_QUEUE_SIZE;
    return data;
}

// nevytahuje z fronty element, ale jeho kopii
// inkrementuje citac pouzitych kopii
tech_data* Tech095_QueueCopy(u16 nIndex)
{
	u16 nPos = (nQueueOut + nIndex) % DATA_QUEUE_SIZE;
	if(nQueueIn == nPos)
	{
		return NULL; // na teto pozici uz nejsou data
	}

	tech_data* data = &Queue[nPos];
	nCopySamples++;
	return data;
}

// vycisti frontu, pokud v ni byly nejake prvky, vrati posledni prvek do fronty vlozeny, jinak NULL
tech_data* Tech095_QueueReset()
{
  // v priapde prazdne fronty nic nedelat
  if(nQueueIn == nQueueOut)
  {
    return NULL;
  }

  u16 nPos = (nQueueIn - 1) % DATA_QUEUE_SIZE;
  tech_data* data = &Queue[nPos];
  Tech095_QueueInit();

  // !!! tady vracime pointer na prvek, ktery uz ve fronte neni, ale jeho data tam jeste do dalsiho PUT vydrzi !!!
  return data;
}

uint16_t Tech095_QueueGetCopyCount()
{
	return nCopySamples;
}
