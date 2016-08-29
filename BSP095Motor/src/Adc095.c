/*
 * ADC.c
 *
 *  Created on: 27. 10. 2015
 *      Author: priesolv
 */

#include "Adc_095.h"
#include <stdlib.h>

#define ADC_REFERENCE_VOLTAGE 3300L	// mV
#define ADC_REFERENCE_UNIT_UV (ADC_REFERENCE_VOLTAGE * 1000 / 4095)		// rozliseni prevodu (1 bit) v uV

#define ADC_TIM_PRESCALER   100

//#define ADC_INPUTS 8			// pocet vstupu ADC

typedef enum
{
  adc1_current_M1,
  adc1_ref_current_M1,
  adc1_angleM1 = 0,           // uhlovy snimac M1
  adc1_udc,                 // napajeci napeti vykonove casti (Udc)
  adc1_temp_internal,       // MCU core temperature
  adc1_max
} adc1_inputs_e;

typedef enum
{
  adc2_current_M2,
  adc2_ref_current_M2,
  adc2_angleM2,               // uhlovy snimac M2
  adc2_max
}adc2_inputs_e;

typedef enum
{
  adc3_pfc_fan = 0,
  adc3_temp_heatsinkM1,
  adc3_temp_heatsinkM2,
  adc3_gen_adaptor,            // supply 24V
  adc3_brake_current,
  adc3_fan_current,
  adc3_temp_M1,
  adc3_temp_M2,
  adc3_handle_motor_current,
  adc3_ac_in_line,             // napajeci napeti (230V)
  adc3_ac_out_line,
  adc3_max
} adc3_inputs_e;


uint16_t g_nADC1Values[adc1_max];		// hodnoty nactene na vstupech ADC1
uint16_t g_nADC2Values[adc2_max];   // hodnoty nactene na vstupech ADC2
uint16_t g_nADC3Values[adc3_max];   // hodnoty nactene na vstupech ADC3

uint32_t g_nCycleCounter = 0;       // citac pro odmereni intervalu spousteni ADC3


