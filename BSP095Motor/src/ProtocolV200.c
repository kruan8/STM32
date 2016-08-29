/**
  ******************************************************************************
  * @file    ProtocolV200.h
  * @author  Tejas H
  * @version V1.0.0
  * @date    08-October-2014
  * @brief   USART-Transmission/Reception declaration
  ******************************************************************************
  */

/*Includes********************************************/

#include "stm32f4xx.h"
#include <string.h>
#include "ProtocolV200.h"


/*Variables*******************************************/

static uint8_t MyID1 = 0;                      							//!< ID of the slave, we must assign at initialization
static uint8_t MyID2 = 0;                								//change      //!<  ID of the slave, we must assign at initialization
static uint8_t IDDataReady= NONE_ID_FOR_DATA_READY; 					//!< ID Slave for which are ready for data packet # 0
static volatile uint32_t RxDataPacketErr = RX_NO_ERROR;  				//!< Bitwise enumeration error while receiving a packet - used for calling event reception error
static volatile uint32_t RxFastCommandErr = RX_NO_ERROR;				// Bitwise enumeration error while recieved data
static uint8_t CurrentID = 0x0;
static volatile uint8_t RxStartByte = 0;      							//First Byte of the packet showing type and length of packet
static volatile uint32_t RxByteCnt = 0;         						//byte counter master to slave communication
static volatile uint32_t RxByteNum = 0;         						//!< calculated number of bytes (for stage communication M-> S)
static volatile uint8_t RxChs = 0;           						 	// Reception Check sum
static volatile uint32_t RxError = RX_NO_ERROR;							//!< Bitwise enumeration of errors that occurred while receiving a packet / command from the master
static volatile RX_TX_OPERATION CurrentOperation = RTO_IDLE;			//Current operation
static volatile uint32_t RxBuffIndex = 0;								//Index of first free position in the buffer
static volatile uint32_t RxBuffLength = 0;								//number of recieved bytes
static volatile bool RxFastCommand = false;								//Reception of fast command
volatile bool RxDataPacket = false;										//Reception of Data packet
static volatile bool GenBusy = false;									//Generator busy and not ready for communication
static volatile bool LinkLocked = false;								// Linklock variable to keep track of communication
volatile bool TxFastCommandResponse = false; 							//!< SYMPTOMS When you submit response to receiving the fast byte (only send a reply or acknowledgment)
volatile bool TxDataPacketResponse;  									//!< SYMPTOMS When you send the response to receipt of a data packet (sending packets or only confirmed)
static volatile bool TxResponseSuccessful = false;  					//!< Response send the result to the adoption of fast byte or packet data
Ptr_OnTxDataPacketResponse  pOnTxDataPacketResponse = NULL;				//Pointer function for reception of data
Ptr_OnRxDataPacket pOnRxDataPacket = NULL;								//pointer function for transimission of data
volatile uint8_t RxBuff[RXTX_Buff_Size];  								//!< the receive buffer for user data packet
volatile uint8_t TxBuff[RXTX_Buff_Size];								//!< the transmit buffer for user data packet
static volatile uint8_t TxStartByte = 0;       							//!< sending the first byte of the packet (shows the type and length of the packet)
volatile uint32_t TxByteCnt = 0;         								//!< Sent byte count
static volatile uint32_t TxByteNum = 0;         						//!< Calculated number of bytes sent (for Phase communications S-> M)
static volatile uint8_t TxChs = 0;            							//!< checksum byte sent (for Phase communications S-> M)
static volatile uint8_t TxRepeatCnt = 0;       							//!< pocitadlo resend the packet (after a bad reception Master)
static volatile uint32_t TxBuffIndex = 0;       						//!<index byte's turn for sending
static volatile uint32_t TxBuffLength = 0;     							//!< TxBufferu length (number of bytes sent customizing)
volatile bool TcFlag;

/* function ***********************************************************/

/*******************************************************************************
* Function Name  : V200_Init
* Description    : first called function
* Input          : port number
* Return         : None
*******************************************************************************/
void V200_Init(serial_port_e ePort, uint8_t deviceID, GPIO_TypeDef* dir_gpio, uint16_t dir_pin)
{
	MyID1 = deviceID;
	BTL_USART_Init(ePort, dir_gpio, dir_pin);
	USART_SetRxFunction(V200_OnRxByte);
	USART_SetTxFunction(V200_OnTxByte);
}


