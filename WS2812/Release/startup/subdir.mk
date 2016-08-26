################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../startup/sysmem.c 

S_UPPER_SRCS += \
../startup/startup_stm32f0xx.S 

OBJS += \
./startup/startup_stm32f0xx.o \
./startup/sysmem.o 

S_UPPER_DEPS += \
./startup/startup_stm32f0xx.d 

C_DEPS += \
./startup/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
startup/%.o: ../startup/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -mfloat-abi=soft -std=gnu99 -DSTM32F051R8Tx -DSTM32F0 -DSTM32 -DSTM32F0DISCOVERY -DUSE_STDPERIPH_DRIVER -DSTM32F051 -I"C:/Users/priesolv/workspace/WS2812/inc" -I"C:/Users/priesolv/workspace/WS2812/CMSIS/core" -I"C:/Users/priesolv/workspace/WS2812/CMSIS/device" -I"C:/Users/priesolv/workspace/WS2812/StdPeriph_Driver/inc" -I"C:/Users/priesolv/workspace/WS2812/Utilities" -O3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

startup/%.o: ../startup/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -mfloat-abi=soft -std=gnu99 -DSTM32F051R8Tx -DSTM32F0 -DSTM32 -DSTM32F0DISCOVERY -DUSE_STDPERIPH_DRIVER -DSTM32F051 -I"C:/Users/priesolv/workspace/WS2812/inc" -I"C:/Users/priesolv/workspace/WS2812/CMSIS/core" -I"C:/Users/priesolv/workspace/WS2812/CMSIS/device" -I"C:/Users/priesolv/workspace/WS2812/StdPeriph_Driver/inc" -I"C:/Users/priesolv/workspace/WS2812/Utilities" -O3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


