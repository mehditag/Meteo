// ####################################################################
// Auteur : Alix Dumay et Mehdi Taguema
// Date : 24/04/2019
// Version : 1.5
// Description : Ce programme permet de dessiner l'interface graphique de la staion météo, basé sur QtQuick 2
// ####################################################################


import QtQuick 2.0
import QtQuick.Window 2.0


// #################################################
// Tracé de l'interface graphique
// #################################################

// Fenêtre de l'interface graphique composé d'un Rectangle principale et d'un Rectangle Historique (Partageant la fenêtre en 2)
Window
{
    visible: true
    width: 600
    height: 480

    //Rectangle principale
    Rectangle {
        id: rectangle_principal
        x:0
        y:0
        width: parent.width
        height: parent.height
        gradient: Gradient {
               GradientStop { position: 0.0; color: "honeydew" }
               GradientStop { 
                   id : grad
                   position: 1.0; color: "aquamarine" }}
    
      
         //Rectangle contenant la meteo, la tendance et la description      
        Rectangle { 
            x : 0
            y : 0
            width: parent.width
            height: parent.height*0.5
            color:"transparent"
               
            
               //Image représentant la météo
            Image {
                id :lune
                x : parent.width*0.01
                y : parent.height *0.01
                source : "Icones/fullmoon.svg"
                sourceSize.width : Math.min(parent.width*0.2, parent.height*0.2)
                sourceSize.height : Math.min(parent.width*0,2, parent.height*0.2)
                        }

        
            //Image représentant la météo
            Image {
                id :meteo
                x : parent.width*0.2
                y : parent.height *0.14
                source : "Icones/Soleil.svg"
                sourceSize.width : Math.min(parent.width*0.5, parent.height*0.5)
                sourceSize.height : Math.min(parent.width*0.5, parent.height*0.5)
                        }


            //Image représentant la tendance
            Image {
                id : tendance
                x :parent.width*0.05
                y: parent.height*0.75
                source : ""
                sourceSize.width : Math.min(parent.width*0.33, parent.height*0.167)
                sourceSize.height : Math.min(parent.width*0.33, parent.height*0.167)
                        }
        
        
            //Texte description de la météo
            Text{
                id :indication
                x : parent.width*0.20
                y : parent.height*0.78
                horizontalAlignment: Text.AlignHCenter
                font.family : "Linux Biolinum";                
                text: "Ensoleillé"
                fontSizeMode: Text.Fit;
                minimumPointSize: 5
                font.pointSize: Math.max(Math.min(parent.height*0.1 , parent.width*0.055 ),5)
                }

            
    //Rectangle contenant les informations de Température, Humidité, Pression et data-horaire  
    Rectangle {
        
        x: parent.width*0.5
        y:0
        width : parent.width*0.5
        height : parent.height
        color : "transparent"
        
        
              //Date      
             Text {
                id :date
                x : parent.width * 0.31
                y : parent.height * 0.01
                horizontalAlignment: Text.AlignHCenter
                font.family : "Linux Biolinum";
                text : ""
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.07 , parent.width*0.07 ),5)    
                    }
            
            //Heure
             Text {
                id :heure
                x : parent.width * 0.45
                y : parent.height * 0.12
                horizontalAlignment: Text.AlignHCenter
                font.family : "Linux Biolinum";
                text : ""
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.1 , parent.width*0.1 ),5)    
                    }
    
            //Texte température
            Text {
                id :text_temp
                x : parent.width*0.40
                y : parent.height*0.30
                horizontalAlignment : Text.AlignHCenter
                text : "Il fait actuellement "
                font.family : "Linux Biolinum";
                fontSizeMode: Text.Fit;
                minimumPointSize: 5;
                font.pointSize: Math.max(Math.min(parent.height*0.06 , parent.width*0.06),5 )
                    }
            
            //Valeur mesurée temp
            Text {
                id :temperature
                x : parent.width*0.52
                y : parent.height*0.38
                horizontalAlignment : Text.AlignHCenter
                text : "22 °C"       
                font.family : "Linux Biolinum";
                fontSizeMode: Text.Fit;
          //  minimumPointSize: 5;
                font.pointSize: Math.max(Math.min(parent.height*0.08 , parent.width*0.08),5)
                     }
            
            //Titre Pression
            Text{
                id :text_press
                x : parent.width*0.55
                y: parent.height*0.55
                text :"Pression"
                font.family : "Linux Biolinum";                
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.048, parent.width*0.048),5)
                }
            
            //Valeur mesurée Pression
            Text{
                id :pression
                x : parent.width*0.55
                y: parent.height*0.63
                font.family : "Linux Biolinum";           
                horizontalAlignment: Text.Justify
                text :"1020 hPa"
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.048, parent.width*0.048),5)
                }
            
            //Titre Humidité
            Text{
                id :text_hum
                x : parent.width*0.54
                y: parent.height*0.75
                font.family : "Linux Biolinum";          
                horizontalAlignment: Text.AlignHCenter
                text :"Humidité"
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.048, parent.width*0.048),5)
                    }
                
            //Valeur mesurée Humidité          
           Text{
                id :humidite
                x : parent.width*0.60
                y: parent.height*0.83
                font.family : "Linux Biolinum";                
                horizontalAlignment: Text.AlignHCenter
                text :"35 %"
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.048, parent.width*0.048),5)
                    }
                
    }//Fin Rectangle contenant T,P,H Date et heure
    
}//Fin Rectangle Meteo
    
     
 
 //Début Rectangle du bas        

