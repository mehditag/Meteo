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
        color: "honeydew"
        
        Image {
            x : parent.width /7
            y : parent.height /7
            source : "Icones/Soleil.svg"
            sourceSize.width : Math.min(parent.width/2, parent.height/2)
            sourceSize.height : Math.min(parent.width/2, parent.height/2)
        }

            
        Text{
                id :msg
                x : parent.width*0.25
                y : parent.height*2/3
                horizontalAlignment: Text.AlignHCenter
                text: "Indications"
                fontSizeMode: Text.Fit;
                minimumPointSize: 5
                font.pointSize: Math.max(Math.min(parent.height/7 , parent.width/14 ),5)
                }
            
            
             Text {
            x : parent.width * 0.1
            y : parent.height * 0.02
            
           horizontalAlignment: Text.AlignHCenter
           text:new Date().toLocaleDateString(Qt.locale("fr_FR"))
           fontSizeMode: Text.Fit;
           minimumPointSize: 5
           font.pointSize: Math.max(Math.min(parent.height/14 , parent.width/28 ),5)    
            
        }


            
      
   Rectangle {
        
        x: parent.width*2/3
        y:0
        width : parent.width/3
        height : parent.height/2
        color : "honeydew"
        
   
        

        Text {
           id :text_temp
           x : parent.width*0.15
           y : parent.height/6
           horizontalAlignment : Text.AlignHCenter
            text : "T°C"
            fontSizeMode: Text.Fit;
           minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/6 , parent.width/12),5 )
            
            }

               
                Text {
            id :temperature
               x : parent.width*0.50
           y : parent.height/6
             horizontalAlignment : Text.AlignHCenter
            text : ""                  
            fontSizeMode: Text.Fit;
          //  minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/6 , parent.width/12),5)
            
        }
        
        
            
           Text{
             
           id :text_press
             x : parent.width*0.10
             y: parent.height*3/6
                text :"Pression"
            fontSizeMode: Text.Fit;
        //    minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/8, parent.width/16),5)
                
                }
            
           Text{
                id :pression
             x : parent.width*0.10
             y: parent.height*4/6
            
             horizontalAlignment: Text.Justify
                text :""
            fontSizeMode: Text.Fit;
        //    minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/8, parent.width/16),5)
                }
            
             
            
           Text{
                id :text_hum
                x : parent.width*0.55
                y: parent.height*3/6
          
                horizontalAlignment: Text.AlignHCenter
                text :"humidity"
            fontSizeMode: Text.Fit;
       //     minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/8, parent.width/16),5)
                }
                
                      
           Text{
                id :humidite
                x : parent.width*0.55
                y: parent.height*4/6
                
                horizontalAlignment: Text.AlignHCenter
                text :""
             fontSizeMode: Text.Fit;
         //   minimumPointSize: 5;
            font.pointSize: Math.max(Math.min(parent.height/8, parent.width/16),5)
                }
                
 
 }
    }
    
    function update() {
		var t = "%1 °C"
        var h = "%1 %"
        var p= "%1 hPa"
        D_Meteo.refresh()
        D_Meteo.maj_temp()
        D_Meteo.maj_hum()
        D_Meteo.maj_press()
        temperature.text = t.arg(D_Meteo.getTemp.toFixed(2))
        humidite.text = h.arg(Math.round(D_Meteo.getHum))
        pression.text = p.arg(Math.round(D_Meteo.getPress))
        
		
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
