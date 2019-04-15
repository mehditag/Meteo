#include <iostream>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctime>
#include <math.h>
using namespace std;

int main(int argc, char **argv) {
 // int tendance = -5;
    int tendance;
  //int pression = 1030;
    int altitude = 151.5;
    int zambretti_coefficient;
    int stock_pression;
    
    
// Déterminer le mois de l'année
  time_t temps;
  struct tm datetime;
  char mois[4];
  // char date[32];
  
 
  time(&temps);
  datetime = *localtime(&temps);
//strftime(date, "%Y-%m-%d ", &datetime);
  strftime(mois, 4 , "%m", &datetime);
 
  int nbr_mois  =stoi(mois);
  cout<<nbr_mois<<endl;
  

  
    
    
    for   (int pression=900; pression <1051; pression=pression+10){
        
    
    
    int  pression_calc = pression/ pow(1-(0.0065*altitude/288.15),5.255);
    
  //tendance = pression_calc - stock_pression;
    tendance = stock_pression - pression_calc;
    
    
    cout << "tendance : "<< tendance<<endl;
    
    
    cout << "pression au niveau de la mer" << pression_calc << endl;
    
    if ((tendance <-2)){
 
        zambretti_coefficient = 130-(10*pression_calc/81);
        
     /* if (mois=="04") { zambretti_coefficient = zambretti_coefficient+1;}
        else {zambretti_coefficient = zambretti_coefficient;}
        */
    //  cout<< "tendance descendante" <<endl;
        
  } else if (tendance >2) {
            
            zambretti_coefficient = 179-((20*pression_calc)/129);
       //   cout<< zambretti_coefficient << endl;
            
            
    }else {            
              zambretti_coefficient = 147-((50*pression_calc)/376);
     //     cout<< zambretti_coefficient << endl;
    
            
            
        }
        
                
              switch (zambretti_coefficient){
                  
                  case 1: cout << "Il fait beau"<< endl; break;
                  case 2: cout << "Il fait beau 2"<< endl; break;
                  case 3: cout << "Il fait beau 3"<< endl; break;
                  case 4: cout << "pluie fine" << endl; break;
                  case 5: cout << "incertain"<< endl; break;
                  case 6: cout << "incertain"<< endl; break;
                  case 7:cout << "pluie" << endl; break;
                  case 8: cout << "averses" << endl; break;
                  case 9: cout << "averses" << endl; break;                            
                  case 10:cout << "Il fait beau"<< endl; break;
                  case 11:cout << "Il fait beau 2"<< endl; break;
                  case 12:cout << "Il fait beau 3"<< endl; break;
                  case 13:cout << "soleil + nuages" << endl; break;
                  case 14:cout << "pluie fine" << endl; break;
                  case 15:cout << "incertain"<< endl; break;
                  case 16:cout << "incertain"<< endl; break;
                  case 17:cout << "pluie" << endl; break;
                  case 18:cout << "averses" << endl; break;
                  case 19:cout << "averses" << endl; break;
                  case 20:cout << "Il fait beau"<< endl; break;
                  case 21:cout << "Il fait beau 2"<< endl; break;
                  case 22:cout << "Il fait beau 3"<< endl; break;
                  case 23:cout << "soleil + nuages" << endl; break;
                  case 24:cout << "pluie fine" << endl; break;
                  case 25:cout << "incertain"<< endl; break;
                  case 26:cout << "incertain"<< endl; break;
                  case 27:cout << "pluie" << endl; break;
                  case 28:cout << "averses" << endl; break;
                  case 29:cout << "averses" << endl; break;
                  case 30:cout << "incertain"<< endl; break;
                  case 31:cout << "tempête" << endl; break;
                  case 32:cout << "tempete" << endl; break;
                  
                default: cout << "are you serious"<< endl; break;
              }
              
              
                stock_pression = pression_calc;
    }
    
    return 0;
}
 
