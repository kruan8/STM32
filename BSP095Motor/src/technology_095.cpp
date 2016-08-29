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

// simulate data
tech_data g_dataSimul;
bool g_bSimulPosIncX = true;
bool g_bSimulPosIncY = true;
bool g_bSimulGyrIncX = true;
bool g_bSimulGyrIncY = true;
uint8_t g_bSimulCounter = 0;

u16 nCopySamples = 0;
tech_data g_data;           // vzorek dat stavu (pozice+acc) pro master


void Tech095_Init()
{
  Adc095_Init();

  Mot09_SoftPMDC_Init();

  Power_DriverOn(true);


//	Mot095_Init();
//	Tech095_QueueInit();
//	Tenzo095_Init();

//	Pos095_Init();

//	SwtInsertService(Tech095_Timer_10ms, 10, true);

}

void Tech095_Exec()
{
  static int16_t nPerc = 30;

  if (Power_IsOn())
  {
    for (uint8_t i = 0; i < MOTORS; i++)
    {
      mot_limit_e limit = Mot09_SoftPMDC_IsLimit((motors_e)i);
      if (limit == mot_limit_up)
      {
        nPerc = -30;
      }
      else if (limit == mot_limit_down)
      {
        nPerc = 30;
      }

      Mot09_SoftPMDC_SetPWM((motors_e)i, nPerc);
    }

  }

//	Tenzo095_Exec();

//	LSM303D_Exec();


//	Pos095_Exec();

//	Delay_ms(1000);
//	if (Mot095_IsBrakeOff())
//	{
//		Mot095_Cycling();

//		Mot095_MoveMotor(motor_1, 6666, dir_down);
//		Delay_ms(1000);
//		Mot095_MoveMotor(motor_1, 6666, dir_up);
//		Delay_ms(1000);

		// jedna otacka = 20000 impulzu
//		Mot095_MoveMotorPulse(motor_1, 640000, 666000);
//		while (Mot095_IsMotorMoving(motor_1));


//		Mot095_MoveMotor(motor_1, 666666, dir_down);
//		Delay_ms(5000);
//		Mot095_MoveMotor(motor_1, 300066, dir_up);
//		Delay_ms(5000);

//		for (uint8_t i = 0; i < 10; i++)
//		{
//			Mot095_MoveMotorPulse(motor_1, 8800, 30600);
//			while (Mot095_IsMotorMoving(motor_1));
//			Mot095_MoveMotorPulse(motor_1, -8800, 30000);
//			while (Mot095_IsMotorMoving(motor_1));
//		}
//
//		for (uint8_t i = 0; i < 10; i++)
//		{
//			Mot095_MoveMotorPulse(motor_1, 8800, 306000);
//			while (Mot095_IsMotorMoving(motor_1));
//			Mot095_MoveMotorPulse(motor_1, -8800, 300000);
//			while (Mot095_IsMotorMoving(motor_1));
//		}
//	}

}

void Tech095_Timer_10ms()
{
//	// zjisteni pozice teziste na plosine z tenzometru
//  g_data.weight = Tenzo095_GetCentrePosition(&g_data.posX, &g_data.posY);
//
//  int32_t nPosX = Pos095_GetAngle(angleM1);
//  int32_t nPosY = Pos095_GetAngle(angleM2);
//
//#if SEMIHOSTING
//	printf("Angle: x=%d;y=%d\n", g_data.angleX, g_data.angleY);
//#endif
//
//	// natoceni o 45 st. z pozic M1 a M2 do pozic X a Y
//  int16_t nSinCos45 = 707;  // sin 45st. = 0.707, cos 45st. = 0.707
//
//  //  x = x * cos A - y * sin A;
//  //  y = x * sin A + y * cos A;
//  g_data.angleX = (int16_t)((nPosX * nSinCos45 - nPosY * nSinCos45) / 1000);
//  g_data.angleY = (int16_t)((nPosY * nSinCos45 + nPosX * nSinCos45) / 1000);
//
//	Tech095_QueuePut(&g_data);
}

tech_data* Tech095_GetData()
{
 return &g_data;
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
