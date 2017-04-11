#!/usr/bin/env bash

f_cpus=(8000000 16000000 20000000 24000000 25000000)
avr_types=("atmega1284p" "atmega2560")
baudrates=(57600 115200 250000 500000 1000000 2000000)

git clone https://github.com/majekw/optiboot.git
cd optiboot/optiboot/bootloaders/optiboot/
make clean

for f_cpu in "${f_cpus[@]}"; do
    for avr_type in "${avr_types[@]}"; do
        for baud in "${baudrates[@]}"; do
            F_CPU=${f_cpu}L AVR_FREQ=$f_cpu BAUD_RATE=$baud BIGBOOT=1 make $avr_type
            mv optiboot_${avr_type}.hex ../../../../optiboot_${avr_type}_freq-${f_cpu}_baud-${baud}.hex
        done
    done
done
