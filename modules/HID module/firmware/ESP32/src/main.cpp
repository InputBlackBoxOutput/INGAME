// https://randomnerdtutorials.com/esp32-client-server-wi-fi/
// https://randomnerdtutorials.com/esp32-http-get-post-arduino/#http-post

#include <Arduino.h>

#include "WiFi.h"
#include "ESPAsyncWebServer.h"
#include "routes.h"
#include "connections.h"

#define LOOP_DELAY 50 //ms

const char *ssid = "ESP32 - Server";
const char *password = "123456789";

AsyncWebServer server(80); // Port 80

void setup()
{
  Serial.begin(115200);

  WiFi.softAP(ssid, password);
  IPAddress IP = WiFi.softAPIP();
  Serial.println("Connected: " + String(IP));

  server.on("/connected", HTTP_GET, [](AsyncWebServerRequest *request)
            { request->send_P(200, "text/plain", connected().c_str()); });
  server.on("/F", HTTP_GET, [](AsyncWebServerRequest *request)
            { request->send_P(200, "text/plain", fire().c_str()); });
  server.on("/R", HTTP_GET, [](AsyncWebServerRequest *request)
            { request->send_P(200, "text/plain", reload().c_str()); });
  server.on("/O", HTTP_GET, [](AsyncWebServerRequest *request)
            { request->send_P(200, "text/plain", scope().c_str()); });

  server.begin();
}

void loop()
{

  // Upon connection set connection LED high
  // if(connected)
  // digitalWrite(LED_C, HIGH);
  // else
  // digitalWrite(LED_C, LOW);

  delay(LOOP_DELAY);
}