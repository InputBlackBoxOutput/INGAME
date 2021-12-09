#pragma once

#include <Arduino.h>
#include "connections.h"

#define DEBOUNCE_DELAY 300 //ms

class Button
{
public:
    Button();
    bool pollButton(uint8_t button);
};

Button::Button()
{
    pinMode(BTN_NEXT, INPUT_PULLUP);
    pinMode(BTN_OK, INPUT_PULLUP);
}

bool Button::pollButton(uint8_t button)
{
    if (!digitalRead(button))
    {
        delay(DEBOUNCE_DELAY);
        if (!digitalRead(button))
            return true;
        else
            return false;
    }
    return false;
}