/**
* @file    SPIRIT1_Util.c
* @author  High End Analog & RF BU - AMS / ART Team Systems Lab
* @version V3.1.0
* @date    November 19, 2012
* @brief   Identification functions for SPIRIT DK.
* @attention
*
* <h2><center>&copy; COPYRIGHT(c) 2015 STMicroelectronics</center></h2>
*
* Redistribution and use in source and binary forms, with or without modification,
* are permitted provided that the following conditions are met:
*   1. Redistributions of source code must retain the above copyright notice,
*      this list of conditions and the following disclaimer.
*   2. Redistributions in binary form must reproduce the above copyright notice,
*      this list of conditions and the following disclaimer in the documentation
*      and/or other materials provided with the distribution.
*   3. Neither the name of STMicroelectronics nor the names of its contributors
*      may be used to endorse or promote products derived from this software
*      without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "SPIRIT1_Util.h"

/**
* @defgroup SPIRIT1_Util_Private_Macros                 SPIRIT1_Util Private Macros
* @{
*/
#define XTAL_FREQUENCY          50000000
#define SPIRIT_VERSION          SPIRIT_VERSION_3_0
#define RANGE_TYPE              RANGE_EXT_NONE       /*RANGE_EXT_SKYWORKS*/
/**
* @}
*/

/**
* @brief A map that contains the SPIRIT version
*/
const SpiritVersionMap xSpiritVersionMap[] =
{
  /* The Control Board frame handler functions */
  {CUT_2_1v4, SPIRIT_VERSION_2_1},
  {CUT_2_1v3, SPIRIT_VERSION_2_1},
  {CUT_3_0, SPIRIT_VERSION_3_0},
};
static RangeExtType xRangeExtType = RANGE_EXT_NONE;
static uint8_t s_RfModuleBand = 0;
static uint8_t s_eeprom = 0;

/**
* @defgroup SPIRIT1_Util_Private_Functions              SPIRIT1_Util Private Functions
* @{
*/

/**
* @brief  Identifies the SPIRIT1 Xtal frequency and version.
* @param  None
* @retval Status
*/
void SpiritManagementIdentificationRFBoard(void)
{
  do {
    /* Delay for state transition */
    for(volatile uint8_t i=0; i!=0xFF; i++);
    
    /* Reads the MC_STATUS register */
    SpiritRefreshStatus();
  } while(g_xStatus.MC_STATE != MC_STATE_READY);

  SpiritRadioSetXtalFrequency(XTAL_FREQUENCY);
//  SpiritGeneralSetSpiritVersion(SPIRIT_VERSION);
}

/**
* @brief  Sets the SPIRIT frequency band
* @param  uint8_t value: RF FREQUENCY
* @retval None
*/
void SpiritManagementSetBand(uint8_t value)
{
  s_RfModuleBand = value;
}


/**
* @brief  returns the SPIRIT frequency band
* @param  None
* @retval uint8_t value: RF FREQUENCY
*/
uint8_t SpiritManagementGetBand(void)
{
  return s_RfModuleBand;
}

/**
* @brief  returns the spirit1 range extender type
* @param  None
* @retval RangeExtType
*/
RangeExtType SpiritManagementGetRangeExtender(void)
{
  return xRangeExtType;
}

/**
* @brief  Sets the spirit1 range extender type
* @param  RangeExtType
* @retval None
*/
void SpiritManagementSetRangeExtender(RangeExtType xRangeType)
{
  xRangeExtType = xRangeType;
}

/**
* @brief  this function returns the value to indicate that EEPROM is present or not
* @param  None
* @retval uint8_t: 0 or 1
*/
uint8_t SdkEvalGetHasEeprom(void)
{
  return s_eeprom;
}

/**
* @brief  this function setc the value to indicate that EEPROM is present or not
* @param  None
* @retval uint8_t: 0 or 1
*/
void SdkEvalSetHasEeprom(uint8_t eeprom)
{
  s_eeprom = eeprom;
}

/**
* @brief  this function intializes the spirit1 gpio irq for TX and Rx
* @param  None
* @retval None
*/
void Spirit1GpioIrqInit(SGpioInit *pGpioIRQ)
{
  /* Spirit IRQ config */
  SpiritGpioInit(pGpioIRQ);
}

/**
* @brief  this function used to receive RX packet
* @param  None
* @retval None
*/
void Spirit1RadioInit(SRadioInit *pRadioInit)
{    
  /* Spirit Radio config */
  SpiritRadioInit(pRadioInit);

}

/**
* @brief  this function sets the radio power
* @param  uint8_t cIndex, float fPowerdBm
* @retval None
*/
void Spirit1SetPower(uint8_t cIndex, float fPowerdBm)
{
  /* Spirit Radio set power */
  SpiritRadioSetPALeveldBm(cIndex,fPowerdBm);
  SpiritRadioSetPALevelMaxIndex(cIndex);
}

