/*
 * spirit_spi.c
 *
 *  Created on: 24. 8. 2016
 *      Author: priesolv
 */

#include "spirit_spi.h"
#include "spirit.h"

#define SPIRIT1_CS_PIN                (1 << 1)
#define SPIRIT1_CS_GPIO_PORT          GPIOB

#define SPIRIT1_CS_ENABLE         (SPIRIT1_CS_GPIO_PORT->BRR = SPIRIT1_CS_PIN)
#define SPIRIT1_CS_DISABLE        (SPIRIT1_CS_GPIO_PORT->BSRR = SPIRIT1_CS_PIN)

#define CS_TO_SCLK_DELAY     0x0100
#define CLK_TO_CS_DELAY      0x0100

/* SPIRIT1_Spi_config_Headers */
#define HEADER_WRITE_MASK     0x00                                /*!< Write mask for header byte*/
#define HEADER_READ_MASK      0x01                                /*!< Read mask for header byte*/
#define HEADER_ADDRESS_MASK   0x00                                /*!< Address mask for header byte*/
#define HEADER_COMMAND_MASK   0x80                                /*!< Command mask for header byte*/

#define LINEAR_FIFO_ADDRESS   0xFF                                  /*!< Linear FIFO address*/

#define DUMMY_BYTE            0xFF

#define ALL_IRQ_ENABLE()  __enable_irq()
#define ALL_IRQ_DISABLE() __disable_irq()

/* SPIRIT1_Spi_config_Private_FunctionPrototypes */
#define SPI_ENTER_CRITICAL()  Spirit_DisableIRQ()
#define SPI_EXIT_CRITICAL()   Spirit_EnableIRQ()

/* SPIRIT1_Spi_config_Private_Macros */
#define BUILT_HEADER(add_comm, w_r) (add_comm | w_r)                             // macro to build the header byte
#define WRITE_HEADER        BUILT_HEADER(HEADER_ADDRESS_MASK, HEADER_WRITE_MASK) // macro to build the write header byte
#define READ_HEADER         BUILT_HEADER(HEADER_ADDRESS_MASK, HEADER_READ_MASK)  // macro to build the read header byte
#define COMMAND_HEADER      BUILT_HEADER(HEADER_COMMAND_MASK, HEADER_WRITE_MASK) // macro to build the command header byte

void SPIspirit_init()
{
  /* Enable the peripheral clock of GPIOA and GPIOB */
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
  RCC->IOPENR |= RCC_IOPENR_GPIOBEN;

  // set GPIO PA5, PA6, PA7 to AF function
  GPIOA->MODER = (GPIOA->MODER
                  & ~(GPIO_MODER_MODE5 | \
                      GPIO_MODER_MODE6 | GPIO_MODER_MODE7))\
                  | (GPIO_MODER_MODE5_1 | \
                     GPIO_MODER_MODE6_1 | GPIO_MODER_MODE7_1); /* (1) */
  GPIOA->AFR[0] = (GPIOA->AFR[0] & ~((0xF<<(4*5)) | (0xF<<(4*6)) | ((uint32_t)0xF<<(4*7)))); /* (2) */

  // set CS for output on PB1
  GPIOB->MODER = (GPIOB->MODER & ~(GPIO_MODER_MODE1)) | GPIO_MODER_MODE1_0;
  GPIOB->PUPDR = (GPIOB->PUPDR & ~(GPIO_PUPDR_PUPD1)) | GPIO_PUPDR_PUPD1_0;

  SPIRIT1_CS_DISABLE;

  /* Enable the peripheral clock SPI1 */
  RCC->APB2ENR |= RCC_APB2ENR_SPI1EN;

  /* Configure SPI1 in master */
  /* (1) Master selection, BR: Fpclk/256 (due to C13 on the board, SPI_CLK is set to the minimum)
        CPOL and CPHA at zero (rising first edge), 8-bit data frame */
  /* (2) Slave select output enabled, RXNE IT */
  SPI1->CR1 = SPI_CR1_MSTR | SPI_CR1_BR_0; /* (1) */  // (16MHz) :2
  SPI1->CR2 = SPI_CR2_SSOE; // | SPI_CR2_RXNEIE; /* (2) */
  SPI1->CR1 |= SPI_CR1_SPE; // Enable SPI

  /* Configure IT */
  /* (4) Set priority for SPI1_IRQn */
  /* (5) Enable SPI1_IRQn */
//  NVIC_SetPriority(SPI1_IRQn, 0); /* (4) */
//  NVIC_EnableIRQ(SPI1_IRQn); /* (5) */

}

uint8_t SPIspirit_write(uint8_t value)
{
  /*!< Loop while DR register in not empty */
  while (!(SPI1->SR & SPI_SR_TXE));
  SPI1->DR = value;

  // Wait to receive a byte
  while (!(SPI1->SR & SPI_SR_RXNE));
  return (uint8_t)(SPI1->DR);
}