/*******************************************************************************
* Function Name  : V200_OnRxByte
* Description    : called by V200_HostUsartIrq during recepion of data
* Input          : None
* Return         : None
*******************************************************************************/

void V200_OnRxByte(uint8_t rxByte)
{
  uint32_t rxByteNumNv = 0;                //Local variable declared to break the reading order of volatile variable to solve warning pa082

	if(rxByte & 0x80)														//Check for 7th bit set- COMM_Start, COMM_end, Check Device
	{
		if(((rxByte & 0x3F) == MyID1) || ((rxByte & 0x3F) == MyID2))		 //TH: if the rxByte bit 0-6 match with myID1 or My ID2 usually for check_device start_comm
		{
			CurrentID = (rxByte & 0x3F);
			if(rxByte & 0x40)        										 //Locked command line TH: this is executed  only on COMM_start
			{
				/*REVIEW COMMENT: GenBusy flag needs to be set (V200_SetBusy) when ever generator needs more time to process data and latter cleared*/
        if(GenBusy == false)										   //if generator not busy,
				{
					V200_LockLink();										      // lock link,
					BTL_USART_SendByte(CurrentID | 0x40);				 // TH:Return slave device ready - START_ACk response
					//SEND_BYTE_DELAYED(CurrentID | 0x40);
				}
				else
				{
					if ((rxByte & 0x3F) == IDDataReady)
					{
						V200_LockLink();
						BTL_USART_SendByte(CurrentID | 0x40);			 // TH:Return slave device ready - START_ACk response
						// SEND_BYTE_DELAYED(CurrentID | 0x40);
					}
					else													// If Generator Busy
					{
						BTL_USART_SendByte(CurrentID);					// TH:Return slave device busy - START_ACk response
						//SEND_BYTE_DELAYED(CurrentID);
					}
				}
			}
			else                      										// command to test presence of the device //TH: This is called only on check_device
			{
				if(GenBusy == false)										  //if generator no busy
				{
					BTL_USART_SendByte(CurrentID);						// reply to check device- Slave ready
					//SEND_BYTE_DELAYED(CurrentID);
				}
				else
				{
					if ((rxByte & 0x3F) == IDDataReady)
					{
						BTL_USART_SendByte(CurrentID);					// reply to check device- Slave ready
						//SEND_BYTE_DELAYED(CurrentID);
					}
					else													// Generator busy
					{
						BTL_USART_SendByte(CurrentID | 0x40);			// reply to check device- Slave busy
						//SEND_BYTE_DELAYED(CurrentID | 0x40);
					}
				}
			}
		}
		else     															// TH: not addressed to this slave or release link
		{
			if(rxByte == 0xff)												//RELEASE_LINK_BYTE)
			{
				V200_UnlockLink();
			}
		}
	}
	else  																	// if 7th bit is 0 must be a data packet
	{
		if(LinkLocked) 														// Accept byte is intended for me
		{
			RxByteCnt++; 													//TH:increase byte count initially byte cnt is 0
			if(RxByteCnt == 1) 												//TH: first byte of packet after Start_Comm
			{
				RxChs += rxByte;   											//TH:  appends Check sum initially 0
				V200_ReadStartByte(rxByte); 								// TH: this 1 byte indicates the type of packet and number of bytes it has_denorm
			}
			else															//TH: if not first byte of packet
			{
				rxByteNumNv =  RxByteNum;                                                                             //Volatile variable value read to local variable to break  reading order error Pa082 in IAR
        if(RxByteCnt < (rxByteNumNv)) 			  // TH: Byte being recieved is less than the byte number the number of bytes is identified by the first byte
					RxChs += rxByte;										// TH: Modoify the check sum

				switch(CurrentOperation)  						// TH: current operation information
				{
					case RTO_RX_FAST_COMMAND: V200_RxFastCommand(rxByte);          break;   	// Receive fast command
					case RTO_RX_DATA_PACKET: 	V200_RxDataPacket(rxByte);  	       break;			// Receive Data packet of length7/140
					case RTO_TX_FAST_COMMAND:	V200_RxFastCommandResponse(rxByte);  break;			// Response received from master for previously transmitted fastcommand packet
					case RTO_TX_DATA_PACKET:  V200_RxDataPacketResponse(rxByte);   break;			// Response received from master for previously transmitted Datapacket
					case RTO_IDLE:						                                     break;
				}
			}

		}
	}
}


