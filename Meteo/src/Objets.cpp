#include "Objets.h"
#include <QDebug>
#include "capteur.h"
#include <math.h>


//Constructeur
Data_Meteo::Data_Meteo() {
     Data_Meteo::capt_init();
}

//Get
qreal  Data_Meteo::getTemp() const {		
	return m_temp;
    
}
   
//Set      
void Data_Meteo::setTemp(qreal temperature) {
    
    m_temp = temperature;
    
}

//Get
qreal  Data_Meteo::getHum() const {		
	return m_humidity;
}
   
//Set      
void Data_Meteo::setHum(qreal humidity) {
    
    m_humidity = humidity;
    
}

//Get
qreal  Data_Meteo::getPress() const {		
	return m_pressure;
}
   
//Set      
void Data_Meteo::setPress(qreal pressure) {
    
    m_pressure = pressure;
    
}

//Get
QString Data_Meteo::getImage() const {		
	return m_image;
}

void Data_Meteo::maj_temp(){
    m_temp=m_data.temperature;
}

void Data_Meteo::maj_hum(){
    m_humidity=m_data.humidity;
}
    
    
    void Data_Meteo::maj_press(){
    m_pressure=m_data.pressure/100;
}
    

void Data_Meteo::capt_init(){
m_dev = init_capt();
}
    
void Data_Meteo::refresh(){

m_data=sensor_data(&m_dev);
}

void  Data_Meteo::calc_press_sea(){
    m_press_sea=(m_pressure/ pow(1-(0.0065*m_altitude/288.15),5.255));
}


void Data_Meteo::calc_zambretti(qreal pression){
    
    m_zambretti= 30-(10*pression/81);
}
    
    
qreal Data_Meteo::getZambretti() const
{
    return m_zambretti;
}
    
    
    
