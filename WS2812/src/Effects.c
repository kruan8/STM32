#include "effects.h"


void Eff_RandomEffects()
{
  uint32_t rnd = RGBlib_Rand(1, 16);
  switch (rnd)
  {
    case  1: Eff_ColorWhipe(); break;
    case  2: RGBlib_ColorWipeCenter(COLOR_BLUE, 150);
             RGBlib_Delay_ms(1000); break;
    case  3: RGBlib_ColorWipeCenter(COLOR_WHITE_DARK, 120);
             RGBlib_Delay_ms(1000); break;
    case  4: RGBlib_Rainbow(10, 10); break;
    case  5: Eff_SpeedRotateLed(); break;
    case  6: RGBlib_TheaterChase(COLOR_RED, 30, 3, 150); break;
    case  7: RGBlib_TheaterChase(COLOR_YELLOW, 40, 3, 100); break;
    case  8: RGBlib_TheaterChase(COLOR_BLUE, 50, 3, 70); break;
    case  9: RGBlib_TheaterChaseTwoColor(COLOR_RED, COLOR_BLUE, 10, 500); break;
    case 10: RGBlib_TheaterChaseTwoColorRotate(COLOR_RED, COLOR_BLUE, 10, 100); break;
    case 11: RGBlib_RainbowCycle(5, 10); break;
    case 12: RGBlib_Detonate(COLOR_GREEN, 600); break;
    case 13: RGBlib_Fade(COLOR_RED);
             RGBlib_Delay_ms(500); break;
    case 14: RGBlib_Fade(COLOR_BLUE);
             RGBlib_Delay_ms(500); break;
    case 15: RGBlib_Fade(COLOR_YELLOW);
             RGBlib_Delay_ms(500); break;
    case 16: Eff_ColorWhipe(); break;
    default: break;
  }
}

void Eff_ColorWhipe()
{
  	RGBlib_ColorWipe(COLOR_RED, 120, true);
	RGBlib_ColorWipe(COLOR_BLUE, 120, false);
	RGBlib_ColorWipe(COLOR_GREEN, 120, false);
	RGBlib_ColorWipe(COLOR_BLACK, 120, false);
	RGBlib_Delay_ms(1000);
}

void Eff_Tears()
{
	for (uint8_t cycles = 0; cycles < 5; cycles++)
	{
		for (uint8_t i = 0; i < RGBlib_GetLedsCount() / 2; i++)
		{
			RGBlib_SetColor(i, COLOR_RED);
			RGBlib_SetColor(RGBlib_GetLedsCount() - 1 - i, COLOR_RED);
			RGBlib_Show();
			RGBlib_Delay_ms(100);
			RGBlib_SetColor(i, COLOR_BLACK);
			RGBlib_SetColor(RGBlib_GetLedsCount() - 1 - i, COLOR_BLACK);
		}

		RGBlib_Delay_ms(RGBlib_GetRandomNumber(300, 1000));
	}

}

void Eff_Stars()
{
	for (uint8_t i = 0; i < RGBlib_GetLedsCount(); i++)
	{
		uint32_t nColor = RGBlib_GetColor(i);
		if (nColor == 0)
		{
			uint8_t nRnd = RGBlib_GetRandomNumber(1, 20);
			if (nRnd == 1)
			{
				RGBlib_SetColor(i, COLOR_BLACK);
			}
		}
	}

	RGBlib_Delay_ms(50);
}

void Eff_SpeedRotateLed()
{
    for (uint8_t i = 110; i > 0; i -= 10)  // zrychlujici scanner
    {
      RGBlib_Scanner(COLOR_GREEN, i, false);
    }

    for (uint8_t w = 0; w < 12; w++)     // drzet
    {
      RGBlib_Scanner(COLOR_GREEN, 10, false);
    }

    for (uint8_t w = 0; w < 12; w++)     // drzet
    {
      RGBlib_Scanner(COLOR_RED, 10, false);
    }

    for (uint8_t w = 0; w < 12; w++)     // drzet
    {
      RGBlib_Scanner(COLOR_BLUE, 10, false);
    }

    for (uint8_t i = 10; i < 90; i += 10)  // zrychlujici scanner
    {
        RGBlib_Scanner(COLOR_BLUE, i, false);
    }

    RGBlib_Delay_ms(2000);
}

void Eff_Candle(RGB_colors_e color)
{
  uint8_t nPwmCtrl = 0;		// 4 bit-Counter
  uint8_t nFrameCtrl = 0;	// 5 bit-Counter

  uint8_t PWM_VAL = 0;		// 4 bit-Register
  uint8_t NEXTBRIGHT = 0;	// 4 bit-Register
  uint8_t RAND = 0;			  // 5 bit Signal
  uint8_t randflag = 0;		// 1 bit Signal

  while(1)
  {
    //_delay_us(1e6/440/16);   // Main clock=440*16 Hz
//    Delay_us(142);

 		// PWM
 		nPwmCtrl++;
 		nPwmCtrl &= 0xf;		// only 4 bit

 		if (nPwmCtrl <= PWM_VAL)
 		{
 		  RGBlib_SetColorAll(color, 0);
    }
    else
    {
      RGBlib_SetColorAll(COLOR_BLACK, 0);
    }

 		// FRAME
 		if (nPwmCtrl == 0)
 		{
 			nFrameCtrl++;
 			nFrameCtrl &= 0x1f;

 			if ((nFrameCtrl & 0x07) == 0)  // generate a new random number every 8 cycles. In reality this is most likely bit serial
 			{
 				RAND = RGBlib_Rand(0, 31);
 				if ((RAND & 0x0c)!=0)
        {
          randflag = 1;
        }
        else
        {
          randflag = 0;// only update if valid
        }
 			}

			// NEW FRAME
 			if (nFrameCtrl == 0)
 			{
 				PWM_VAL = NEXTBRIGHT; // reload PWM
 				randflag = 1;		    // force update at beginning of frame
 			}

 			if (randflag)
 			{
 				NEXTBRIGHT = RAND > 15 ? 15 : RAND;
 			}
 		}
  }
}

void Eff_Test()
{
	RGBlib_Delay_ms(1000);
	RGBlib_SetColorAll(COLOR_RED, 1000);
	RGBlib_SetColorAll(COLOR_GREEN, 1000);
	RGBlib_SetColorAll(COLOR_BLUE, 1000);
	RGBlib_Clear();
	RGBlib_Delay_ms(1000);
}
