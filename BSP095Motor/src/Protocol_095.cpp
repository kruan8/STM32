 /*****************************************************************************
  * @title   ProtocolPackets.c
  * @author  Tejas H
  * @date
  * @brief 	 Process all the packets present in communication protocol
  *******************************************************************************/


/*Includes*********************************************************************/

#include <string.h>

#include "ProtocolV200.h"
#include "protocol_095.h"
#include "BTL_USART.h"
#include "swtTimer.h"
#include "Adc_095.h"
#include "technology_095.h"
#include "motors_095.h"

//!< Vycet operaci provadenych po dokonceni odeslani paketu s odpovedi
typedef enum
{
  OOSR_IDLE           = 0,
  OOSR_SELF_RESTART   = 1,
  OOSR_SLEEP_MODE     = 2,
  OOSR_UPLOAD_MODE    = 3,
  OOSR_STATUS_SENDED  = 4
} OPERATION_ON_SENDING_RESPONSE;

typedef enum
{
  calib_tenz_w = 0,   // kalibrace tenzometru na hmotnost
  calib_tenz_zero,    // kalibrace nulove hodnoty tenzometru (tare)
  calib_acc_zero,     // kalibrace nulove hodnoty akcelerometru
  calib_angle_X,      // kalibrace uhloveho snimace X
  calib_angle_Y,      // kalibrace uhloveho snimace Y
}calib_mode_e;

#define  DIR_GPIO   GPIOB
#define  DIR_PIN    GPIO_Pin_12

/*Variables********************************************************************/
static OPERATION_ON_SENDING_RESPONSE g_eOnSendingResponse = OOSR_IDLE;  //!< pozadovana operace po dokonceni odesilani odpovedi

static uint32_t CommTimeoutCnt = DEFAULT_COMMUNICATION_TIMEOUT_100MS;
static uint32_t CommTimeout = DEFAULT_COMMUNICATION_TIMEOUT_100MS;
bool ErrorFlag = false;
bool TempErrorFlag = false;

uint8_t *TxData = NULL;      			    // pointer to transmission buffer
static uint16_t TxDataLength = 0;     // Transmission Data length
static uint8_t* RxData = NULL;      	// pointer to reception buffer
static uint32_t RxDataLength = 0; 		// Reception data length


/*Functions********************************************************************/


//static void OnRxDataPacketErr(ULONG dwErrorMask);               //NEEDS VALIDATION!< udalost volana pri chybe behem prijmani datoveho paketu


/*******************************************************************************
* Function Name  : B095_ServInit
* Description    : Initialise all the variables and pointer function used by packet processing
* Input          : BOOLEAN: needs to be validated
* Return         : None
*******************************************************************************/
void B095_ServInit(serial_port_e ePort, uint8_t deviceID)
{
	/*Initialise variables*/
	TxData = NULL;
	TxDataLength = 0;
	RxData = NULL;
	RxDataLength = 0;
	// g_eOnSendingResponse = OOSR_IDLE;

	CommTimeoutCnt = DEFAULT_COMMUNICATION_TIMEOUT_100MS; 
	CommTimeout = DEFAULT_COMMUNICATION_TIMEOUT_100MS;
	//  g_bEnCleanRxBuff = TRUE;  // povoleni nulovani primaciho bufferu po obslouzeni paketu - kvuli kompatibilite pri rozsirovani paketu
	//---- inicializace komunikacniho protokolu nove linky - verze II
	// HIL_Init(bCommEnable ? ResolveGenerID_App() : 0xFF, SCISII_CHANNEL, SCIS_INTERRUPT_LEVEL, SCI_PIN_CONFIG_0, SCIS_BR_DEFAULT, 0xFF);


	V200_SetOnRxDataPacket(B095_OnRxDataPacket);		// set the function to be called on reception of data packet
	//  HIL_SetOnRxDataPacketErr(OnRxDataPacketErr);              //REVIEW COMMENT: The purpose of this function needs to be identified
	V200_SetOnTxDataPacketResponse(B095_OnTxDataPacketResponse);  //REVIEW COMMENT: The purpose of this function needs to be identified
	//HIL_SetEnCleanRxBuff(g_bEnCleanRxBuff);                     //REVIEW COMMENT: The purpose of this function needs to be identified

	SwtInsertService(B095_OnCommWdTimer100ms, 100, false);   //insert communication watch dog timer to software timer que
        /*REVIEW COMMENT: Refer protocol to understand timing (120sec) */

	V200_Init(ePort, deviceID, DIR_GPIO, DIR_PIN);
}


