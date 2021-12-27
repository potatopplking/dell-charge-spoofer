# Yet another Dell charge spoofer

Spoofer emulates genuine Dell laptop charger, allowing you to charge your laptop with any power source (with correct voltage and current rating). Built using ATTiny13. This spoofer is very simple, containing only 2 ICs and a few resistors and capacitors.

## Motivation

If you need to use your Dell laptop with non-original charger (or any generic power source), you need to emulate communication between laptop and charger. This communication takes place on 1-wire bus (center pin of laptop power in connector).

## Usage

### Prerequisities

On the software side, you'll need `avr-gcc`, `avr-libc` and `avrdude`. For the hardware you'll need some AVR programmer and a spoofer (it's easy to build one yourself!).

### Compile & flash

```
make compile
make fuse # set AVR fuses (config bits)
make flash
```

### Connect

See schematic. Connect GND output voltage of your source to voltage input of spoofer. Connect center pin of the laptop connector to DATA pin of spoofer. GND should go on the outer shield of connector, voltage should be connected to inner shield of connector.

*Important: spoofer doesn't regulate or monitor voltage of the power source - it's up to you to check that voltage matches original charger!*
