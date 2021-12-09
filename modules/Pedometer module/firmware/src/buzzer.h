#pragma once

#include <Arduino.h>
#include "connections.h"

class Buzzer
{
public:
    Buzzer();
    void soundBuzzer(uint8_t times, uint32_t delayTime);
};

Buzzer::Buzzer()
{
    pinMode(BUZZER, OUTPUT);
}

void Buzzer::soundBuzzer(uint8_t times = 3, uint32_t delayTime = 1000)
{
    // Approximately 50% duty cycle @ 1KHz
    for (uint8_t i = 0; i < times; i++)
    {
        digitalWrite(BUZZER, HIGH);
        delayMicroseconds(500);
        digitalWrite(BUZZER, LOW);
        delayMicroseconds(1000 - 500);

        delay(delayTime);
    }
}
