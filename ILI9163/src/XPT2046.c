/* Includes ------------------------------------------------------------------*/
#include "XPT2046.h"
#include "SPI1.h"

#define XPT2046_CS_PIN                     GPIO_Pin_5
#define XPT2046_CS_GPIO_PORT               GPIOC
#define XPT2046_CS_SCK_GPIO_CLK            RCC_AHBPeriph_GPIOC

#define XPT2046_IRQ_PIN                    GPIO_Pin_3
#define XPT2046_IRQ_GPIO_PORT              GPIOC
#define XPT2046_IRQ_SCK_GPIO_CLK           RCC_AHBPeriph_GPIOC

#define XPT2046_CS_ENABLE                  (XPT2046_CS_GPIO_PORT->BRR = XPT2046_CS_PIN)
#define XPT2046_CS_DISABLE                 (XPT2046_CS_GPIO_PORT->BSRR = XPT2046_CS_PIN)

#define XPT2046_SPI_PRESCALER              spi_br_32

/* Private variables ---------------------------------------------------------*/
Matrix        matrix;
Coordinate    display;
Coordinate    ScreenSample[3];
Coordinate    DisplaySample[3] = { {30, 45}, {290, 45}, {160, 210} };

/* Private define ------------------------------------------------------------*/
#define THRESHOLD 2

void XPT2046_Init(void) 
{ 
  GPIO_InitTypeDef GPIO_InitStruct;

  // SPI1 nakonfigurovano od driveru displeje ILI9163, budeme jenom menit rychlost

  /* CS pin */
  RCC_AHBPeriphClockCmd(XPT2046_CS_SCK_GPIO_CLK, ENABLE);
  GPIO_InitStruct.GPIO_Pin = XPT2046_CS_PIN;
	GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStruct.GPIO_Speed = GPIO_Speed_Level_3;;
  GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(XPT2046_CS_GPIO_PORT, &GPIO_InitStruct);

  XPT2046_CS_DISABLE;

  /* IRQ pin */
  RCC_AHBPeriphClockCmd(XPT2046_IRQ_SCK_GPIO_CLK, ENABLE);
  GPIO_InitStruct.GPIO_Pin =  XPT2046_IRQ_PIN;
  GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStruct.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStruct.GPIO_Speed = GPIO_Speed_Level_3;;
  GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(XPT2046_IRQ_GPIO_PORT, &GPIO_InitStruct);
} 

uint16_t Read_X(void)  
{  
  uint16_t curr_X;

  XPT2046_CS_ENABLE;
  XPT2046_CS_ENABLE;
  WR_CMD(CHX); 
  XPT2046_CS_ENABLE;   // Todo: wait, zatim nevim na co
  curr_X = RD_AD();
  XPT2046_CS_DISABLE;
  return curr_X;    
} 

uint16_t Read_Y(void)  
{  
  uint16_t curr_Y; 

  XPT2046_CS_ENABLE;
  XPT2046_CS_ENABLE;
  WR_CMD(CHY); 
  XPT2046_CS_ENABLE;   // Todo: wait, zatim nevim na co
  curr_Y = RD_AD();
  XPT2046_CS_DISABLE;
  return curr_Y;     
} 

void XPT2046_GetAdXY(int *x,int *y)  
{ 
  uint16_t adx, ady;
  adx = Read_X();
  XPT2046_CS_ENABLE;   // Todo: wait, zatim nevim na co
  ady = Read_Y();
  *x = adx;
  *y = ady;
} 
	
