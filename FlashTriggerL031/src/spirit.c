/*
 * spirit_gpio.c
 *
 *  Created on: 24. 8. 2016
 *      Author: priesolv
 */

#include "spirit.h"
#include "spirit_spi.h"

//#define USE_SPIRIT1_868MHz
#define USE_SPIRIT1_915MHz

#define SPIRIT1_SDN_PIN                 (1 << 2)  // out
#define SPIRIT1_SDN_GPIO_PORT           GPIOA

#define SPIRIT1_GPIO3_PIN               (1 << 10) // in
#define SPIRIT1_GPIO3_GPIO_PORT         GPIOA

#define SPIRIT1_SDN_INACTIVE            (SPIRIT1_SDN_GPIO_PORT->BSRR = SPIRIT1_SDN_PIN)
#define SPIRIT1_SDN_ACTIVE              (SPIRIT1_SDN_GPIO_PORT->BRR = SPIRIT1_SDN_PIN)

#define POR_TIME ((uint16_t)0x1E00)


Ptr_OnGPIO3_EXTI g_pOnGPIO3_EXTI;

void Spirit_Init(Ptr_OnGPIO3_EXTI pOnGPIO3Exti)
{

  RCC->IOPENR |= RCC_IOPENR_GPIOAEN | RCC_IOPENR_GPIOCEN;

  // Configure SPIRIT SDN pin as output
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE2))| (GPIO_MODER_MODE2_0);

  // Configure SPIRIT GPIO3 pin as input
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE10));

  // pull up
  GPIOA->PUPDR = (GPIOA->PUPDR & ~(GPIO_PUPDR_PUPD10)) | (GPIO_PUPDR_PUPD10_0);

  //SYSCFG->EXTICR[0] &= (uint16_t)~SYSCFG_EXTICR1_EXTI0_PA; /* (3) */
  EXTI->IMR |= SPIRIT1_GPIO3_PIN; // Configure the corresponding mask bit in the EXTI_IMR register
  EXTI->FTSR |= SPIRIT1_GPIO3_PIN; // Configure the Trigger Selection bits of the Interrupt line (falling edge)
  //EXTI->FTSR |= 0x0001; /* (6) */

  g_pOnGPIO3_EXTI = pOnGPIO3Exti;
}

// Puts at logic 1 the SDN pin.
void Spirit_EnterShutdown(void)
{
  SPIRIT1_SDN_INACTIVE;
}

// Put at logic 0 the SDN pin.
void Spirit_ExitShutdown(void)
{
  SPIRIT1_SDN_ACTIVE;

  /* Delay to allow the circuit POR, about 700 us */
  for (volatile uint32_t i = 0; i < POR_TIME; i++);
}

void Spirit_EnableIRQ(void)
{
  // Configure NVIC for Extended Interrupt
  NVIC_SetPriority(EXTI4_15_IRQn, 2);
  NVIC_EnableIRQ(EXTI4_15_IRQn);
}

void Spirit_DisableIRQ(void)
{
  NVIC_DisableIRQ(EXTI4_15_IRQn);
}

void EXTI4_15_IRQHandler(void)
{
  // EXTI line 10 interrupt detected
  if (EXTI->PR & SPIRIT1_GPIO3_PIN)
  {
    EXTI->PR = SPIRIT1_GPIO3_PIN; // Clear interrupt flag
    if (g_pOnGPIO3_EXTI)
    {
      g_pOnGPIO3_EXTI();
    }
  }
}

void Spirit_WriteReg(uint8_t nRegAddr, uint8_t nValue)
{
  SPIspirit_WriteRegisters(nRegAddr, 1, &nValue);
}

void Spirit_WriteCommand(uint8_t nCommand, SpiritState state)
{
  SpiritRefreshStatus();
  SPIspirit_CommandStrobes(nCommand);
  do {
     /* Delay for state transition */
     for(volatile uint8_t i=0; i!=0xFF; i++);

     /* Reads the MC_STATUS register */
     SpiritRefreshStatus();
   } while(g_xStatus.MC_STATE != state);

}

