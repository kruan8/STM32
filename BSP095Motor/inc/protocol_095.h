 /*****************************************************************************
  * @title   ProtocolPackets.h
  * @author  Tejas H
  * @date
  * @brief 	 Process all the packets present in communication protocol
  *******************************************************************************/

#ifndef B095_PKTPROCESSING_H
#define B095_PKTPROCESSING_H


/*Includes**********************************************************************/
#include "ProtocolV200.h"

#ifdef __cplusplus
 extern "C" {
#endif

/*Defines*******************************************************************************/

#define DEFAULT_COMMUNICATION_TIMEOUT_100MS  1200			//Communication tim


/*Type Def********************************************************************/



/*Packets and packet id's for communication*/
typedef enum packet_id
{
  // COMMON PACKETS
  PID_SEND_LAST_OPERATION_RESULT       = 0x00,
  PID_RUN_SELFTEST                     = 0x01,
  PID_DO_SELF_RESTART                  = 0x02,
  PID_SEND_FW_VERSION                  = 0x03,
  PID_SEND_SELFTEST_RESULT             = 0x04,
  PID_ENTRY_SLEEP_MODE                 = 0x05,
  PID_RESET_COMM_WD                    = 0x06,
  PID_SEND_STATUS_REGISTER             = 0x0A,
  PID_SEND_RX_TX_BUFFER_SIZE           = 0x0B,
  PID_SEND_TEMPERATURE                 = 0x0C,
  PID_SEND_HW_CONFIG                   = 0x0D,
  PID_SEND_NUM_CHANNELS                = 0x82,
  PID_SET_LOGGING                      = 0x83,
  PID_SEND_LOGGING_INFORMATION         = 0x84,
  PID_SEND_BINARY_DISC   		    	     = 0x85,
 // COMMON PACKET REPLY
  PID_REPLY_SEND_LAST_OPERATION_RESULT = 0x00,
  PID_REPLY_RUN_SELFTEST               = 0x13,
  PID_REPLY_SEND_FW_VERSION            = 0x12,
  PID_REPLY_SEND_SELFTEST_RESULT       = 0x11,
  PID_REPLY_SEND_STATUS_REGISTER       = 0x1A,
  PID_REPLY_SEND_RX_TX_BUFFER_SIZE     = 0x1B,
  PID_REPLY_SEND_TEMPERATURE           = 0x1C,
  PID_REPLY_SEND_HW_CONFIG             = 0x1D,
  PID_REPLY_SEND_NUM_CHANNELS          = 0x92,
  PID_REPLY_SEND_LOGGING_ASCII		     = 0X93,
  PID_REPLY_SEND_LOGGING_BINARY		     = 0X94,
  PID_REPLY_SEND_LOGGING_INFORMATION   = 0x95,
  PID_REPLY_SEND_BINARY_DISC	         = 0x96,
  PID_REPLY_SEND_LOGGING_ERROR 		     = 0xE0,

  // Recommended packets
  PID_MOTOR_START		                  = 0x20,
  PID_MOTOR_STOP		                  = 0x21,
  PID_GET_INFO		                    = 0x22,
  PID_SENSOR_CALIBRATE                = 0x23,
  PID_GET_DATA  		                  = 0x24,
  PID_SEND_ERROR_CODE                 = 0x28,

  PID_START_TEST_PROCESS			        = 0x6D,
  PID_SEND_LAST_TEST_STATUS			      = 0x6E,
  PID_INTERRUPT_CURRENT_TEST		      = 0x6F,

  // Recommended packet reply
  PID_REPLY_GET_DATA		 			        = 0x40,
  PID_REPLY_TENZ_CALIB		 			      = 0x41,
  PID_REPLY_GET_HW			 			        = 0x42,
  PID_REPLY_GET_TENZ_INFO	 			      = 0x43,
  PID_REPLY_SET_MOTORS	              = 0x44,
  PID_REPLY_CONFIGURATION             = 0x45,
  PID_REPLY_DRIVE_ON                  = 0x46,
  PID_REPLY_SET_MODE                  = 0x47,
  PID_REPLY_SEND_ERROR_CODE           = 0x48,

  PID_REPLY_START_TEST_PROCESS			  = 0x7D,
  PID_REPLY_SEND_LAST_TEST_STATUS		  = 0x7E,
  PID_REPLY_INTERRUPT_CURRENT_TEST		= 0x7F,

} PACKET_ID;

/*Variables******************************************************************************/

//extern bool ErrorFlag ;
//extern bool TempErrorFlag;
//extern uint8_t *TxData;


/*Function Prototype*********************************************************************/

void B095_ServInit(serial_port_e ePort, uint8_t deviceID);
void B095_OnRxDataPacket(uint8_t* pData, uint32_t dwLength);
bool B095_Service_SendPacketDataResponse(SLAVE_RESPONSE eResponse, uint8_t *pData, uint32_t dwLength);
void B095_OnRx_SendLastOperationResult(void);
void B095_OnRx_RunSelftest(void);
void B095_OnRx_DoSelfRestart(void);
void B095_OnRx_SendFwVersion(void);
void B095_OnRx_SendSelftestResult(void);
void B095_OnRx_EntrySleepMode(void);
void B095_OnRx_ResetCommWd(void);
void B095_OnRx_SendStatusRegister(void);
void B095_OnRx_SendRxTxBufferSize(void);
void B095_OnRx_SendHwConfig(void);
void B095_OnRx_SetLogging(void);
void B095_OnRx_SendLoggingInformation(void);
void B095_OnRx_SendBinaryDisc(void);
void B095_OnRx_SendErrorCode(void);
void B095_OnRx_StarTestProcess(void);
void B095_OnRx_SendLastTestStatus(void);
void B095_OnRx_InterruptCurrentTest(void);

void B095_OnUnsupportedID(void);
void B095_OnTxDataPacketResponse(bool bSuccessful);
void B095_OnCommWdTimer100ms(void);
void B095_SetEnCommWd(bool WdEnable);
void B095_ClrCommWd(void);
void B095_SendTemp(void);

void B095_OnRx_MotorStart(void);
void B095_OnRx_MotorStop(void);
void B095_OnRx_GetInfo(void);
void B095_OnRx_SensorCalibrate(void);
void B095_OnRx_GetData(void);

void B095_OnRx_ParamMotion(void);
void B095_OnRx_SampleTable(void);
void B095_OnRx_StartActiveMode(void);
void B095_OnRx_StartPasiveMode(void);

#ifdef __cplusplus
}
#endif

#endif