// nakonfiguruje ADC pro cyklicke snimani AD0-AD7 (vyjma AD4) pomoci DMA2 do pameti
// prevod ADC je spousten pomoci casovace TIM4
void Adc095_Init(void)
{
  // hodiny do ADC1 + ADC3
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC2, ENABLE);
  RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC3, ENABLE);

  // hodiny do portu A
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA | RCC_AHB1Periph_GPIOB | RCC_AHB1Periph_GPIOC | RCC_AHB1Periph_GPIOF, ENABLE);



  GPIO_InitTypeDef GPIO_InitStructure;
  GPIO_StructInit(&GPIO_InitStructure);

  // konfigurace vstupu pro ADC1
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2    // adc_in_angleX
                              | GPIO_Pin_3    // adc_in_angleY
                              | GPIO_Pin_5    // current M1
                              | GPIO_Pin_7;   // current M2
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIOA, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0 | GPIO_Pin_1;    // ref current M1 + M2
  GPIO_Init(GPIOB, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;    // Udc (napajeci napeti vykonove casti)
  GPIO_Init(GPIOC, &GPIO_InitStructure);

  // konfigurace vstupu pro ADC1
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_1     // pfc fan
                              | GPIO_Pin_2     // M1 temp heatsink
                              | GPIO_Pin_3;    // M2 temp heatsink
  GPIO_Init(GPIOC, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_3     // gener adaptor (24V)
                              | GPIO_Pin_4     // brake currnet
                              | GPIO_Pin_5     // fan current
                              | GPIO_Pin_6     // M1 temp
                              | GPIO_Pin_7     // M2 temp
                              | GPIO_Pin_8     // handle motor current
                              | GPIO_Pin_9     // AC IN line
                              | GPIO_Pin_10;   // AC OUT line
  GPIO_Init(GPIOF, &GPIO_InitStructure);


  //  ADC Common Init
  ADC_CommonInitTypeDef ADC_CommonInitStructure;
  ADC_CommonStructInit(&ADC_CommonInitStructure);
  ADC_CommonInitStructure.ADC_Mode = ADC_Mode_Independent;
  ADC_CommonInitStructure.ADC_Prescaler = ADC_Prescaler_Div4;  // APB2 clock / prescaler (84MHz/4=21MHz)
  ADC_CommonInitStructure.ADC_TwoSamplingDelay = ADC_TwoSamplingDelay_5Cycles;
  ADC_CommonInitStructure.ADC_DMAAccessMode = ADC_DMAAccessMode_Disabled;
  ADC_CommonInit(&ADC_CommonInitStructure);

  // ADC configuration
  ADC_InitTypeDef ADC_InitStructure;

  ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
  ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;
  ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;		// no continuous mode
  ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T4_CC4;	// trigger TIM4_CH4
  ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_Rising;	// start conversion by rising edge
  ADC_InitStructure.ADC_NbrOfConversion = adc1_max;	//I think this one is clear
  ADC_InitStructure.ADC_ScanConvMode = ENABLE;
  ADC_Init(ADC1, &ADC_InitStructure);

  ADC_InitStructure.ADC_NbrOfConversion = adc2_max;
  ADC_Init(ADC2, &ADC_InitStructure);

  ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None; // no start conversion
  ADC_InitStructure.ADC_NbrOfConversion = adc3_max;
  ADC_Init(ADC3, &ADC_InitStructure);

  // skenovaci sekvence pro ADC1
  ADC_RegularChannelConfig(ADC1, ADC_Channel_5, 1, ADC_SampleTime_15Cycles); // current M1
  ADC_RegularChannelConfig(ADC1, ADC_Channel_8, 3, ADC_SampleTime_15Cycles); // ref current M1
  ADC_RegularChannelConfig(ADC1, ADC_Channel_2, 5, ADC_SampleTime_15Cycles); // angle M1
  ADC_RegularChannelConfig(ADC1, ADC_Channel_10, 7, ADC_SampleTime_3Cycles); // Udc voltage
  ADC_RegularChannelConfig(ADC1, ADC_Channel_16, 8, ADC_SampleTime_15Cycles); // MCU internal temperature sensor

  // enable internal temperature sensor
  ADC_TempSensorVrefintCmd(ENABLE);

  // skenovaci sekvence pro ADC2
  ADC_RegularChannelConfig(ADC2, ADC_Channel_7, 1, ADC_SampleTime_15Cycles); // current M2
  ADC_RegularChannelConfig(ADC1, ADC_Channel_9, 2, ADC_SampleTime_15Cycles); // ref current M2
  ADC_RegularChannelConfig(ADC1, ADC_Channel_3, 3, ADC_SampleTime_15Cycles); // angle M2

  // skenovaci sekvence pro ADC3
  ADC_RegularChannelConfig(ADC3, ADC_Channel_11, 1, ADC_SampleTime_15Cycles); // pfc_fan
  ADC_RegularChannelConfig(ADC3, ADC_Channel_12, 2, ADC_SampleTime_15Cycles); // temp M1 heatsink
  ADC_RegularChannelConfig(ADC3, ADC_Channel_13, 3, ADC_SampleTime_15Cycles); // temp M2 heatsink
  ADC_RegularChannelConfig(ADC3, ADC_Channel_9 , 4, ADC_SampleTime_3Cycles);  // gener adaptor
  ADC_RegularChannelConfig(ADC3, ADC_Channel_14, 5, ADC_SampleTime_15Cycles);  // brake current
  ADC_RegularChannelConfig(ADC3, ADC_Channel_15, 6, ADC_SampleTime_15Cycles);  // fan current
  ADC_RegularChannelConfig(ADC3, ADC_Channel_4 , 7, ADC_SampleTime_15Cycles);  // M1 temp
  ADC_RegularChannelConfig(ADC3, ADC_Channel_5 , 8, ADC_SampleTime_15Cycles);  // M2 temp
  ADC_RegularChannelConfig(ADC3, ADC_Channel_6 , 9, ADC_SampleTime_15Cycles);  // handle motor current
  ADC_RegularChannelConfig(ADC3, ADC_Channel_7, 10, ADC_SampleTime_15Cycles);  // AC IN line
  ADC_RegularChannelConfig(ADC3, ADC_Channel_8, 11, ADC_SampleTime_15Cycles);  // AC OUT line

  ADC_DMARequestAfterLastTransferCmd(ADC1, ENABLE);
  ADC_DMARequestAfterLastTransferCmd(ADC2, ENABLE);
  ADC_DMARequestAfterLastTransferCmd(ADC3, ENABLE);


  // ---- DM2 configuration
  // clock to DMA2
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_DMA2, ENABLE);

  // Configure the DMA == Configure DMA2 - Stream 4 for ADC1
  DMA_InitTypeDef DMA_InitStructure;
  DMA_DeInit(DMA2_Stream4);  //Set DMA registers to default values

  DMA_InitStructure.DMA_Channel = DMA_Channel_0;
  DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t) &ADC1->DR; // Source address
  DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t) g_nADC1Values; // Destination address
  DMA_InitStructure.DMA_DIR = DMA_DIR_PeripheralToMemory;
  DMA_InitStructure.DMA_BufferSize = adc1_max; 									// Buffer size
  DMA_InitStructure.DMA_PeripheralInc = DMA_PeripheralInc_Disable;
  DMA_InitStructure.DMA_MemoryInc = DMA_MemoryInc_Enable;
  DMA_InitStructure.DMA_PeripheralDataSize = DMA_PeripheralDataSize_HalfWord; // source size - 16bit
  DMA_InitStructure.DMA_MemoryDataSize = DMA_MemoryDataSize_HalfWord; // destination size = 16b
  DMA_InitStructure.DMA_Mode = DMA_Mode_Circular;   // neni potreba obnovovat buffer pointer
  DMA_InitStructure.DMA_Priority = DMA_Priority_High;
  DMA_InitStructure.DMA_FIFOMode = DMA_FIFOMode_Disable;
  DMA_InitStructure.DMA_FIFOThreshold = DMA_FIFOThreshold_HalfFull;
  DMA_InitStructure.DMA_MemoryBurst = DMA_MemoryBurst_Single;
  DMA_InitStructure.DMA_PeripheralBurst = DMA_PeripheralBurst_Single;

  DMA_Init(DMA2_Stream4, &DMA_InitStructure); 		// Initialize the DMA
  DMA_Cmd(DMA2_Stream4, ENABLE); 									// Enable the DMA2 - Stream 4

  ADC_DMACmd(ADC1, ENABLE);             // Enable ADC1 DMA
  ADC_Cmd(ADC1, ENABLE);                // Enable ADC1

  // Configure DMA2 - Channel 1 Stream 2 for ADC2
  DMA_InitStructure.DMA_Channel = DMA_Channel_1;
  DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t) &ADC2->DR; // Source address
  DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t) g_nADC2Values; // Destination address
  DMA_InitStructure.DMA_BufferSize = adc2_max;            // Buffer size
  DMA_Init(DMA2_Stream2, &DMA_InitStructure);             // Initialize the DMA
  DMA_Cmd(DMA2_Stream2, ENABLE);                  // Enable the DMA2 - Stream 4

  ADC_DMACmd(ADC2, ENABLE);             // Enable ADC2 DMA
  ADC_Cmd(ADC2, ENABLE);                // Enable ADC2

  // Configure DMA2 - Stream 1 for ADC3
  DMA_InitStructure.DMA_Channel = DMA_Channel_2;
  DMA_InitStructure.DMA_PeripheralBaseAddr = (uint32_t) &ADC3->DR; // Source address
  DMA_InitStructure.DMA_Memory0BaseAddr = (uint32_t) g_nADC3Values; // Destination address
  DMA_InitStructure.DMA_BufferSize = adc3_max;            // Buffer size
  DMA_Init(DMA2_Stream1, &DMA_InitStructure);             // Initialize the DMA
  DMA_Cmd(DMA2_Stream1, ENABLE);                  // Enable the DMA2 - Stream 4

  ADC_DMACmd(ADC3, ENABLE);             // Enable ADC1 DMA
  ADC_Cmd(ADC3, ENABLE);                // Enable ADC1

  // povoleni preruseni pro DMA
  NVIC_InitTypeDef NVIC_InitStructure;
  NVIC_InitStructure.NVIC_IRQChannel = DMA2_Stream4_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 4;
  NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
  NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
  NVIC_Init(&NVIC_InitStructure);

  DMA_ITConfig(DMA2_Stream4, DMA_IT_TC, ENABLE);// DMA transfer complete interrupt enable

  NVIC_InitStructure.NVIC_IRQChannel = DMA2_Stream2_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 4;
  NVIC_Init(&NVIC_InitStructure);

  DMA_ITConfig(DMA2_Stream2, DMA_IT_TC, ENABLE);// DMA transfer complete interrupt enable

  NVIC_InitStructure.NVIC_IRQChannel = DMA2_Stream1_IRQn;
  NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 4;
  NVIC_Init(&NVIC_InitStructure);

  DMA_ITConfig(DMA2_Stream1, DMA_IT_TC, ENABLE);// DMA transfer complete interrupt enable

  Adc095_TIM_Configuration();

  ADC_SoftwareStartConv(ADC1);						// Start ADC1 conversion
}

