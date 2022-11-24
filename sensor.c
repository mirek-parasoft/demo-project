#include <math.h>
#include <stdint.h>
#include "mathLib.h"


int8_t getSensorValue(uint8_t sensorId, int32_t * value) {
    int8_t status;

    if (sensorId > INSTALLED_SENSORS) {
        status = STATUS_ERROR;        
    } else {
        *value = getSensors().array[sensorId];
        status = STATUS_OK;
    }
    return status;
}


struct Sensors getSensors(void) {
    //Direct read from memory - to be implemented
};