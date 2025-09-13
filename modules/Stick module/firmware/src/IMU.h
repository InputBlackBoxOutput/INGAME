#ifndef IMU_h
#define IMU_h

// TODO
// - Offset self calibration

#include "Arduino.h"
#include <Wire.h>

// Address of IMU accel/gyro when ADO = 0
#define IMU_ADDRESS 0xD4

// Register address map
#define WHO_AM_I 0x0F

#define OUT_TEMP_L 0x20
#define OUT_TEMP_H 0x21

#define OUTX_L_G 0x22
#define OUTX_H_G 0x23
#define OUTY_L_G 0x24
#define OUTY_H_G 0x25
#define OUTZ_L_G 0x26
#define OUTZ_H_G 0x27

#define OUTX_L_XL 0x28
#define OUTX_H_XL 0x29
#define OUTY_L_XL 0x2A
#define OUTY_H_XL 0x2B
#define OUTZ_L_XL 0x2C
#define OUTZ_H_XL 0x2D

#define CTRL1_XL 0x10
#define CTRL2_G 0x11
#define CTRL3_C 0x12
#define CTRL8_XL 0x17

class LSM6DSM
{
public:
  LSM6DSM();
  void readDataAccelerometer();
  void readDataGyroscope();
  bool checkID();

  uint16_t accel_x, accel_y, accel_z;
  uint16_t gyro_x, gyro_y, gyro_z;

private:
  void writeByte(uint8_t registerAddress, uint8_t data);
  uint8_t readByte(uint8_t registerAddress);
};


#endif