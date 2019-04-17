#pragma once
#include <QObject>
#include "bme280.h"
#include "bme280_defs.h"
#include "capteur.h"


class Data_Meteo : public QObject
{
	Q_OBJECT
	Q_PROPERTY(qreal getTemp READ getTemp WRITE setTemp 		NOTIFY tempChanged)
    Q_PROPERTY(qreal getHum READ getHum WRITE setHum 		NOTIFY humChanged)
    Q_PROPERTY(qreal getPress READ getPress WRITE setPress 		NOTIFY pressChanged)
    Q_PROPERTY(QString getImage READ getImage       NOTIFY imageChanged)
     Q_PROPERTY(qreal getZambretti READ getZambretti 		NOTIFY zambChanged)
    
    
private:
	qreal m_temp;
    qreal m_humidity;
    qreal m_pressure;
    qreal m_press_sea;
    qreal m_altitude=151.5; 
    QString m_image="Icones/Orageux.svg";
    qreal m_zambretti=2;
    
    struct bme280_dev m_dev;
    struct bme280_data m_data;

signals:
void tempChanged();
void humChanged();
void pressChanged();
void imageChanged();
void zambChanged();

public slots:
	    void maj_temp();
        void maj_hum();
        void maj_press();
        void refresh();
        void capt_init();
        void calc_press_sea();
        void calc_zambretti(qreal p_sea);

public:
	Data_Meteo();
    qreal getTemp() const;
    void setTemp(qreal temperature);
    qreal getHum() const;
    void setHum(qreal temperature);
    qreal getPress() const;
    void setPress(qreal temperature);
    QString getImage() const;
    qreal getZambretti() const;
};
