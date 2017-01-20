
#include "stm32f0xx.h"
#include "ILI9163.h"

#include "ugui.h"

void Window_1Callback(UG_MESSAGE *msg);

UG_GUI gui; // Global GUI structure

int main(void)
{
	// kontrola hodin
	RCC_ClocksTypeDef RCC_Clocks;
	RCC_GetClocksFreq(&RCC_Clocks); // Get system clocks

	ILI9163_Init();

	UG_Init(&gui, ILI9163_PixelSetRGB565, 240, 320);
	UG_FontSetHSpace(0);
	UG_DriverRegister(DRIVER_FILL_FRAME, ( void*)ILI9163_FillFrame);

	UG_FillScreen(C_BLACK);

	UG_FillFrame(0, 0, 50, 60, C_YELLOW);

	UG_FontSelect(&FONT_10X16);
	UG_SetBackcolor(C_BLACK);
	UG_SetForecolor(C_CYAN);
	UG_PutString(0, 100, "Ahoj");

//
//#define MAX_OBJECTS 10
//	UG_OBJECT objBuffWnd_1[MAX_OBJECTS];
//	UG_WINDOW window_1;
//	UG_BUTTON button_1;
//	UG_WindowCreate(&window_1, objBuffWnd_1, MAX_OBJECTS, Window_1Callback);
//	UG_WindowSetTitleText (&window_1, "Window 1");
//	UG_WindowSetTitleTextFont (&window_1, &FONT_10X16);
//
//	UG_ButtonCreate(&window_1, &button_1, BTN_ID_0, 10, 10, 110, 60);
//
//	UG_WindowShow(&window_1);
//	UG_Update();
//	while(1);
//
//	UG_FillFrame(0, 0, 50, 60, C_YELLOW);
//	UG_FillFrame(50, 100, 90, 150, C_YELLOW_GREEN);
//
//	UG_FontSelect(&FONT_10X16);
//	UG_SetBackcolor(C_BLACK);
//	UG_SetForecolor(C_CYAN);
//	UG_PutString(0, 0, "Dobry den!");

//
//	uint32_t nStart = ILI9163_GetTicks_ms();
//
//	// smycka trvala 15,3 s
//	for (uint8_t i = 0; i < 100; i++)
//	{
//		ILI9163_FillScreen(aqua);
//		ILI9163_Delay_ms(1000);
//		ILI9163_FillScreen(yellow);
//		ILI9163_Delay_ms(1000);
//		ILI9163_FillScreen(red);
//    ILI9163_Delay_ms(1000);
//		ILI9163_FillScreen(black);
//	}
//
//	uint32_t nDuration = ILI9163_GetTicks_ms() - nStart;
//
//	ILI9163_FillRect(0, 0, ILI9163_RES_X, 50, yellow);
//	ILI9163_FillRect(10, 10, ILI9163_RES_X - 20, 50 - 20, fuchsia);
//
//	ILI9163_SetTextParams(black, fuchsia);
//	ILI9163_PrintText(30, 20, "LCD-ILI9163");


	while(1);
}

void Window_1Callback(UG_MESSAGE *msg)
{

}
