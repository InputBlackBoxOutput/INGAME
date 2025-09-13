// Stick module firmware
//
// TODO:
// TinyML based action classifier: Strike & Place
// Use buttons to implement other in-game actions
//
// References:
// https://randomnerdtutorials.com/esp-now-many-to-one-esp32/
// https://randomnerdtutorials.com/get-change-esp32-esp8266-mac-address-arduino/
// https://docs.arduino.cc/learn/communication/wire

#include <Arduino.h>
#include "connections.h"
#include "IMU.h"
#include <WiFi.h>
#include <esp_now.h>

#define LOOP_DELAY 100 //ms
#define DEBOUNCE_DELAY 20 //us

uint8_t broadcastAddress[] = {0x32, 0xAE, 0xA4, 0x07, 0x0D, 0x66};

typedef struct struct_payload
{
  uint8_t id;
  char action;
} struct_payload;

struct_payload payload;
esp_now_peer_info_t peerInfo;

void OnDataSent(const uint8_t *mac_addr, esp_now_send_status_t status)
{
  Serial.print("\r\nLast Packet Send Status:\t");
  Serial.println(status == ESP_NOW_SEND_SUCCESS ? 1 : 0);
}

LSM6DSM IMU = LSM6DSM();

bool buttonPressed(uint8_t btn) {
  if(!digitalRead(btn)) {
    delayMicroseconds(DEBOUNCE_DELAY);
    if(!digitalRead(btn)) {
      return true;
    }
  }

  return false;
}

void setup()
{
  // Setup serial port for debugging purposes
  Serial.begin(115200);
  Serial.println();

  // Setup GPIO pins
  pinMode(LED, OUTPUT);

  pinMode(BTN_11, INPUT_PULLUP);
  pinMode(BTN_12, INPUT_PULLUP);
  pinMode(BTN_13, INPUT_PULLUP);
  pinMode(BTN_14, INPUT_PULLUP);

  pinMode(BTN_21, INPUT_PULLUP);
  pinMode(BTN_22, INPUT_PULLUP);
  pinMode(BTN_23, INPUT_PULLUP);

  // Setup IMU LSM6DSM
  if (!IMU.checkID())
  {
    Serial.println("Unable to connect to connect to LSM6DSM");
  }

  // Setup ESP-NOW
  WiFi.mode(WIFI_STA);

  if (esp_now_init() != ESP_OK)
  {
    Serial.println("Error initializing ESP-NOW");
    return;
  }

  esp_now_register_send_cb(OnDataSent);

  // Connect with ESP-NOW peer
  memcpy(peerInfo.peer_addr, broadcastAddress, 6);
  peerInfo.channel = 0;
  peerInfo.encrypt = false;

  if (esp_now_add_peer(&peerInfo) != ESP_OK)
  {
    Serial.println("Failed to add peer");
    return;
  }
}

void loop()
{
  IMU.readDataAccelerometer();
  IMU.readDataGyroscope();
  float magnitude;

  // Action: Break block
  magnitude = sqrt(IMU.accel_x * IMU.accel_x + 0.15 * IMU.accel_y * IMU.accel_y + 0.15 * IMU.accel_z * IMU.accel_z);
  if (magnitude >= 65536.0f) {
    payload.id = 0;
    payload.action = 'S';

    esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&payload, sizeof(payload));

    if (result != ESP_OK)
      Serial.println("Error sending data via ESP-NOW");
  }

  // Action: Place block
  magnitude = sqrt(0.15 * IMU.accel_x * IMU.accel_x + 0.15 * IMU.accel_y * IMU.accel_y + IMU.accel_z * IMU.accel_z);
  if (magnitude >= 65536.0f)
  {
    payload.id = 0;
    payload.action = 'P';

    esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&payload, sizeof(payload));

    if (result != ESP_OK)
      Serial.println("Error sending data via ESP-NOW");
  }

  // if (buttonPressed(BTN_X)) {
  //   payload.id = 0;
  //   payload.action = 'X';

  //   esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&payload, sizeof(payload));

  //   if (result != ESP_OK)
  //     Serial.println("Error sending data via ESP-NOW");
  // }

  delay(LOOP_DELAY);
}