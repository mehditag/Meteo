#pragma once
#include "bme280.h"
#include "bme280_defs.h"


#if defined (__cplusplus)
extern "C"{
#endif

void user_delay_ms(uint32_t period);

int8_t user_i2c_read(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len);

int8_t user_i2c_write(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len);


struct bme280_dev init_capt();

struct bme280_data sensor_data (struct bme280_dev *dev);

#if defined (__cplusplus)
}
#endif 
