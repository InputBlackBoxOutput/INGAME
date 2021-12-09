// References
// https://forum.arduino.cc/t/getting-quaternion-values-from-mpu6050/668823
// https://github.com/arduino-libraries/MadgwickAHRS      Mahony IMU AHRS

#pragma once

#include <Arduino.h>
#include <Wire.h>
#include "connections.h"

class MPU6050
{
public:
    uint16_t ax, ay, az = 0;
    uint16_t gx, gy, gz = 0;
    uint16_t theta_x, theta_y, theta_z = 0;
    uint16_t q[4]{0, 0, 0, 0};

    uint16_t x, y = 0;

    MPU6050();
    void getEulerAngles();
    void computeMouseMovement();
};

MPU6050::MPU6050()
{
    // Connect with MPU6050 via I2C
    // Setup MPU6050 config register
}

void MPU6050::getEulerAngles()
{
    // Read raw data from MPU6050 using I2C
    // Convert to Euler angles directly or convert to Euler angles using quaternions
}

void MPU6050::computeMouseMovement()
{
    // Read raw data from MPU6050 using I2C
    // Convert to Euler angles directly or convert to Euler angles using quaternions
}