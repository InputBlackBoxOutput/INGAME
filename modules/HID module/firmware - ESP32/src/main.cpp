#include <Arduino.h>
#include "connections.h"
#include <WiFi.h>
#include <esp_now.h>
#include <esp_wifi.h>

// References:
// https://randomnerdtutorials.com/esp-now-many-to-one-esp32/
// https://randomnerdtutorials.com/get-change-esp32-esp8266-mac-address-arduino/

uint8_t MACAddress[] = {0x32, 0xAE, 0xA4, 0x07, 0x0D, 0x66};

typedef struct struct_payload
{
  uint8_t id;
  char action;
} struct_payload;

struct_payload payload;

void blinkLED(uint8_t led)
{
  digitalWrite(led, HIGH);
  delay(500);
  digitalWrite(led, LOW);
  delay(500);
}

void setupMACAddress()
{
  Serial.print("[OLD] ESP32 Board MAC Address:  ");
  Serial.println(WiFi.macAddress());

  esp_wifi_set_mac(WIFI_IF_STA, &MACAddress[0]);

  Serial.print("[NEW] ESP32 Board MAC Address:  ");
  Serial.println(WiFi.macAddress());
}

void OnDataRecieved(const uint8_t *mac_addr, const uint8_t *incomingPayload, int len)
{
  memcpy(&payload, incomingPayload, sizeof(payload));

  Serial.printf("Module: %c \n", payload.id);
  Serial.println();
  Serial.printf("Action: %c \n", payload.action);
  Serial.println();

  switch (payload.id)
  {
    case 0:
    case 1:
      blinkLED(LED_C);
      break;
    case 2:
      blinkLED(LED_P);
      break;
  }

  Serial.print('~');
  Serial.println(payload.action);
}


void setup()
{
  Serial.begin(115200);
  pinMode(LED_C, OUTPUT);
  pinMode(LED_P, OUTPUT);

  // Change MAC address for easy programmability
  setupMACAddress();

  // Setup ESP-NOW
  WiFi.mode(WIFI_STA);

  if (esp_now_init() != ESP_OK)
  {
      Serial.println("Error initializing ESP-NOW");
      return;
  }

  esp_now_register_recv_cb(OnDataRecieved);
}

void loop()
{
}