/**
* @brief  this function sets the payload length
* @param  uint8_t length
* @retval None
*/
void Spirit1SetPayloadlength(uint8_t length)
{
#if defined(USE_STack_PROTOCOL)
    /* Payload length config */
  SpiritPktStackSetPayloadLength(length);
  
#elif defined(USE_BASIC_PROTOCOL)
  /* payload length config */
  SpiritPktBasicSetPayloadLength(length);
#endif
}

/**
* @brief  this function sets the destination address
* @param  uint8_t adress
* @retval None
*/
void Spirit1SetDestinationAddress(uint8_t address)
{
#if defined(USE_STack_PROTOCOL)
  /* Destination address */
  SpiritPktStackSetDestinationAddress(address);
#elif defined(USE_BASIC_PROTOCOL)
  /* destination address */
  SpiritPktBasicSetDestinationAddress(address);
#endif
}

/**
* @brief  this function enables the Tx IRQ
* @param  None
* @retval None
*/
void Spirit1EnableTxIrq(void)
{
  /* Spirit IRQs enable */
  SpiritIrq(TX_DATA_SENT, S_ENABLE); 
#if defined(USE_STack_LLP)
  SpiritIrq(MAX_RE_TX_REACH, S_ENABLE);
#endif  
}

/**
* @brief  this function enables the Rx IRQ
* @param  None
* @retval None
*/
void Spirit1EnableRxIrq(void)
{
    /* Spirit IRQs enable */
  SpiritIrq(RX_DATA_READY, S_ENABLE);
  SpiritIrq(RX_DATA_DISC, S_ENABLE); 
  SpiritIrq(RX_TIMEOUT, S_ENABLE);
}

/**
* @brief  this function disable IRQs
* @param  None
* @retval None
*/
void Spirit1DisableIrq(void)
{
  /* Spirit IRQs enable */
  SpiritIrqDeInit(NULL);
}
/**
* @brief  this function set the receive timeout period
* @param  None
* @retval None
*/
void Spirit1SetRxTimeout(float cRxTimeOut)
{
  if(cRxTimeOut == 0)
  {
    /* rx timeout config */
    SET_INFINITE_RX_TIMEOUT();
    SpiritTimerSetRxTimeoutStopCondition(ANY_ABOVE_THRESHOLD);
  }
  else
  {
    /* RX timeout config */
    SpiritTimerSetRxTimeoutMs(cRxTimeOut);
    Spirit1EnableSQI();
    SpiritTimerSetRxTimeoutStopCondition(RSSI_AND_SQI_ABOVE_THRESHOLD);  }
}

/**
* @brief  this function sets the RSSI threshold
* @param  int dbmValue
* @retval None
*/
void Spirit1SetRssiTH(int dbmValue)
{
  SpiritQiSetRssiThresholddBm(dbmValue);
}

/**
* @brief  this function sets the RSSI threshold
* @param  int dbmValue
* @retval None
*/
float Spirit1GetRssiTH(void)
{
  float dbmValue=0;
  dbmValue = SpiritQiGetRssidBm();
  return dbmValue;
}

/**
* @brief  this function enables SQI check
* @param  None
* @retval None
*/
void Spirit1EnableSQI(void)
{
  /* enable SQI check */
  SpiritQiSetSqiThreshold(SQI_TH_0);
  SpiritQiSqiCheck(S_ENABLE);
}

/**
* @brief  this function starts the RX process
* @param  None
* @retval None
*/
void Spirit1StartRx(void)
{
  if(g_xStatus.MC_STATE == MC_STATE_RX)
  {
    SpiritCmdStrobeSabort();
  }
  /* RX command */
  SpiritCmdStrobeRx();
}

/**
* @brief  this function receives the data
* @param  None
* @retval None
*/
void Spirit1GetRxPacket(uint8_t *buffer, uint8_t *cRxData )
{
  uint8_t noofbytes = 0;
  /* when rx data ready read the number of received bytes */
  *cRxData = SpiritLinearFifoReadNumElementsRxFifo();
  noofbytes = *cRxData;
    /* read the RX FIFO */
  SpiritSpiReadLinearFifo(noofbytes, buffer);
  
  SpiritCmdStrobeFlushRxFifo();
}

/**
* @brief  this function starts the TX process
* @param  None
* @retval None
*/
void Spirit1StartTx(uint8_t *buffer, uint8_t size )
{
  if(g_xStatus.MC_STATE==MC_STATE_RX)
  {
    SpiritCmdStrobeSabort();
  }
  /* fit the TX FIFO */
  SpiritCmdStrobeFlushTxFifo();
  
  SpiritSpiWriteLinearFifo(size, buffer);
  
  /* send the TX command */
  SpiritCmdStrobeTx();
}

/**
* @brief  this function clear the IRQ status
* @param  None
* @retval None
*/
void Spirit1ClearIRQ(void)
{
  SpiritIrqClearStatus();
}

/******************* (C) COPYRIGHT 2015 STMicroelectronics *****END OF FILE****/