/*******************************************************************************
* Function Name  : B095_OnRxDataPacket
* Description    : On receiving data packet with packet ID
* Input          : pointer to recieved data buffer, length of receieved data
* Return         : None
*******************************************************************************/
void B095_OnRxDataPacket(uint8_t* pData, uint32_t dwLength)
{
	TxData = V200_GetTxBuff();                              //Fetch the TxBuffer Address
	RxData = pData;                                         //Points to RxBuffer
	RxDataLength = dwLength;

	// g_eOnSendingResponse = OOSR_IDLE;

	//  ClrCommWd();																		//Enable once communication watchdog is up

	if(TxData == NULL)   																	//error - not initialized sending buffer
	{
		B095_Service_SendPacketDataResponse(SR_ERR_SLAVE_BUSY, NULL, 0);
		return;
	}

	if(RxDataLength == 0) 															 	    // Error - missing packet ID
	{
		B095_Service_SendPacketDataResponse(SR_ERR_SYNTAX_ERROR, NULL, 0);
		return;
	}

	/* packet ID switch*/
	switch(pData[0])
	{
	/*Switch to specific packet to process*/

		/*Common packets*/
		case PID_SEND_LAST_OPERATION_RESULT:  B095_OnRx_SendLastOperationResult();  break; // on request to send last operation result
		case PID_RUN_SELFTEST:             		B095_OnRx_RunSelftest();            	break; // on request Run Self Test
		case PID_DO_SELF_RESTART:           	B095_OnRx_DoSelfRestart();           	break; // on request Restart generator
		case PID_SEND_FW_VERSION:          		B095_OnRx_SendFwVersion();           	break; // on request Send  firmware version
		case PID_SEND_SELFTEST_RESULT:     		B095_OnRx_SendSelftestResult();      	break; // on request Send self test result
		case PID_ENTRY_SLEEP_MODE:          	B095_OnRx_EntrySleepMode();          	break; // on requestEnter Sleep mode
		case PID_RESET_COMM_WD:             	B095_OnRx_ResetCommWd();             	break; // on requestReset communication watch dog with new time
		case PID_SEND_STATUS_REGISTER:      	B095_OnRx_SendStatusRegister();      	break; // on request send status register
		case PID_SEND_RX_TX_BUFFER_SIZE:    	B095_OnRx_SendRxTxBufferSize();      	break; // on request send buffer Reception buffer size
		case PID_SEND_HW_CONFIG:            	B095_OnRx_SendHwConfig();            	break; // on request send hardware configuration
//		case PID_SET_LOGGING:               	B095_OnRx_SetLogging();              	break; // on request set logging state
//		case PID_SEND_LOGGING_INFORMATION:		B095_OnRx_SendLoggingInformation();  	break; // on request send logging information
//		case PID_SEND_BINARY_DISC:		  		  B095_OnRx_SendBinaryDisc();				    break; // on request send binary discription

		/* Recommended packets*/
		case PID_SEND_ERROR_CODE:         	  B095_OnRx_SendErrorCode();           	break; // on request send error code
		case PID_START_TEST_PROCESS:			    B095_OnRx_StarTestProcess();			    break;
		case PID_SEND_LAST_TEST_STATUS:	 	  	B095_OnRx_SendLastTestStatus();			  break;
		case PID_INTERRUPT_CURRENT_TEST:   		B095_OnRx_InterruptCurrentTest();		  break;

    /*Slave Specific packets*/
    case PID_MOTOR_START:						      B095_OnRx_MotorStart();			          break;	//
    case PID_MOTOR_STOP:					        B095_OnRx_MotorStop();				        break;	//
    case PID_GET_INFO:						        B095_OnRx_GetInfo();					        break;	//
    case PID_SENSOR_CALIBRATE:					  B095_OnRx_SensorCalibrate();		      break;	//
    case PID_GET_DATA:					          B095_OnRx_GetData();  					      break;	//
//    case PID_DRIVE_ON:                    B095_OnRx_DriveOn();                  break;  // on request Driver ON



		default: 						              		B095_OnUnsupportedID();					      break;
	}
}


