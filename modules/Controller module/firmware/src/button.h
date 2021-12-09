#pragma once

#include <Arduino.h>
#include "connections.h"
#include "character-map.h"

// LINKING FUNCTIONS WITH BUTTONS
#define FIRE B3_1
#define SCOPE B3_2
#define RELOAD B3_3

#define SELECT_1 B2_1
#define SELECT_2 B2_2

#define FUNC_1 B1_1
#define FUNC_2 B1_2
#define FUNC_3 B1_3
#define FUNC_4 B1_4

#define DEBOUNCE_DELAY 15 //ms

class Button
{
public:
    Button();
    char pollButtons();
    boolean buttonRead(uint8_t pin);

private:
    char output = 'E';
};

Button::Button()
{
    pinMode(B1_1, INPUT_PULLUP);
    pinMode(B1_2, INPUT_PULLUP);
    pinMode(B1_3, INPUT_PULLUP);
    pinMode(B1_4, INPUT_PULLUP);

    pinMode(B2_1, INPUT_PULLUP);
    pinMode(B2_2, INPUT_PULLUP);

    pinMode(B3_1, INPUT_PULLUP);
    pinMode(B3_2, INPUT_PULLUP);
    pinMode(B3_3, INPUT_PULLUP);
}

char Button::pollButtons()
{
    output = (buttonRead(FIRE)) ? FIRE_CHAR : ' ';
    output = (buttonRead(SCOPE)) ? SCOPE_CHAR : ' ';
    output = (buttonRead(RELOAD)) ? RELOAD_CHAR : ' ';

    if (buttonRead(SELECT_1) == false && buttonRead(SELECT_2) == false)
    {
        output = (buttonRead(FUNC_1)) ? JUMP_CHAR : ' ';
        output = (buttonRead(FUNC_2)) ? CROUCH_CHAR : ' ';
        output = (buttonRead(FUNC_3)) ? GRENADE_CHAR : ' ';
        output = (buttonRead(FUNC_4)) ? KNIFE_CHAR : ' ';
    }
    if (buttonRead(SELECT_1) == true && buttonRead(SELECT_2) == false)
    {
        output = (buttonRead(FUNC_1)) ? WALK_CHAR : ' ';
        output = (buttonRead(FUNC_2)) ? SPRINT_CHAR : ' ';
        output = (buttonRead(FUNC_3)) ? PREVIOUS_WEAPON_CHAR : ' ';
        output = (buttonRead(FUNC_4)) ? NEXT_WEAPON_CHAR : ' ';
    }
    if (buttonRead(SELECT_1) == false && buttonRead(SELECT_2) == true)
    {
        output = (buttonRead(FUNC_1)) ? EXTRA_1_CHAR : ' ';
        output = (buttonRead(FUNC_2)) ? EXTRA_2_CHAR : ' ';
        output = (buttonRead(FUNC_3)) ? EXTRA_3_CHAR : ' ';
        output = (buttonRead(FUNC_4)) ? EXTRA_4_CHAR : ' ';
    }

    if (buttonRead(SELECT_1) == true && buttonRead(SELECT_2) == true)
        output = 'E';

    return output;
}

boolean Button::buttonRead(uint8_t pin)
{
    if (!digitalRead(pin))
    {
        delay(DEBOUNCE_DELAY);

        if (!digitalRead(pin))
            return true;
        else
            return false;
    }
    return false;
}