void Spirit_InitRegs()
{
  Spirit_WriteReg(159, 160);
  Spirit_WriteCommand(COMMAND_STANDBY, MC_STATE_STANDBY);

  Spirit_WriteReg(180, 33);
  Spirit_WriteCommand(COMMAND_READY, MC_STATE_READY);

  Spirit_WriteReg(163, 53);
  Spirit_WriteReg(7, 54);

  Spirit_WriteReg(1, 192);
  Spirit_WriteReg(108, 0);
  Spirit_WriteReg(12, 14);
  Spirit_WriteReg(13, 172);
  Spirit_WriteReg(14, 0);
  Spirit_WriteReg(15, 0);

  Spirit_WriteReg(26, 46);
  Spirit_WriteReg(27, 12);
  Spirit_WriteReg(28, 98);
  Spirit_WriteReg(29, 2);

  Spirit_WriteReg(30, 200);
  Spirit_WriteReg(153, 128);
  Spirit_WriteReg(154, 227);
  Spirit_WriteReg(158, 91);

#ifdef USE_SPIRIT1_868MHz  // for 848 MHz
  Spirit_WriteReg(8, 6);
  Spirit_WriteReg(9, 130);
  Spirit_WriteReg(10,143);
  Spirit_WriteReg(11, 89);
#endif

#ifdef USE_SPIRIT1_915MHz  // for 915 MHz
  Spirit_WriteReg(8, 134);
  Spirit_WriteReg(9, 220);
  Spirit_WriteReg(10, 204);
  Spirit_WriteReg(11, 201);
#endif

  Spirit_WriteReg(158, 219);
  Spirit_WriteReg(158, 219);

#ifdef USE_SPIRIT1_868MHz  // for 848 MHz
  Spirit_WriteReg(8, 13);
  Spirit_WriteReg(9, 5);
  Spirit_WriteReg(10, 30);
  Spirit_WriteReg(11, 177);
#endif

#ifdef USE_SPIRIT1_915MHz  // for 915 MHz
  Spirit_WriteReg(8, 141);
  Spirit_WriteReg(9, 185);
  Spirit_WriteReg(10, 153);
  Spirit_WriteReg(11, 145);
#endif

  Spirit_WriteReg(161, 25);
  Spirit_WriteReg(80, 2);

  Spirit_WriteCommand(COMMAND_LOCKTX, MC_STATE_LOCK);

  Spirit_WriteCommand(COMMAND_READY, MC_STATE_READY);

  Spirit_WriteCommand(COMMAND_LOCKRX, MC_STATE_LOCK);

  Spirit_WriteCommand(COMMAND_READY, MC_STATE_READY);

  Spirit_WriteReg(80, 0);
  Spirit_WriteReg(158, 91);
  Spirit_WriteReg(158, 91);

#ifdef USE_SPIRIT1_868MHz  // for 848 MHz
  Spirit_WriteReg(8, 6);
  Spirit_WriteReg(9, 130);
  Spirit_WriteReg(10, 143);
  Spirit_WriteReg(11, 89);
#endif

#ifdef USE_SPIRIT1_915MHz  // for 915 MHz
  Spirit_WriteReg(8, 134);
  Spirit_WriteReg(9, 220);
  Spirit_WriteReg(10, 204);
  Spirit_WriteReg(11, 201);
#endif

  Spirit_WriteReg(161, 17);

#ifdef USE_SPIRIT1_868MHz  // for 848 MHz
  Spirit_WriteReg(110, 67);  // nebo 66
  Spirit_WriteReg(111, 67);  // nebo 66
#endif

#ifdef USE_SPIRIT1_915MHz  // for 915 MHz
  Spirit_WriteReg(110, 39);
  Spirit_WriteReg(111, 39);
#endif
}

void Spirit_SetPowerRegs(void)
{
    Spirit_WriteReg(16, 1);
    Spirit_WriteReg(24, 7);
}

void Spirit_ProtocolInitRegs(void)
{
  // PacketConfig
  Spirit_WriteReg(81, 1);
  Spirit_WriteReg(79, 64);

  Spirit_WriteReg(48, 8);
  Spirit_WriteReg(49, 6);
  Spirit_WriteReg(50, 31);
  Spirit_WriteReg(51, 48);

  Spirit_WriteReg(79, 65);

  Spirit_WriteReg(54, 136);
  Spirit_WriteReg(55, 136);
  Spirit_WriteReg(56, 136);
  Spirit_WriteReg(57, 136);
}

void Spirit_EnableSQIRegs(void)
{
  Spirit_WriteReg(58, 2);
  Spirit_WriteReg(58, 2);
}

void Spirit_SetRssiTHRegs(void)
{
  Spirit_WriteReg(34, 20);
}