//Rectange du bas (historique)
    Rectangle { 
        x : 0
        y : parent.height*0.5
        width: parent.width
        height : parent.height*0.5
        color: "transparent"
        
        Rectangle { //Estimation H3
            x:0
            y:0
            width: parent.width*0.33
            height: parent.height
            color: "transparent"
            
            //Image météo H-3
            Image {
                id : imageh3
                x : parent.width*0.33
                y : parent.height*0.375
                source : "Icones/Soleil_nuageux.svg"
                sourceSize.width : Math.min(parent.width*0.33, parent.height*0.33)
                sourceSize.height : Math.min(parent.width*0.33, parent.height*0.33)
                        }
                        
            //Titre historique h-3
            Text {
                id :heure3
                x : parent.width*0.33
                y : parent.height*0.05
                horizontalAlignment : Text.AlignHCenter
                text : "Heure -3"
                font.family : "Linux Biolinum";    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }    

             //Titre température       
            Text {
                id :tmpet1
                x : parent.width*0.25
                y : parent.height*0.167
                horizontalAlignment : Text.AlignHCenter
                text : "T°C"
                font.family : "Linux Biolinum";                    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                        }

            //Valeur lue temp h-3
            Text {
                id :temph3
                x : parent.width*0.5
                y : parent.height*0.167
                horizontalAlignment : Text.AlignHCenter
                text : "25.52"
                font.family : "Linux Biolinum";    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
    
            //Titre Pression H-3
           Text{
                id :pret1
                x : parent.width*0.12
                y: parent.height*0.75
                text :"Pression"
                font.family : "Linux Biolinum";    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
        
            //Valeur lue Press H-3
           Text{
                id :pressh3
                x : parent.width*0.12
                y: parent.height*0.83
                horizontalAlignment: Text.Justify
                text :"991.400"
                font.family : "Linux Biolinum";    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
            
            //Titre Humidité H-3
           Text{
                id :humt1
                x : parent.width*0.55
                y: parent.height*0.75
                horizontalAlignment: Text.AlignHCenter
                text :"Humidité"
                font.family : "Linux Biolinum";        
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
                
            //Valeur lue Humidité H-3
           Text{
                id :humh3
                x : parent.width*0.65
                y: parent.height*0.83
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                font.family : "Linux Biolinum";    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
                
        }//Fin Rectangle H-3
            

        
        Rectangle { //Heure -2
            x:parent.width*0.33
            y:0
            width: parent.width*0.33
            height: parent.height
            color: "transparent"
            
            
             Image {
                 id : imageh2
                x : parent.width*0.33
                y : parent.height*0.375
                source : "Icones/Averses.svg"
                sourceSize.width : Math.min(parent.width*0.33, parent.height*0.33)
                sourceSize.height : Math.min(parent.width*0.33, parent.height*0.33)
                        }
            
            Text {
                id :heuret2
                x : parent.width*0.33
                y : parent.height*0.05
                horizontalAlignment : Text.AlignHCenter
                text : "Heure -2"
                font.family : "Linux Biolinum";    
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                        }    

            Text {
                id :tmpet2
                x : parent.width*0.25
                y : parent.height*0.167
                horizontalAlignment : Text.AlignHCenter
                text : "T°C"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                        }

            Text {
                id :temph2
                x : parent.width*0.5
                y : parent.height*0.167
                horizontalAlignment : Text.AlignHCenter
                text : "25.52"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
        
            
           Text{
                id :pret2
                x : parent.width*0.12
                y: parent.height*0.75
                text :"Pression"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
            
            Text{
                id :pressh2
                x : parent.width*0.12
                y: parent.height*0.83
                horizontalAlignment: Text.Justify
                text :"991.400"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
            
            Text{
                id :humt2
                x : parent.width*0.55
                y: parent.height*0.75
                horizontalAlignment: Text.AlignHCenter
                text :"Humidité"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
                
           Text{
                id :humh2
                x : parent.width*0.65
                y: parent.height*0.83
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
                    
        }//Fin Rectangle H-2
            

        
        Rectangle { //Rectangle H-1
            x:parent.width*0.66
            y:0
            width: parent.width*0.34
            height: parent.height
            color: "transparent"
            
             Image {
                id :imageh1
                x : parent.width*0.33
                y : parent.height*0.375
                source : "Icones/Orageux.svg"
                sourceSize.width : Math.min(parent.width*0.33, parent.height*0.33)
                sourceSize.height : Math.min(parent.width*0.33, parent.height*0.33)
                        }
            
            Text {
                id :heuret3
                x : parent.width*0.33
                y : parent.height*0.05
                horizontalAlignment : Text.AlignHCenter
                text : "Heure -1"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }    

            Text {
                id :tmpet3
                x : parent.width*0.25
                y : parent.height*0.167
                horizontalAlignment : Text.AlignHCenter
                text : "T°C"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }

        
            Text {
                id :temph1
                x : parent.width*0.5
                y : parent.height*0.167
                horizontalAlignment : Text.AlignHCenter
                text : "25.52"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
    
            
           Text{
                id :pret3
                x : parent.width*0.12
                y: parent.height*0.75
                text :"Pression"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
            
           Text{
                id :pressh1
                x : parent.width*0.12
                y: parent.height*0.83
                horizontalAlignment: Text.Justify
                text :"991.400"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
            
           Text{
                id :humt3
                x : parent.width*0.55
                y: parent.height*0.75
                horizontalAlignment: Text.AlignHCenter
                text :"Humidité"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }
                
           Text{
                id :humh1
                x : parent.width*0.65
                y: parent.height*0.83
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                font.family : "Linux Biolinum"; 
                fontSizeMode: Text.Fit;
                font.pointSize: Math.max(Math.min(parent.height*0.125, parent.width*0.0625),5)
                    }

        }//Fin Rectangle H-1
   
    }//Fin Rectangle Historique
    
    
}//Fin Rectangle Principal

// ########################################################
// Fonctions utilisées pour l'interface graphique
// ########################################################


//Fonction appelée toutes les t millisecondes par le Timer1
//But : Réaliser l'actualisation des données météos et de l'interface
//        Et d'appeler des méthodes de la classe D_Météo

    function update() {
		//Déclaration des variables permettant d'actualiser les champs Texte et Image de l'interface
        var t = "%1 °C"                //Valeur température
        var h = "%1 %"                //Valeur humidité
        var p= "%1 hPa"             //Valeur pression
        var i= "%1"                      //Image principale
        var tend="%1"                //Image tendance pression (flêche)
        var msg="%1"                //Description météo
        var t3 = "%1 °C"             //Valeur température H-3
        var h3 = "%1 %"             //Valeur humidite H-3
        var p3= "%1 hPa"          //Valeur pression H-3
        var t2 = "%1 °C"             //Valeur température H-2
        var h2 = "%1 %"             //Valeur humidité H-2
        var p2= "%1 hPa"          //Valeur pression H-2
        var t1 = "%1 °C"             //Valeur température H-1
        var h1 = "%1 %"             //Valeur humidité H-1
        var p1= "%1 hPa"          //Valeur pression H-1
        var i_h1= "%1"               //Image météo H-1
        var i_h2= "%1"               //Image météo H-2
        var i_h3= "%1"               //Image météo H-3
        var i_color="%1"            //Couleur background
        var i_lune="%1"             //Image lune
        
        //Appel des méthode de la classe
        D_Meteo.refresh()

        
        //Mise à jour des données de l'interface (application basique)
        meteo.source=i.arg(D_Meteo.getImage)
        temperature.text = t.arg(D_Meteo.getTemp.toFixed(2))
        humidite.text = h.arg(Math.round(D_Meteo.getHum))
        pression.text = p.arg(Math.round(D_Meteo.getPress))
        heure.text= new Date().toLocaleTimeString(Qt.locale("fr_FR"),'hh:mm:ss')
		date.text=new Date().toLocaleDateString(Qt.locale("fr_FR"),'dddd dd MMMM yyyy')
        tendance.source=tend.arg(D_Meteo.getTendance)
        indication.text = msg.arg(D_Meteo.getDescr)
        
         //Mise à jour des données de l'interface (application optionnelle)
        temph3.text=t3.arg(D_Meteo.getTemp3.toFixed(2))
        humh3.text=h3.arg(Math.round(D_Meteo.getHum3))
        pressh3.text=p3.arg(Math.round(D_Meteo.getPress3))
        temph2.text=t2.arg(D_Meteo.getTemp2.toFixed(2))
        humh2.text=h2.arg(Math.round(D_Meteo.getHum2))
        pressh2.text=p2.arg(Math.round(D_Meteo.getPress2))
        temph1.text=t1.arg(D_Meteo.getTemp1.toFixed(2))
        humh1.text=h1.arg(Math.round(D_Meteo.getHum1))
        pressh1.text=p1.arg(Math.round(D_Meteo.getPress1))
        imageh1.source=i_h1.arg(D_Meteo.getImage_h1)
        imageh2.source=i_h2.arg(D_Meteo.getImage_h2)
        imageh3.source=i_h3.arg(D_Meteo.getImage_h3)
        grad.color=i_color.arg( D_Meteo.getColor_background )
        lune.source=i_lune.arg(D_Meteo.getMoon)

        
	}//Fin fct° update
	
	
//Fonction appelée toutes les t millisecondes par le Timer2
//But : Animer l'image de la tendance (flèche)
 //Mouvement de bas en haut, de haut en bas ou horizontale suivant la tendance

	function animation(){
        
      //Variable permettant de modifier les coordonnées de l'image  
        var z=D_Meteo.getAnimation
        var t=D_Meteo.gettend
        
        //Incrément des coordonnées
        D_Meteo.animation()
    
    
      //Mouvement de bas en haut, de haut en bas ou horizontale suivant la tendance
      
      //Mouvement de haut en bas pour une tendance décroissante
        if (t <  -0.5){
            tendance.x =(tendance.parent.width*0.05+z)
            tendance.y =(tendance.parent.height*3/4+z)
        }
    
     //Mouvement de bas en haut pour un tendance croissante
        else if (t>0.5){      
            tendance.x =(tendance.parent.width*0.05+z)
            tendance.y =(tendance.parent.height*3/4-z)}
        
    //Mouvement horizontale pour une tendance stable       
        else 
        {   tendance.x =(tendance.parent.width*0.05+z)
            tendance.y =(tendance.parent.height*3/4)}
            
    }//Fin fonction animation
	

// ########################################################
// Timer permettant d'appeler une fonction une fois activé (tous les t millisecondes)
// ########################################################
	
	
//Timer 2 permettant d'appeler la fonction animation	

	Timer {
		id: globalTimer2
		interval: 150
		repeat: true
		running: true
		triggeredOnStart: true
		onTriggered:animation()
	}
	
//Timer 1 permettant d'appeler la fonction update	
	Timer {
		id: globalTimer
		interval: 1000
		repeat: true
		running: true
		triggeredOnStart: true
		onTriggered: update()
	}
	

}//Fin de la fenêtre principale de l'interface graphique 


