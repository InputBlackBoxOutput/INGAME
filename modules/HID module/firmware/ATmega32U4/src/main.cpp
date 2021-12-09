#include <Arduino.h>

#include <Mouse.h>
#include <Keyboard.h>

#include "connections.h"

#include "button.h"
#include "led.h"
#include "display.h"

void setup()
{
    Serial.begin(115200);
    Mouse.begin();
    Keyboard.begin();
}

void loop()
{
    char c = 'E';

    if (Serial.available())
        c = Serial.read();

    switch (c)
    {
    case 'F':
        Mouse.click(MOUSE_LEFT); // Fire
        break;
    case 'O':
        Mouse.click(MOUSE_RIGHT); // Scope
        break;
    case 'R':
        Keyboard.write('r'); // Reload
        break;
    case 'E':
        Keyboard.write(KEY_ESC);
        break;
    }

    // Alternative for mouse click (Use to increase click duration)
    //    Mouse.press(//MouseButton);
    //    delayMicroseconds(//Delay_Time);
    //    Mouse.release(//MouseButton);

    // Get mouse movement via UART
    // readStringUntil(terminator)
    // Mouse.move(vx, vy);
}