uint16_t SPIspirit_SendHeader(uint8_t nHeader, uint8_t nValue)
{
  uint16_t status;

  SPI_ENTER_CRITICAL();

  /* Puts the SPI chip select low to start the transaction */
  SPIRIT1_CS_ENABLE;

  for (volatile uint16_t i = 0; i < CS_TO_SCLK_DELAY; i++);

  /* Write the aHeader bytes and read the SPIRIT1 status bytes */
  status = SPIspirit_write(nHeader);
  status = status << 8;

  /* Write the aHeader bytes and read the SPIRIT1 status bytes */
  status |= SPIspirit_write(nValue);

  return status;
}

void SPIspirit_Deactive()
{
  /* To be sure to don't rise the Chip Select before the end of last sending */
  while (SPI1->SR & SPI_SR_BSY);

  /* Puts the SPI chip select high to end the transaction */
  SPIRIT1_CS_DISABLE;

  SPI_EXIT_CRITICAL();
}

/**
* @brief  Write single or multiple RF Transceivers register
* @param  cRegAddress: base register's address to be write
* @param  cNbBytes: number of registers and bytes to be write
* @param  pcBuffer: pointer to the buffer of values have to be written into registers
* @retval StatusBytes
*/
StatusBytes SPIspirit_WriteRegisters(uint8_t cRegAddress, uint8_t cNbBytes, uint8_t* pcBuffer)
{
  uint16_t status = SPIspirit_SendHeader(WRITE_HEADER, cRegAddress);

//  g_RegVal[g_regCount++] = -1;
//  g_RegVal[g_regCount++] = cRegAddress;

  /* Writes the registers according to the number of bytes */
  for (uint8_t i = 0; i < cNbBytes; i++)
  {
    SPIspirit_write(pcBuffer[i]);
//    g_RegVal[g_regCount++] = pcBuffer[i];
  }

  SPIspirit_Deactive();

  StatusBytes *pStatus = (StatusBytes *) &status;
  return *pStatus;
}


/**
* @brief  Read single or multiple SPIRIT1 register
* @param  cRegAddress: base register's address to be read
* @param  cNbBytes: number of registers and bytes to be read
* @param  pcBuffer: pointer to the buffer of registers' values read
* @retval StatusBytes
*/
StatusBytes SPIspirit_ReadRegisters(uint8_t cRegAddress, uint8_t cNbBytes, uint8_t* pcBuffer)
{
  uint16_t status = SPIspirit_SendHeader(READ_HEADER, cRegAddress);

  for (uint8_t i = 0; i < cNbBytes; i++)
  {
    pcBuffer[i] = SPIspirit_write(DUMMY_BYTE);
  }

  SPIspirit_Deactive();

  StatusBytes *pStatus = (StatusBytes *) &status;
  return *pStatus;
}


/**
* @brief  Send a command
* @param  cCommandCode: command code to be sent
* @retval StatusBytes
*/
StatusBytes SPIspirit_CommandStrobes(uint8_t cCommandCode)
{
//  g_RegVal[g_regCount++] = -200;
//  g_RegVal[g_regCount++] = cCommandCode;
  uint16_t status = SPIspirit_SendHeader(COMMAND_HEADER, cCommandCode);

  SPIspirit_Deactive();

  StatusBytes *pStatus = (StatusBytes *) &status;
  return *pStatus;
}


/**
* @brief  Write data into TX FIFO
* @param  cNbBytes: number of bytes to be written into TX FIFO
* @param  pcBuffer: pointer to data to write
* @retval StatusBytes
*/
StatusBytes SPIspirit_WriteFifo(uint8_t cNbBytes, uint8_t* pcBuffer)
{
  uint16_t status = SPIspirit_SendHeader(WRITE_HEADER, LINEAR_FIFO_ADDRESS);

  /* Writes the registers according to the number of bytes */
  for (uint8_t i = 0; i < cNbBytes; i++)
  {
    SPIspirit_write(pcBuffer[i]);
  }

  SPIspirit_Deactive();

  StatusBytes *pStatus = (StatusBytes *) &status;
  return *pStatus;
}

/**
* @brief  Read data from RX FIFO
* @param  cNbBytes: number of bytes to read from RX FIFO
* @param  pcBuffer: pointer to data read from RX FIFO
* @retval StatusBytes
*/
StatusBytes SPIspirit_ReadFifo(uint8_t cNbBytes, uint8_t* pcBuffer)
{
  uint16_t status = SPIspirit_SendHeader(READ_HEADER, LINEAR_FIFO_ADDRESS);

  for (uint8_t i = 0; i < cNbBytes; i++)
  {
    pcBuffer[i] = SPIspirit_write(DUMMY_BYTE);
  }

  SPIspirit_Deactive();

  StatusBytes *pStatus = (StatusBytes *) &status;
  return *pStatus;
}

