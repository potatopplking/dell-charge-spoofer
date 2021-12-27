#
# Parameters
# Fuses are set according to http://www.engbedded.com/fusecalc/:
#  - freq not divided - running at 9.6 MHz
#
FREQ = 9600000
MCU = attiny13
PROGRAMMER = -c avrispmkII -P usb
FUSES = -U lfuse:w:0x7a:m -U hfuse:w:0xff:m 

#
# Internal vars
#
CC = avr-gcc -Wall -Os
AVRDUDE = avrdude $(PROGRAMMER) -p $(MCU)

all: fuse compile flash

compile:
	$(CC) -DF_CPU=$(FREQ) -mmcu=$(MCU) -c main.c -o main.o
	$(CC) -Os -DF_CPU=$(FREQ) -mmcu=$(MCU) -o main.elf main.o
	rm -f main.hex
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex
	avr-size --format=avr --mcu=$(MCU) main.elf

clean:
	rm -f *hex *o *elf
flash:
	$(AVRDUDE) -U flash:w:main.hex:i

fuse:
	$(AVRDUDE) $(FUSES)
