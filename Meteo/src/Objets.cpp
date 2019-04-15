#include "Objets.h"
#include <QDebug>



//Constructeur
Data_Meteo::Data_Meteo() {
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

void Data_Meteo::maj_temp(){
    m_temp=m_temp+1;
}

void Data_Meteo::maj_hum(){
    m_humidity=m_humidity+1;
}
    
    
    void Data_Meteo::maj_press(){
    m_pressure=m_pressure+1;
}
    
    
