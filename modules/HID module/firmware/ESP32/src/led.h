#pragma once

#include <Arduino.h>
#include "connections.h"

class LED
{
public:
    LED();
    void blinkLED(uint8_t led, uint8_t times, uint16_t delay_time);
    void toggleLED(uint8_t led);
};

LED::LED()
{
    pinMode(LED_C, OUTPUT);
    pinMode(LED_P, OUTPUT);
}

void LED::blinkLED(uint8_t led, uint8_t times, uint16_t delay_time)
{
    digitalWrite(led, HIGH);
    delay(delay_time);
    digitalWrite(led, LOW);
    delay(delay_time);
}

void LED::toggleLED(uint8_t led)
{
    digitalWrite(led, !digitalRead(led));
}