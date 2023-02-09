
#include <Arduino.h>
#include "connections.h"
#include "IMU.h"
#include "IMU-Fusion.h"
#include "character-map.h"

#include <WiFi.h>
#include <esp_now.h>

// TODO
// - Auto recalibration
// - Turn lazer on for calibration
// - Switch to power saving if inactivity
// - Offset self calibration
// - Implement trigonometric mapping & scaling for mouse movement

// LINKING FUNCTIONS WITH BUTTONS
#define FIRE B31_PIN
#define SCOPE B32_PIN
#define RELOAD B33_PIN

#define SELECT_1 B21_PIN
#define SELECT_2 B22_PIN

#define FUNC_1 B11_PIN
#define FUNC_2 B12_PIN
#define FUNC_3 B13_PIN
#define FUNC_4 B14_PIN

#define DEBOUNCE_DELAY 15 // ms
#define LOOP_DELAY 50 //ms

boolean buttonRead(uint8_t pin)
{
  if (!digitalRead(pin)) {
    delay(DEBOUNCE_DELAY);

    if (!digitalRead(pin))
      return true;
    else
      return false;
  }
  return false;
}

char pollButtons()
{
  char output = '~';
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

IMU _IMU;
Fusion _Fusion;

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

void setup()
{
  Serial.begin(115200);

  // Setup analog read resolution to 12 bits
  analogReadResolution(12);

  //Setup buttons, LEDs & buzzer
  pinMode(B11_PIN, INPUT_PULLUP);
  pinMode(B12_PIN, INPUT_PULLUP);
  pinMode(B13_PIN, INPUT_PULLUP);
  pinMode(B14_PIN, INPUT_PULLUP);

  pinMode(B21_PIN, INPUT_PULLUP);
  pinMode(B22_PIN, INPUT_PULLUP);
  pinMode(B23_PIN, INPUT_PULLUP);

  pinMode(B31_PIN, INPUT_PULLUP);
  pinMode(B32_PIN, INPUT_PULLUP);
  pinMode(B33_PIN, INPUT_PULLUP);

  pinMode(LEDR_PIN, OUTPUT);
  pinMode(LEDG_PIN, OUTPUT);
  pinMode(LEDB_PIN, OUTPUT);

  pinMode(LAZER_PIN, OUTPUT);
  pinMode(BUZZER_PIN, OUTPUT);

  // Setup IMU
  if(_IMU.checkID()) {
    Serial.println("Unable to connect with IMU");
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

  Serial.println("Setup complete!");
}

void loop()
{
 
  // Collect data from IMU
  _IMU.readDataAccelerometer();
  _IMU.readDataGyroscope();
  _IMU.readDataMagnetometer();

  // Determine mouse movement using the IMU
  payload.id = 0;

  clock_t timestamp = clock();                                          // Gyroscope timestamp
  FusionVector gyroscope = {_IMU.accel_x, _IMU.accel_y, _IMU.accel_z};  // Gyroscope data in degrees/s
  FusionVector accelerometer = {_IMU.gyro_x, _IMU.gyro_y, _IMU.gyro_z}; // Accelerometer data in g
  FusionVector magnetometer = {_IMU.mag_x, _IMU.mag_y, _IMU.mag_z};     // Magnetometer data in arbitrary units

  _Fusion.updateOrientation(gyroscope, accelerometer, magnetometer, timestamp);

  printf("Roll %0.1f, Pitch %0.1f, Yaw %0.1f", _Fusion.roll, _Fusion.pitch, _Fusion.yaw);

  uint8_t x_movement = _Fusion.pitch / 10;
  uint8_t y_movement = _Fusion.yaw / 10;
  uint8_t movement = x_movement & 0x0F || y_movement & 0x0F << 4;

  payload.action = movement; 
  esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&payload, sizeof(payload));

  if (result != ESP_OK)
    Serial.println("Error sending data over ESP-NOW");

  // Check for button presses
  char key = pollButtons();
  if( key != '~') {
      payload.id = 1;
      payload.action = key;

      esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&payload, sizeof(payload));

      if (result != ESP_OK)
        Serial.println("Error sending data over ESP-NOW");
  }

  // Check WiFi strength and update RGB LED
  int8_t RSSI = WiFi.RSSI();
  if (RSSI < -70)
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
