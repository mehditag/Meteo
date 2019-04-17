import QtQuick 2.0
import QtQuick.Window 2.0




Window
{
    visible: true
    width: 600
    height: 480

    Rectangle { 
        x : 0
        y : 0
        width: parent.width
        height: parent.height
          gradient: Gradient {
                GradientStop { position: 0.0; color: "honeydew" }
               GradientStop { position: 1.0; color: "aquamarine" }
               }
        
        
    Image {
        id :meteo
            x : parent.width /7
            y : parent.height /7
            source : "Icones/Soleil.svg"
            sourceSize.width : Math.min(parent.width/2, parent.height/2)
            sourceSize.height : Math.min(parent.width/2, parent.height/2)
        }



        Image {
            id : tendance
             x :parent.width*4/5
             y: parent.height*3/4
            source : "Icones/fleche_rising.svg"
            sourceSize.width : Math.min(parent.width/3, parent.height/6)
            sourceSize.height : Math.min(parent.width/3, parent.height/6)
        }
        
        
            
        Text{
                id :msg
                x : parent.width*1/10
                y : parent.height*3/4
                horizontalAlignment: Text.AlignHCenter
                text: "Ensoleillé"
                fontSizeMode: Text.Fit;
                minimumPointSize: 5
                font.pointSize: Math.max(Math.min(parent.height/7 , parent.width/14 ),5)
                }
            
            Rectangle{
        x : 0
        y : 0
        width: parent.width
        height: parent.height*0.1
        color: "transparent"
                
            
             Text {
             id :date
            x : parent.width * 0.05
            y : parent.height * 0.02
            
           horizontalAlignment: Text.AlignHCenter

           text : new Date().toLocaleDateString(Qt.locale("fr_FR"),'dddd dd MMMM yyyy')
           fontSizeMode: Text.Fit;
           minimumPointSize: 5
           font.pointSize: Math.max(Math.min(parent.height/2 , parent.width/2 ),5)    
            
        }
               
             Text {
             id :heure
            x : parent.width * 0.75
            y : parent.height * 0.02
            
           horizontalAlignment: Text.AlignHCenter

           text : ""
           fontSizeMode: Text.Fit;
           minimumPointSize: 5
           font.pointSize: Math.max(Math.min(parent.height/2 , parent.width/2 ),5)    
            
        }
        
        
}

            

            
      
  Rectangle {
        
        x: parent.width*2/3
        y:parent.height*0.1
        width : parent.width/3
        height : parent.height*0.65
        color : "transparent"
        
   
        

        Text {
           id :text_temp
           x : parent.width*0.15
           y : parent.height/8
           horizontalAlignment : Text.AlignHCenter
            text : "Température"
            fontSizeMode: Text.Fit;
           minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/6 , parent.width/12),5 )
            
            }


                     Text {
            id :temperature
            x : parent.width*0.30
           y : parent.height*2/8
             horizontalAlignment : Text.AlignHCenter
            text : "22 °C"                  
            fontSizeMode: Text.Fit;
          //  minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/5 , parent.width/10),5)
            
        }
                   
         Text{
             
           id :text_press
             x : parent.width*0.30
             y: parent.height*0.45
                text :"Pression"
            fontSizeMode: Text.Fit;
        //    minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/7, parent.width/14),5)
                
                }
            
           Text{
                id :pression
             x : parent.width*0.30
             y: parent.height*0.55
            
             horizontalAlignment: Text.Justify
                text :"1020 hPa"
            fontSizeMode: Text.Fit;
            font.pointSize: Math.max(Math.min(parent.height/7, parent.width/14),5)
                }
            
            
                Text{
                id :text_hum
                x : parent.width*0.30
                y: parent.height*0.7
          
                horizontalAlignment: Text.AlignHCenter
                text :"Humidité"
            fontSizeMode: Text.Fit;
       //     minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/7, parent.width/14),5)
                }
                
                      
           Text{
                id :humidite
                x : parent.width*0.4
                y: parent.height*0.8
                
                horizontalAlignment: Text.AlignHCenter
                text :"35 %"
             fontSizeMode: Text.Fit;
            font.pointSize: Math.max(Math.min(parent.height/7, parent.width/14),5)
                }
                

 }
    }
    
    function update() {
		var t = "%1 °C"
        var h = "%1 %"
        var p= "%1 hPa"
        var i= "%1"
        var tend="%1"
        D_Meteo.refresh()
          D_Meteo.maj_temp()
          D_Meteo.maj_hum()
          D_Meteo.maj_press()
        //meteo.source=i.arg(D_Meteo.getImage)
          temperature.text = t.arg(D_Meteo.getTemp.toFixed(2))
          humidite.text = h.arg(Math.round(D_Meteo.getHum))
          pression.text = p.arg(Math.round(D_Meteo.getPress))
       //  msg.text = tend.arg(Math.round(D_Meteo.getZambretti))
            heure.text= new Date().toLocaleTimeString(Qt.locale("fr_FR"),'hh:mm:ss')
		date.text=new Date().toLocaleDateString(Qt.locale("fr_FR"),'dddd dd MMMM yyyy')
	}
	
	Timer {
		id: globalTimer
		interval: 1000
		repeat: true
		running: true
		triggeredOnStart: true
		onTriggered: update()
	}
    
}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
         