/*******************************************************************************
* Function Name  : V200_OnTxByte
* Description    : called by V200_HostUsartIrq during transmission complete of data
                    This function handles transmission of data to master, transmission may be one of fast command response, data packet response, data packet, fast command
* Input          : None
* Return         : None
*******************************************************************************/

void V200_OnTxByte(void)
{
	TcFlag=true;
	if(LinkLocked != false)  									// TH: link not locked
	{

		if(CurrentOperation != RTO_IDLE) 				// TH: operation not idle
		TxByteCnt++;											  		// TH:increment transmission counter

		switch(CurrentOperation)
		{
			case RTO_RX_FAST_COMMAND:             // TH: send fast command response for the fast command received
				V200_TxFastCommandResponse();
				break;
			case RTO_RX_DATA_PACKET:  						// TH: send data packet response for the data packet received
				V200_TxDataPacketResponse();
				break;
			case RTO_TX_FAST_COMMAND:							// TH: send a fast command packet to master
				V200_TxFastCommand();
				break;
			case RTO_TX_DATA_PACKET: 							// TH:Send a data packet to master
				V200_TxDataPacket();
				break;
			default: break;
		}
	}
}


/*******************************************************************************
* Function Name  : V200_ReadStartByte
* Description    : First byte contains the type of packet and length of
* 					       packet this function decodes it
* Input          : unsingend char received byte (first byte for data type detection)
* Return         : None
*******************************************************************************/

void V200_ReadStartByte(uint8_t rxByte)
{
  uint32_t rxBuffLengthNv = 0;      // Local variable declared to break the reading order of volatile variable to solve warning pa082
	RxStartByte = rxByte; 					  // TH: Copy first byte to another variable

  if((rxByte & 0xF0) == 0x30) 					// 0011 xxxx  //TH: in first byte 0011 xxxx pattern means packet recieved is fast command
  {
    CurrentOperation = RTO_RX_FAST_COMMAND;		// TH: Set current operation to RX_fast_command
    RxBuffLength = 0;													// TH: fast command has only 1byte
    RxByteNum = 2;                            // start byte + chs
  }
  else if((rxByte & 0xE0) == 0x40) 						// 010x xxxx   // TH: in first byte 010x xxxx pattern means packet received is data packet of length 7
  {
    CurrentOperation = RTO_RX_DATA_PACKET;		// TH: current operation to RX_data_packet
    RxBuffLength = (rxByte & 0x1F) * 7;     	// TH: bit 0-4 contains the lenght of data packet (length * 7)
    rxBuffLengthNv = RxBuffLength;                           // Volatile variable value read to local variable to break  reading order error Pa082  in IAR
    RxByteNum = 3 + rxBuffLengthNv + rxBuffLengthNv / 7;     // start byte + chs + const 0x77 + data  // TH: start byte +data + MSB bytes (Data/7)+077+chs
  }
  else if((rxByte & 0xE0) == 0x60) 										// 011x xxxx  //TH: in first byte 011x xxxx pattern means received is data packet of length 140
  {
    CurrentOperation = RTO_RX_DATA_PACKET; 								//TH: Set the current mode to RX_data packet
    RxBuffLength = (rxByte & 0x1F) * 140;    							// TH:  bit 0-4 contains the lenght of data packet (length * 140)
    rxBuffLengthNv = RxBuffLength;                        //Volatile variable value read to local variable to break  reading order error Pa082  in IAR
    RxByteNum = 3 + rxBuffLengthNv + rxBuffLengthNv / 7;  // start byte + chs + const 0x77 + data //TH: start byte +data + MSB bytes (Data/7)+077+chs
  }

  if(RxBuffLength > RXTX_Buff_Size) 								// TH: Check if the set buffer length is greater  than available buffer length
  {
    RxBuffLength = RXTX_Buff_Size; 									// TH: set the buffer length to max available buffer length
    RxError |= RX_LENGTH_ERROR;         						// TH: set length error in RxError flag
  }
}