void Adc095_TIM_Configuration(void) {
  // pro spousteni AD prevodu lze pouzit casovace TIM1,2,3,4,5,8 (viz EXTSEL registru CR2)
  // pouzijeme TIM4 CH4

  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM4, ENABLE);

  TIM_TimeBaseInitTypeDef TIM_TimeBaseStructure;

  /* Time base configuration */
  uint32_t nPeriod = (84000000 / ADC_TIM_PRESCALER / 1000) - 1; // 1 KHz one sample, from 84 MHz TIM4CLK (DIV_APB1=4 then TIMCLK = APB1*2)
  TIM_TimeBaseStructInit(&TIM_TimeBaseStructure);
  TIM_TimeBaseStructure.TIM_Period = nPeriod;
  TIM_TimeBaseStructure.TIM_Prescaler = ADC_TIM_PRESCALER;
  TIM_TimeBaseStructure.TIM_ClockDivision = TIM_CKD_DIV1;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
  TIM_TimeBaseStructure.TIM_RepetitionCounter = 0x00;
  TIM_TimeBaseInit(TIM4, &TIM_TimeBaseStructure);

  TIM_OCInitTypeDef TIM_OCInitStructure;
  TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM1;
  TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
  TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Disable;
  TIM_OCInitStructure.TIM_Pulse = nPeriod / 2; // 50/50 duty
  TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_High;
  TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
  TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Reset;
  TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;
  TIM_OC4Init(TIM4, &TIM_OCInitStructure);

  /* TIM4 TRGO selection */
	TIM_SelectOutputTrigger(TIM4, TIM_TRGOSource_OC4Ref); // ADC_ExternalTrigConv_T4_OC4

  DBGMCU_APB2PeriphConfig(DBGMCU_TIM4_STOP, ENABLE);

  /* TIM4 enable counter */
  TIM_Cmd(TIM4, ENABLE);
}

