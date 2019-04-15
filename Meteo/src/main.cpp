#include "Objets.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> 

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    
    Data_Meteo D_Meteo;
    
	QQmlApplicationEngine engine;
	engine.rootContext()->setContextProperty("D_Meteo", &D_Meteo);
	engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    
    return app.exec();
}

