#include "Objets.h"
#include <QDebug>



//Constructeur
Objets::Objets() {
}

//Get
qint32  Objets::temp() const {		
	return m_temp;
}
   
//Set      
void Objets::setTemp(qint32 temperature) {
    
    m_temp = temperature;
    
}

qint32 Objets::maj(){
    m_temp=m_temp+1;
    return 0;
}
    