// after group scan of ADC1
void DMA2_Stream4_IRQHandler(void)
{
  DMA_ClearITPendingBit(DMA2_Stream4, DMA_FLAG_TCIF4);

  g_nCycleCounter++;
  if (g_nCycleCounter > 1000)
  {
    ADC_SoftwareStartConv(ADC3);
    g_nCycleCounter = 0;
  }
}


// after group scan of ADC2
void DMA2_Stream2_IRQHandler(void)
{
  DMA_ClearITPendingBit(DMA2_Stream2, DMA_FLAG_TCIF1);
}

// after group scan of ADC3
void DMA2_Stream1_IRQHandler(void)
{
  DMA_ClearITPendingBit(DMA2_Stream1, DMA_FLAG_TCIF1);
}

// ------ Funkce pro výpoèet naskenovaných hodnot ----------------

uint32_t Adc095_GetAngleM1()
{
  return (uint32_t)g_nADC1Values[adc1_angleM1] * ADC_REFERENCE_UNIT_UV;
}

uint32_t Adc095_GetAngleM2()
{
  return (uint32_t)g_nADC2Values[adc2_angleM2] * ADC_REFERENCE_UNIT_UV;
}

int32_t Adc095_GetCurrentM1_mA()
{
  return (uint32_t)g_nADC1Values[adc1_current_M1] * ADC_REFERENCE_UNIT_UV;
}

