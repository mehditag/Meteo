//#############################################################################################
// Auteur : Mehdi Taguema & Alix DUMAY
// Version : 1.0
// Source : Basé sur le fichier Demo_Code (librairies) fourni avec le capteur
// Description : Le but de ce programme est de permettre d'initialiser et parametrer le capteur
//               Il permet aussi de lire les métrique
//##############################################################################################


#include "bme280.h"
#include <stdio.h>
#include <unistd.h>
 #include <wiringPi.h>
 #include <wiringPiSPI.h>

//Raspberry 3B+ platform's default SPI channel
#define channel 0  

//Default write it to the register in one time
#define USESPISINGLEREADWRITE 0 

//This definition you use I2C or SPI to drive the bme280
//When it is 1 means use I2C interface, When it is 0,use SPI interface
#define USEIIC 1

#include <string.h>
#include <stdlib.h>
#include <linux/i2c-dev.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <fcntl.h>
//Raspberry 3B+ platform's default I2C device file
#define IIC_Dev  "/dev/i2c-1"


//##############################################################
// Fonctions propre aux drivers du capteur
//##############################################################

int fd;

void user_delay_ms(uint32_t period)
{
  usleep(period*1000);
}

int8_t user_i2c_read(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
  write(fd, &reg_addr,1);
  read(fd, data, len);
  return 0;
}

int8_t user_i2c_write(uint8_t id, uint8_t reg_addr, uint8_t *data, uint16_t len)
{
  int8_t *buf;
  buf = malloc(len +1);
  buf[0] = reg_addr;
  memcpy(buf +1, data, len);
  write(fd, buf, len +1);
  free(buf);
  return 0;
}


//############################################################################
// Fonctions créées pour l'application
//###########################################################################


//Fonction d'initialisation & parametrage du capteur
struct bme280_dev init_capt()
{
  
    struct bme280_dev dev; 
    int8_t rslt = BME280_OK;
    
    
    //Test d'ouverture du bus I2C
    if ((fd = open(IIC_Dev, O_RDWR)) < 0) {
        printf("Failed to open the i2c bus");
        exit(1);
    }
  
    //Test d'acquisition de l'accès au bus I2C et de communication avec l'esclave
    if (ioctl(fd, I2C_SLAVE, 0x77) < 0) {
        printf("Failed to acquire bus access and/or talk to slave.\n");
        exit(1);
    }

    
    //Initialisation du capteur
    dev.dev_id = BME280_I2C_ADDR_SEC; //0x77
    dev.intf = BME280_I2C_INTF;
    dev.read = user_i2c_read;
    dev.write = user_i2c_write;
    dev.delay_ms = user_delay_ms;
    
    //Affichage du résultat d'initialisation du capteur
    printf("\r\n BME280 Init Result is:%d \r\n",rslt);

    rslt = bme280_init(&dev);
    int8_t rslt2;
    uint8_t settings_sel;
  
    
    //Paramétrage du capter
	/* Recommended mode of operation: Indoor navigation */
	dev.settings.osr_h = BME280_OVERSAMPLING_1X;
	dev.settings.osr_p = BME280_OVERSAMPLING_16X;
	dev.settings.osr_t = BME280_OVERSAMPLING_2X;
	dev.settings.filter = BME280_FILTER_COEFF_16;
	dev.settings.standby_time = BME280_STANDBY_TIME_62_5_MS;

	settings_sel = BME280_OSR_PRESS_SEL;
	settings_sel |= BME280_OSR_TEMP_SEL;
	settings_sel |= BME280_OSR_HUM_SEL;
	settings_sel |= BME280_STANDBY_SEL;
	settings_sel |= BME280_FILTER_SEL;
	rslt2 = bme280_set_sensor_settings(settings_sel, &dev);
	rslt2 = bme280_set_sensor_mode(BME280_NORMAL_MODE, &dev);

	

    //Renvoi des paramètre du capteur dans une structure
    return dev;

}


//Fonction d'acquisition de métrique
struct bme280_data sensor_data (struct bme280_dev *dev){
    
   
    int8_t rslt;
    
    //Création d'une structure résultats
   
    struct bme280_data comp_data;
    
    //Appel de la fonction bme280_get_sensor_data (propre au capteur)
    rslt = bme280_get_sensor_data(BME280_ALL, &comp_data, dev);  
    
    //Renvoi des métriques lues stockés dans la structure comp_data
    return comp_data;
    
}
    
