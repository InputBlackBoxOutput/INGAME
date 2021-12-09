// Use POST instead of GET to send data over WiFi connection

// https://randomnerdtutorials.com/esp32-client-server-wi-fi/
// https://randomnerdtutorials.com/esp32-http-get-post-arduino/#http-post

#pragma once

#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>

class WiFiCommunication
{
public:
    const char *ssid = "ESP32 - 1";
    const char *password = "123456789";
    String serverRoute = "http://192.168.4.1/route";

    WiFiCommunication();
    bool sendKeystroke(char c);
    bool sendMouseMovement(uint16_t x, uint16_t y);
};

WiFiCommunication::WiFiCommunication()
{
    WiFi.begin(ssid, password);
    Serial.println("Connecting");
    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial.print(".");
    }
    Serial.println("");
    Serial.print("Connected to WiFi network with IP Address: ");
    Serial.println(WiFi.localIP());
}

bool WiFiCommunication::sendKeystroke(char c)
{
    // if (WiFi.status() == WL_CONNECTED)
    // {
    //     HTTPClient http;
    //     http.begin(serverRoute.c_str());
    //     int httpResponseCode = http.GET();

    //     if (httpResponseCode > 0)
    //     {
    //         Serial.print("HTTP Response code: ");
    //         Serial.println(httpResponseCode);

    //         String payload = http.getString();
    //         Serial.println(payload);
    //     }
    //     else
    //     {
    //         Serial.print("Error code: ");
    //         Serial.println(httpResponseCode);
    //     }
    //     http.end();
    //     return true;
    // }

    return false;
}

bool WiFiCommunication::sendMouseMovement(uint16_t x, uint16_t y)
{
    // if (WiFi.status() == WL_CONNECTED)
    // {
    //     HTTPClient http;
    //     http.begin(serverRoute.c_str());
    //     int httpResponseCode = http.GET();

    //     if (httpResponseCode > 0)
    //     {
    //         Serial.print("HTTP Response code: ");
    //         Serial.println(httpResponseCode);

    //         String payload = http.getString();
    //         Serial.println(payload);
    //     }
    //     else
    //     {
    //         Serial.print("Error code: ");
    //         Serial.println(httpResponseCode);
    //     }
    //     http.end();
    //     return true;
    // }

    return false;
}