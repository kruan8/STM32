/*
 * Eeprom.c
 *
 *  Created on: 26. 8. 2016
 *      Author: priesolv
 */

#include "Eeprom.h"



#define FLASH_PEKEY1               ((uint32_t)0x89ABCDEF) /*!< Flash program erase key1 */
#define FLASH_PEKEY2               ((uint32_t)0x02030405) /*!< Flash program erase key: used with FLASH_PEKEY2
                                                               to unlock the write access to the FLASH_PECR register and
                                                               data EEPROM */


//FLASH_Status writeEEPROMByte(uint32_t address, uint8_t data) {
//    FLASH_Status status = FLASH_COMPLETE;
//    address = address + 0x08080000;
//    DATA_EEPROM_Unlock();  //Unprotect the EEPROM to allow writing
//    status = DATA_EEPROM_ProgramByte(address, data);
//    DATA_EEPROM_Lock();  // Reprotect the EEPROM
//    return status;
//}
//
//uint8_t readEEPROMByte(uint32_t address) {
//    uint8_t tmp = 0;
//    address = address + 0x08080000;
//    tmp = *(__IO uint32_t*)address;
//
//    return tmp;
//}

void Eeprom_WriteUint32(uint32_t nAddr, uint32_t nValue)
{
  nAddr += DATA_E2_ADDR;
  *(uint32_t *)(nAddr) = nValue;
}

uint32_t Eeprom_ReadUint32(uint32_t nAddr)
{
  nAddr += DATA_E2_ADDR;
  return *(uint32_t *)(nAddr);
}

/**
  * Brief   This function unlocks the data EEPROM and the FLASH_PECR.
  *         The data EEPROM will be ready to be erased or programmed
  *         but the program memory will be still locked till PRGLOCK is set.
  *         It first checks no flash operation is on going,
  *         then unlocks PELOCK if it is locked.
  * Param   None
  * Retval  None
  */
void Eeprom_UnlockPELOCK(void)
{
  /* (1) Wait till no operation is on going */
  /* (2) Check if the PELOCK is unlocked */
  /* (3) Perform unlock sequence */
  while ((FLASH->SR & FLASH_SR_BSY) != 0) /* (1) */
  {
    /* For robust implementation, add here time-out management */
  }
  if ((FLASH->PECR & FLASH_PECR_PELOCK) != 0) /* (2) */
  {
    FLASH->PEKEYR = FLASH_PEKEY1; /* (3) */
    FLASH->PEKEYR = FLASH_PEKEY2;
  }
}

void Eeprom_WriteBuffer(uint16_t nAddr, uint8_t pBuffer, uint16_t nSize)
{
  while (nSize)
  {
    if (nSize % sizeof(uint32_t) == 0)
    {

    }

    *(uint8_t *)(DATA_E2_ADDR + 1) = 0x55; /* (1) */
    while ((FLASH->SR & FLASH_SR_BSY) != 0);
  }
}

/**
  * Brief   This function locks the NVM.
  *         It first checks no flash operation is on going,
  *         then locks the flash.
  * Param   None
  * Retval  None
  */
void Eeprom_LockNVM(void)
{
  /* (1) Wait till no operation is on going */
  /* (2) Locks the NVM by setting PELOCK in PECR */
  while ((FLASH->SR & FLASH_SR_BSY) != 0) /* (1) */
  {
    /* For robust implementation, add here time-out management */
  }
  FLASH->PECR |= FLASH_PECR_PELOCK; /* (2) */
}

/**
  * Brief   This function erases a word of data EEPROM.
  *         The ERASE bit and DATA bit are set in PECR at the beginning
  *         and reset at the endof the function. In case of successive erase,
  *         these two operations could be performed outside the function.
  *         The flash interrupts must have been enabled prior to call
  *         this function.
  * Param   addr is the 32-bt word address to erase
  * Retval  None
  */
void Eeprom_Erase(uint32_t addr)
{
  /* (1) Set the ERASE and DATA bits in the FLASH_PECR register
         to enable page erasing */
  /* (2) Write a 32-bit word value at the desired address
         to start the erase sequence */
  /* (3) Enter in wait for interrupt. The EOP check is done in the Flash ISR */
  /* (6) Reset the ERASE and DATA bits in the FLASH_PECR register
         to disable the page erase */
  FLASH->PECR |= FLASH_PECR_ERASE | FLASH_PECR_DATA; /* (1) */
  *(__IO uint32_t *)addr = (uint32_t)0; /* (2) */
  __WFI(); /* (3) */
  FLASH->PECR &= ~(FLASH_PECR_ERASE | FLASH_PECR_DATA); /* (4) */
}