/*******************************************************************************
* Function Name  : V200_RxFastCommand
* Description    : This function is called on reception of fast command
* Input          : unsigend char received byte in fast command mode
** Return         : None
*******************************************************************************/
/*REVIEW COMMENT: This part of code is not validated since this is not applicable to 043-HIL*/
void V200_RxFastCommand(uint8_t rxByte)
{
  uint32_t rxByteNumNv = 0;
  rxByteNumNv = RxByteNum;               // Volatile variable value read to local variable to break  reading order error Pa082 in IAR
  if (RxByteCnt == rxByteNumNv)      					// The last byte contains CHS // TH: is this last byte?
  {
    if (rxByte == (RxChs & 0x7F) && RxError == RX_NO_ERROR)  			// data are received OK //TH: check sum and no error
   	{
      if (GenBusy)          											// I am busy and can not revenues //TH: slave busy
      {
        if (CurrentID == IDDataReady)  								// TH: processing current ID
        {
          RxFastCommand = true;
        }
        else														// TH : Processing some other event
        {
          V200_InitLink();
          // SEND_BYTE_DELAYED(SCIII_PACKET_ERR_SLAVE_BUSY); 		//TH: Send slave busy to master
          BTL_USART_SendByte(CurrentID);
        }
      }
 			else
  		{
  			RxFastCommand = true;
  		}
   	}
   	else																// TH: if check sum is not true and error ocurred
    {
      RxFastCommandErr = RxError;        								// TH: set fast command error
      if (rxByte != (RxChs & 0x7F))
      {
        RxFastCommandErr |= RX_CHS_ERROR;  							// TH: set fast command errot with chs error
      }

      V200_InitLink();
      BTL_USART_SendByte(PACKET_ERR_INVALID_CHS);
    }
  }
}

/*******************************************************************************
* Function Name  : V200_RxDataPacket
* Description    : This function is called on reception of Data Packet
* Input          : unsigned char received byte
* Return         : None
*******************************************************************************/

void V200_RxDataPacket(uint8_t rxByte)
{
	uint32_t rxByteNumNv = 0;
	uint32_t rxBuffLengthNv = 0;

	rxByteNumNv = RxByteNum;                // Volatile variable value read to local variable to break  reading order error Pa082  in IAR

	if (RxByteCnt < rxByteNumNv - 1)  						// TH: not last byte enters his block
  {
	  rxBuffLengthNv = RxBuffLength;        // Volatile variable value read to local variable to break  reading order error Pa082 in IAR
    if (((RxByteCnt - 1) & 0x07) == 0) 					// Every eighth byte is MSB previous byte // TH: Every 8th byte will enter this loop
    {
      /*REVIEW COMMENT: Below lines of code D-Packetize according protocol*/
      for (uint8_t i = 1; i < 8; i++)
      {
        rxByte <<= 1;
        if (rxByte & 0x80)
        {
          RxBuff[RxBuffIndex - i] |= 0x80;
        }
      }

//      if(RxBuffIndex-7 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-7] |= (rxByte & 0x01) ? 0x80 : 0x00;
//      if (RxBuffIndex-6 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-6] |= (rxByte & 0x02) ? 0x80 : 0x00;
//      if (RxBuffIndex-5 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-5] |= (rxByte & 0x04) ? 0x80 : 0x00;
//      if (RxBuffIndex-4 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-4] |= (rxByte & 0x08) ? 0x80 : 0x00;
//      if (RxBuffIndex-3 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-3] |= (rxByte & 0x10) ? 0x80 : 0x00;
//      if (RxBuffIndex-2 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-2] |= (rxByte & 0x20) ? 0x80 : 0x00;
//      if (RxBuffIndex-1 < rxBuffLengthNv)
//        RxBuff[RxBuffIndex-1] |= (rxByte & 0x40) ? 0x80 : 0x00;
    }
    else																// TH: If not 8th byte then this block will be entered
    {
      if (RxBuffIndex < rxBuffLengthNv)
      {
        RxBuff[RxBuffIndex] = rxByte;
      }

      RxBuffIndex++;
    }
  }
	else																   	//TH: if last byte
	{
    rxByteNumNv = RxByteNum;     	                      // Volatile variable value read to local variable to break  reading order error Pa082 in IAR
		if (RxByteCnt == rxByteNumNv)      								  // The last byte contains CHS
		{
			if (rxByte == (RxChs & 0x7F) && RxError == RX_NO_ERROR)  		// data are received OK
			{
				if (GenBusy)           										//Gen busy and can not execute
				{
				  if (CurrentID == IDDataReady)                            /*REVIEW COMMENT: probably this condition may be used when generator is already doing task which master is requesting, Iddataready not handeled currently */
					{
						RxDataPacket = true;
					}
					else
					{
						V200_InitLink();
						BTL_USART_SendByte(PACKET_ERR_SLAVE_BUSY);
					}
				}
				else
				{
					RxDataPacket = true;
				}
			}
			else															// data are received error
			{
				RxDataPacketErr = RxError;
				if(rxByte != (RxChs & 0x7F))								// if checksum not correct
				{
					RxDataPacketErr |= RX_CHS_ERROR;						// set packet error to Rx check sum error¨
				}

				V200_InitLink();
				BTL_USART_SendByte(PACKET_ERR_INVALID_CHS);
			}
		}
	}
}


