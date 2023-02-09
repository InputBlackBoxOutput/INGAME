#include <Fusion.h>
#include <stdbool.h>
#include <stdio.h>
#include <time.h>

#define SAMPLE_RATE (100) // Sample rate

class Fusion
{

public:
    Fusion();
    void updateOrientation(FusionVector gyroscope, FusionVector accelerometer, FusionVector magnetometer, clock_t timestamp);
    float roll, pitch, yaw;

private:
    // Initialise algorithms
    FusionOffset offset;
    FusionAhrs ahrs;

    // Calibration data
    FusionMatrix gyroscopeMisalignment;
    FusionVector gyroscopeSensitivity;
    FusionVector gyroscopeOffset;
    FusionMatrix accelerometerMisalignment;
    FusionVector accelerometerSensitivity;
    FusionVector accelerometerOffset;
    FusionMatrix softIronMatrix;
    FusionVector hardIronOffset;
};