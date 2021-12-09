#pragma once

#include <Arduino.h>
#include "connections.h"

class LED
{
public:
    LED();
    void blinkStatusLED(uint8_t times, uint32_t delay_time);
    void setWifiStrengthLED(uint8_t led);
};

LED::LED()
{
    pinMode(_LED, OUTPUT);
    pinMode(LEDR, OUTPUT);
    pinMode(LEDG, OUTPUT);
    pinMode(LEDB, OUTPUT);
}

void LED::blinkStatusLED(uint8_t times, uint32_t delay_time)
{
    for (uint8_t i = 0; i < times; i++)
    {
        digitalWrite(_LED, HIGH);
        delay(delay_time);
        digitalWrite(_LED, LOW);
        delay(delay_time);
    }
}

void LED::setWifiStrengthLED(uint8_t led = 4)
{
    digitalWrite(LEDR, LOW);
    digitalWrite(LEDG, LOW);
    digitalWrite(LEDB, LOW);

    switch (led)
    {
    case 0:
        digitalWrite(LEDR, HIGH);
        break;
    case 1:
        digitalWrite(LEDR, HIGH);
        break;
    case 2:
        digitalWrite(LEDR, HIGH);
        break;
    default:
        digitalWrite(LEDR, HIGH);
        digitalWrite(LEDG, HIGH);
        digitalWrite(LEDB, HIGH);
    }
}