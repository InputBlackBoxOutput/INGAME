
#include <Arduino.h>
#include "connections.h"
#include "character-map.h"

#include "button.h"
#include "led.h"
#include "buzzer.h"
#include "MPU6050.h"
#include "communication.h"
#define LOOP_DELAY 50 //ms

Button btn;
LED led;
Buzzer buzzer;
MPU6050 mpu6050;
WiFiCommunication communication;

void setup()
{
  Serial.begin(115200);
  Serial.println("Setup complete!");
}

void loop()
{
  led.blinkStatusLED(3, 500);

  char output = btn.pollButtons();
  communication.sendKeystroke(output);

  mpu6050.getEulerAngles();
  communication.sendMouseMovement(mpu6050.x, mpu6050.y);

  // Check WiFi strength and update RGB LED
  // Check battery and sound buzzer if low
  // Switch to power saving if inactivity
  // Check if calibration button was pressed!

  delay(LOOP_DELAY);
}
