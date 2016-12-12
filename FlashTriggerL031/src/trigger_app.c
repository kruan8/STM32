/*
 * spirit1_app.c
 *
 *  Created on: 21. 6. 2016
 *      Author: priesolv
 */

#include "trigger_app.h"
#include "SPIRIT1_Util.h"
#include "spirit_spi.h"
#include "timer.h"
#include "spirit.h"
#include "Gpio_utility.h"
#include "Eeprom.h"

#include <string.h>

/**
* @brief GPIO structure fitting
*/
SGpioInit xGpioIRQ =
{
  SPIRIT_GPIO_3,
  SPIRIT_GPIO_MODE_DIGITAL_OUTPUT_LP,
  SPIRIT_GPIO_DIG_OUT_IRQ
};

/**
* @brief Radio structure fitting
*/
SRadioInit xRadioInit =
{
  XTAL_OFFSET_PPM,
  BASE_FREQUENCY,
  CHANNEL_SPACE,
  CHANNEL_NUMBER,
  MODULATION_SELECT,
  DATARATE,
  FREQ_DEVIATION,
  BANDWIDTH
};


/**
* @brief Packet Basic structure fitting
*/
PktBasicInit xBasicInit =
{
  PREAMBLE_LENGTH,
  SYNC_LENGTH,
  SYNC_WORD,
  LENGTH_TYPE,
  LENGTH_WIDTH,
  CRC_MODE,
  CONTROL_LENGTH,
  EN_ADDRESS,
  EN_FEC,
  EN_WHITENING
};

/**
* @brief Address structure fitting
*/
PktBasicAddressesInit xAddressInit =
{
  EN_FILT_MY_ADDRESS,
  MY_ADDRESS,
  EN_FILT_MULTICAST_ADDRESS,
  MULTICAST_ADDRESS,
  EN_FILT_BROADCAST_ADDRESS,
  BROADCAST_ADDRESS
};

#define CHECK_INTERVAL_MS    1000

#define FLASH_LIMIT                      2

#define STD_OFF_INTERVAL_MS         (1000*60*20)  // 20 minut
#define PRG_OFF_INTERVAL_MS         (1000*60*1)   // 1 minuta

#define EEPROM_STORAGE1       0
#define EEPROM_STORAGE2       (EEPROM_STORAGE1 + sizeof(uint32_t))

uint8_t aCheckBroadcast[] = {'C','H','E','C','K'};
uint8_t aFlashBroadcast[] = {'F','L','A','S','H'};
uint8_t RxBuffer[MAX_BUFFER_LEN];

SpiritIrqs xIrqStatus;

volatile FlagStatus xRxDoneFlag = RESET;
volatile FlagStatus xTxDoneFlag = RESET;
volatile FlagStatus cmdFlag = RESET;
volatile FlagStatus xStartRx = RESET;
volatile FlagStatus rx_timeout = RESET;
volatile FlagStatus exitTime = RESET;

uint16_t exitCounter = 0;
uint8_t TxFrameBuff[MAX_BUFFER_LEN];

AppState_t g_eState = APP_STATE_IDLE;

uint8_t g_Master = 0;

uint16_t g_nOptoValue;

volatile bool g_bFlashFlag;          // detekovan zablesk
volatile bool g_bFlashEnable;

// TODO: odmerovani asi vyhodit, uz je vyreseno v SysTicks
volatile uint16_t g_nDelayTimer;    // odmerovani intervalu
volatile bool g_bDelayOver;

volatile uint16_t g_nTimeCounter;
volatile bool g_bTimeCounterStop;         // spinac citace

uint16_t g_nFlash1;
uint16_t g_nFlash2;
uint16_t g_nFlash3;

