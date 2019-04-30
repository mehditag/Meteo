// ####################################################################
// Auteur : Alix Dumay et Mehdi Taguema
// Date : 24/04/2019
// Version : 1.5
// Description : Ce programme permet de créer les méthodes de la classe Data_Meteo
// ####################################################################


#include "Objets.h"
#include "capteur.h"
#include <math.h>
#include <deque>
#include<iostream>
#include <ctime>


// ####################################################################
//  Déclaration des Get et du Constructeur
// ####################################################################

//Constructeur de la classe
Data_Meteo::Data_Meteo() {
    //Initialisation du capteur lors de la création de la classe, donc de l'ouverture de l'application
     Data_Meteo::capt_init();
    }

//Get des métriques T,P et H
qreal  Data_Meteo::getTemp() const {		
	return m_temp;
    }
    
qreal  Data_Meteo::getHum() const {		
	return m_humidity;
}

qreal  Data_Meteo::getPress() const {		
	return m_pressure;
}

//Get de la valeur d'incrément pour l'animation
qreal  Data_Meteo::getAnimation() const  {		
    return m_animation;
}

//Get de l'image de la météo
QString Data_Meteo::getColor_background() const {		
	return m_color_bg;
}

QString Data_Meteo::getMoon() const {		
	return m_moon;
}
   
//Get des métriques T,P et H pour l'historique
qreal  Data_Meteo::getPress3() const {		
	return m_pressure_h3;
}
qreal  Data_Meteo::getPress2() const {		
	return m_pressure_h2;
}
qreal  Data_Meteo::getPress1() const {		
	return m_pressure_h1;
}

qreal  Data_Meteo::getHum3() const {		
	return m_hum_h3;
}
qreal  Data_Meteo::getHum2() const {		
	return m_hum_h2;
}
qreal  Data_Meteo::getHum1() const {		
	return m_hum_h1;
}

qreal  Data_Meteo::getTemp3() const {		
	return m_temp_h3;
}
qreal  Data_Meteo::getTemp2() const {		
	return m_temp_h2;
}
qreal  Data_Meteo::getTemp1() const {		
	return m_temp_h1;
}

//Get de l'image de la météo
QString Data_Meteo::getImage() const {		
	return m_image;
}

//Get de l'image de la météo pour l'historique
QString Data_Meteo::getImage_h1() const {		
	return m_image_h1;
}
QString Data_Meteo::getImage_h2() const {		
	return m_image_h2;
}
QString Data_Meteo::getImage_h3() const {		
	return m_image_h3;
}

//Get de la valeur de la tendance, pour l'animation de la flèche
qreal Data_Meteo::gettend() const {		
	return m_tendance;
}

//Get de l'image correspondant à la tendance
QString Data_Meteo::getTendance() const
{
    return m_tendance_im;
}

//Get du texte de Description de la météo
QString Data_Meteo::getDescr() const
{
    return m_description;
}


// ####################################################################
//  Déclaration des Méthodes de la classe
// ####################################################################

//Animation de la flêche
void Data_Meteo::animation(){
    if (m_animation>20){
        m_animation=0;
    }
    m_animation=m_animation+5;
}

//Mise à jour des métriques 
void Data_Meteo::maj_temp(){
    m_temp=m_data.temperature;
}
void Data_Meteo::maj_hum(){
    m_humidity=m_data.humidity;
}
void Data_Meteo::maj_press(){
    m_pressure=m_data.pressure/100; //Donnée en hPa
}

//Initialisation du capteur    
void Data_Meteo::capt_init(){
    m_dev = init_capt();
}

