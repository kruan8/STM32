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
  Spirit_WriteReg(SYNTH_CONFIG0_BASE, 160);      // 0x9F  split time=3.47 ns
  Spirit_WriteCommand(COMMAND_STANDBY, MC_STATE_STANDBY);

  Spirit_WriteReg(180, 33);       // 0xB4 (XO_RCO_TEST)
  Spirit_WriteCommand(COMMAND_READY, MC_STATE_READY);

  Spirit_WriteReg(163, 53);       // 0xA3 (DEM_CONFIG)  enable initialization
  Spirit_WriteReg(7, 54);         // (IF_OFFSET_ANA)  Intermediate frequency setting for the analog RF synthesizer.

  Spirit_WriteReg(ANA_FUNC_CONF0_BASE, 192);

  // Channel number. This value is  multiplied by the channel
  // spacing and added to the synthesizer base frequency to
  // generate the actual RF carrier  frequency.
  Spirit_WriteReg(108, 0);        // 0x6C (CHNUM)

  Spirit_WriteReg(12, 14);        // 0x0C (CHSPACE)
  Spirit_WriteReg(13, 172);       // 0x0D (IF_OFFSET_DIG) Intermediate frequency setting for the digital shift-to-baseband
  Spirit_WriteReg(14, 0);         // 0x0E (FC_OFFSET[1])  Carrier offset in steps of fXO/218
  Spirit_WriteReg(15, 0);         // 0x0F (FC_OFFSET[0])

  // Radio configuration
  Spirit_WriteReg(26, 46);        // 0x1A (MOD1) The mantissa value of the data rate equation
  Spirit_WriteReg(27, 12);        // 0x1B (MOD0)
  Spirit_WriteReg(28, 98);        // 0x1C (FDEV0)
  Spirit_WriteReg(29, 2);         // 0x1D (CHFLT)

  Spirit_WriteReg(30, 200);       // 0x1E (AFC2)
  Spirit_WriteReg(153, 128);      // 0x99
  Spirit_WriteReg(154, 227);      // 0x9A
  Spirit_WriteReg(158, 91);       // 0x9E (SYNTH_CONFIG[1])  fREF = fXO frequency

  // SYNT0 - SYNT3
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

  Spirit_WriteReg(158, 219);       // 0x9E (SYNTH_CONFIG[1]) fREF = fXO frequency / 2
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

  Spirit_WriteReg(VCO_CONFIG_BASE, 25);  // Set the VCO current
  Spirit_WriteReg(PROTOCOL2_BASE, PROTOCOL2_VCO_CALIBRATION_MASK); // enable the automatic VCO calibration

  Spirit_WriteCommand(COMMAND_LOCKTX, MC_STATE_LOCK);

  Spirit_WriteCommand(COMMAND_READY, MC_STATE_READY);

  Spirit_WriteCommand(COMMAND_LOCKRX, MC_STATE_LOCK);

  Spirit_WriteCommand(COMMAND_READY, MC_STATE_READY);

  Spirit_WriteReg(PROTOCOL2_BASE, 0); // disable the automatic VCO calibration
  Spirit_WriteReg(SYNTH_CONFIG1_BASE, 91);       // fREF = fXO frequency
  Spirit_WriteReg(SYNTH_CONFIG1_BASE, 91);       // fREF = fXO frequency

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

  Spirit_WriteReg(161, 17);    // 0xA1  Set the VCO current

#ifdef USE_SPIRIT1_868MHz  // for 848 MHz
  Spirit_WriteReg(110, 67);  // nebo 66       // 0x6E Word value for the VCO to be used in TX mode
  Spirit_WriteReg(111, 67);  // nebo 66       // 0x6F Word value for the VCO to be used in RX mode
#endif

#ifdef USE_SPIRIT1_915MHz  // for 915 MHz
  Spirit_WriteReg(110, 39);
  Spirit_WriteReg(111, 39);
#endif
}

void Spirit_SetPowerRegs(void)
{
  Spirit_WriteReg(PA_POWER8_BASE, 1);  // Output power level for 8th slot (+12 dBm)

  // Final level for power ramping or selected output power index
  Spirit_WriteReg(PA_POWER0_BASE, PA_POWER0_PA_LEVEL_MAX_INDEX_7);
}

void Spirit_ProtocolInitRegs(void)
{
  // PacketConfig

  uint8_t nValue;

  // automatic packet filtering mode enabled
  // vypnout vsechny filtry
  // !! kdyz byly filtry povoleny a v registru PCKT_FLT_OPTIONS_BASE vsechny zakazany, tak stejne se pakety zahazovaly !!
  Spirit_WriteReg(PROTOCOL1_BASE, 0 /*PROTOCOL1_AUTO_PCKT_FLT_MASK*/);

  // filter option
//  Spirit_WriteReg(PCKT_FLT_OPTIONS_BASE, PCKT_FLT_OPTIONS_RX_TIMEOUT_AND_OR_SELECT);

  Spirit_WriteReg(PCKTCTRL4_BASE, 8);   // 0x30  Length of address field in bytes: Basic, CONTROL_LEN=0
  Spirit_WriteReg(PCKTCTRL3_BASE, 6);   // 0x31  LEN_WID=6
  Spirit_WriteReg(PCKTCTRL2_BASE, 31);
  Spirit_WriteReg(PCKTCTRL1_BASE, 48);

  // filter option
  // vyhodime filtrovani od kvality signalu
//  SPIspirit_ReadRegisters(PCKT_FLT_OPTIONS_BASE, 1, &nValue);
  Spirit_WriteReg(PCKT_FLT_OPTIONS_BASE, 0/* PCKT_FLT_OPTIONS_RX_TIMEOUT_AND_OR_SELECT | PCKT_FLT_OPTIONS_CRC_CHECK_MASK*/);
//  SPIspirit_ReadRegisters(PROTOCOL2_BASE, 1, &nValue);


  // SYNC4-SYNC1 word (default)
  Spirit_WriteReg(SYNC4_BASE, 0x88);
  Spirit_WriteReg(SYNC3_BASE, 0x88);
  Spirit_WriteReg(SYNC2_BASE, 0x88);
  Spirit_WriteReg(SYNC1_BASE, 0x88);
}

void Spirit_EnableSQIRegs(void)
{
  Spirit_WriteReg(QI_BASE, 2);
  Spirit_WriteReg(QI_BASE, 2);
}

void Spirit_SetRssiTHRegs(void)
{
  Spirit_WriteReg(RSSI_TH_BASE, 20);
}