void App_Exec(void)
{
  uint8_t nLength;
  static uint32_t nLastCheckTime = 0;

  /*float rRSSIValue = 0;*/

  switch(g_eState)
  {
  case APP_STATE_PROG:
    Programming();
    break;

  case APP_STATE_MANUAL_TRIGGER:
      break;

  case APP_STATE_START_RX:
    {
      AppliReceiveBuff(RxBuffer, MAX_BUFFER_LEN);
      /* wait for data received or timeout period occured */
      g_eState = APP_STATE_WAIT_FOR_RX_DONE;
    }
    break;

  case APP_STATE_WAIT_FOR_RX_DONE:
    if((RESET != xRxDoneFlag)||(RESET != rx_timeout)||(SET != exitTime))
    {
      if((rx_timeout == SET)||(exitTime == RESET))
      {
        rx_timeout = RESET;
        g_eState = APP_STATE_START_RX;
      }
      else if(xRxDoneFlag)
      {
        xRxDoneFlag = RESET;
        g_eState = APP_STATE_DATA_RECEIVED;
      }
    }
    break;

  case APP_STATE_DATA_RECEIVED:
    {
      Spirit1GetRxPacket(RxBuffer, &nLength);
      /*rRSSIValue = Spirit1GetRssiTH();*/

      if (memcmp(RxBuffer, aCheckBroadcast, sizeof (aCheckBroadcast)) == 0)
      {
        g_eState = APP_STATE_START_RX;
        Gpio_LedBlink(50);
      }
      else if (memcmp(RxBuffer, aFlashBroadcast, sizeof (aFlashBroadcast)) == 0)
      {
        Gpio_FlashBlink();
        SetOffInterval(STD_OFF_INTERVAL_MS);
      }
    }
    break;

  case APP_STATE_SEND_CHECK:
    {
      Gpio_LedBlink(100);
      AppliSendBuff(aCheckBroadcast, sizeof (aCheckBroadcast));
      g_eState = APP_STATE_WAIT_FOR_TX_DONE;
    }
    break;

  case APP_STATE_SEND_FLASH:
      AppliSendBuff(aFlashBroadcast, sizeof (aFlashBroadcast));
      g_eState = APP_STATE_WAIT_FOR_TX_DONE;
    break;

  case APP_STATE_WAIT_FOR_TX_DONE:
  /* wait for TX done */
    if(xTxDoneFlag)
    {
      xTxDoneFlag = RESET;
      g_eState = APP_STATE_IDLE;
    }
    break;

  case APP_STATE_IDLE:
    if (g_Master)
    {
      if (nLastCheckTime + CHECK_INTERVAL_MS < GetTicks_ms())
      {
        g_eState = APP_STATE_SEND_CHECK;
        nLastCheckTime = GetTicks_ms();
      }
    }

#if defined(USE_LOW_POWER_MODE)
    Enter_LP_mode();
#endif
    break;
  }

  if (GetOffTime() == 0)
  {
    Gpio_StandbyMode();
  }

  if (Gpio_IsButtonPressed_ms())
  {
    while (!Gpio_IsButtonPressed_ms());
    Gpio_Off();
  }
}

void App_Init(void)
{
  TimerInit();

  Gpio_Init();
  Spirit_Init(OnSpiritInterruptHandler);

  SetOffInterval(STD_OFF_INTERVAL_MS);

  g_Master = Gpio_IsMaster();

  SPIspirit_init();

  /* Board management */
  Spirit_EnterShutdown();
  Spirit_ExitShutdown();

  uint8_t v;
  StatusBytes sb;
  sb = SpiritSpiReadRegisters(DEVICE_INFO1_PARTNUM, 1, &v);
  sb = SpiritSpiReadRegisters(DEVICE_INFO0_VERSION, 1, &v);

  SpiritManagementIdentificationRFBoard();
  Spirit1GpioIrqInit(&xGpioIRQ); // Spirit IRQ config

  // Todo: !!! po nastaveni registru by se mela udelat VCO kalibrace!!!
  //https://my.st.com/public/STe2ecommunities/interface/Lists/Low%20Power%20RF%20Solutions/DispForm.aspx?ID=696&RootFolder=%2fpublic%2fSTe2ecommunities%2finterface%2fLists%2fLow%20Power%20RF%20Solutions%2fSPIRIT1%20yet%20another%20can%27t%20get%20to%20Rx%20problem&Source=https%3A%2F%2Fmy%2Est%2Ecom%2Fpublic%2FSTe2ecommunities%2Finterface%2FLists%2FLow%2520Power%2520RF%2520Solutions%2FAllItems%2Easpx%3FRootFolder%3D%252fpublic%252fSTe2ecommunities%252finterface%252fLists%252fLow%2520Power%2520RF%2520Solutions%252fSPIRIT1%2520yet%2520another%2520can%2527t%2520get%2520to%2520Rx%2520problem%26FolderCTID%3D0x0107009D947151ED1E46C998F5DFE02DFA735600F512522A73A5B4479728569A6F8E9913%26View%3D%257b9E4E3322%252dEA51%252d4610%252d85FF%252dF7E487351A95%257d
  Spirit_InitRegs();// Spirit Radio config

  Spirit_SetPowerRegs();  // Spirit Radio set power
//  Spirit_ProtocolInitRegs();  // Spirit Packet config

  BasicProtocolInit();

  Spirit_EnableSQIRegs();
  Spirit_SetRssiTHRegs();

  g_eState = APP_STATE_START_RX;

  // pro master nakonfigurovat optodiodu
  if (g_Master)
  {
    Gpio_OptoInit(ADCGetConv);
    g_eState = APP_STATE_IDLE;
  }

  // cekat na uvolneni tlacitka
  uint16_t nTime = 1;
  while (nTime)
  {
    nTime = Gpio_IsButtonPressed_ms();

    // pokud je master, zjistovat rezimy podle delky stisku tlacitka
    if (g_Master)
    {
      if (nTime > 1000)
      {
        g_eState = APP_STATE_MANUAL_TRIGGER;
      }

      if (nTime > 3000)
      {
        g_eState = APP_STATE_PROG;
      }
    }

    if (!Gpio_IsButtonPressed_ms())
    {
      break;
    }
  }

  g_nTimeCounter = 0;
  g_bTimeCounterStop = false;
  g_bDelayOver = false;
  g_bFlashFlag = false;

  g_bFlashEnable = false;

  // pockat na ustaleni svetelne hodnoty
  Delay_ms(20);

  g_bFlashEnable = true;
  g_nFlash1 = Eeprom_ReadUint32(EEPROM_STORAGE1);
  g_nFlash2 = Eeprom_ReadUint32(EEPROM_STORAGE2);

  Spirit_EnableIRQ();
}