//Mise à jour des données de la classe
void Data_Meteo::refresh(){
    
    //Récupération des métriques
    m_data=sensor_data(&m_dev);
    
    //Calcul des métriques
    Data_Meteo::calc_tendance();

    //Calcul de zambretti toutes les secondes
    if (val_seconde.size()<60 && val_heure.size()<1){
        Data_Meteo::calc_zambretti(m_press_sea);
    }
    
    //Calcul de zambretti toutes les minutes
    if (val_seconde.size()==59 && val_minutes.size()<60 && val_minutes.size()>=1 && val_heure.size()<1){
        Data_Meteo::calc_zambretti(val_minutes.front());
    }
    
    //Calcul de zambrettitoutes les heures
    if (val_minutes.size ()==59){
        Data_Meteo::calc_zambretti(val_heure.front());   
    }
    
    //Calcul phase lunaire
    Data_Meteo::calc_moon();
    
    //Mise à jour des métriques T,P, et H
    Data_Meteo::maj_hum();
    Data_Meteo::maj_press();
    Data_Meteo::maj_temp();
    
    //Mise à jour de l'interface selon jour/nuit
    Data_Meteo::change_background();
   
    // Appel de la fonction Historique toutes les secondes.
    Data_Meteo::calc_zambretti_history();

    
    
    //Affectation des valeurs de l'historique pour affichage toute les min, la 1ère heure
    if ( val_heure.size()<1){
        
        //Affectation des valeurs de l'historique pour affichage toute les min
        m_pressure_h3=stock_press_min[2];
        m_pressure_h2=stock_press_min[1];
        m_pressure_h1=stock_press_min[0];
     
        m_hum_h3=stock_hum_min[2];
        m_hum_h2=stock_hum_min[1];
        m_hum_h1=stock_hum_min[0];
     
        m_temp_h3=stock_temp_min[2];
        m_temp_h2=stock_temp_min[1];
        m_temp_h1=stock_temp_min[0];
 
        //Condition sur l'affichage de l'historique des métriques,  pour affichage toutes les min
        //Si le vecteur ne contient pas la valeur voulu, 0 est affiché
        if (stock_press_min.size()<3){
            m_pressure_h3=0;}
        if (stock_press_min.size()<2){
            m_pressure_h2=0;}
        if (stock_press_min.size()<1){
           m_pressure_h1=0;}
  
        if (stock_hum_min.size()<3){
            m_hum_h3=0;}
        if (stock_hum_min.size()<2){
            m_hum_h2=0;}
        if (stock_hum_min.size()<1){
            m_hum_h1=0;}
 
        if (stock_temp_min.size()<3){
            m_temp_h3=0;}
        if (stock_temp_min.size()<2){
            m_temp_h2=0;}
        if (stock_temp_min.size()<1){
            m_temp_h1=0;}
        
    }
    
    //Affectation des valeurs de l'historique pour affichage toutes les heures
    else if (val_heure.size()>=1 && val_minutes.size ()==59){
 
        m_pressure_h3=stock_press_heure[2];
        m_pressure_h2=stock_press_heure[1];
        m_pressure_h1=stock_press_heure[0];
    
        m_hum_h3=stock_hum_heure[2];
        m_hum_h2=stock_hum_heure[1];
        m_hum_h1=stock_hum_heure[0];
     
        m_temp_h3=stock_temp_heure[2];
        m_temp_h2=stock_temp_heure[1];
        m_temp_h1=stock_temp_heure[0];
        
    //Condition sur l'affichage de l'historique des métriques,  pour affichage toutes les min et toutes les heures
    //Si le vecteur ne contient pas la valeur voulu, 0 est affiché
        if (stock_press_heure.size()<3){
            m_pressure_h3=0;}
        if (stock_press_heure.size()<2){
            m_pressure_h2=0;}
        if (stock_press_heure.size()<1){
            m_pressure_h1=0;}
  
        if (stock_hum_heure.size()<3){
            m_hum_h3=0;}
        if (stock_hum_heure.size()<2){
            m_hum_h2=0;}
        if (stock_hum_heure.size()<1){
            m_hum_h1=0;}
 
        if (stock_temp_heure.size()<3){
            m_temp_h3=0;}
        if (stock_temp_heure.size()<2){
            m_temp_h2=0;}
        if (stock_temp_heure.size()<1){
            m_temp_h1=0;}
        
    }
 
    //Stockage des données m_press_sea et des métriques toutes les secondes, puis min, puis heures 
    Data_Meteo::calc_history(val_seconde, val_minutes, val_heure,  4);
    Data_Meteo::calc_history(stock_temp_sec, stock_temp_min, stock_temp_heure,  1);    
    Data_Meteo::calc_history(stock_press_sec, stock_press_min, stock_press_heure, 2);
    Data_Meteo::calc_history(stock_hum_sec, stock_hum_min, stock_hum_heure,      3); 

    
}//Fin fonction refresh

