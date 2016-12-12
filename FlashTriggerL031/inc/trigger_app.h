/*
 * spirit1_app.h
 *
 *  Created on: 21. 6. 2016
 *      Author: priesolv
 */

#ifndef SPIRIT1_APP_H_
#define SPIRIT1_APP_H_

#include "stm32l0xx.h"
#include "SPIRIT_Config.h"

/* Exported constants --------------------------------------------------------*/

/*  Radio configuration parameters  */
#define XTAL_OFFSET_PPM             0
#define INFINITE_TIMEOUT            0.0

//#ifdef USE_SPIRIT1_868MHz
#define BASE_FREQUENCY              868.0e6
//#endif

//#ifdef USE_SPIRIT1_915MHz
//#define BASE_FREQUENCY              915.0e6
//#endif

#define CHANNEL_SPACE               20e3
#define CHANNEL_NUMBER              0
#define MODULATION_SELECT           FSK
#define DATARATE                    115200 //38400
#define FREQ_DEVIATION              60e3    //20e3
#define BANDWIDTH                   220E3 // 100E3

#define POWER_DBM                   11.6
#define POWER_INDEX                 7

#define RECEIVE_TIMEOUT             2000.0 /*change the value for required timeout period*/
#define RSSI_THRESHOLD              -120

/*  Packet configuration parameters  */
#define PREAMBLE_LENGTH             PKT_PREAMBLE_LENGTH_04BYTES
#define SYNC_LENGTH                 PKT_SYNC_LENGTH_4BYTES
#define SYNC_WORD                   0x88888888
#define LENGTH_TYPE                 PKT_LENGTH_VAR
#define LENGTH_WIDTH                7
#define CRC_MODE                    PKT_CRC_MODE_8BITS
#define CONTROL_LENGTH              PKT_CONTROL_LENGTH_0BYTES
#define EN_FEC                      S_DISABLE
#define EN_WHITENING                S_ENABLE

/*  Addresses configuration parameters  */
#define EN_ADDRESS                  S_DISABLE
#define EN_FILT_MY_ADDRESS          S_DISABLE
#define EN_FILT_MULTICAST_ADDRESS   S_DISABLE
#define EN_FILT_BROADCAST_ADDRESS   S_DISABLE
#define EN_FILT_SOURCE_ADDRESS      S_DISABLE//S_ENABLE
#define MY_ADDRESS                  0x44
#define DESTINATION_ADDRESS         0x44
#define SOURCE_ADDR_MASK            0xf0
#define SOURCE_ADDR_REF             0x37
#define MULTICAST_ADDRESS           0xEE
#define BROADCAST_ADDRESS           0xFF


#define EN_AUTOACK                    S_DISABLE
#define EN_PIGGYBACKING               S_DISABLE
#define MAX_RETRANSMISSIONS           PKT_DISABLE_RETX


#define PAYLOAD_LEN                     10 //25 /*20 bytes data+tag+cmd_type+cmd+cmdlen+datalen*/
#define APPLI_CMD                       0x11
#define NWK_CMD                         0x22
#define LED_TOGGLE                      0xff
#define ACK_OK                          0x01
#define MAX_BUFFER_LEN                  96
#define TIME_TO_EXIT_RX                 3000
#define DELAY_RX_LED_TOGGLE             100
#define DELAY_TX_LED_GLOW               200
#define LPM_WAKEUP_TIME                 100
#define DATA_SEND_TIME                  50//30

typedef enum {
  APP_STATE_IDLE = 0,
  APP_STATE_PROG,
  APP_STATE_MANUAL_TRIGGER,
  APP_STATE_START_RX,
  APP_STATE_WAIT_FOR_RX_DONE,
  APP_STATE_DATA_RECEIVED,
  APP_STATE_SEND_CHECK,
  APP_STATE_SEND_FLASH,
  APP_STATE_WAIT_FOR_TX_DONE,
} AppState_t;

typedef struct
{
  uint8_t Cmdtag;
  uint8_t CmdType;
  uint8_t CmdLen;
  uint8_t Cmd;
  uint8_t DataLen;
  uint8_t* DataBuff;
}AppliFrame_t;

void App_Exec(void);
void App_Init(void);
void AppliSendBuff(uint8_t* pBuffer, uint8_t nLength);
void AppliReceiveBuff(uint8_t *RxFrameBuff, uint8_t cRxlen);
void BasicProtocolInit(void);
void OnSpiritInterruptHandler(void);
void FlashActive();
void Programming();
void ADCGetConv(uint16_t nValue);

#endif /* SPIRIT1_APP_H_ */