Coordinate *Read_XPT2046(void)
{
  static Coordinate  screen;
  int m0,m1,m2,TP_X[1],TP_Y[1],temp[3];
  uint8_t count=0;
  int buffer[2][9]={{0},{0}};
  
  do
  {		   
    XPT2046_GetAdXY(TP_X,TP_Y);  
	  buffer[0][count]=TP_X[0];  
	  buffer[1][count]=TP_Y[0];
	  count++;  
  }
  while(!read_IRQ()&& count<9);  /* TP_INT_IN  */
  if(count==9)   /* Average X Y  */ 
  {
	/* Average X  */
  temp[0]=(buffer[0][0]+buffer[0][1]+buffer[0][2])/3;
	temp[1]=(buffer[0][3]+buffer[0][4]+buffer[0][5])/3;
	temp[2]=(buffer[0][6]+buffer[0][7]+buffer[0][8])/3;

	m0=temp[0]-temp[1];
	m1=temp[1]-temp[2];
	m2=temp[2]-temp[0];

	m0=m0>0?m0:(-m0);
  m1=m1>0?m1:(-m1);
	m2=m2>0?m2:(-m2);

	if( m0>THRESHOLD  &&  m1>THRESHOLD  &&  m2>THRESHOLD ) return 0;

	if(m0<m1)
	{
	  if(m2<m0) 
	    screen.x=(temp[0]+temp[2])/2;
	  else 
	    screen.x=(temp[0]+temp[1])/2;	
	}
	else if(m2<m1) 
	  screen.x=(temp[0]+temp[2])/2;
	else 
	  screen.x=(temp[1]+temp[2])/2;

	/* Average Y  */
  temp[0]=(buffer[1][0]+buffer[1][1]+buffer[1][2])/3;
	temp[1]=(buffer[1][3]+buffer[1][4]+buffer[1][5])/3;
	temp[2]=(buffer[1][6]+buffer[1][7]+buffer[1][8])/3;
	m0=temp[0]-temp[1];
	m1=temp[1]-temp[2];
	m2=temp[2]-temp[0];
	m0=m0>0?m0:(-m0);
	m1=m1>0?m1:(-m1);
	m2=m2>0?m2:(-m2);
	if(m0>THRESHOLD&&m1>THRESHOLD&&m2>THRESHOLD) return 0;

	if(m0<m1)
	{
	  if(m2<m0) 
	    screen.y=(temp[0]+temp[2])/2;
	  else 
	    screen.y=(temp[0]+temp[1])/2;	
    }
	else if(m2<m1) 
	   screen.y=(temp[0]+temp[2])/2;
	else
	   screen.y=(temp[1]+temp[2])/2;

	return &screen;
  }  
  return 0; 
}
	 
FunctionalState setCalibrationMatrix( Coordinate * displayPtr,
                          Coordinate * screenPtr,
                          Matrix * matrixPtr)
{

  FunctionalState retTHRESHOLD = ENABLE ;
  /* K£½(X0£­X2) (Y1£­Y2)£­(X1£­X2) (Y0£­Y2) */
  matrixPtr->Divider = ((screenPtr[0].x - screenPtr[2].x) * (screenPtr[1].y - screenPtr[2].y)) - 
                       ((screenPtr[1].x - screenPtr[2].x) * (screenPtr[0].y - screenPtr[2].y)) ;
  if( matrixPtr->Divider == 0 )
  {
    retTHRESHOLD = DISABLE;
  }
  else
  {
    /* A£½((XD0£­XD2) (Y1£­Y2)£­(XD1£­XD2) (Y0£­Y2))£¯K	*/
    matrixPtr->An = ((displayPtr[0].x - displayPtr[2].x) * (screenPtr[1].y - screenPtr[2].y)) - 
                    ((displayPtr[1].x - displayPtr[2].x) * (screenPtr[0].y - screenPtr[2].y)) ;
	/* B£½((X0£­X2) (XD1£­XD2)£­(XD0£­XD2) (X1£­X2))£¯K	*/
    matrixPtr->Bn = ((screenPtr[0].x - screenPtr[2].x) * (displayPtr[1].x - displayPtr[2].x)) - 
                    ((displayPtr[0].x - displayPtr[2].x) * (screenPtr[1].x - screenPtr[2].x)) ;
    /* C£½(Y0(X2XD1£­X1XD2)+Y1(X0XD2£­X2XD0)+Y2(X1XD0£­X0XD1))£¯K */
    matrixPtr->Cn = (screenPtr[2].x * displayPtr[1].x - screenPtr[1].x * displayPtr[2].x) * screenPtr[0].y +
                    (screenPtr[0].x * displayPtr[2].x - screenPtr[2].x * displayPtr[0].x) * screenPtr[1].y +
                    (screenPtr[1].x * displayPtr[0].x - screenPtr[0].x * displayPtr[1].x) * screenPtr[2].y ;
    /* D£½((YD0£­YD2) (Y1£­Y2)£­(YD1£­YD2) (Y0£­Y2))£¯K	*/
    matrixPtr->Dn = ((displayPtr[0].y - displayPtr[2].y) * (screenPtr[1].y - screenPtr[2].y)) - 
                    ((displayPtr[1].y - displayPtr[2].y) * (screenPtr[0].y - screenPtr[2].y)) ;
    /* E£½((X0£­X2) (YD1£­YD2)£­(YD0£­YD2) (X1£­X2))£¯K	*/
    matrixPtr->En = ((screenPtr[0].x - screenPtr[2].x) * (displayPtr[1].y - displayPtr[2].y)) - 
                    ((displayPtr[0].y - displayPtr[2].y) * (screenPtr[1].x - screenPtr[2].x)) ;
    /* F£½(Y0(X2YD1£­X1YD2)+Y1(X0YD2£­X2YD0)+Y2(X1YD0£­X0YD1))£¯K */
    matrixPtr->Fn = (screenPtr[2].x * displayPtr[1].y - screenPtr[1].x * displayPtr[2].y) * screenPtr[0].y +
                    (screenPtr[0].x * displayPtr[2].y - screenPtr[2].x * displayPtr[0].y) * screenPtr[1].y +
                    (screenPtr[1].x * displayPtr[0].y - screenPtr[0].x * displayPtr[1].y) * screenPtr[2].y ;
  }
  return( retTHRESHOLD ) ;
}

