/*
 * Dell laptop power adapter spoofer for ATTiny13
 * MCU has to run on 9.6 MHz (don't forget to set fuses!)
 * Probably would run on other AVR of the same specs and frequency,
 * though timing is critical
 * 
 * Hardware connections:
 * - connect VCC from powersource directly to laptop VCC adapter input
 * - connect GND from powersource directly to laptop GND adapter input
 * - connect data wire of laptop adapter input to PB4 of ATTINY13
 * - [optional] PB3 to LED, which indicates that laptop is connected
 * Devices (laptop, ATTINY13) must share common ground!
 */ 

#define F_CPU 9600000UL /* 9.6 MHz - don't forget to set fuses! (check Makefile) */
#include <avr/io.h>
#include <util/delay.h>
#include <avr/wdt.h>

/*
 * Definitions
 */

#define ONEWIRE_PIN_DDR DDB4
#define ONEWIRE_PIN_PORT PB4
#define ONEWIRE_PIN_IN PINB4
#define LED_PIN_DDR DDB3
#define LED_PIN_PORT PB3

/*
 * Macros
 */

/* check whether bus is low or high */
#define BUS_HIGH (PINB & (1 << ONEWIRE_PIN_IN))
#define BUS_LOW !BUS_HIGH

/* 1-Wire is open-drain bus with pull-up resistors to 3 - 5 V */
/* set bus to logical low - PORTB for given pin must be zero */
#define SET_BUS_LOW DDRB |= (1 << ONEWIRE_PIN_DDR)
/* release bus - PORTB for given pin must be zero */
#define RELEASE_BUS DDRB &= ~(1 << ONEWIRE_PIN_DDR)

/* LED */
#define INIT_LED DDRB |= (1 << LED_PIN_DDR)
#define SET_LED_OFF PORTB |= (1 << LED_PIN_PORT)
#define SET_LED_ON PORTB &= ~(1 << LED_PIN_PORT)

/*
 * Watchdog functions
 */

void WDT_init(void)
{
    wdt_reset();
    /* disable interrupts - probably default settings */
    WDTCR &= ~(1<<WDTIE);
    /* Start timed sequence & enable (necessary to modify prescaler) */
    WDTCR |= (1<<WDCE) | (1<<WDE);
    /* Set new prescaler(time-out) value = 64K cycles (~0.5 s) */
    WDTCR = (1<<WDE) | (1<<WDP2) | (1<<WDP0);
}

void WDT_off(void)
{
    wdt_reset();
    /* Clear WDRF in MCUSR */
    MCUSR &= ~(1<<WDRF);
    /* Write logical one to WDCE and WDE */
    /* Keep old prescaler setting to prevent unintentional time-out 
    */
    WDTCR |= (1<<WDCE) | (1<<WDE);
    /* Turn off WDT */
    WDTCR = 0x00;
}


/*
 * 1-Wire functions
 */

uint8_t onewire_read_byte()
{
    /* note: data are sent LSB first */
    uint8_t data = 0;
    uint8_t i;
    _delay_us(1); /* wait 1 us - critical, do not remove */
    for (i = 0; i < 8; i++) {
        /* wait for falling edge */
        while (BUS_HIGH) {
            /* do nothing */
        }
        /* wait 30 us */
        _delay_us(30);
        /* sample bit */
        data <<= 1;
        if (BUS_HIGH) {
            data |= 0x01;
        }
        /* wait until bus goes back up */
        while (BUS_LOW);
    }
    return data;
}

void onewire_write_byte(const uint8_t data)
{
    /* note: data are sent LSB first */
    uint8_t mask = 0x01;
    uint8_t i;
    for (i = 0; i < 8; i++) {
        /* wait for falling edge */
        while (BUS_HIGH) {
            /* do nothing */
        }
        /* master releases bus after 7.625 us; set bit */
        if (data & mask) {
            RELEASE_BUS;
        } else {
            SET_BUS_LOW;
        }
        mask <<= 1;
        /* master samples after 9 us; release bus after 30 us (55 us max time) */
        _delay_us(30);
        RELEASE_BUS;
        /* wait for rising edge */
        while (BUS_LOW) {
            /* do nothing */
        }
    }
    return;
}

/*
 * Main
 */

int main(void)
{
    const uint8_t delay = 50;
    /* slave response: last three bytes indicate power capability in Watts
     * (ASCII: '0', '6', '5' is 65 W; '0', '9', '0' is 90 W) */
    const uint8_t slave_response[] = {0x27, 0x41, 0x43, '0', '6', '5' };
    uint8_t buffer[8];
    uint8_t slave_response_len = sizeof(slave_response) / sizeof(slave_response[1]);
    uint8_t master_msg_len = 4;
    uint8_t i;
    uint16_t counter;

    DDRB = 0;
    PORTB = 0;
    RELEASE_BUS;
    INIT_LED;
    SET_LED_OFF;
    while (1) {
        /* Turn LED on if charger connected to laptop */
        //SET_LED_ON;
        /* disable watchdog timer */
        WDT_off();
        /* wait for falling edge */
        while (BUS_HIGH);
        /* enable watchdog timer */
        WDT_init();
        SET_LED_OFF;
        counter = 0;
        while (BUS_LOW) {
            _delay_us(delay);
            counter++;
        }
        /* Master initiates communication by pulling bus low for more than 480 us */
        if (counter > (480 / delay) && counter < (1000 / delay)) {
            /* 480 < t_low < 1000 [us], RESET: 
             * slave sends PRESENCE condition - keep bus low for 120 us 
             */
            _delay_us(10);
            SET_BUS_LOW;
            _delay_us(120);
            RELEASE_BUS;
            /* Receive 4 B from master:
             *   0xCC (SKIP ROM command)
             *   0xF0 (240, ?)
             *   0x06 (?)
             *   0x00 (?)
             * (LSB first when sending over 1-wire)
             */
            for (i = 0; i < master_msg_len; i++) {
                /* nothing is being checked here; just reading out some stuff to make master happy */
                buffer[i] = onewire_read_byte();
            }
            /* Slave response for two types of power adapter:
             *  +---------------+---------------+
             *  | 65W DELL      |   180W DELL   |
             *  +---------------+---------------+
             *  |  0x27 (?)     |    0x27 (?)   |
             *  |  0x41 ('A')   |    0x41 ('A') |
             *  |  0x43 ('C')   |    0x43 ('C') |
             *  |  0x30 ('0')   |    0x31 ('1') |
             *  |  0x36 ('6')   |    0x38 ('8') |
             *  |  0x35 ('5')   |    0x30 ('0') |
             *  +---------------+---------------+
             * Where last three bytes seem to indicate power output. Known options: 65 W, 90 W, 180 W
             */
            for (i = 0; i < slave_response_len; i++) {
                onewire_write_byte(slave_response[i]);
            }
            /* done! */
            SET_LED_ON;
        }
        /* reset watchdog */
        wdt_reset();
    }
    return 0;
}