void Programming()
{
  bool bTimeOver = false;

  g_nFlash1 = 0;
  g_nFlash2 = 0;
  SetOffInterval(PRG_OFF_INTERVAL_MS);

  // pocitani zablesku
  while (true)
  {
    g_nTimeCounter = 0;
    g_bTimeCounterStop = false;

    while (!g_bFlashFlag)
    {
      if (Gpio_IsButtonPressed_ms())
      {
        // testovaci zablesk a vypnout
        Gpio_Off();
      }

      if (!GetOffTime())
      {
        Gpio_StandbyMode();
      }

      if (g_nFlash2 && g_bTimeCounterStop)
      {
        // je min 1 zablesk a vyprsel cas
        bTimeOver = true;
        break;
      }
    }

    if (bTimeOver)
    {
      break;
    }

    g_bTimeCounterStop = true;
    g_nFlash2 = g_nFlash1;
    g_nFlash1 = g_nTimeCounter;

    // wait 5ms pro odezneni zablesku
    uint32_t time = GetTicks_ms();
    while ((GetTicks_ms() - time) < 5);
    g_bFlashFlag = false;
  }

  // ulozit data
  Eeprom_UnlockPELOCK();
  Eeprom_WriteUint32(EEPROM_STORAGE1, g_nFlash1);
  Eeprom_WriteUint32(EEPROM_STORAGE2, g_nFlash2);
  Eeprom_LockNVM();

  // pokud g_nFlash2 == 0, neni interval (1 zablesk)
  // prehodit g_nFlash2 <-> g_nFlash1

}

/**
* @brief  This function handles the point-to-point packet transmission
* @param  AppliFrame_t *xTxFrame = Pointer to AppliFrame_t structure
*         uint8_t cTxlen = Length of aTransmitBuffer
* @retval None
*/
void AppliSendBuff(uint8_t* pBuffer, uint8_t nLength)
{
  PktBasicAddressesInit xAddressInit=
  {
    .xFilterOnMyAddress = S_DISABLE,
    .cMyAddress = MY_ADDRESS,
    .xFilterOnMulticastAddress = S_DISABLE,
    .cMulticastAddress = MULTICAST_ADDRESS,
    .xFilterOnBroadcastAddress = S_DISABLE,
    .cBroadcastAddress = BROADCAST_ADDRESS
  };

  SpiritPktBasicAddressesInit(&xAddressInit);

  memcpy(TxFrameBuff, pBuffer, nLength);
//  for(uint8_t i = 0; i < nLength; i++)
//  {
//    TxFrameBuff[i] = pBuffer[i];
//  }

  // Spirit IRQs disable
  Spirit_DisableIRQ();

  // Spirit IRQs enable
  Spirit1EnableTxIrq();

  // payload length config
  Spirit1SetPayloadlength(nLength);

  // rx timeout config
  Spirit1SetRxTimeout(RECEIVE_TIMEOUT);

  // IRQ registers blanking
  Spirit1ClearIRQ();

  // destination address
  Spirit1SetDestinationAddress(DESTINATION_ADDRESS);

  // send the TX command
  Spirit1StartTx(TxFrameBuff, nLength);

}


