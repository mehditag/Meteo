#pragma once
#include <QObject>

class Objets : public QObject
{
	Q_OBJECT
	Q_PROPERTY(qint32 temp READ temp		NOTIFY tempChanged)
    Q_PROPERTY(qint32 maj WRITE temp		NOTIFY majTemp)


private:
	qint32 m_temp  = 17;

signals:
void tempChanged();
void majTemp();

public slots:
	//qint32 temp() const;

public:
	Objets();
    qint32 temp() const;
    void setTemp(qint32 temperature);
    qint32 maj();
};
