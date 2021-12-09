#pragma once

#include <Arduino.h>
#include "connections.h"

class LED
{
public:
    LED();
    void blinkLED(uint8_t times, uint16_t delay_time);
};

LED::LED()
{
    pinMode(LED_K, OUTPUT);
}

void LED::blinkLED(uint8_t times = 3, uint16_t delay_time = 1000)
{
    digitalWrite(LED_K, HIGH);
    delay(delay_time);
    digitalWrite(LED_K, LOW);
    delay(delay_time);
}
