//#############################################################################################
// Auteur : Mehdi Taguema & Alix DUMAY
// Version : 1.0
// Source : Basé sur le fichier Demo_Code (librairies) fourni avec le capteur
// Description : Le but de ce programme est de permettre d'initialiser et parametrer le capteur
//               Il permet aussi de lire les métrique
//##############################################################################################


#pragma once
#include "bme280.h"
#include "bme280_defs.h"


//Déclaration de fonction en C utilisable pour un programme en C++
#if defined (__cplusplus)
extern "C"{
#endif

//Déclaration des fonctions du capteur    
struct bme280_dev init_capt();

struct bme280_data sensor_data (struct bme280_dev *dev);


//Fin de déclaration de fonction en C utilisable pour un programme en C++
#if defined (__cplusplus)
}
#endif 
