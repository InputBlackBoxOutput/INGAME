#include "IMU.h"

IMU::IMU()
{
    Wire.begin();
    Wire.setClock(100000);

    // Setup accelerometer and gyroscope
    // Set output data rate to 12.5Hz & the scale to ±2g & ±250 dps
    writeByte(ACCELGYRO_ADDRESS, ACCELGYRO_CTRL1_XL, 0x10);
    writeByte(ACCELGYRO_ADDRESS, ACCELGYRO_CTRL2_G, 0x10);

    // Enable block update
    writeByte(ACCELGYRO_ADDRESS, ACCELGYRO_CTRL3_C, readByte(ACCELGYRO_ADDRESS, ACCELGYRO_CTRL3_C) | 0x40);

    delayMicroseconds(10);

    // Setup magnetometer
    writeByte(MAGNETO_ADDRESS, MAGNETO_ODR, 0xFF);
    writeByte(MAGNETO_ADDRESS, MAGNETO_INTCTRL0, 0b10100000);
    writeByte(MAGNETO_ADDRESS, MAGNETO_INTCTRL1, 0b00000011);
    writeByte(MAGNETO_ADDRESS, MAGNETO_INTCTRL2, 0b00010000);
}

bool IMU::checkID() {
    bool check_1 = (readByte(ACCELGYRO_ADDRESS, ACCELGYRO_WHO_AM_I) == 0x6B);
    bool check_2 = (readByte(MAGNETO_ADDRESS, MAGNETO_PRODUCTID) == 0x10);
    return check_1 && check_2;
}

void IMU::readDataAccelerometer()
{
    accel_x = ((int16_t)readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTX_H_A) << 8) | readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTX_L_A);
    accel_y = ((int16_t)readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTY_H_A) << 8) | readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTY_L_A);
    accel_z = ((int16_t)readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTZ_H_A) << 8) | readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTZ_L_A);
}

void IMU::readDataGyroscope()
{
    gyro_x = ((int16_t)readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTX_H_G) << 8) | readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTX_L_G);
    gyro_y = ((int16_t)readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTY_H_G) << 8) | readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTY_L_G);
    gyro_z = ((int16_t)readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTZ_H_G) << 8) | readByte(ACCELGYRO_ADDRESS, ACCELGYRO_OUTZ_L_G);
}

void IMU::readDataMagnetometer()
{
    int32_t mag = 0;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_XOUT0) << 12;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_XOUT1) << 4;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_XOUT2) >> 4;
    mag_x = 0.0625 * (mag - 524288);

    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_YOUT0) << 12;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_YOUT1) << 4;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_YOUT2) >> 4;
    mag_y = 0.0625 * (mag - 524288);

    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_ZOUT0) << 12;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_ZOUT1) << 4;
    mag |= readByte(MAGNETO_ADDRESS, MAGNETO_ZOUT2) >> 4;
    mag_z = 0.0625 * (mag - 524288);
}

// Helper function to write 1 byte of data via I2C
void IMU::writeByte(uint8_t deviceAddress, uint8_t registerAddress, uint8_t data)
{
    Wire.beginTransmission(deviceAddress);
    Wire.write(byte(registerAddress));
    Wire.write(byte(data));
    Wire.endTransmission();

    delayMicroseconds(10);
}

// Helper function to read 1 byte of data via I2C
uint8_t IMU::readByte(uint8_t deviceAddress, uint8_t registerAddress)
{
    Wire.beginTransmission(deviceAddress | 0x01);
    Wire.write(registerAddress);
    Wire.endTransmission();

    // Read one byte from the device
    Wire.requestFrom(deviceAddress, 1);

    uint8_t data = 0;
    if (Wire.available())
        data = Wire.read();

    delayMicroseconds(10);
    return data;
}
