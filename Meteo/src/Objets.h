#pragma once
#include <QObject>
#include "bme280.h"
#include "bme280_defs.h"
#include "capteur.h"
#include <deque>


class Data_Meteo : public QObject
{
	Q_OBJECT
	Q_PROPERTY(qreal getTemp READ getTemp WRITE setTemp 		NOTIFY tempChanged)
    Q_PROPERTY(qreal getHum READ getHum WRITE setHum 		NOTIFY humChanged)
    Q_PROPERTY(qreal getPress READ getPress WRITE setPress 		NOTIFY pressChanged)
    Q_PROPERTY(QString getImage READ getImage       NOTIFY imageChanged)
    Q_PROPERTY(QString getTendance READ getTendance		NOTIFY tendChanged)
        Q_PROPERTY(QString getDescr READ getDescr       	NOTIFY descrChanged)
    
    
private:
	qreal m_temp;
    qreal m_humidity;
    qreal m_pressure;
    qreal m_press_sea;
    qreal m_altitude=151.5; 
    QString m_image="Icones/Orageux.svg";
    qint32 m_zambretti=2;
    qreal m_tendance;
    QString m_tendance_im;
    QString m_description;
    
    std::deque<qreal> val_seconde;
    std::deque<qreal> val_minutes;
    std::deque<qreal> val_heure;
    
    struct bme280_dev m_dev;
    struct bme280_data m_data;

signals:
void tempChanged();
void humChanged();
void pressChanged();
void imageChanged();
void tendChanged();
void descrChanged();

public slots:
	    void maj_temp();
        void maj_hum();
        void maj_press();
        void refresh();
        void capt_init();
        void calc_press_sea();
        void calc_zambretti(qreal p_sea);
        qreal moyenne (std::deque <qreal> &nbre);
        void calc_tendance();

public:
	Data_Meteo();
    qreal getTemp() const;
    void setTemp(qreal temperature);
    qreal getHum() const;
    void setHum(qreal temperature);
    qreal getPress() const;
    void setPress(qreal temperature);
    QString getImage() const;
    QString getTendance() const;
      QString getDescr() const;
};
