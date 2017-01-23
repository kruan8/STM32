/* -----------------------------------------------------------------------------

XPT2046 based touchscreen driver

Copyright (C) 2013  Fabio Angeletti - fabio.angeletti89@gmail.com

Part of this code is an adaptation from souce code provided by
		WaveShare - http://www.waveshare.net

I'm not the owner of the whole code

------------------------------------------------------------------------------*/

#ifndef _TOUCHPANEL_H_
#define _TOUCHPANEL_H_

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx.h"


/* Private typedef -----------------------------------------------------------*/
typedef	struct POINT 
{
   uint16_t x;
   uint16_t y;
}Coordinate;


typedef struct Matrix 
{						
long double An,  
            Bn,     
            Cn,   
            Dn,    
            En,    
            Fn,     
            Divider ;
} Matrix ;

/* Private variables ---------------------------------------------------------*/
extern Coordinate ScreenSample[3];
extern Coordinate DisplaySample[3];
extern Matrix matrix ;
extern Coordinate  display ;

/* Private define ------------------------------------------------------------*/

#define	CHX 	0x90
#define	CHY 	0xD0



/* Private function prototypes -----------------------------------------------*/				
	// controller initialization
void XPT2046_Init(void);
	// calibration routine	
void TouchPanel_Calibrate(void);
	// returns if a pressure is present
uint8_t XPT2046_Press(void);
	// returns coordinates of the pressure
Coordinate *Read_XPT2046(void);

	// function to calibrate touchscreen and use calibration matrix
FunctionalState setCalibrationMatrix(Coordinate * displayPtr,Coordinate * screenPtr,Matrix * matrixPtr);
FunctionalState getDisplayPoint(Coordinate * displayPtr,Coordinate * screenPtr,Matrix * matrixPtr );

	// controller specific functions - should not be used outside
static uint8_t read_IRQ(void);
static void WR_CMD (uint8_t cmd);
static uint16_t RD_AD(void);

#endif
