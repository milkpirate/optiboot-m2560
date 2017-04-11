# optiboot-m2560
Quick build script to compile the optiboot bootloader for ATmega1284p and ATmega2560.

To install required (ubuntu) packages issue `sudo apt-get install avr-libc binutils-avr gcc-avr`.

Added more baudrates and frequencies. Incompatible combinations will be dicarded by the optiboot build process.

Also attached an example `board.txt` (for the ATmega2560, 16MHz, 1Mbaud) to tell the Arduino IDE how to handle these bootloaders. Depending on the hex file (resp. chip, baudrate, frequency) you want to use, you need to modify the `board.txt` correspondingly.
