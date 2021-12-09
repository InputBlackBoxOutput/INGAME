// Setup connection with 1.3 inch OLED display using I2C

#pragma once

#include <Arduino.h>
#include "connections.h"
#include <U8glib.h>

class Display
{
public:
    Display();
    void displayText(String text);
};

void Display::displayText(String text)
{
    U8GLIB_SH1106_128X64 u8g(U8G_I2C_OPT_NONE);
    u8g.firstPage();
    do
    {
        u8g.setFont(u8g_font_profont12);
        u8g.setPrintPos(0, 10);
        u8g.print(text);
        u8g.setPrintPos(0, 25);
        u8g.print(text);
        u8g.setPrintPos(0, 40);
        u8g.setFont(u8g_font_profont10);
        u8g.print(text);
    } while (u8g.nextPage());
}