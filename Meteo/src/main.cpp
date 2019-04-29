// ####################################################################
// Auteur : Alix Dumay et Mehdi Taguema
// Date : 24/04/2019
// Version : 1.5
// Description : Ce programme est le programme principale du projet
// ####################################################################

#include "Objets.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> 


int main(int argc, char *argv[])
{
    //Déclaration d'une interface graphique
    QGuiApplication app(argc, argv);
    
    //Création d'une instance de la classe Data_Meteo
    Data_Meteo D_Meteo;
    
    //Ouverture de l'interface graphique
	QQmlApplicationEngine engine;
    //Lien interface graphique avec la classe D_Meteo
	engine.rootContext()->setContextProperty("D_Meteo", &D_Meteo);
	engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    
    //Execution du programme
    return app.exec();
}

