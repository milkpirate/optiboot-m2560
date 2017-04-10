#!/usr/bin/env bash

git clone https://github.com/majekw/optiboot.git
cd optiboot/optiboot/bootloaders/optiboot/
make clean

f_cpu="16000000L"

for avr_type in atmega1284p atmega2560; do
    for baud in 115200 1000000; do
        F_CPU=$f_cpu AVR_FREQ=$f_cpu BAUD_RATE=$baud BIGBOOT=1 make $avr_type
        mv optiboot_${avr_type}.hex ../../../../optiboot_${avr_type}_freq-${avr_type}_${baud}baud.hex
    done
done
