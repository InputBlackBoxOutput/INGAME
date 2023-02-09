#ifndef IMU_h
#define IMU_h

#include "Arduino.h"
#include <Wire.h>

// Address of IMU accel/gyro when ADO = 0
#define ACCELGYRO_ADDRESS 0b11010100
#define MAGNETO_ADDRESS 0b0110000

// Register address map
#define ACCELGYRO_WHO_AM_I 0x0F
#define ACCELGYRO_STATUS_REG 0x1E

#define ACCELGYRO_CTRL1_XL 0x10
#define ACCELGYRO_CTRL2_G 0x11
#define ACCELGYRO_CTRL3_C 0x12

#define ACCELGYRO_OUT_TEMP_L 0x20
#define ACCELGYRO_OUT_TEMP_H 0x21

#define ACCELGYRO_OUTX_L_G 0x22
#define ACCELGYRO_OUTX_H_G 0x23
#define ACCELGYRO_OUTY_L_G 0x24
#define ACCELGYRO_OUTY_H_G 0x25
#define ACCELGYRO_OUTZ_L_G 0x26
#define ACCELGYRO_OUTZ_H_G 0x27

#define ACCELGYRO_OUTX_L_A 0x28
#define ACCELGYRO_OUTX_H_A 0x29
#define ACCELGYRO_OUTY_L_A 0x2A
#define ACCELGYRO_OUTY_H_A 0x2B
#define ACCELGYRO_OUTZ_L_A 0x2C
#define ACCELGYRO_OUTZ_H_A 0x2D


#define MAGNETO_PRODUCTID 0x39
#define MAGNETO_STATUS 0x18

#define MAGNETO_XOUT0 0x00
#define MAGNETO_XOUT1 0x01
#define MAGNETO_YOUT0 0x02
#define MAGNETO_YOUT1 0x03
#define MAGNETO_ZOUT0 0x04
#define MAGNETO_ZOUT1 0x05
#define MAGNETO_XOUT2 0x06
#define MAGNETO_YOUT2 0x07
#define MAGNETO_ZOUT2 0x08
#define MAGNETO_TOUT 0x09


#define MAGNETO_ODR 0x1A
#define MAGNETO_INTCTRL0 0x1B
#define MAGNETO_INTCTRL1 0x1C
#define MAGNETO_INTCTRL2 0x1D

class IMU
{
public:
  IMU();
  void readDataAccelerometer();
  void readDataGyroscope();
  void readDataMagnetometer();
  bool checkID();

  uint16_t accel_x, accel_y, accel_z;
  uint16_t gyro_x, gyro_y, gyro_z;
  float mag_x, mag_y, mag_z;

private:
  void writeByte(uint8_t deviceAddress, uint8_t registerAddress, uint8_t data);
  uint8_t readByte(uint8_t deviceAddress, uint8_t registerAddress);
};

#endif