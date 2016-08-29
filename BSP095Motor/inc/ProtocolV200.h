/**
  ******************************************************************************
  * @file    V200_CommProtocol.h
  * @author  Tejas H
  * @version V1.0.0
  * @date    17-November-2014
  * @brief   Handles communication protocol such as check device, comm start, comm end, reception of data packet, reception of fast command(not fully implemented)
  ******************************************************************************
  */

#ifndef V200_CommProtocol_H
#define V200_CommProtocol_H

/*Includes-------------------------------------------------------------------------------*/
//#include "H043_TypeDefine.h"
#include "share_f4/types.h"
#include "stm32f4xx.h"
#include "btl_USART.h"

#ifdef __cplusplus
 extern "C" {
#endif

/*Typedef----------------------------------------------------------------------------*/

/*Possible RX Tx operation used identify current operation*/
typedef enum
{
  	RTO_IDLE = 0,
   	RTO_RX_FAST_COMMAND = 1,
   	RTO_RX_DATA_PACKET = 2,
   	RTO_TX_FAST_COMMAND = 3,
   	RTO_TX_DATA_PACKET = 4
} RX_TX_OPERATION;

/*Possible slave Response codes on reception of data*/
typedef enum
{
  	SR_OK_PACKET_PROCESSED = 0,
   	SR_OK_PACKET_PROCESSED_LATELY = 1,
   	SR_ERR_SYNTAX_ERROR = 2,
   	SR_ERR_SLAVE_BUSY = 3,
   	SR_ERR_UNSUPPORTED_PACKET = 4
} SLAVE_RESPONSE;


typedef void(*Ptr_OnRxDataPacket)(uint8_t* pData, uint32_t Length);
typedef void(*Ptr_OnTxDataPacketResponse)(bool Successful);


/*Defines-----------------------------------------------------------------------------*/

#define REPEAT_SENDING_AFTER_PACKET_ERR 3
#define PACKET_ERR 				 		0x0F
#define CHS_IDENTIFICATION_BYTE 		0x77
#define RX_NO_ERROR      				0x00
#define RX_OVERFLOW_ERROR		 		0x01
#define RX_FRAME_ERROR    		 		0x02
#define RX_PARITY_ERROR   		 		0x04
#define RX_LENGTH_ERROR  		 		0x08
#define RX_CHS_ERROR     		 		0x10
#define NONE_ID_FOR_DATA_READY   		0xFF
#define RXTX_Buff_Size 			 		1024
#define PACKET_OK_PROCESSED_PROMPTLY 	0x01
#define PACKET_OK_PROCESSED_LATELY   	0x02
#define PACKET_ERR_SYNTAX_ERROR			0x0C
#define PACKET_ERR_SLAVE_BUSY			0x0D
#define PACKET_ERR_UNSUPPORTED_PACKET 	0x0E
#define PACKET_ERR_UNSUPPORTED_PACKET 	0x0E
#define PACKET_ERR_INVALID_CHS         	0x0F

/*Variables-------------------------------------------------------------------------------------*/



extern volatile bool TcFlag;
extern volatile bool RxDataPacket;
extern volatile uint32_t TxByteCnt;
extern volatile bool TxDataPacketResponse;


/*Function Prototype-------------------------------------------------------------------------------------*/
//REVIEW COMMENT: The purpose of this function needs to be identified
//void HIL_SetOnRxDataPacketErr(OnRxDataPacketErr);
//void HIL_SetEnCleanRxBuff(g_bEnCleanRxBuff);

void V200_Init(serial_port_e ePort, uint8_t deviceID, GPIO_TypeDef* dir_gpio, uint16_t dir_pin);
void V200_OnRxByte(uint8_t rxByte);
void V200_OnTxByte(void);
void V200_ReadStartByte(uint8_t rxByte);
void V200_RxFastCommand(uint8_t rxByte);
void V200_RxDataPacket(uint8_t rxByte);
void V200_RxFastCommandResponse(uint8_t rxByte);
void V200_RxDataPacketResponse(uint8_t rxByte);
void V200_InitLink(void);
void V200_LockLink(void);
void V200_UnlockLink(void);
void V200_TxFastCommand(void);
void V200_TxDataPacket(void);
void V200_TxFastCommandResponse(void);
void V200_TxDataPacketResponse(void);
bool V200_SendPacketDataResponse(SLAVE_RESPONSE enResponse, uint8_t *pData, uint32_t Length);
void V200_CommExec(void);
void V200_SetOnRxDataPacket(Ptr_OnRxDataPacket pFunction);
void V200_SetOnTxDataPacketResponse(Ptr_OnTxDataPacketResponse pFunction);
uint8_t* V200_GetTxBuff(void);
void V200_SetBusy(bool NewState);

void V200_ConvertU32ToArray(u32 value, u8 *array);
void V200_ConvertS32ToArray(s32 value, u8 *array);
uint32_t V200_ConvertArrayToU32( u8 *array);

#ifdef __cplusplus
}
#endif

#endif
