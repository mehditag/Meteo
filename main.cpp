#include "Objets.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> 

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    
    
    Objets capteur;
    
	QQmlApplicationEngine engine;
	engine.rootContext()->setContextProperty("capteur", &capteur);
	engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    
    return app.exec();
}