/**
* @brief  This function handles the point-to-point packet reception
* @param  uint8_t *RxFrameBuff = Pointer to ReceiveBuffer
*         uint8_t cRxlen = length of ReceiveBuffer
* @retval None
*/
void AppliReceiveBuff(uint8_t *RxFrameBuff, uint8_t cRxlen)
{
  /*float rRSSIValue = 0;*/
  exitTime = SET;
  exitCounter = TIME_TO_EXIT_RX;

//  PktBasicAddressesInit xAddressInit=
//  {
//    .xFilterOnMyAddress = S_DISABLE,
//    .cMyAddress = MY_ADDRESS,
//    .xFilterOnMulticastAddress = S_DISABLE,
//    .cMulticastAddress = MULTICAST_ADDRESS,
//    .xFilterOnBroadcastAddress = S_ENABLE,
//    .cBroadcastAddress = BROADCAST_ADDRESS
//  };
//
//  SpiritPktBasicAddressesInit(&xAddressInit);

  /* Spirit IRQs disable */
  Spirit1DisableIrq();

  /* Spirit IRQs enable */
  Spirit1EnableRxIrq();

  /* payload length config */
  Spirit1SetPayloadlength(PAYLOAD_LEN);

  // rx timeout config
  Spirit1SetRxTimeout(RECEIVE_TIMEOUT);

  // destination address
  Spirit1SetDestinationAddress(DESTINATION_ADDRESS);

  // IRQ registers blanking
  Spirit1ClearIRQ();

  // RX command
  Spirit1StartRx();
}

/** @brief  This function initializes the BASIC Packet handler of spirit1
* @param  None
* @retval None
*/
void BasicProtocolInit(void)
{
  PktBasicInit xBasicInit=
  {
    .xPreambleLength = PREAMBLE_LENGTH,
    .xSyncLength = SYNC_LENGTH,
    .lSyncWords = SYNC_WORD,
    .xFixVarLength = LENGTH_TYPE,
    .cPktLengthWidth = LENGTH_WIDTH,
    .xCrcMode = CRC_MODE,
    .xControlLength = CONTROL_LENGTH,
    .xAddressField = S_ENABLE,
    .xFec = EN_FEC,
    .xDataWhitening = EN_WHITENING
  };

  // Spirit Packet config
  SpiritPktBasicInit(&xBasicInit);

  PktBasicAddressesInit xAddressInit=
  {
    .xFilterOnMyAddress = S_DISABLE,
    .cMyAddress = MY_ADDRESS,
    .xFilterOnMulticastAddress = S_DISABLE,
    .cMulticastAddress = MULTICAST_ADDRESS,
    .xFilterOnBroadcastAddress = S_DISABLE,
    .cBroadcastAddress = BROADCAST_ADDRESS
  };

  SpiritPktBasicAddressesInit(&xAddressInit);
  SpiritPktBasicSetFormat();
}

/**
* @brief  This function handles External interrupt request. In this application it is used
*         to manage the Spirit IRQ configured to be notified on the Spirit GPIO_3.
* @param  None
* @retval None
*/
void OnSpiritInterruptHandler(void)
{
  SpiritIrqGetStatus(&xIrqStatus);

  /* Check the SPIRIT TX_DATA_SENT IRQ flag */
  if(xIrqStatus.IRQ_TX_DATA_SENT || xIrqStatus.IRQ_MAX_RE_TX_REACH)
  {
    xTxDoneFlag = SET;
  }

  /* Check the SPIRIT RX_DATA_READY IRQ flag */
  if((xIrqStatus.IRQ_RX_DATA_READY))
  {
    xRxDoneFlag = SET;
  }

  /* Restart receive after receive timeout*/
  if (xIrqStatus.IRQ_RX_TIMEOUT)
  {
    rx_timeout = SET;
    SpiritCmdStrobeRx();
  }
  /* Check the SPIRIT RX_DATA_DISC IRQ flag */
  if(xIrqStatus.IRQ_RX_DATA_DISC)
  {
    /* RX command - to ensure the device will be ready for the next reception */
    SpiritCmdStrobeRx();
  }
}

void FlashActive()
{
  g_eState = APP_STATE_SEND_FLASH;
  SetOffInterval(STD_OFF_INTERVAL_MS);
}

void ADCGetConv(uint16_t ADCValue)
{
  /* Get ADC1 converted data */
  ADCValue = ADCValue >> 4;

  if (ADCValue == g_nOptoValue)
  {
    return;
  }
  else if (ADCValue > g_nOptoValue)
  {
    g_nOptoValue++;
    if (g_bFlashEnable)
    {
      if (ADCValue > (g_nOptoValue + FLASH_LIMIT))
      {
        g_bFlashFlag = true;
        Gpio_FlashBlink();
        return;
      }
    }
  }
  else if (ADCValue < g_nOptoValue && g_nOptoValue)
  {
    g_nOptoValue--;
  }

  if (!g_bTimeCounterStop)
  {
    g_nTimeCounter++;
    if (g_nTimeCounter == 0)
    {
      g_bTimeCounterStop = true;
    }
  }

  if (!g_bDelayOver)
  {
    g_nDelayTimer--;
    if (g_nDelayTimer == 0)
    {
      g_bDelayOver = true;
    }
  }

}