/*******************************************************************************
* Function Name  : V200_RxFastCommandResponse
* Description    : This function is called on reception of fast command response
* Input          : unsigned char rxbyte recieved in resposnse to previous fast command transimssion
* Return         : None
*******************************************************************************/
/*REVIEW COMMENT: This part of code is not validated since this is not applicable to 043-HIL*/
void V200_RxFastCommandResponse(uint8_t rxByte)
{
	if((rxByte == PACKET_ERR	) && (TxRepeatCnt < REPEAT_SENDING_AFTER_PACKET_ERR))  		// TH: check recieved byte means previous fast command transmission was erroneous and resend attempt are not reached then resend the data
	{
		TxRepeatCnt++;																		//TH: repeat send counter increment
		TxChs = 0;																			//TH: Transmission chs
		TxByteCnt = 1;																		//TH:byte count for fast_command
		V200_TxFastCommand();																//TH:transmit fast command
	}
	else																					//TH: transmitted data ok
	{
		V200_InitLink();   																	// TH: Initialize link
		TxResponseSuccessful = (rxByte == PACKET_ERR) ? false : true;  						// TH: transmission response flag ture or false
		TxFastCommandResponse = true;														//TH: set fast command transmission response flag
	}
}

/*******************************************************************************
* Function Name  :	V200_RxDataPacketResponse
* Description    : This function is called on reception of data packet response
* Input          : Unsigned char received byte in response to previously transmitted data packet
* Return         : None
*******************************************************************************/

void V200_RxDataPacketResponse(uint8_t rxByte)
{
	if((rxByte == PACKET_ERR) && (TxRepeatCnt < REPEAT_SENDING_AFTER_PACKET_ERR)) 		// TH: check recieved byte means previous fast command transmission was erroneous and resend attempt are not reached then resend the data
	{
		TxRepeatCnt++;																	//TH: repeat send counter increment
		TxChs = 0;																		//TH: Transmission chs
		TxBuffIndex = 0;																//TH: reinitialize buffer index
		TxByteCnt = 1;																	//TH:byte count for fast_command
		V200_TxDataPacket();															//TH:transmit fast command
	}
	else																				//TH: transmitted data ok
	{
		V200_InitLink();
		TxResponseSuccessful = (rxByte == PACKET_ERR) ? false : true;
		TxDataPacketResponse = true;
	}
}

/*******************************************************************************
* Function Name  :	V200_InitLink
* Description    : clears the buffer index and buffer counts to zero and clear flags
* Input          : None
* Return         : None
*******************************************************************************/

void V200_InitLink(void)
{
	CurrentOperation = RTO_IDLE;

	RxBuffIndex = 0;
	TxBuffIndex = 0;
	RxBuffLength = 0;
	TxBuffLength = 0;

	RxStartByte = 0;
	RxByteCnt = 0;
	RxByteNum = 0;
	RxChs = 0;
	RxError = RX_NO_ERROR;

	TxStartByte = 0;
	TxByteCnt = 0;
	TxByteNum = 0;
	TxChs = 0;
	TxRepeatCnt = 0;
}