/*******************************************************************************
* Function Name  : B095_Service_SendPacketDataResponse
* Description    : Sends response to the data packet recieved
* Input          : Slave Response,
* 					Data : Data to be sent
* 					Data length : Number of bytes to be sent
*
* Return         : Boolean: True- successful False-Failed
*******************************************************************************/
bool B095_Service_SendPacketDataResponse(SLAVE_RESPONSE eResponse, uint8_t *pData, uint32_t dwLength)
{
	if(dwLength)
	{
		TxDataLength = 0;																	 // Tx buffer data is sent, Tx buffer will be empty
	}

	if(pData == NULL)																			// No Data to be sent
	{
		dwLength = 0;
	}

	return V200_SendPacketDataResponse(eResponse, pData, dwLength);							 	//Sends data packet response
}
/*REVIEW COMMENT: Send last operation result is used in place where generator needs more time to process data. by sending packet processed lately in response to data packet recieved, master will send this packet to acquire the data*/
/*******************************************************************************
* Function Name  : B095_OnRx_SendLastOperationResult
* Description    : Sends Last operation Result
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_SendLastOperationResult(void)
{
	if (TxDataLength != 0 && TxData[0] == 0x00) 		// the Tx buffer has required data
	{
		B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, TxDataLength);
	}
	else		//if Tx buffer doesnt have any data
	{
    /*REVIEW COMMENT: reply to send last operation result as no result available(add it in this section). refer to communication protoco*/
		TxData[0] = 0x00;
    TxData[1] = 0x11;
    TxData[2] = 0x00;
    B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 3);
	}
}

/*******************************************************************************
* Function Name  : B095_OnRx_RunSelftest
* Description    : Performs self test, and informs master about the time required for self test
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_RunSelftest(void)
{
	
	TxData[0] = PID_REPLY_RUN_SELFTEST;
	TxData[1] = 0x32;                                               /*REVIEW COMMENT: Time after which master has to ask for self test result*/

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 2);
//	B095_SelftestStart();
}

/*******************************************************************************
* Function Name  : B095_OnRx_DoSelfRestart
* Description    : Restarts the generator board
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_DoSelfRestart(void)
{
  g_eOnSendingResponse = OOSR_SELF_RESTART;
	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, NULL, 0);

}

/*******************************************************************************
* Function Name  : B095_OnRx_SendFwVersion
* Description    : Sends Firmware version
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_SendFwVersion(void)
{
	uint16_t FirmwareVersion = (uint16_t)(1);
	uint16_t BuildVersion = (uint16_t)(1);

	TxData[0] = PID_REPLY_SEND_FW_VERSION;
	TxData[1] = (uint8_t)(FirmwareVersion >> 8);												//Firmware version
	TxData[2] = (uint8_t)(FirmwareVersion);
	TxData[3] = (uint8_t)(BuildVersion >> 8);														//Build Version
	TxData[4] = (uint8_t)(BuildVersion);

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 5);
}


/*******************************************************************************
* Function Name  : B095_OnRx_SendSelftestResult
* Description    : Replies self test result
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_SendSelftestResult(void)
{

	TxData[0] = PID_REPLY_SEND_SELFTEST_RESULT;
	TxData[1] = 0;																		//Self test result

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 2);
}

/*******************************************************************************
* Function Name  : B095_OnRx_EntrySleepMode
* Description    : pulls the system into sleep mode
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_EntrySleepMode(void)
{
	/*Todo: This is dummy pakcet replace with  correct packet*/
	TxData[0] = PID_ENTRY_SLEEP_MODE;
	TxData[1] = 0x11;
	TxData[2] = 0x00;
	TxData[3] = 0x11;

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 4);
        
        /*REVIEW COMMENT: after sending response system needs to enter sleep mode */
}

