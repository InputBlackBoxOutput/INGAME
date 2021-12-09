// References
// https://www.engineersgarage.com/arduino-based-walking-steps-distance-calculator-adxl345/
// https://circuitdigest.com/microcontroller-projects/diy-arduino-pedometer-counting-steps-using-arduino-and-accelerometer

#pragma once

#include <Arduino.h>
#include <Wire.h>
#include "connections.h"

class ADXL345
{
public:
    uint16_t ax, ay, az = 0;
    uint16_t threshold = 0;

    ADXL345();
    bool step();
};

ADXL345::ADXL345()
{
    // Connect with ADXL345 via I2C
    // Setup ADXL345 config register
}

bool ADXL345::step()
{
    // Read raw data from ADXL345 using I2C
    // Use geometry to determine steps and frequency of steps

    return false;
}
