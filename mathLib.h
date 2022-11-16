#define STATUS_OK 0
#define STATUS_ERROR -1
#define INSTALLED_SENSORS 8U

/* Value object containing an array as an element */
struct Sensors {
 int32_t array[10];
};

struct Sensors getSensors(void);

int8_t getSensorValue(uint8_t, int32_t *);