/*******************************************************************************
* Function Name  : B095_OnRx_ResetCommWd
* Description    : sets new timeout for communication watchdog
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_ResetCommWd(void)
{
	// Sets communication watchdog to default time
	if(RxDataLength < 2)		// recieved data length cannot be less than 2 bytes
	{
		B095_Service_SendPacketDataResponse(SR_ERR_SYNTAX_ERROR, NULL, 0);
	  return;
	}

	if(RxData[1])
	{
	  CommTimeout = RxData[1];	        //Replace the communication counter with the new value sent by master										 //communications watchdog timeout in [100 ms]
	}

  B095_ClrCommWd();           // Update the communication time out value to communication time out count
	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, NULL, 0);

}

/*******************************************************************************
* Function Name  : B095_OnRx_SendStatusRegister
* Description    : Sends the status register
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_SendStatusRegister(void)
{
	g_eOnSendingResponse = OOSR_STATUS_SENDED;

	TxData[0] = PID_REPLY_SEND_STATUS_REGISTER;
//	STATUS_REGISTER* sr = Conf095_GetStatusRegister();

	/*Framming status register*/
//	TxData[1] = (uint8_t)(sr->m_Reg.m_dwLong >> 24);
//	TxData[2] = (uint8_t)(sr->m_Reg.m_dwLong >> 16);
//	TxData[3] = (uint8_t)(sr->m_Reg.m_dwLong >> 8);
//	TxData[4] = (uint8_t)(sr->m_Reg.m_dwLong);

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 5);
}

/*******************************************************************************
* Function Name  : B095_OnRx_SendRxTxBufferSize
* Description    : sends Reception buffer sixe
* Input          : None
* Return         : None
*************************************e******************************************/
void B095_OnRx_SendRxTxBufferSize(void)
{
	uint16_t rxTxBuff = RXTX_Buff_Size;   													//Defined Buff size

	TxData[0] = PID_REPLY_SEND_RX_TX_BUFFER_SIZE;
	TxData[1] = (uint8_t)(rxTxBuff>>8);
	TxData[2] = (uint8_t)(rxTxBuff);

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 3);
}


/*******************************************************************************
* Function Name  : B095_OnRx_SendHwConfig
* Description    : on request for sending hardware configuration
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_SendHwConfig(void)
{

}

//
///*******************************************************************************
//* Function Name  : B095_OnRx_SetLogging
//* Description    : sets logging state
//* Input          : None
//* Return         : None
//*******************************************************************************/
//void B095_OnRx_SetLogging(void)
//{
//  if (RxDataLength < 6)
//  {
//    B095_Service_SendPacketDataResponse(SR_ERR_SYNTAX_ERROR, NULL, 0);
//    return;
//  }
//
//  uint32_t nLogConfig = 0;
//  uint16_t nTxPacketSize = 0;
//
//  switch (RxData[1])
//  {
//  case 0:   // logging stop
//    Log_SetEnable(LE_DISABLED);
//    break;
//  case 1:   // logging start
//    nLogConfig  = (uint32_t)RxData[2] << 24;
//    nLogConfig |= (uint32_t)RxData[3] << 16;
//    nLogConfig |= (uint32_t)RxData[4] << 8;
//    nLogConfig |= (uint32_t)RxData[5];
//    Log_SetConfig(nLogConfig);
//    Log_SetEnable(LOGGING_TYPE_SUPPORTED);
//    break;
//  case 2:   // request for logged data
//    nTxPacketSize = Log_PreparePacket(TxData, RXTX_Buff_Size);
//    break;
//  default:
//    B095_Service_SendPacketDataResponse(SR_ERR_SYNTAX_ERROR, NULL, 0);
//    return;
//    break;
//  }
//
//	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, nTxPacketSize ? TxData : NULL, nTxPacketSize);
//}