int32_t Adc095_GetCurrentM2_mA()
{
  return (uint32_t)g_nADC2Values[adc2_current_M2] * ADC_REFERENCE_UNIT_UV;
}

uint32_t Adc095_GetUdc_mV()
{
  // ADC * 0.152523 <-> ADC / 6.5564
  // rozliseni 0,1 V
  return (uint32_t)g_nADC1Values[adc1_udc] * 100000 / 65564 * 100;
}

// vraci teplotu MCU v rozliseni 0.1 C
int16_t Adc095_GetTempMCU_C()
{
  // Temperature (in °C) = {(VSENSE – V25) / Avg_Slope} + 25
  return (int16_t) ((int32_t) g_nADC1Values[adc1_temp_internal] * ADC_REFERENCE_UNIT_UV - 760000) / 250 + 250;
}

uint32_t Adc095_GetAcLineIn_mV()
{
  // 145.71
  uint32_t value = g_nADC3Values[adc3_ac_in_line];

  // odecist stredni stejnosmernou hodnotu, zabranit podteceni
  value -= MIN(value, 0x800);
  return value * ADC_REFERENCE_UNIT_UV / 1000 * 14571 / 100;  // mV
}

uint32_t Adc095_GetAcLineOut_mV()
{
  // 145.71
  uint32_t value = g_nADC3Values[adc3_ac_out_line];

  // odecist stredni stejnosmernou hodnotu, zabranit podteceni
  value -= MIN(value, 0x800);
  return value * ADC_REFERENCE_UNIT_UV / 1000 * 14571 / 100;  // mV
}

uint32_t Adc095_GetAdaptor_mV()
{
  // ADC * 0.008877 <-> ADC / 112.65
  return g_nADC3Values[adc3_gen_adaptor] * 100000 / 11265;
}

int16_t Adc095_GetTempM1_C()
{
  // g_nADCConvertedValue[adc_in_temp_motor1]
  return 241;
}

int16_t Adc095_GetTempM2_C()
{
  // g_nADCConvertedValue[adc_in_temp_motor2]
  return 286;
}

uint32_t Adc095_GetBrakeCurrent_mA()
{
  uint32_t value = 0; // g_nAdcMuxValue[adc_mux_brake];

  // I = U / 1.423
  return value * ADC_REFERENCE_UNIT_UV / 1423;
}

uint32_t Adc095_GetPFC_mV()
{
  // ADC * 0.0046 <-> ADC / 217.39
  return g_nADC3Values[adc3_pfc_fan] * 100000 / 21739;
}

//---------------------------------------------------

// vraci teplotu PCB generu v rozliseni 0.1 C
int16_t Adc095_GetTempGener_C()
{
//   g_nADCConvertedValue[adc_in_temp_gener]
  return 251;
}

uint32_t Adc095_GetFan1Current_mA()
{
  uint32_t value = 0; // g_nAdcMuxValue[adc_mux_fan1];

  // I = U/R;  R= 0.1 Ohm
  // vstupuji uV, vydelit o zesileni komparatoru, vysledek mA
  return value * ADC_REFERENCE_UNIT_UV / 100 / 148;
}

uint32_t Adc095_GetFan2Current_mA()
{
  uint32_t value = 0; // g_nAdcMuxValue[adc_mux_fan2];

  // I = U/R;  R= 0.1 Ohm
  // vstupuji uV, vydelit o zesileni komparatoru, vysledek mA
  return value * ADC_REFERENCE_UNIT_UV / 100 / 148;
}
