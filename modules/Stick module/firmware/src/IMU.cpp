#include "IMU.h"

LSM6DSM::LSM6DSM()
{
    Wire.begin();
    Wire.setClock(100000);

    // Set output data rate to 12.5Hz & the scale to ±2g & 250 dps
    writeByte(CTRL1_XL, 0x10);
    writeByte(CTRL2_G, 0x10);

    // Enable block update
    writeByte(CTRL3_C, readByte(CTRL3_C) | 0x40);

    // // Enable LP2, set LP2 tp ODR/9, enable input_composite
    // writeByte(CTRL8_XL, 0x80 | 0x40 | 0x08);
}

bool LSM6DSM::checkID()
{
    return (readByte(WHO_AM_I) == 0x6A);
}

void LSM6DSM::readDataAccelerometer()
{
    accel_x = ((int16_t)readByte(OUTX_H_XL) << 8) | readByte(OUTX_L_XL);
    accel_y = ((int16_t)readByte(OUTY_H_XL) << 8) | readByte(OUTY_L_XL);
    accel_z = ((int16_t)readByte(OUTZ_H_XL) << 8) | readByte(OUTZ_L_XL);
}

void LSM6DSM::readDataGyroscope()
{
    gyro_x = ((int16_t)readByte(OUTX_H_G) << 8) | readByte(OUTX_L_G);
    gyro_y = ((int16_t)readByte(OUTY_H_G) << 8) | readByte(OUTY_L_G);
    gyro_z = ((int16_t)readByte(OUTZ_H_G) << 8) | readByte(OUTZ_L_G);
}

// Helper function to write 1 byte of data via I2C
void LSM6DSM::writeByte(uint8_t registerAddress, uint8_t data)
{
    Wire.beginTransmission(IMU_ADDRESS);
    Wire.write(byte(registerAddress));
    Wire.write(byte(data));
    Wire.endTransmission();

    delayMicroseconds(10);
}

// Helper function to read 1 byte of data via I2C
uint8_t LSM6DSM::readByte(uint8_t registerAddress)
{
    Wire.beginTransmission(IMU_ADDRESS | 0x01);
    Wire.write(registerAddress);
    Wire.endTransmission();

    // Read one byte from the device
    Wire.requestFrom(IMU_ADDRESS, 1);

    uint8_t data = 0;
    if (Wire.available())
        data = Wire.read();

    delayMicroseconds(10);
    return data;
}
