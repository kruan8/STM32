/*
 * Log.h
 *
 *  Created on: 4. 3. 2016
 *      Author: priesolv
 */

#ifndef LOG_H
#define LOG_H

#include "stm32f4xx.h"
#include "stdbool.h"
#include "ProtocolV200.h"

#ifdef __cplusplus
 extern "C" {
#endif

//! Version of logging system
#define LOG_SYSTEM_VERSION  100
//! Maximal size of structure description
#define MAX_STRUCT_DESCRIPTION_SIZE   1024
//! Maximal logging buffer size for ASCII records logging (hodnotu 1023 vymyslel Macik, viz. kom. protokol)
#define MAX_LOG_ASCII_DATA_SIZE   1023
//! Maximal size of logging binary data (hodnotu 1023 vymyslel Macik, viz. kom. protokol)
#define MAX_LOG_BINARY_DATA_SIZE  1023

//! Number of control bytes in logging packet (packet with ID 0x93 and 0x94)
// !!! don't change the value, it must correspond to construction in function Log_PreparePacket() !!!
#define LOG_PACKET_CONTROL_BYTES  3

//! Logging buffer size for ASCII records logging
#ifndef LOG_BUFFER_SIZE
  #define LOG_BUFFER_SIZE   MAX_LOG_ASCII_DATA_SIZE
#endif

// The size have to be limited by SCIS_RXTX_BUFF_SIZE
#if (LOG_BUFFER_SIZE > MAX_LOG_ASCII_DATA_SIZE)
  #undef LOG_BUFFER_SIZE
  #define LOG_BUFFER_SIZE  MAX_LOG_ASCII_DATA_SIZE
#endif

// The size have to be limited by SCIS_RXTX_BUFF_SIZE
#if (LOG_BUFFER_SIZE > (SCIS_RXTX_BUFF_SIZE - LOG_PACKET_CONTROL_BYTES))
  #undef LOG_BUFFER_SIZE
  #define LOG_BUFFER_SIZE  (RXTX_Buff_Size - LOG_PACKET_CONTROL_BYTES)
#endif

// The size have to be limited by SCIS_RXTX_BUFF_SIZE
#if (MAX_LOG_BINARY_DATA_SIZE > (SCIS_RXTX_BUFF_SIZE - LOG_PACKET_CONTROL_BYTES))
  #undef MAX_LOG_BINARY_DATA_SIZE
  #define MAX_LOG_BINARY_DATA_SIZE  (SCIS_RXTX_BUFF_SIZE - LOG_PACKET_CONTROL_BYTES)
#endif

//! Maximal size of logging ASCII message, addition 4 = 'M' + ':' + CR + LF
#define MAX_LOG_MESSAGE_SIZE  (LOG_BUFF_SIZE - 4)

//! Format of header used in structure description, Don't change the string (it is used in projects)
#define HEADER_STRUCTURE_STRING   "STRUCT=%i;ICNT=%i;SIZE=%i;NAME=%s;"

//! Level of logging, !!! must be storable to two bites !!!
typedef enum
{
  LOG_LEVEL_0 = 0,  // lowest level, very saving for use at customers (default)
  LOG_LEVEL_1 = 1,  // more detailed for use at customers
  LOG_LEVEL_2 = 2,  // for use in testing department
  LOG_LEVEL_3 = 3   // highest level, for debug code and testing only
}LOGGING_LEVEL;

// Type of logging enable, !!! Don't change enum values, it is used in communication protocol with master. !!!
typedef enum
{
  LE_DISABLED = 0,
  LE_ASCII_ONLY = 1,
  LE_BINARY_ONLY = 2,
  LE_ALL_ENABLED = 3,
} LOGGING_ENABLE;

// Logging IDs for warnings (must be in range 0..999)
#define WLOG_OK_ID                    0

// Logging IDs for errors (must be in range 0..999)
#define ELOG_OK_ID                    0
#define ELOG_LOG_BUFF_OVERFLOW        1
#define ELOG_LOG_FIFO_OVERFLOW        2
#define ELOG_LOG_DESCRIPTION_INVALID  3
#define ELOG_LOG_STRUCT_SIZE_INVALID  4


/*!
  Function type for filling pDesBuff by binary data. Binary data = ID of structure + data of structure.
    nStructureID - ID of required structure (by the same value must start binary data)
    pDesBuff - buffer to store binary data
    nMaxDesBuffSize - maximal size of binary data for overflow check
  Function returns number of binary data.
*/
typedef uint16_t(*COPY_BINARY_DATA_FUNC)(uint8_t nStructureID, uint8_t* pDesBuff, uint16_t nMaxDesBuffSize);

/*!
  Necessary initialization before logging use.
    parametes are pointers to functions defined in application:
      MakeTxRequest - function sets 15.bit in status register (request for logging data read)
      ClearTxRequest - function clears 15.bit in status register
      CopyBinaryData - function fills destination buffer by data of required structure
*/
extern void Log_Init(VOID_FUNC pMakeTxRequest, VOID_FUNC pClearTxRequest, COPY_BINARY_DATA_FUNC pCopyBinaryData);
// If you set pointers in Log_Init() you need not to use following functions
extern void Log_SetMakeTxRequestFunc(VOID_FUNC pFunc);
extern void Log_SetClearTxRequestFunc(VOID_FUNC pFunc);
extern void Log_SetCopyBinaryDataFunc(COPY_BINARY_DATA_FUNC pFunc);

extern void Log_ClearAllLogs();

//! Enable of logging, after reset it is disabled (LE_DISABLED)
extern void Log_SetEnable(LOGGING_ENABLE eLoggingEnable);
extern LOGGING_ENABLE Log_GetEnable();

/*!
  Setting of logging configuration.
    dwConfig - logging level and bit enum of logging events independent on logging level
             - bits 0,1 includes logging level - value of LOGGING_LEVEL
             - bits 2..31 includes bit enum of logging events independent on logging level
                          - bits 2..15 are reserved for common events of all generators (defined below)
                          - bits 16..31 are reserved for project dependent events
*/
extern void Log_SetConfig(uint32_t dwConfig);
extern uint32_t Log_GetConfig();
extern LOGGING_LEVEL Log_GetLevel();

/*!
  Setting enable logging in interrupt with interrupt level eBlockInterruptLevel and lower.
    bEnLogInInterrupt - enable/disable logging in interrupt
    eBlockInterruptLevel - maximal interrupt level in which you want to call Log_Add...() functions
                         - this parametr is used only if logging in interrupt is enabled
  !!! Important note:                                                                                     !!!
  !!! If you enable this feature, all interrupts with interrupt level eBlockInterruptLevel and lower will !!!
  !!! be blocked during logging. Use this feature only if you don't need immediate entering to interrupt. !!!
*/
//extern void Log_SetEnLogInInterrupt(bool bEnLogInInterrupt, INTERRUPT_LEVEL eBlockInterruptLevel);

/*!
  Addition of record to buffer for ASCII data logging.
    nWarningID - can be 0..9999
    nErrorID - can be 0..9999
    sString - string terminated by 0
    dwConfig - configuration on which have to be the record logged
             - parametr is described in comment of function Log_SetConfig(uint32_t dwConfig)
    bSend - driver generates request for sending logged data to master
    nStringSize - velikost retezce sString bez zarazky
                - parametr neni povinny - pokud je 0 velikost se vypocitava, jeho zadanim setrite cas (velikost vraci sprintf)
*/
extern bool Log_AddWarning(uint16_t nWarningID, uint32_t dwConfig, bool bSend);
extern bool Log_AddError(uint16_t nErrorID, uint32_t dwConfig, bool bSend);
extern bool Log_AddMessage(P_STRING sString, uint32_t dwConfig, bool bSend, uint16_t nStringSize);

/*!
  Addition of structure ID to FIFO for binary data logging.
    nStructureID - ID of structure required to logging
    dwConfig - configuration on which have to be the record logged
             - parametr is described in comment of function Log_SetConfig(uint32_t dwConfig)
  !!! Calling this function is not logging. It is request for structure logging only. !!!
  !!! The logging is executed in CopyBinaryDataFunc calling before packet sending.    !!!
*/
extern bool Log_AddBinaryData(uint8_t nStructureID, uint32_t dwConfig);

//! Returns TRUE if ID of structure is already used in FIFO
extern bool Log_IsBinaryRequestInFiFo(uint16_t nStructureID);

//! Check of addition the record according current configuration
extern bool Log_CanAddLog(uint32_t dwLogConfig);

/*!
  Preparing of logging packet for master (packet with ID 0x93 or 0x94 or 0xE0)
    pTxPacket - field to filling by packet data (logged data with contol bytes of packet)
    nMaxPacketSize - size of pTxPacket to protection of buffer overflow
  Function returns packet data size.
*/
extern uint16_t Log_PreparePacket(uint8_t* pTxPacket, uint16_t nMaxPacketSize);

/*
  *************************** STRUCTURE DESCRIPTION OF BINARY DATA ***************************

  The structure description consists of HEADER string and ITEM strings. All strings must be terminated by 0.
  ITEM strings must be placed immediately after HEADER string.

  1. Format of HEADER string:

    "STRUCT=number;ICNT=count;SIZE=size;NAME=name"

      STRUCT - identification number of structure, must be in range 0..255
      ICNT - count of items in structure
      SIZE - structure size [in bytes]
      NAME - structure name

    All attributes are required.

  2. Format of ITEM string:

    "name:X*cnt[unit]^exp(low,high)#note"

      name - name of variable, must be first in the string
      X - type of variable, must be placed after control character ':', types are defined in following table
      cnt - count of variables (default 1, for array use higher then 1), must be placed after control character '*'
      unit - physical unit after exp operation, must be placed in square brackets []
      exp - shift of radix point (default 0, for shift calculate as 10 power of exponent)), must be placed after control character '^'
      low,high - range of variable value after exp operation, must be placed in curve brackets ()
      note - comment to variable, must be placed after control character '#'

    Variable name and type are required, others are optional. Don't use control characters :*[]^()# in attributes value.
    Character $ use before system variable name only.

      Variable name reserved:
                  $WarningID   - use variable to marking warning log (0 - no warning)
                  $ErrorID     - use variable to marking error log (0 - no error)
                  $StartArrXXX - index to XXX field on first valid sample (default is 0, use varible if field is round buffer)
                  $CountArrXXX - count of valid samples in XXX field (default is field size, use varible if filed may not be full)
                  $StartArr    - index to all fields on first valid sample (default is 0, use varible if all fields are same round buffers)
                  $CountArr    - count of valid samples in all fields (default is field size, use varible if all fields are same buffers and may not be full)

      Variable type table:
       Identification character       Type                Size
                  b                int8, char               1
                  B               uint8, UCHAR              1
                  O                  bool                1
                  h                int16, SINT              2
                  H               uint16, UINT              2
                  l                int32, long              4
                  L               uint32, ULONG             4


  Example of description following structure:

  typedef struct
  {
    UINT wWarningID;
    UINT wErrorID;
    UCHAR byMainsVoltage;         // [10V], 18..25V
    UCHAR arrOutputVoltage[10];   // [mV]
    UCHAR byStartOutputVoltage;   // first valid index in arrOutputVoltage
    UCHAR byCountOutputVoltage;   // count of valid samples in arrOutputVoltage
  } EXAMPLE;

  const CP_STRING StructDescription[7] =
  {
    "STRUCT=0;ICNT=6;SIZE=17;NAME=example",
    "$WarningID:H",
    "$ErrorID:H",
    "MainsVoltage:B[V]^1(180,250)#measured mains voltage",
    "OutputVoltage:B[mV]*10"
    "$StartArrOutputVoltage:B"
    "$CountArrOutputVoltage:B"
  };
*/

//! Helpful functions for structure description of binary data, you can use for check structure size
extern uint16_t Log_GetStructureSize(const CP_STRING* pStructureDescription, uint16_t nStringCount);
extern uint16_t Log_GetDescriptionSize(const CP_STRING* pStructureDescription, uint16_t nStringCount);
extern uint8_t Log_GetVariableSize(const CP_STRING pVariableDescription);

/*
  Bit mask of logging events independet on logging level.
  Following bits are defined for common events of all generators (reserved range 2..15).
*/
#define LOG_TEMPERATURES_BIT  0x00000004

#ifdef __cplusplus
}
#endif

#endif
