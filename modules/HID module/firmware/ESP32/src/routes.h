#pragma once

#include <Arduino.h>

String connected()
{
    return "OK";
}

String fire()
{
    Serial.write('F');
    return "OK";
}

String reload()
{
    Serial.write('R');
    return "OK";
}

String scope()
{
    Serial.write('O');
    return "OK";
}

// String mouseMovement() {
//     POST request
// }