FunctionalState getDisplayPoint(Coordinate * displayPtr,
                     Coordinate * screenPtr,
                     Matrix * matrixPtr )
{
  FunctionalState retTHRESHOLD =ENABLE ;

  if( matrixPtr->Divider != 0 )
  {
    /* XD = AX+BY+C */        
    displayPtr->x = ( (matrixPtr->An * screenPtr->x) + 
                      (matrixPtr->Bn * screenPtr->y) + 
                       matrixPtr->Cn 
                    ) / matrixPtr->Divider ;
	/* YD = DX+EY+F */        
    displayPtr->y = ( (matrixPtr->Dn * screenPtr->x) + 
                      (matrixPtr->En * screenPtr->y) + 
                       matrixPtr->Fn 
                    ) / matrixPtr->Divider ;
  }
  else
  {
    retTHRESHOLD = DISABLE;
  }
  return(retTHRESHOLD);
} 

//void TouchPanel_Calibrate(void)
//{
//  unsigned char i;
//  Coordinate * Ptr;
//
//  for(i=0;i<3;i++)
//  {
//   SSD1289_Clear(Black);
//   SSD1289_CleanText(44,10,"Touch crosshair to calibrate",Red);
//   Delay(250);
//   SSD1289_DrawCross(DisplaySample[i].x,DisplaySample[i].y, Red, RGB565CONVERT(184,158,131));
//   do
//   {
//     Ptr = Read_XPT2046();
//   }
//   while( Ptr == (void*)0 );
//   ScreenSample[i].x= Ptr->x; ScreenSample[i].y= Ptr->y;
//  }
//  setCalibrationMatrix( &DisplaySample[0],&ScreenSample[0],&matrix );
//  SSD1289_Clear(Black);
//}

static uint8_t read_IRQ(void)
{
  return XPT2046_IRQ_GPIO_PORT->IDR & XPT2046_IRQ_PIN;
}

uint8_t XPT2046_Press(void)
{
  return read_IRQ();
}

static void WR_CMD (uint8_t cmd)
{
  SPI1_SetPrescaler(XPT2046_SPI_PRESCALER);
  SPI1->DR = cmd;
  while (SPI1->SR & SPI_I2S_FLAG_BSY);
} 

static uint16_t RD_AD(void)  
{ 
  uint16_t buf;
  uint8_t temp;

  SPI1_SetPrescaler(XPT2046_SPI_PRESCALER);

  while (!(SPI1->SR & SPI_I2S_FLAG_TXE));
  SPI_SendData8(SPI1, 0x0000);

  /* Wait for SPI3 data reception */
  while (!(SPI1->SR & SPI_I2S_FLAG_RXNE));
  temp = SPI1->DR;

  buf = temp << 8;
  XPT2046_CS_ENABLE;   // Todo: wait, zatim nevim na co

  while (!(SPI1->SR & SPI_I2S_FLAG_TXE));
  SPI_SendData8(SPI1, 0x0000);

  while (!(SPI1->SR & SPI_I2S_FLAG_RXNE));
  temp = SPI1->DR;

  buf |= temp; 
  buf >>= 3;
  buf &= 0xfff;
  return buf; 
}