//Calcul de la pression au niveau de la mer
void Data_Meteo::calc_press_sea(){
    m_press_sea=(m_pressure/ pow(1-(0.0065*m_altitude/288.15),5.255));
}

//Fonction permettant la mise à jour de l'interface suivant le jour/la nuit
void Data_Meteo::change_background(){
    time_t temps;
    struct tm datetime;
    std::time(&temps);
    datetime = *localtime(&temps);
    qint32 h_jour=0;
    qint32 h_nuit=0;
    
    //Suivant la saison hiver ou été, modification des heures jour et nuit
    if (datetime.tm_mon <= 4 && datetime.tm_mon >= 8) {
        h_jour=9;
        h_nuit=19;}
    else {
        h_jour=11;
        h_nuit=21;
    }
    // Récupération heure de l'instant pour le calcul jour/nuit
    if (datetime.tm_hour <h_jour ||  datetime.tm_hour>=h_nuit){
        m_color_bg = "steelblue";
    }
    else {
        m_color_bg = "aquamarine"; }
        
}//Fin change_background


//Algorithme de zambretti
void Data_Meteo::calc_zambretti(qreal pression){

    //Selon le numéro du mois, on incrèmente de 1 la valeur de zambretti
    //Récupération du n° du mois en cours
     time_t temps;
     struct tm datetime;
     std::time(&temps);
     datetime = *localtime(&temps);
    
    //Réalisation de l'algorithme
    if (m_tendance<-2){
        
        m_zambretti=ceil(130-(10*pression/81));
        m_tendance_im="Icones/fleche_falling.svg";
    }
        
    else if ( m_tendance>2){
        m_zambretti=ceil(179-(20*pression/129));
        m_tendance_im="Icones/fleche_rising.svg";
    }
        
    else {
        m_zambretti= ceil(147-(50*pression/376));
        m_tendance_im="Icones/fleche_steady.svg";
    }
        
    //Réalisation de l'incrément Attention datetime.tm_mon donne le n° du mois -1...
    if (datetime.tm_mon >= 2 && datetime.tm_mon <= 9) {
        m_zambretti = m_zambretti;
    }
    else {
        m_zambretti = m_zambretti+1;
    }
    
    //Description et image météo selon la valeur de zambretti
    switch (m_zambretti){
                  case 1:   m_description="Ensoleillé";     m_image="Icones/Soleil.svg";                    break;
                  case 2:   m_description="Ensoleillé";     m_image="Icones/Soleil.svg";                    break;
                  case 3:   m_description="Ensoleillé";     m_image="Icones/Soleil_nuageux.svg";   break;
                  case 4:   m_description="Eclaircies";     m_image="Icones/Soleil_nuageux.svg";   break;
                  case 5:   m_description="Averses";        m_image="Icones/Averses.svg";                break;
                  case 6:   m_description="Instable";       m_image="Icones/Pluvieux.svg";               break;
                  case 7:   m_description="Pluvieux" ;     m_image="Icones/Pluvieux.svg";               break;
                  case 8:   m_description="Pluvieux" ;     m_image="Icones/Pluvieux.svg";               break;
                  case 9:   m_description="Pluvieux" ;     m_image="Icones/Pluvieux.svg";               break;                            
                  case 10: m_description="Ensoleillé";    m_image="Icones/Soleil.svg";                    break;
                  case 11: m_description="Ensoleillé";    m_image="Icones/Soleil.svg";                    break;
                  case 12: m_description="Eclaircies";    m_image="Icones/Soleil_nuageux.svg";   break;
                  case 13: m_description="Eclaircies" ;   m_image="Icones/Soleil_nuageux.svg";   break;
                  case 14: m_description="Averses" ;      m_image="Icones/Averses.svg";                break;
                  case 15: m_description="Variable";      m_image="Icones/Averses.svg";                break;
                  case 16: m_description="Variable";      m_image="Icones/Pluvieux.svg";               break;
                  case 17: m_description="Pluvieux" ;     m_image="Icones/Pluvieux.svg";               break;
                  case 18: m_description="Pluvieux" ;     m_image="Icones/Pluvieux.svg";               break;
                  case 19: m_description="Orageux" ;     m_image="Icones/Orageux.svg";                break;
                  case 20: m_description="Ensoleillé";    m_image="Icones/Soleil.svg";                    break;
                  case 21: m_description="Ensoleillé";    m_image="Icones/Soleil.svg";                    break;
                  case 22: m_description="Eclaircies";    m_image="Icones/Soleil_nuageux.svg";   break;
                  case 23: m_description="Eclaircies" ;   m_image="Icones/Soleil_nuageux.svg";   break;
                  case 24: m_description="Eclaircies" ;   m_image="Icones/Soleil_nuageux.svg";   break;
                  case 25: m_description="Pluvieux";      m_image="Icones/Pluvieux.svg";               break;
                  case 26: m_description="Instable";       m_image="Icones/Nuageux.svg";              break;
                  case 27: m_description="Eclaircies" ;   m_image="Icones/Soleil_nuageux.svg";   break;
                  case 28: m_description="Instable" ;      m_image="Icones/Nuageux.svg";              break;
                  case 29: m_description="Averses" ;      m_image="Icones/Averses.svg";                break;
                  case 30: m_description="Averses";       m_image="Icones/Averses.svg";                break;
                  case 31: m_description="Orageux" ;     m_image="Icones/Orageux.svg";               break;
                  case 32: m_description="Orageux" ;     m_image="Icones/Orageux.svg";               break;
                  default:  m_description="Chargement en cours";                                                       break;}
                  
     //Stockage de la valeur de zambretti pour historique   
     if (val_seconde.size()==58 && val_heure.size()<1){
         
         if (stock_zambretti.size() <4) {
                 stock_zambretti.push_front(m_zambretti);
             }
         
         else if (stock_zambretti.size() >= 4) {
           
                 stock_zambretti.pop_back();
                 stock_zambretti.push_front(m_zambretti);                 
            }
         
     }
         
     else if (val_minutes.size()==59){
         
          if (stock_zambretti.size() <4) {
                 stock_zambretti.push_front(m_zambretti);
            }
         
         else if (stock_zambretti.size() >= 4) {
           
                 stock_zambretti.pop_back();
                 stock_zambretti.push_front(m_zambretti);               
            }  
     }
 
}//Fin calcul zambretti

