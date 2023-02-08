#include <Arduino.h>
#include "connections.h"
#include "key-map.h"

#include <Mouse.h>
#include <Keyboard.h>
#include <U8glib.h>

// TODO
// - Create a menu interface using display and buttons: https://github.com/olikraus/u8glib/blob/master/sys/arm/examples/menu/menu.c
// - Create a library for keyboard mappings for various games

#define DEBOUNCE_DELAY 300 // ms
#define LOOP_DELAY 300     // ms

bool pollButton(uint8_t button)
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

void blinkLED()
{
    digitalWrite(LED_K, HIGH);
    delay(100);
    digitalWrite(LED_K, LOW);
    delay(100);
}

void setup()
{
    Serial.begin(115200);

    pinMode(BTN_NEXT, INPUT_PULLUP);
    pinMode(BTN_OK, INPUT_PULLUP);

    pinMode(LED_K, OUTPUT);

    Mouse.begin();
    Keyboard.begin();
}

void loop()
{
    char c = '-';
    if (Serial.available())
        c = Serial.read();

    // Keyboard keypresses
    switch (c)
    {
    case 'F':
        Mouse.click(ACTION_FIRE); // Fire
        blinkLED();
        break;
    case 'O':
        Mouse.click(ACTION_SCOPE); // Scope
        blinkLED();
        break;
    case 'R':
        Keyboard.write(ACTION_SCOPE); // Reload
        blinkLED();
        break;
    case 'E':
        Keyboard.write(ACTION_ESC);
        blinkLED();
        break;

    case 'J':
        Keyboard.write(ACTION_JUMP);
        blinkLED();
        break;
    case 'W':
        Keyboard.write(ACTION_WALK);
        blinkLED();
        break;
    case 'A':
        Keyboard.write(ACTION_EXTRA1);
        blinkLED();
        break;

    case 'C':
        Keyboard.write(ACTION_CROUCH);
        blinkLED();
        break;
    case 'S':
        Keyboard.write(ACTION_SPRINT);
        blinkLED();
        break;
    case 'B':
        Keyboard.write(ACTION_EXTRA2);
        blinkLED();
        break;

    case 'G':
        Keyboard.write(ACTION_GRENADE);
        blinkLED();
        break;
    case 'P':
        Keyboard.write(ACTION_PREV_WEAPON);
        blinkLED();
        break;
    case 'X':
        Keyboard.write(ACTION_EXTRA3);
        blinkLED();
        break;

    case 'K':
        Keyboard.write(ACTION_KNIFE);
        blinkLED();
        break;
    case 'N':
        Keyboard.write(ACTION_NEXT_WEAPON);
        blinkLED();
        break;
    case 'Y':
        Keyboard.write(ACTION_EXTRA4);
        blinkLED();
        break;
    }

    // Mouse movement
    if(c == '~') {
        uint8_t movement = 0;
        if (Serial.available())
            movement = Serial.read();

        uint8_t movement_x = movement & 0x0F;
        uint8_t movement_y = movement & 0xF0 >> 4;

        Mouse.move(movement_x, movement_y);
    }

    delay(LOOP_DELAY);
}
