#include "Objets.h"
#include "capteur.h"
#include <math.h>
#include <deque>
#include<iostream>

//Constructeur
Data_Meteo::Data_Meteo() {
     Data_Meteo::capt_init();
}

//Get
qreal  Data_Meteo::getTemp() const {		
	return m_temp;
    
}

qreal  Data_Meteo::getZ()  {		
    
    //if rising
         if (m_z>40){m_z=0;}
     m_z=m_z+5;
// 	return m_z;
    
    //If steady
//     if (m_z>40){m_z=0;}
//     m_z=m_z+5;
// 	return m_z;
    
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

qreal Data_Meteo::gettend() const {		
	return m_tendance;
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
    
    if (m_tendance<-0.01){
        
        m_zambretti=ceil(130-(10*pression/81));
        m_tendance_im="Icones/fleche_falling.svg";
        
    }
        
        else if ( m_tendance>0.01){
        
            m_zambretti=ceil(179-(20*pression/129));
            m_tendance_im="Icones/fleche_rising.svg";
        }
        
        else {
    m_zambretti= ceil(147-(50*pression/376));
        m_tendance_im="Icones/fleche_steady.svg";
        }
    
    switch (m_zambretti){
                  case 1: m_description="Ensoleillé"; m_image="Icones/Soleil.svg";break;
                  case 2: m_description="Ensoleillé";m_image="Icones/Soleil.svg"; break;
                  case 3: m_description="Ensoleillé"; m_image="Icones/Soleil_nuageux.svg";break;
                  case 4: m_description="Eclaircies" ; m_image="Icones/Soleil_nuageux.svg";break;
                  case 5: m_description="Averses"; m_image="Icones/Averses.svg";break;
                  case 6: m_description="Instable"; m_image="Icones/Pluvieux.svg";break;
                  case 7:m_description="Pluvieux" ; m_image="Icones/Pluvieux.svg";break;
                  case 8: m_description="Pluvieux" ;m_image="Icones/Pluvieux.svg"; break;
                  case 9: m_description="Pluvieux" ; m_image="Icones/Pluvieux.svg";break;                            
                  case 10:m_description="Ensoleillé"; m_image="Icones/Soleil.svg";break;
                  case 11:m_description="Ensoleillé"; m_image="Icones/Soleil.svg";break;
                  case 12:m_description="Eclaircies"; m_image="Icones/Soleil_nuageux.svg";break;
                  case 13:m_description="Eclaircies" ; m_image="Icones/Soleil_nuageux.svg";break;
                  case 14:m_description="Averses" ;m_image="Icones/Averses.svg"; break;
                  case 15:m_description="Variable"; m_image="Icones/Averses.svg";break;
                  case 16:m_description="Variable"; m_image="Icones/Pluvieux.svg";break;
                  case 17:m_description="Pluvieux" ; m_image="Icones/Pluvieux.svg";break;
                  case 18:m_description="Pluvieux" ; m_image="Icones/Pluvieux.svg";break;
                  case 19:m_description="Orageux" ; m_image="Icones/Orageux.svg";break;
                  case 20:m_description="Ensoleillé"; m_image="Icones/Soleil.svg";break;
                  case 21:m_description="Ensoleillé"; m_image="Icones/Soleil.svg";break;
                  case 22:m_description="Eclaircies"; m_image="Icones/Soleil_nuageux.svg";break;
                  case 23:m_description="Eclaircies" ;m_image="Icones/Soleil_nuageux.svg"; break;
                  case 24:m_description="Eclaircies" ; m_image="Icones/Soleil_nuageux.svg";break;
                  case 25:m_description="Pluvieux"; m_image="Icones/Pluvieux.svg";break;
                  case 26:m_description="Instable"; m_image="Icones/Nuageux.svg";break;
                  case 27:m_description="Eclaircies" ; m_image="Icones/Soleil_nuageux.svg";break;
                  case 28:m_description="Instable" ; m_image="Icones/Nuageux.svg";break;
                  case 29:m_description="Averses" ; m_image="Icones/Averses.svg";break;
                  case 30:m_description="Averses";m_image="Icones/Averses.svg"; break;
                  case 31:m_description="Orageux" ; m_image="Icones/Orageux.svg";break;
                  case 32:m_description="Orageux" ; m_image="Icones/Orageux.svg";break;
                  
                  default: m_description="Chargement en cours"; break;}
 
}
    
    
QString Data_Meteo::getTendance() const
{
    return m_tendance_im;
}
    
        
QString Data_Meteo::getDescr() const
{
    return m_description;
}
    
qreal Data_Meteo::moyenne (std::deque <qreal> &nbre){
    
    qreal moy=0;
     for(int i=0; i<nbre.size(); i++)
   {
      moy += nbre[i];   }
      moy=moy/nbre.size();
      return moy;
}



void Data_Meteo::calc_tendance()
{    
    Data_Meteo::calc_press_sea();
    
     //Pour les secondes :    
    if (val_seconde.size() < 60){
      
        val_seconde.push_front(m_press_sea);
//          std::cout<<"taille seconde="<<val_seconde.size()<<std::endl;
    }

    else 
    {/*
        val_seconde.pop_back();
        val_seconde.push_front(m_press_sea);*/
        val_seconde.clear();
        /*std::cout<<"Val seconde="<<val_seconde.front()<<std::endl;*/}
   
   
   
if (val_seconde.size() ==60){ 
   if (val_minutes.size() < 60){
//        std::cout<<"taille minute="<<val_minutes.size()<<std::endl;
        val_minutes.push_front(Data_Meteo::moyenne(val_seconde));
    }
        
       else{ 
        val_minutes.pop_back();
        val_minutes.push_front(Data_Meteo::moyenne(val_seconde));
//         std::cout<<m_press_sea<<std::endl;
//         std::cout<<"val minutes="<<val_minutes.front()<<std::endl;
       }
    
}
//         std::cout<<"taille minute="<<val_minutes.size()<<std::endl;
  m_tendance=0;    
  
if (val_minutes.size()==1){        
                //Pour les heures :    
    if (val_heure.size() < 4){
      
        val_heure.push_front(Data_Meteo::moyenne(val_minutes));
        m_tendance=m_press_sea-val_heure.front();
    }
        
    else
    {
        val_heure.pop_back();
        val_heure.push_front(Data_Meteo::moyenne(val_minutes));
//         std::cout<<m_press_sea<<std::endl;
//         std::cout<<"val heure"<<val_heure.front()<<std::endl;
    m_tendance=m_press_sea-val_heure.front();
    }
//     std::cout<<"tendance="<<m_tendance<<std::endl; 
}


 //std::cout<<"tendance="<<m_tendance<<std::endl;
Data_Meteo::calc_zambretti(m_press_sea);
// std::cout<<"zambretti="<<m_zambretti<<std::endl;

Data_Meteo::calc_history(stock_temp_sec, stock_temp_min, stock_temp_heure, 1);
Data_Meteo::calc_history(stock_press_sec, stock_press_min, stock_press_heure, 2);
Data_Meteo::calc_history(stock_hum_sec, stock_hum_min, stock_hum_heure, 3);

// std::cout<<"Température="<<stock_temp_sec.front()<<std::endl;
// std::cout<<"Pression="<<stock_press_sec.front()<<std::endl;
// std::cout<<"Humidite="<<stock_hum_sec.front()<<std::endl;
}




void Data_Meteo::calc_history(std::deque<qreal> &stock_data_sec,std::deque<qreal> &stock_data_min,std::deque<qreal> &stock_data_heure, int type)
{
    qreal data;
    switch (type){
        case 1:data=m_temp;break;
        case 2:data=m_pressure;break;
        case 3:data=m_humidity;break;
    }
    
     //Pour les secondes :    
    if (stock_data_sec.size() < 60){
      
        stock_data_sec.push_front(data);
        // std::cout<<"taille seconde="<<val_seconde.size()<<std::endl;
    }

    else 
    {/*
        val_seconde.pop_back();
        val_seconde.push_front(m_press_sea);*/
        stock_data_sec.clear();
        //std::cout<<"Val seconde="<<val_seconde.front()<<std::endl;
        
    }
   
   
   
if (stock_data_sec.size() ==60){ 
   if (stock_data_min.size() < 60){
      // std::cout<<"taille minute="<<val_minutes.size()<<std::endl;
        stock_data_min.push_front(Data_Meteo::moyenne(stock_data_sec));
    }
        
       else{ 
        stock_data_min.pop_back();
        stock_data_min.push_front(Data_Meteo::moyenne(stock_data_sec));
//         std::cout<<m_press_sea<<std::endl;
//         std::cout<<"val minutes="<<val_minutes.front()<<std::endl;
       }
    
}
//         std::cout<<"taille minute="<<val_minutes.size()<<std::endl;
  
if (stock_data_min.size()==1){        
                //Pour les heures :    
    if (stock_data_heure.size() < 4){
      
        stock_data_heure.push_front(Data_Meteo::moyenne(stock_data_min));
    }
        
    else
    {
        stock_data_heure.pop_back();
        stock_data_heure.push_front(Data_Meteo::moyenne(stock_data_min));
    }
}

}