/*******************************************************************************
* Function Name  : V200_LockLink
* Description    : sets link lock variable to lock (communication is at mid satge)
* Input          : None
* Return         : None
*******************************************************************************/

void V200_LockLink(void)

{
	V200_InitLink();
	LinkLocked = true;
}

/*******************************************************************************
* Function Name  : V200_UnlockLink
* Description    : unlocks link communication completed/aborted
* Input          : None
* Return         : None
*******************************************************************************/

void V200_UnlockLink(void)

{
  /*REVIEW COMMENT: Clearing here needs more depth analysis*/
  //V200_InitLink(); - pozor, zamyslet se, smaze delky bufferu a start bajt a v execu budou neplatne

	LinkLocked = false;
}

/*******************************************************************************
* Function Name  : V200_TxFastCommand
* Description    : Transmission of Fast command packet
* Input          : None
* Return         : None
*******************************************************************************/
/*REVIEW COMMENT: This part of code is not validated since this is not applicable to 043-HIL*/
void V200_TxFastCommand(void)   												 //TH: Send fast command to master
{
  uint8_t txStartByteNv=0;                                                                                                          //Local variable declared to break the read order of volatile variable
	if(TxByteCnt == 1)															 //TH: if first byte
	{
		txStartByteNv =TxStartByte;
    TxChs += txStartByteNv;
		//SEND_BYTE_DELAYED(TxStartByte); //TH: send start byte

	}

	if(TxByteCnt == 2)
	{
		// SEND_BYTE(TxChs & 0x7F); // TH: Send Check Sum
	}
}

/*******************************************************************************
* Function Name  :  V200_TxDataPacket
* Description    : Transimisson of data packet
* Input          : None
* Return         : None
*******************************************************************************/

void V200_TxDataPacket(void)
{
	uint8_t txStartByteNv = 0;
	uint32_t txByteNumNV = 0;
	uint32_t txBuffLengthNV = 0;    //Local variable declared to break the read order of volatile variable
 
	if (TxByteCnt == 1)
	{
    txStartByteNv = TxStartByte;
		TxChs += txStartByteNv;
		BTL_USART_SendByte(TxStartByte);
	}
	else
	{
    txByteNumNV = TxByteNum;
		if (TxByteCnt < txByteNumNV - 2)  									 		// will be able to send data bytes // TH: bytes being transmitted is not last 2 bytes-> constant 0x77 and CHS
		{
		  txBuffLengthNV = TxBuffLength;

			uint8_t TxByte = 0;
			if (((TxByteCnt - 1) & 0x07) == 0) 									// Every eighth byte is MSB previous byte //TH: enters after every 7bytes
			{
			  for (uint8_t i = 1; i < 8; i++)
			  {
			    TxByte <<= 1;
			    if (TxBuff[TxBuffIndex - i] & 0x80)
			    {
			      TxByte |= 0x01;
			    }
			  }

//				if (TxBuffIndex - 7 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 7] & 0x80) ? 0x01 : 0x00;
//				if (TxBuffIndex - 6 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 6] & 0x80) ? 0x02 : 0x00;
//				if (TxBuffIndex - 5 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 5] & 0x80) ? 0x04 : 0x00;
//				if (TxBuffIndex - 4 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 4] & 0x80) ? 0x08 : 0x00;
//				if (TxBuffIndex - 3 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 3] & 0x80) ? 0x10 : 0x00;
//				if (TxBuffIndex - 2 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 2] & 0x80) ? 0x20 : 0x00;
//				if (TxBuffIndex - 1 < txBuffLengthNV)
//					TxByte |= (TxBuff[TxBuffIndex - 1] & 0x80) ? 0x40 : 0x00;
			}
			else           //TH: 1 to 7 bytes
			{
        if (TxBuffIndex < txBuffLengthNV)
        {
					TxByte = TxBuff[TxBuffIndex] & 0x7F;
        }

				TxBuffIndex++;
			}

			TxChs += TxByte;
			BTL_USART_SendByte(TxByte);
		}

    txByteNumNV = TxByteNum;
		if(TxByteCnt == txByteNumNV - 2)  										// Is the row Outgoing constants 0x77 // TH: Last but one byte
		{
			TxChs += CHS_IDENTIFICATION_BYTE;
			BTL_USART_SendByte(CHS_IDENTIFICATION_BYTE);
		}

		txByteNumNV = TxByteNum;
		if(TxByteCnt == txByteNumNV - 1) 											// is the row Outgoing CHS // TH: Last Byte
		{
			BTL_USART_SendByte(TxChs & 0x7F);
		}
	}
}