///*******************************************************************************
//* Function Name  : B095_OnRx_SendLoggingInformation
//* Description    : sends back logging information
//* Input          : None
//* Return         : None
//*******************************************************************************/
//void B095_OnRx_SendLoggingInformation(void)
//{
//  TxData[0] = PID_REPLY_SEND_LOGGING_INFORMATION;
//  TxData[1] = LOGGING_TYPE_SUPPORTED;
//  TxData[2] = Log095_GetLoggingStructureCount();
//  TxData[3] = (uint8_t)(LOG_SYSTEM_VERSION >> 8);
//  TxData[4] = (uint8_t)(LOG_SYSTEM_VERSION);
//  TxData[5] = (uint8_t)(LOG_DATA_VERSION >> 8);
//  TxData[6] = (uint8_t)(LOG_DATA_VERSION);
//
//  B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 7);
//}

///*******************************************************************************
//* Function Name  : B095_OnRx_SendBinaryDisc
//* Description    : Sends discription of binary data logging followed
//* Input          : None
//* Return         : None
//*******************************************************************************/
//void B095_OnRx_SendBinaryDisc(void)
//{
//  if (RxDataLength < 2)
//  {
//    B095_Service_SendPacketDataResponse(SR_ERR_SYNTAX_ERROR, NULL, 0);
//    return;
//  }
//
//  uint16_t nTxPacketSize = 0;
//  uint16_t nStructDescriptionSize = 0;
//  uint16_t nMaxBuffSize = RXTX_Buff_Size - 5;
//
//  if (MAX_STRUCT_DESCRIPTION_SIZE < nMaxBuffSize)
//  {
//    nMaxBuffSize = MAX_STRUCT_DESCRIPTION_SIZE;
//  }
//
//  nStructDescriptionSize = Log095_FillStructDescription(RxData[1], &TxData[5], nMaxBuffSize);
//
//  if (nStructDescriptionSize)
//  {
//    TxData[0] = PID_REPLY_SEND_BINARY_DISC;
//    TxData[1] = RxData[1];
//    TxData[2] = 0;
//    TxData[3] = (uint8_t)(nStructDescriptionSize >> 8);
//    TxData[4] = (uint8_t)(nStructDescriptionSize);
//    nTxPacketSize = nStructDescriptionSize + 5;
//  }
//  else
//  {
//    // error, undefined structure
//    TxData[0] = PID_REPLY_SEND_LOGGING_ERROR;
//    nTxPacketSize = 1;
//  }
//
//	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, nTxPacketSize);
//}

/* Recommended packets*************************************************************/
/*******************************************************************************
* Function Name  : B095_OnRx_SendErrorCode
* Description    : sends last set error code
* Input          : None
* Return         : None
*******************************************************************************/
void B095_OnRx_SendErrorCode(void)
{
	TxData[0] = PID_REPLY_SEND_ERROR_CODE;
	TxData[1] = 0;														//Fetches last set error code

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 2);
}


/*******************************************************************************
* Function Name  : B095_OnRx_StarTestProcess
* Description    :
* Input          : None
* Return         : None
*******************************************************************************/

void B095_OnRx_StarTestProcess(void)
{
	/*Todo: Dummy Data, Neeeds to send actual data*/
	TxData[0] = PID_REPLY_START_TEST_PROCESS;
	TxData[1] = 0x11;
	TxData[2] = 0x00;
	TxData[3] = 0x11;

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 4);
}

/*******************************************************************************
* Function Name  : B095_OnRx_StarTestProcess
* Description    :
* Input          : None
* Return         : None
*******************************************************************************/

void B095_OnRx_SendLastTestStatus(void)
{
	/*Todo: Dummy Data, Neeeds to send actual data*/
	TxData[0] = PID_REPLY_SEND_LAST_TEST_STATUS;
	TxData[1] = 0x11;
	TxData[2] = 0x00;
	TxData[3] = 0x11;

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 4);
}