//Caclul phase de la lune
void Data_Meteo::calc_moon(){
    
    //Création d'une structure temps pour la date
    time_t temps;
    struct tm datetime;
    struct tm datelune;
    std::time(&temps);
    datetime = *localtime(&temps);    
    
    //Structure time pour la phase lunaire (base pleine lune)
    datelune.tm_year=2019-1900;
    datelune.tm_mday=19;
    datelune.tm_mon=3;
    datelune.tm_hour = 13;
    datelune.tm_min = 12;
    datelune.tm_sec = 0;
    std::mktime(&datelune);
    
    // Calcul de la phase lunaire
    double secondes = std::difftime(temps,std::mktime(&datelune));
    
    if (fmod((secondes/86400),29)< 3 || fmod((secondes/86400),29)>27){
        m_moon ="Icones/fullmoon.svg";
        
    } else if (fmod((secondes/86400),29)>13 && fmod((secondes/86400),29)<18){

         m_moon ="Icones/newmoon.svg";
    }
    else { 
        m_moon ="Icones/moon1quart.svg";
    }
}//Fin calcul phase lunaire

//Calcul moyenne d'un vecteur
qreal Data_Meteo::moyenne (std::deque <qreal> &nbre){
    
    qreal moy=0;
    for(int i=0; i<nbre.size(); i++)
        {
        moy += nbre[i];   }
        moy=moy/nbre.size();
        return moy;
}//Fin calcul moyenne d'un vecteur

        
//Calcul de la tendance        
void Data_Meteo::calc_tendance()
{    
    //Calcul de la pression au niveau de la mer
    Data_Meteo::calc_press_sea(); 
    
    //Calcul de la tendance toutes les tendances
    if (val_seconde.size()<60 && val_heure.size()<1){
        m_tendance=m_press_sea - Data_Meteo::moyenne(val_seconde);     
    }
    
    //Calcul de la tendance toutes les minutes
    if (val_seconde.size()==59 && val_minutes.size()<60 && val_minutes.size()>=1){
        m_tendance=Data_Meteo::moyenne(val_seconde)-val_minutes.front();
    }
    
    //Calcul de la tendance toutes les heures
    if (val_minutes.size ()==59){
        m_tendance=Data_Meteo::moyenne(val_minutes)-val_heure.front();
    }

}//Fin calcul tendance



