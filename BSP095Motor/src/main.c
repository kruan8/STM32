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

/*
 *  ------ Rozdeleni HW zdroju -------------------------------------------------------------
 *  PriorityGroupConfig = 4, takze nelze nastavovat subpriority preruseni
 *
 *      HW zdroj     | INT priorita | Modul       |   Pouziti                            | gener 2
 *      ----------------------------|-------------|----------------------------------------------------
 *      TIM1_CC1     |    1         | Adc_095     | casovani prevodu AD prevodniku       | TIM4_CH4
 *      TIM2         |              | Motors_095  | citani pulzu motoru 1                | N/A
 *      TIM3_CC3     |              | Motors_095  | tvorba PWM motoru 1                  | TIM1_CH1
 *      TIM5         |  ???         | Motors_095  | citani pulzu motoru 2                | N/A
 *      TIM8_CC3     |    1         | Motors_095  | tvorba PWM motoru 2                  | TIM8_CH1
 *      I2C2         |  ???         | i2c_int     | komunikace po I2C (EEPROM)
 *      SPI2         |  2/sub0      | Spi2        | komunikace SPI (external ADC)
 *      USART1       |  3/sub0      | BTL_USART   | komunikace master
 *      DMA2_Stream4 |  4/sub0      | Adc_095     | ukladani vysledku prevodu ADC1 (stream 4)
 *      SysTick      |  15          | HwtTimer    | SysTick timer
 *
 * ---------------------------------------------------------------------------------------------
 *
 *       Memory            | Size     | Use
 *       ----------------------------------------------------------
 *       0x10000000 (CCM)  | 0x10000  | active sample buffer (64kB)
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