/*******************************************************************************
* Function Name  : B095_OnRx_InterruptCurrentTest
* Description    :
* Input          : None
* Return         : None
*******************************************************************************/

void B095_OnRx_InterruptCurrentTest(void)
{
	/*Todo: Dummy Data, Neeeds to send actual data*/
	TxData[0] = PID_REPLY_INTERRUPT_CURRENT_TEST;
	TxData[1] = 0x11;
	TxData[2] = 0x00;
	TxData[3] = 0x11;

	B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 4);

}


/*******************************************************************************
* Function Name  : B095_OnUnsupportedID
* Description    : Packet ID not found or wrong packet UD
* Input          : None
* Return         : None
*******************************************************************************/

void B095_OnUnsupportedID()
{
	B095_Service_SendPacketDataResponse(SR_ERR_UNSUPPORTED_PACKET, NULL, 0);
}

/*******************************************************************************
* Function Name  : B095_OnTxDataPacketResponse
* Description    :
* Input          : None
* Return         : None
*******************************************************************************/
/*REVIEW COMMENT: The purpose of the following function needs to be identified/analyzed*/
void B095_OnTxDataPacketResponse(bool bSuccessful)
{
	if(bSuccessful)
	{
		switch(g_eOnSendingResponse)
		{
		case OOSR_SELF_RESTART:   NVIC_SystemReset();                   break;
//		case OOSR_SLEEP_MODE:     EnterToSleepMode();                 break;
//		case OOSR_UPLOAD_MODE:    EnterToUploadMode();                break;
//		case OOSR_STATUS_SENDED:  Conf095_ClearStatusRegisterFlags();   break;
		default: break;
		}
	}

	g_eOnSendingResponse = OOSR_IDLE;
}


/*******************************************************************************
* Function Name  : B095_Swt_OnCommWdTimer100ms
* Description    : called every 100ms, this monitors the communication timing
* Input          : None
* Return         : None
*******************************************************************************/

void B095_OnCommWdTimer100ms()
{
	if(CommTimeoutCnt)
		CommTimeoutCnt--;					// Decrement communication count
	else												// if communication count reached 0 reset generator
	{
	  NVIC_SystemReset();				// Reset Generator using system reset
	}
}

/*******************************************************************************
* Function Name  : B095_Swt_SetEnCommWd
* Description    : Enables/disables communication watch dog
* Input          : BOOLEAN: True-Enable
* 							False-Disable
* Return         : None
*******************************************************************************/

void B095_SetEnCommWd(bool WdEnable)
{
  SwtSetEnable(B095_OnCommWdTimer100ms, WdEnable);
}

/*******************************************************************************
* Function Name  : B095_ClrCommWd
* Description    : sets communication watch dog to default value
* Input          : None
* Return         : None
*******************************************************************************/
/*REVIEW COMMENT: Currently this function is called only when master changes communication timeout value, but we have to call this function everytime master communicates with generator to handle communication watchdog timeout reset*/
void B095_ClrCommWd(void)
{
	CommTimeoutCnt = CommTimeout;           //CommTimeoutCnt is like counter register which will be decrementing, CommTimeout is reload value which is set by master 
}


// ----------- pakety pro pripravek ---------------------------

void B095_OnRx_MotorStart(void)
{
  uint8_t nMotor = RxData[1] & 0b1;
  uint32_t nCycles = V200_ConvertArrayToU32(&RxData[2]);
  uint16_t nSpeed = (RxData[6] << 8) | RxData[7];
  uint16_t nRamp = (RxData[8] << 8) | RxData[9];

  TxData[0] = PID_MOTOR_START;
  TxData[1] = 0;

  Tech095_SetParams(nMotor, nCycles, nSpeed, nRamp);
  Tech095_Start(nMotor);

  B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 2);
}


void B095_OnRx_MotorStop(void)
{
  uint8_t nMotor = RxData[1] & 0b1;

  TxData[0] = PID_MOTOR_STOP;
  TxData[1] = 0;

  Tech095_Stop(nMotor);

  B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 2);

}

