#include <math.h>
#include <stdint.h>

#include "mathLib.h"


int8_t getSensorValue(uint8_t sensorId, int32_t * value) {
    int32_t * sensors;
    int8_t status;
    sensors = getSensors().array; 

    if (sensorId > INSTALLED_SENSORS) {
        status = STATUS_ERROR;        
    } else {
        *value = sensors[sensorId];
        status = STATUS_OK;
    }
    return status;
}

struct Sensors getSensors(void) {};