#pragma once
#include <QObject>

class Data_Meteo : public QObject
{
	Q_OBJECT
	Q_PROPERTY(qreal getTemp READ getTemp WRITE setTemp 		NOTIFY tempChanged)
    Q_PROPERTY(qreal getHum READ getHum WRITE setHum 		NOTIFY humChanged)
    Q_PROPERTY(qreal getPress READ getPress WRITE setPress 		NOTIFY pressChanged)


private:
	qreal m_temp  = 17.5;
    qreal m_humidity = 57.5;
    qreal m_pressure = 1000.5;

signals:
void tempChanged();
void humChanged();
void pressChanged();

public slots:
	    void maj_temp();
        void maj_hum();
        void maj_press();

public:
	Data_Meteo();
    qreal getTemp() const;
    void setTemp(qreal temperature);
    qreal getHum() const;
    void setHum(qreal temperature);
    qreal getPress() const;
    void setPress(qreal temperature);
};