void B095_OnRx_GetInfo(void)
{
  TxData[0] = PID_GET_INFO;
  TxData[1] = RxData[1];    // vracime cislo motoru
  uint8_t nMotor = RxData[1] & 0b1;

  uint16_t nPos = 2;
  V200_ConvertU32ToArray(Tech095_GetCycles(nMotor), &TxData[nPos]); // pocet cyklu
  nPos += 4;

  uint16_t nTemp = Adc095_GetTempHeatsinkM1_K();
  if (nMotor == 1)
  {
    nTemp = Adc095_GetTempHeatsinkM2_K();
  }

  TxData[nPos++] = (u8)(nTemp >> 8);
  TxData[nPos++] = (u8)(nTemp);

  int16_t nPfcVoltage = Adc095_GetPFC_mV() / 100; // napeti 0,1V
  TxData[nPos++] = (u8)(nPfcVoltage >> 8);
  TxData[nPos++] = (u8)(nPfcVoltage);

  B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, nPos);
}

void B095_OnRx_SensorCalibrate(void)
{
  TxData[0] = PID_SENSOR_CALIBRATE;
  TxData[1] = 0;
  B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, 2);
}

void B095_OnRx_GetData(void)
{
  const uint8_t nMaxSamples = 20;  // maximalni pocet vzorku v paketu (TX buffer size = 1024)
  tech_data* pSample;
  static uint8_t nPacketID;

  // citac ID paketu (4 bity - cita dokola), pokud dorazi stejne ID, nemazat frontu, pokud jine, smazat vzorky
  // nejvysi bit ID je RESET flag pro smazani fronty a vraceni nejmladsiho elementu
  uint8_t nIdAndReset = RxData[1];

  // predchozi paket se vzorky byl dorucen, uvolnime vzorky z bufferu
  if ((nIdAndReset & 0x7F) != nPacketID)
  {
    while (Tech095_QueueGetCopyCount())
    {
      Tech095_QueueGet();
    }
  }

  // je nastaven RESET flag pro smazani fronty?
  if (nIdAndReset & 0x80)
  {
    pSample = Tech095_QueueReset();
    if (pSample)    // pokud byl element, vratit ho do smazane fronty, ten bude potom odeslan
    {
      Tech095_QueuePut(pSample);
    }
  }

  nPacketID = nIdAndReset & 0x7F;   // ulozit ID paketu bez reset flagu
  TxData[0] = PID_GET_DATA;

  u16 pos = 3;

  // nacpat vzorky do paketu
  uint16_t nLastPacketSampleCount = 0;  // citac vzorku
  while (nLastPacketSampleCount < nMaxSamples)
  {
    pSample = Tech095_QueueCopy(nLastPacketSampleCount);
    if (!pSample)
    {
      break;    // neni pSample v bufferu
    }

    nLastPacketSampleCount++;
    uint16_t nValue = 0x8000 + pSample->nVoltageM1; // offset kvuli znamenku
    TxData[pos++] = (u8)(nValue >> 8);   // pos X high
    TxData[pos++] = (u8)(nValue);  // pos X low

    nValue = 0x8000 + pSample->nCurrentM1;
    TxData[pos++] = (u8)(nValue >> 8);   // pos Y high
    TxData[pos++] = (u8)(nValue);  // pos Y low

    nValue = 0x8000 + pSample->nVoltageM2;
    TxData[pos++] = (u8)(nValue >> 8);   // pos X high
    TxData[pos++] = (u8)(nValue);  // pos X low

    nValue = 0x8000 + pSample->nCurrentM2;
    TxData[pos++] = (u8)(nValue >> 8);   // pos Y high
    TxData[pos++] = (u8)(nValue);  // pos Y low
  }

  TxData[1] = (u8) (nLastPacketSampleCount >> 8);
  TxData[2] = (u8) (nLastPacketSampleCount);

  B095_Service_SendPacketDataResponse(SR_OK_PACKET_PROCESSED, TxData, pos);
}

/*End of File**********************************************************/
