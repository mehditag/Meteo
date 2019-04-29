// ####################################################################
// Auteur : Alix Dumay et Mehdi Taguema
// Date : 24/04/2019
// Version : 1.5
// Description : Ce programme permet de créer la classe Data_Météo 
//                        Cette classe permet de réaliser toutes les fonctions nécessaire à la station météo
// ####################################################################

#pragma once
#include <QObject>
#include "bme280.h"
#include "bme280_defs.h"
#include "capteur.h"
#include <deque>


class Data_Meteo : public QObject
{
    
    Q_OBJECT
    
     // ####################################################################
    //  Déclaration des Q_PROPERTY permettant à l'interface graphique de récupérer 
    //                     des attributs et des méthodes de la classe via des signaux et des slots
    // #####################################################################
    
   
    
    
    // ####################################################################
    //  Signaux liés à l'application météo "basique"
    // #####################################################################
    
    //Récupếration  des métriques
	Q_PROPERTY(qreal getTemp    READ getTemp 		                    NOTIFY tempChanged)
    Q_PROPERTY(qreal getHum     READ getHum 		                    NOTIFY humChanged)
    Q_PROPERTY(qreal getPress    READ getPress 		                    NOTIFY pressChanged)
    
    //Récupération de l'adresse de l'image météo, de l'image Tendance, du texte de description
    Q_PROPERTY(QString getImage                         READ getImage                  NOTIFY imageChanged)
    Q_PROPERTY(QString getTendance                   READ getTendance		        NOTIFY tendChanged)
    Q_PROPERTY(QString getDescr                          READ getDescr       	            NOTIFY descrChanged)
    Q_PROPERTY(qreal getAnimation                      READ getAnimation       	    NOTIFY AnimationChanged)
    Q_PROPERTY(qreal gettend                                READ gettend      	                NOTIFY tendanceChanged)
    
    // Récupération de la couleur pour le changement de la couleur du fond en fonction de l'heure
    Q_PROPERTY(QString getColor_background         READ getColor_background                  NOTIFY Color_backgroundChanged)
    
     // Récupération de la couleur pour le changement de la couleur du fond en fonction de l'heure
    Q_PROPERTY(QString getMoon         READ getMoon                  NOTIFY MoonChanged)
    
     // ####################################################################
    //  Signaux liés à l'application météo "optionnel" (historique sur 3h)
    // #####################################################################
    
    
    //Récupération de l'historique des températures
    Q_PROPERTY(qreal getTemp3    READ getTemp3 		NOTIFY Temp3Changed)
    Q_PROPERTY(qreal getTemp2   READ getTemp2 		NOTIFY Temp2Changed)
    Q_PROPERTY(qreal getTemp1   READ getTemp1 		NOTIFY Temp1Changed)
    
    //Récupération de l'historique des humidités
    Q_PROPERTY(qreal getHum3    READ getHum3 		NOTIFY hum3Changed)
    Q_PROPERTY(qreal getHum2    READ getHum2 		NOTIFY hum2Changed)
    Q_PROPERTY(qreal getHum1    READ getHum1 		NOTIFY hum1Changed)
    
    //Récupération de l'historique des pressions
    Q_PROPERTY(qreal getPress3  READ getPress3 		NOTIFY Press3Changed)
    Q_PROPERTY(qreal getPress2  READ getPress2 		NOTIFY Press2Changed)      
    Q_PROPERTY(qreal getPress1  READ getPress1 		NOTIFY Press1Changed)
    
    //Récupération de l'historique des images météo
    Q_PROPERTY(QString getImage_h1  READ getImage_h1       NOTIFY image_h1Changed)
    Q_PROPERTY(QString getImage_h2  READ getImage_h2       NOTIFY image_h2Changed)
    Q_PROPERTY(QString getImage_h3  READ getImage_h3       NOTIFY image_h3Changed)
    
 
    // ####################################################################
    //  Déclaration des attributs privés de la classe 
    // ####################################################################
    
private:
    
    // ####################################################################
    //  Déclaration des attributs liés à l'application "basique"
    // ####################################################################
    
	qreal m_temp;
    qreal m_humidity;
    qreal m_pressure;
    qreal m_press_sea;
    qreal m_altitude=151.5;  //Calcul de l'altitude sur Toulouse, en m
    QString m_image="Icones/chargement.svg";
    qint32 m_zambretti=2;
    qreal m_tendance=0;
    QString m_tendance_im; //Variable stockant l'adresse de l'image liée à la tendance
    QString m_description="Chargement ...";
    qreal m_animation=0;
    QString m_color_bg="aquamarine";
    
    // Image lune...
    QString m_moon="Icones/chargement.svg";
    
    // ####################################################################
    //  Déclaration des attributs liés à l'application "optionnelle" (historique sur 3h)
    // ####################################################################
    
    //Image de la météo
    QString m_image_h1="Icones/chargement.svg";
    QString m_image_h2="Icones/chargement.svg";
    QString m_image_h3="Icones/chargement.svg";
      
    //Valeur de zambretti 
    qint32 m_zambretti_h3=2;
    qint32 m_zambretti_h2=2;
    qint32 m_zambretti_h1=2;
    
