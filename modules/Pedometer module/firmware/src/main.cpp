
#include "connections.h"
#include "character-map.h"

#include "buzzer.h"
#include "led.h"
#include "ADXL345.h"
#include "communication.h"

#define LOOP_DELAY 50 //ms

LED led;
Buzzer buzzer;
ADXL345 adxl345;
WiFiCommunication communication;

void setup()
{
  Serial.begin(115200);
  Serial.println("Setup complete!");
}

void loop()
{

  if (adxl345.step())
  {
    communication.sendKeystroke(WALK_CHAR);
  }

  // Track frequency of steps to determine if user is running
  // Check WiFi strength and update RGB LED
  // Check battery and sound buzzer if low
  // Switch to power saving if inactivity
}