/*******************************************************************************
* Function Name  : V200_TxFastCommandResponse
* Description    : Transimisson of response to fast command packet recieved
* Input          : None
* Return         : None
*******************************************************************************/
/*REVIEW COMMENT: This part of code is not validated since this is not applicable to 043-HIL*/
void V200_TxFastCommandResponse(void)
{
	V200_InitLink();
	TxResponseSuccessful = true;
	TxFastCommandResponse = true;
}


/*******************************************************************************
* Function Name  : V200_TxDataPacketResponse
* Description    : Transimisson of response to Data packet recieved
* Input          : None
* Return         : None
*******************************************************************************/

void V200_TxDataPacketResponse(void)
{
	V200_InitLink();
	TxResponseSuccessful = true;
	TxDataPacketResponse = true;
}

/*******************************************************************************
* Function Name  : V200_SendPacketDataResponse
* Description    : Transimisson of response to Data packet after processing the data packet
* Input          : Slave response- Slave response type for recieved packet
* 				   Data- Data on processing the packet
* 				   data length- length of Data
* Return         : bool: True- Packet Data Response was sent successfully
* 							false-	Packet Data Response was not sent successfully
*******************************************************************************/

bool V200_SendPacketDataResponse(SLAVE_RESPONSE enResponse, uint8_t *pData, uint32_t nLength)
{
	uint32_t i;
	uint32_t LengthRound7;
	uint32_t LengthRound140;
	uint32_t rxByteNumNV=0;
	bool linkLockedNV = false;

	linkLockedNV = LinkLocked;
	rxByteNumNV = RxByteNum;

	if(RxByteCnt != rxByteNumNV && linkLockedNV == false) 			// Communication is not at the stage where the master waits for a response
		return false;

	if(nLength > RXTX_Buff_Size)
		return false;

	if(((pData) != NULL) &&	(nLength != 0) && (enResponse == SR_OK_PACKET_PROCESSED || enResponse == SR_OK_PACKET_PROCESSED_LATELY))
	{
		if(TxBuff != pData)
		{
			for(i = 0; i < nLength; i++)
				TxBuff[i] = *pData++;
		}

		CurrentOperation = RTO_TX_DATA_PACKET;
		TxBuffLength = nLength;

		LengthRound7 = ((nLength + 6) / 7) * 7;
		LengthRound140 = ((nLength + 139) / 140) * 140;

		if(LengthRound7 > 217)                                               // REVIEW COMMENT: This condition for 043-HIL since 043 dont use length 140 so data to be sent will never be greater than 217bytes
		{
			TxStartByte = (uint8_t)(0x60 | (LengthRound140 / 140));
			TxByteNum = 4 + LengthRound140 + LengthRound140 / 7; 							 // response + start byte + chs + const 0x77 + data
		}
		else
		{
			TxStartByte = (uint8_t)(0x40 | (LengthRound7 / 7));
			TxByteNum = 4 + LengthRound7 + LengthRound7 / 7;      							// response + start byte + chs + const 0x77 + data
		}
	}

	switch(enResponse)
	{
	case SR_OK_PACKET_PROCESSED:        BTL_USART_SendByte(PACKET_OK_PROCESSED_PROMPTLY);   break;
	case SR_OK_PACKET_PROCESSED_LATELY: BTL_USART_SendByte(PACKET_OK_PROCESSED_LATELY);     break;
	case SR_ERR_SYNTAX_ERROR:           BTL_USART_SendByte(PACKET_ERR_SYNTAX_ERROR);        break;
	case SR_ERR_SLAVE_BUSY:             BTL_USART_SendByte(PACKET_ERR_SLAVE_BUSY);          break;
	case SR_ERR_UNSUPPORTED_PACKET:     BTL_USART_SendByte(PACKET_ERR_UNSUPPORTED_PACKET);  break;
	default:                            BTL_USART_SendByte(PACKET_ERR_UNSUPPORTED_PACKET);  break;
	}

	return true;
}

