#include <Arduino.h>
#include "connections.h"
#include "IMU.h"
#include <WiFi.h>
#include <esp_now.h>

// TODO:
// - Track frequency of steps to determine if user is running
// - Switch to power saving if inactivity
// - Automatic offset self calibration

#define WALK_CHAR 'W'
#define SPRINT_CHAR 'S'
#define LOOP_DELAY 50 //ms

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

void blinkStatusLED(uint8_t times = 3, uint32_t delay_time = 500)
{
  for (uint8_t i = 0; i < times; i++)
  {
    digitalWrite(_LED_PIN, HIGH);
    delay(delay_time);
    digitalWrite(_LED_PIN, LOW);
    delay(delay_time);
  }
}

void setWifiStrengthLED(uint8_t led = 4)
{
  digitalWrite(LEDR_PIN, LOW);
  digitalWrite(LEDG_PIN, LOW);
  digitalWrite(LEDB_PIN, LOW);

  switch (led)
  {
  case 0:
    digitalWrite(LEDR_PIN, HIGH);
    break;
  case 1:
    digitalWrite(LEDR_PIN, HIGH);
    digitalWrite(LEDG_PIN, HIGH);
    break;
  case 2:
    digitalWrite(LEDG_PIN, HIGH);
    break;
  default:
    digitalWrite(LEDR_PIN, HIGH);
    digitalWrite(LEDG_PIN, HIGH);
    digitalWrite(LEDB_PIN, HIGH);
  }
}

void soundBuzzer(uint8_t times = 3, uint32_t delayTime = 1000)
{
  // Approximately 50% duty cycle @ 1KHz
  for (uint8_t i = 0; i < times; i++)
  {
    digitalWrite(BUZZER_PIN, HIGH);
    delayMicroseconds(500);
    digitalWrite(BUZZER_PIN, LOW);
    delayMicroseconds(1000 - 500);

    delay(delayTime);
  }
}

#define NUM_SAMPLES 5
#define LOW_VLTG_THRESH 3.20

bool isBatteryVoltageLow()
{
  double batteryVoltage = 0;

  // Approx LiPo battery discharge curve: y = 0.003488 x − 0.227906
  // Better solution: Battery Management IC with over-voltage, under-voltage and over-temperature detection
  for (int i = 0; i < NUM_SAMPLES; i++)
  {
    batteryVoltage += (0.003488 * analogRead(BATT_ADC_PIN) - 0.227906) * 2;
  }

  return ((batteryVoltage / NUM_SAMPLES) <= LOW_VLTG_THRESH) ? true : false;
}

void setup()
{
  // Setup serial communication over UART
  Serial.begin(115200);

  // Setup analog read resolution to 12 bits
  analogReadResolution(12);

  // Setup LEDs and buzzer
  pinMode(_LED_PIN, OUTPUT);

  pinMode(LEDR_PIN, OUTPUT);
  pinMode(LEDG_PIN, OUTPUT);
  pinMode(LEDB_PIN, OUTPUT);

  pinMode(BUZZER_PIN, OUTPUT);

  // Setup IMU LSM6DSM
  if (!IMU.checkID()) {
    Serial.println("Unable to connect to connect to LSM6DSM");
  }

  // Setup ESP-NOW
  WiFi.mode(WIFI_STA);

  if (esp_now_init() != ESP_OK) {
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

  blinkStatusLED();
  Serial.println("Setup complete!");
}

void loop()
{
  IMU.readDataAccelerometer();
  IMU.readDataGyroscope();
  
  float magnitude = sqrt(0.15 * IMU.accel_x * IMU.accel_x + IMU.accel_y * IMU.accel_y + 0.15 * IMU.accel_z * IMU.accel_z);

  if (magnitude >= 65636.0f)
  {
    payload.id = 2;
    payload.action = 'W';

    esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&payload, sizeof(payload));

    if (result != ESP_OK)
      Serial.println("Error sending data over ESP-NOW");
  }

  // Check WiFi strength and update RGB LED
  int8_t RSSI = WiFi.RSSI();
  if(RSSI < -70) 
    setWifiStrengthLED(0);
  else if (RSSI < -67)
    setWifiStrengthLED(1);
  else if (RSSI < -30)
    setWifiStrengthLED(2);
  else
    setWifiStrengthLED(3);

  // Check battery and sound buzzer if low
  if (isBatteryVoltageLow()) {
    soundBuzzer();
  }

  delay(LOOP_DELAY);
}
