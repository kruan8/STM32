/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/


#include "stm32f4xx.h"
#include "share_f4/types.h"

#include "HwtTimer.h"
#include "SwtTimer.h"
#include "protocol_095.h"
#include "technology_095.h"
#include "BTL_USART.h"

#include "Motors095_SoftPMDC.h"

/*
 *  ------ Rozdeleni HW zdroju -------------------------------------------------------------
 *  PriorityGroupConfig = 4, takze nelze nastavovat subpriority preruseni
 *
 *      HW zdroj         | INT priorita | Modul                |   Pouziti
 *      -----------------|--------------|----------------------|--------------------------------------
 *      TIM1_CC1         |    1         | Motors095_SoftPMDC   | rizeni motoru M1 (spousti ADC1)
 *      TIM8_CC1         |    1         | Motors095_SoftPMDC   | rizeni motoru M2 (spousti ADC2)
 *      DMA2_Stream4Ch0  |    4         | Adc095               | ukladani vysledku prevodu ADC1
 *      DMA2_Stream2Ch1  |    4         | Adc095               | ukladani vysledku prevodu ADC2
 *      DMA2_Stream1Ch2  |    4         | Adc095               | ukladani vysledku prevodu ADC3
 *      I2C2             |   ???        | i2c_int              | komunikace po I2C (EEPROM)
 *      SPI2             |    2         | Spi2                 | komunikace SPI (external ADC)
 *      USART1           |    3         | BTL_USART            | komunikace master
 *
 *      SysTick          |  15          | HwtTimer             | SysTick timer
 *
 * ---------------------------------------------------------------------------------------------
 *
 */

int main(void)
{

  // kontrola hodin
  RCC_ClocksTypeDef RCC_Clocks;
  RCC_GetClocksFreq(&RCC_Clocks); // Get system clocks

  // NVIC_PriorityGroup_4: 4 bits for pre-emption priority
  //                       0 bits for subpriority
  __attribute__((unused)) uint32_t priority = NVIC_GetPriorityGrouping();
  NVIC_PriorityGroupConfig(NVIC_PriorityGroup_4);
  priority = NVIC_GetPriorityGrouping();

  HwtInit(GPIOF, GPIO_Pin_13);
  SwtInit();

  B095_ServInit(usart1, 0x35);    // ID = 53

  Tech095_Init();

  while (true)
  {
    Tech095_Exec();
    SwtExec();
    V200_CommExec();
  }

}