    //Pressions
    qreal m_pressure_h3;
    qreal m_pressure_h2;
    qreal m_pressure_h1;
    
    //Températures
    qreal m_temp_h3;
    qreal m_temp_h2;
    qreal m_temp_h1;
    
    //Humidités
    qreal m_hum_h3;
    qreal m_hum_h2;
    qreal m_hum_h1;
    
    // ####################################################################
    //  Déclaration des containers (deque) liés au stockage des valeurs
    // ####################################################################
    
    
    //Stockage de la pression au niveau de la mer toutes les secondes, puis min, puis heure
    std::deque<qreal> val_seconde;
    std::deque<qreal> val_minutes;
    std::deque<qreal> val_heure;    
    
    //Stockage de la température toutes les sec, puis min, puis heure
    std::deque<qreal> stock_temp_sec;
    std::deque<qreal> stock_temp_min;
    std::deque<qreal> stock_temp_heure;
    
    //Stockage de la pression toutes les sec, puis min, puis heure
    std::deque<qreal> stock_press_sec;
    std::deque<qreal> stock_press_min;
    std::deque<qreal> stock_press_heure;
    
    //Stockage de l'humidité toutes les sec, puis min, puis heure
    std::deque<qreal> stock_hum_sec;
    std::deque<qreal> stock_hum_min;
    std::deque<qreal> stock_hum_heure;
    
    //Stockage de la valeur de zambretti toute les heures, pour historique  
    std::deque<qint32> stock_zambretti;
    
    //Création de structures dev et data liés au capteur bme280
    struct bme280_dev m_dev;
    struct bme280_data m_data;

    
// ####################################################################
//  Déclaration des signaux pour l'acquisition des attributs de la classe par l'interface
// ####################################################################    
    
signals:
    
    // ####################################################################
    //  Signaux liés à l'application "basique"
    // ####################################################################
    void tempChanged();
    void humChanged();
    void pressChanged();
    void imageChanged();
    void tendChanged();
    void descrChanged();
    void tendanceChanged();
    void AnimationChanged();
    void Color_backgroundChanged();
    void MoonChanged();

    // ####################################################################
    //  Signaux liés à l'application "optionnelle"
    // ####################################################################
    
    // Singaux liés aux changements de l'image météo 
    void image_h1Changed();
    void image_h2Changed();
    void image_h3Changed();

    // Singaux liés aux changements de l'humidité
    void hum3Changed();
    void hum2Changed();
    void hum1Changed();

    // Singaux liés aux changements de la Température
    void Temp3Changed();
    void Temp2Changed();
    void Temp1Changed();

    // Singaux liés aux changements de la Pression
    void Press3Changed();
    void Press2Changed();
    void Press1Changed();

// ####################################################################
//  Déclaration des méthodes publiques de la classe, utilisable par l'interface (slots)
// ####################################################################     
public slots:
    
    //Actualisation de T,P et H
    void maj_temp();
    void maj_hum();
    void maj_press();
    
    //Mise à jour des métriques lues
    void refresh();
    
    //Initialisation du capteur
    void capt_init();
    
    //Calcul de la pression au niveau de la mer
    void calc_press_sea();
    
    //Algorithme de zambretti 
    void calc_zambretti(qreal pression);
    
    //Calcul une moyenne d'un vecteur ou deque
    qreal moyenne (std::deque <qreal> &nbre);
    
    //Calcul de la tendance 
    void calc_tendance();
    
    //Stock des valeurs toutes les secondes, puis la moyenne de 60 sec toute les minutes, puis la moyenne de 60min toutes les heures 
    void calc_history(std::deque<qreal> &stock_data_sec,std::deque<qreal> &stock_data_min,std::deque<qreal> &stock_data_heure, int type);
    
    //Selon la valeur de zambretti stockée, permet de definir la météo et l'image correspondante
    void calc_zambretti_history();
    
    //Fonction pour le calcul de la phase lunaire
    void calc_moon();
    
    //Fonction permettant de changer le fond d'écran
    void change_background();

    //fonction permettant l'animation de la flêche
    void animation();
    
// ####################################################################
//  Déclaration des méthodes publiques de la classe, permettant l'accès à ces attributs par l'interface
// ####################################################################       
public:
    //Constructeur de la classe
	Data_Meteo();
    
    //Get des attributs de la classe 
    qreal   getTemp() const;
    qreal   getHum() const;
    qreal   getPress() const;
    qreal getAnimation() const;
    qreal gettend() const;
    QString getImage() const;
    QString getTendance() const;
    QString getDescr() const;
    QString getColor_background() const;
    QString getMoon() const;
     
    
    qreal getHum3() const;
    qreal getHum2() const;
    qreal getHum1() const;
         
    qreal getTemp3() const;
    qreal getTemp2() const;
    qreal getTemp1() const;
         
    qreal getPress3() const;
    qreal getPress2() const;
    qreal getPress1() const;
      
    QString getImage_h1() const;
    QString getImage_h2() const;
    QString getImage_h3() const;      
      
};
