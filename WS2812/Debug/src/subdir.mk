################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Effects.c \
../src/RGBlibrary.c \
../src/WS2812driver.c \
../src/main.c \
../src/system_stm32f0xx.c 

OBJS += \
./src/Effects.o \
./src/RGBlibrary.o \
./src/WS2812driver.o \
./src/main.o \
./src/system_stm32f0xx.o 

C_DEPS += \
./src/Effects.d \
./src/RGBlibrary.d \
./src/WS2812driver.d \
./src/main.d \
./src/system_stm32f0xx.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -mfloat-abi=soft -std=gnu99 -DSTM32F051R8Tx -DSTM32F0 -DSTM32 -DSTM32F0DISCOVERY -DDEBUG -DUSE_STDPERIPH_DRIVER -DSTM32F051 -I"C:/Users/priesolv/workspace/WS2812/inc" -I"C:/Users/priesolv/workspace/WS2812/CMSIS/core" -I"C:/Users/priesolv/workspace/WS2812/CMSIS/device" -I"C:/Users/priesolv/workspace/WS2812/StdPeriph_Driver/inc" -I"C:/Users/priesolv/workspace/WS2812/Utilities" -O0 -g3 -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