//Fonction permettant de stocker une données toutes les secondes
//  Stocker la moyenne de 60 secondes toutes les minutes
//  Stocker la moyenne de 60 min toutes les heures
void Data_Meteo::calc_history(std::deque<qreal> &stock_data_sec,std::deque<qreal> &stock_data_min,std::deque<qreal> &stock_data_heure, int type)
{
   
    qreal data;
    //Suivant l'appel, cette fonction permet de stocker 
    switch (type){
        case 1:data=m_temp;break;
        case 2:data=m_pressure;break;
        case 3:data=m_humidity;break;
        case 4:data =m_press_sea;break;
    }
    
     //Pour les secondes :    
    if (stock_data_sec.size() <= 60){
        stock_data_sec.push_front(data);
    }

   if (stock_data_min.size() <60 && stock_data_sec.size() ==60){ 
        stock_data_min.push_front(Data_Meteo::moyenne(stock_data_sec));
        stock_data_sec.clear();
    }    
               
    //Pour les heures :    
    if (stock_data_heure.size() < 4 && stock_data_min.size()==60){     
        stock_data_heure.push_front(Data_Meteo::moyenne(stock_data_min));
        stock_data_min.clear();
    }
        
    else if (stock_data_heure.size() >= 4 && stock_data_min.size()==60){   
        stock_data_heure.pop_back();
        stock_data_heure.push_front(Data_Meteo::moyenne(stock_data_min));
        stock_data_min.clear();
    }

}//Fin fonction calc_history