/*******************************************************************************
* Function Name  : V200_CommExec
* Description    : Periodic execution of command
* Input          : None
* Return         : None
*******************************************************************************/

void V200_CommExec(void)
{
	/*This section is disabled as fast command is no more a packet for new 043-HIL*/
	/*  if(RxFastCommand && bTxFastCommandResponse == false && bTxDataPacketResponse == false)
  	  {
    	RxFastCommand = false;
    	if(pOnRxFastCommand)
      	  pOnRxFastCommand(RxStartByte & 0x0F);
  	  }*/

	if (RxDataPacket && TxFastCommandResponse == false && TxDataPacketResponse == false)
	{
		RxDataPacket = false;
		if (pOnRxDataPacket)
		{
			pOnRxDataPacket((uint8_t*)RxBuff, RxBuffLength);
		}

		//   if(g_bEnCleanRxBuff)                                                       /*REVIEW COMMENT: this flag is used to clear the transmission buffer, we need to understand where to set this flag and when*/
		//  memset((void*)RxBuff, 0x00, RxBuffLength);
	}

	/*This section is disabled as fast command is no more a packet for new 043-HIL*/
	/*  if(bTxFastCommandResponse)
  	  {
    	bTxFastCommandResponse = false;
    	if(pOnTxFastCommandResponse)
      	  pOnTxFastCommandResponse(TxResponseSuccessful);
  	  }*/

	if (TxDataPacketResponse)
	{
		TxDataPacketResponse = false;
		if (pOnTxDataPacketResponse)
		{
			pOnTxDataPacketResponse(TxResponseSuccessful);
		}
	}
        
  /*REVIEW COMMENT: below command needs analysis*/

	/* if(bSynchroID_Active)
  	  {
    	bSynchroID_Active = false;
    	if(pOnSynchroID_Received)
      	  pOnSynchroID_Received(SynchroID);
  	  }*/
}


/*******************************************************************************
* Function Name  : V200_SetOnRxDataPacket
* Description    : Set pointer function on reception of data
* Input          : pointer function
* Return         : None
*******************************************************************************/
void V200_SetOnRxDataPacket(Ptr_OnRxDataPacket pFunction)
{
	pOnRxDataPacket = pFunction;
}

/*******************************************************************************
* Function Name  : V200_SetOnRxDataPacket
* Description    : Set pointer function on transmission of data
* Input          : pointer function that should be called on data packet response transmission
* Return         : None
*******************************************************************************/
void V200_SetOnTxDataPacketResponse(Ptr_OnTxDataPacketResponse pFunction)
{
	pOnTxDataPacketResponse = pFunction;
}

/*******************************************************************************
* Function Name  : V200_GetTxBuff
* Description    : returns a pointer to transmission buffer
* Input          : None
* Return         : pointer to transmission buffer
*******************************************************************************/
uint8_t* V200_GetTxBuff(void)
{
	return (uint8_t*)TxBuff;
}

/*******************************************************************************
* Function Name  : V200_SetBusy
* Description    : Sets generator state to busy or not busy
* Input          : True- Generator busy
* 				   false-  Generator not busy
* Return         : none
*******************************************************************************/
void V200_SetBusy(bool NewState)
{
	if(NewState != false)
	{
		GenBusy=true;
	}
	else
	{
		GenBusy=false;
	}
}

void V200_ConvertU32ToArray(u32 value, u8 *array)
{
	array[0] = (u8)(value >> 24);
	array[1] = (u8)(value >> 16);
	array[2] = (u8)(value >> 8);
	array[3] = (u8)(value);
}

void V200_ConvertS32ToArray(s32 value, u8 *array)
{
	array[0] = (u8)(value >> 24);
	array[1] = (u8)(value >> 16);
	array[2] = (u8)(value >> 8);
	array[3] = (u8)(value);
}

uint32_t V200_ConvertArrayToU32( u8 *array)
{
	uint32_t value = 0;
	value = (uint32_t) array[0] << 24;
	value |= (uint32_t) array[1] << 16;
	value |= (uint32_t) array[2] << 8;
	value |= (uint32_t) array[3];

	return value;
}

/****End of file **************/