/*

    Rectangle { //Rectange du bas (estimations)
        x : 0
        y : parent.height/2
        width: parent.width
        height : parent.height/2
        color: "honeydew"
        
        Rectangle { //Estimation H+1
            x:0
            y:0
            width: parent.width/4
            height: parent.height
            color: "honeydew"
            
            
              
        Image {
            x : parent.width/3
            y : parent.height*3/8
            source : "Icones/Soleil_nuageux.svg"
            sourceSize.width : Math.min(parent.width/3, parent.height/3)
            sourceSize.height : Math.min(parent.width/3, parent.height/3)
        }
            
                 Text {
            id :heuret1
           x : parent.width/3
           y : parent.height/20
           horizontalAlignment : Text.AlignHCenter
            text : "Heure 1"
            
            // text : obj.temp
            
            fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }    

        Text {
            id :tmpet1
           x : parent.width/4
           y : parent.height/6
           horizontalAlignment : Text.AlignHCenter
            text : "T°C"
                      fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }

        
                Text {
            id :tmpemest1
            x : parent.width/2
           y : parent.height/6
             horizontalAlignment : Text.AlignHCenter
            text : "25.52"
                      fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
        }
        
                      
            
           Text{
                id :pret1
           
             x : parent.width/12
             y: parent.height*9/12
                text :"Pression"
                   fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
           Text{
                id :premest1
             x : parent.width/12
             y: parent.height*5/6
            
             horizontalAlignment: Text.Justify
                text :"991.400"
                        fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
             
            
           Text{
                id :humt1
                x : parent.width/2
                y: parent.height*9/12
          
                horizontalAlignment: Text.AlignHCenter
                text :"humidity"
           fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
                      
           Text{
                id :hummest1
                x : parent.width*11/20
                y: parent.height*5/6
                
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                           fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
            
            
         	MouseArea {
		anchors.fill: parent
		onClicked: function() {
			console.log(parent.height)
			console.log(parent.width)
		}
	}
            
     
        }
        
        Rectangle {
            x:parent.width/4
            y:0
            width: parent.width/4
            height: parent.height
            color: "honeydew"
            
            
             Image {
          x : parent.width/3
            y : parent.height*3/8
            source : "Icones/Averses.svg"
            sourceSize.width : Math.min(parent.width/3, parent.height/3)
            sourceSize.height : Math.min(parent.width/3, parent.height/3)
        }
            
                 Text {
            id :heuret2
           x : parent.width/3
           y : parent.height/20
           horizontalAlignment : Text.AlignHCenter
            text : "Heure 2"
                     fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }    

        Text {
            id :tmpet2
           x : parent.width/4
           y : parent.height/6
           horizontalAlignment : Text.AlignHCenter
            text : "T°C"
               fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }

        
                Text {
            id :tmpemest2
            x : parent.width/2
           y : parent.height/6
             horizontalAlignment : Text.AlignHCenter
            text : "25.52"
                   fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
        
            
           Text{
                id :pret2
           
             x : parent.width/12
             y: parent.height*9/12
                text :"Pression"
                   fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
           Text{
                id :premest2
             x : parent.width/12
             y: parent.height*5/6
            
             horizontalAlignment: Text.Justify
                text :"991.400"
                      fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
             
            
           Text{
                id :humt2
                x : parent.width/2
                y: parent.height*9/12
          
                horizontalAlignment: Text.AlignHCenter
                text :"humidity"
              fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
                      
           Text{
                id :hummest2
                x : parent.width*11/20
                y: parent.height*5/6
                
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                           fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
         	MouseArea {
		anchors.fill: parent
		onClicked: function() {
			console.log(parent.height)
			console.log(parent.width)
		}
	}
        }
        
        Rectangle {
            x:parent.width/2
            y:0
            width: parent.width/4
            height: parent.height
            color: "honeydew"
            
             Image {
        x : parent.width/3
            y : parent.height*3/8
            source : "Icones/Orageux.svg"
            sourceSize.width : Math.min(parent.width/3, parent.height/3)
            sourceSize.height : Math.min(parent.width/3, parent.height/3)
        }
            
                 Text {
            id :heuret3
           x : parent.width/3
           y : parent.height/20
           horizontalAlignment : Text.AlignHCenter
            text : "Heure 3"
                       fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }    

        Text {
            id :tmpet3
           x : parent.width/4
           y : parent.height/6
           horizontalAlignment : Text.AlignHCenter
            text : "T°C"
                       fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            }

        
                Text {
            id :tmpemest3
            x : parent.width/2
           y : parent.height/6
             horizontalAlignment : Text.AlignHCenter
            text : "25.52"
                   fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
        }
        
                      
            
           Text{
                id :pret3
           
             x : parent.width/12
             y: parent.height*9/12
                text :"Pression"
                         fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
           Text{
                id :premest3
             x : parent.width/12
             y: parent.height*5/6
            
             horizontalAlignment: Text.Justify
                text :"991.400"
                        fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
             
            
           Text{
                id :humt3
                x : parent.width/2
                y: parent.height*9/12
          
                horizontalAlignment: Text.AlignHCenter
                text :"humidity"
                       fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
                      
           Text{
                id :hummest3
                x : parent.width*11/20
                y: parent.height*5/6
                
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                           fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
            
         	MouseArea {
		anchors.fill: parent
		onClicked: function() {
			console.log(parent.height)
			console.log(parent.width)
		}
	}
            
            
        }
        
        Rectangle {
            x:parent.width*(3/4)
            y:0
            width: parent.width/4
            height: parent.height
            color: "honeydew"
            
             Image {
          x : parent.width/3
            y : parent.height*3/8
            source : "Icones/Brouillard.svg"
            sourceSize.width : Math.min(parent.width/3, parent.height/3)
            sourceSize.height : Math.min(parent.width/3, parent.height/3)
        }
            
                 Text {
            id :heuret4
           x : parent.width/3
           y : parent.height/20
           horizontalAlignment : Text.AlignHCenter
            text : "Heure 4"
                      fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }    

        Text {
            id :tmpet4
           x : parent.width/4
           y : parent.height/6
           horizontalAlignment : Text.AlignHCenter
            text : "T°C"
                     fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
            }

        
                Text {
            id :tmpemest4
            x : parent.width/2
           y : parent.height/6
             horizontalAlignment : Text.AlignHCenter
            text : "25.52"
                   fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
            
        }
        
                      
            
           Text{
                id :pret4
           
             x : parent.width/12
             y: parent.height*9/12
                text :"Pression"
                        fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
           Text{
                id :premest4
             x : parent.width/12
             y: parent.height*5/6
            
             horizontalAlignment: Text.Justify
                text :"991.400"
                    fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
            
             
            
           Text{
                id :humt4
                x : parent.width/2
                y: parent.height*9/12
          
                horizontalAlignment: Text.AlignHCenter
                text :"humidity"
                         fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
                      
           Text{
                id :hummest4
                x : parent.width*11/20
                y: parent.height*5/6
                
                horizontalAlignment: Text.AlignHCenter
                text :"32.02"
                        fontSizeMode: Text.Fit;
           // minimumPointSize: 5;
            font.pointSize: Math.min(parent.height/8, parent.width/16)
                }
                
            
            
            
        }
    }*/