//Determination image historique météo selon valeur de zambretti stockée
void Data_Meteo::calc_zambretti_history(){
    
    switch (stock_zambretti[0]){
                  case 1: m_image_h1="Icones/Soleil.svg";break;
                  case 2: m_image_h1="Icones/Soleil.svg";break;
                  case 3: m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 4: m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 5: m_image_h1="Icones/Averses.svg";break;
                  case 6: m_image_h1="Icones/Pluvieux.svg";break;
                  case 7:m_image_h1="Icones/Pluvieux.svg";break;
                  case 8: m_image_h1="Icones/Pluvieux.svg";break;
                  case 9: m_image_h1="Icones/Pluvieux.svg";break;                            
                  case 10:m_image_h1="Icones/Soleil.svg";break;
                  case 11:m_image_h1="Icones/Soleil.svg";break;
                  case 12:m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 13:m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 14:m_image_h1="Icones/Averses.svg";break;
                  case 15:m_image_h1="Icones/Averses.svg";break;
                  case 16:m_image_h1="Icones/Pluvieux.svg";break;
                  case 17:m_image_h1="Icones/Pluvieux.svg";break;
                  case 18:m_image_h1="Icones/Pluvieux.svg";break;
                  case 19:m_image_h1="Icones/Orageux.svg";break;
                  case 20:m_image_h1="Icones/Soleil.svg";break;
                  case 21:m_image_h1="Icones/Soleil.svg";break;
                  case 22:m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 23:m_image_h1="Icones/Soleil_nuageux.svg"; break;
                  case 24:m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 25:m_image_h1="Icones/Pluvieux.svg";break;
                  case 26:m_image_h1="Icones/Nuageux.svg";break;
                  case 27:m_image_h1="Icones/Soleil_nuageux.svg";break;
                  case 28:m_image_h1="Icones/Nuageux.svg";break;
                  case 29:m_image_h1="Icones/Averses.svg";break;
                  case 30:m_image_h1="Icones/Averses.svg"; break;
                  case 31:m_image_h1="Icones/Orageux.svg";break;
                  case 32:m_image_h1="Icones/Orageux.svg";break;
                
                  default : m_image_h1="Icones/chargement.svg";break;}
                    

    

    switch (stock_zambretti[1]){
                  case 1: m_image_h2="Icones/Soleil.svg";break;
                  case 2: m_image_h2="Icones/Soleil.svg"; break;
                  case 3: m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 4: m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 5: m_image_h2="Icones/Averses.svg";break;
                  case 6: m_image_h2="Icones/Pluvieux.svg";break;
                  case 7:m_image_h2="Icones/Pluvieux.svg";break;
                  case 8: m_image_h2="Icones/Pluvieux.svg"; break;
                  case 9: m_image_h2="Icones/Pluvieux.svg";break;                            
                  case 10:m_image_h2="Icones/Soleil.svg";break;
                  case 11:m_image_h2="Icones/Soleil.svg";break;
                  case 12:m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 13:m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 14:m_image_h2="Icones/Averses.svg"; break;
                  case 15:m_image_h2="Icones/Averses.svg";break;
                  case 16:m_image_h2="Icones/Pluvieux.svg";break;
                  case 17:m_image_h2="Icones/Pluvieux.svg";break;
                  case 18:m_image_h2="Icones/Pluvieux.svg";break;
                  case 19:m_image_h2="Icones/Orageux.svg";break;
                  case 20:m_image_h2="Icones/Soleil.svg";break;
                  case 21:m_image_h2="Icones/Soleil.svg";break;
                  case 22:m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 23:m_image_h2="Icones/Soleil_nuageux.svg"; break;
                  case 24:m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 25:m_image_h2="Icones/Pluvieux.svg";break;
                  case 26:m_image_h2="Icones/Nuageux.svg";break;
                  case 27:m_image_h2="Icones/Soleil_nuageux.svg";break;
                  case 28:m_image_h2="Icones/Nuageux.svg";break;
                  case 29:m_image_h2="Icones/Averses.svg";break;
                  case 30:m_image_h2="Icones/Averses.svg"; break;
                  case 31:m_image_h2="Icones/Orageux.svg";break;
                  case 32:m_image_h2="Icones/Orageux.svg";break;
        
                default : m_image_h2="Icones/chargement.svg";break;}
    

    switch (stock_zambretti[2]){
                  case 1: m_image_h3="Icones/Soleil.svg";break;
                  case 2: m_image_h3="Icones/Soleil.svg"; break;
                  case 3: m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 4: m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 5: m_image_h3="Icones/Averses.svg";break;
                  case 6: m_image_h3="Icones/Pluvieux.svg";break;
                  case 7:m_image_h3="Icones/Pluvieux.svg";break;
                  case 8: m_image_h3="Icones/Pluvieux.svg"; break;
                  case 9: m_image_h3="Icones/Pluvieux.svg";break;                            
                  case 10:m_image_h3="Icones/Soleil.svg";break;
                  case 11:m_image_h3="Icones/Soleil.svg";break;
                  case 12:m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 13:m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 14:m_image_h3="Icones/Averses.svg"; break;
                  case 15:m_image_h3="Icones/Averses.svg";break;
                  case 16:m_image_h3="Icones/Pluvieux.svg";break;
                  case 17:m_image_h3="Icones/Pluvieux.svg";break;
                  case 18:m_image_h3="Icones/Pluvieux.svg";break;
                  case 19:m_image_h3="Icones/Orageux.svg";break;
                  case 20:m_image_h3="Icones/Soleil.svg";break;
                  case 21:m_image_h3="Icones/Soleil.svg";break;
                  case 22:m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 23:m_image_h3="Icones/Soleil_nuageux.svg"; break;
                  case 24:m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 25:m_image_h3="Icones/Pluvieux.svg";break;
                  case 26:m_image_h3="Icones/Nuageux.svg";break;
                  case 27:m_image_h3="Icones/Soleil_nuageux.svg";break;
                  case 28:m_image_h3="Icones/Nuageux.svg";break;
                  case 29:m_image_h3="Icones/Averses.svg";break;
                  case 30:m_image_h3="Icones/Averses.svg"; break;
                  case 31:m_image_h3="Icones/Orageux.svg";break;
                  case 32:m_image_h3="Icones/Orageux.svg";break;
        
                  default : m_image_h3="Icones/chargement.svg";break;}
                  
}//Fin historique de zambretti
