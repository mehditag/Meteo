## Bienvenue sur l'application Weather Pi

 1. Description du projet :

	Weather Pi est une application météo, qui utilise les données issues d’un sensor BME280 branchée en I2C pour afficher une prévision météo valable sur les 4 prochaines heures. L’application permet à l’utilisateur de connaître également la température, la pression et l’humidité mesurées par le capteur ainsi que la date et l’heure. A partir de la deuxième heure de fonctionnement, un historique commence à s’afficher : il présente les données mesurées et la météo prévue au cours des 3 dernières heures.

 2. Fonctionnement de l'application :

	- L’application initialise automatiquement le capteur
	- L’application récupère les données de Pression, Température et humidité du capteur
	- Elle calcule la prévision météo sur les 4 prochaines heures
	- Elle affiche les données sur une interface graphique
	- L’affichage de l’historique s’affiche au fur et à mesure dans les 4 heures

## Pour utiliser cette application :

1. Matériel nécessaire :

Cette application nécessite une Raspberry Pi et un sensor BME280 

- Branchement du capteur à la Raspberry Pi : 
	Le capteur doit être branché en I2C. Voici une photo de la Pi, et de la cartographie des broches de branchement : 
<img src = "https://projetsdiy.fr/wp-content/uploads/2017/06/Raspberry-pi-reperage-broches-Pinout.jpg" title = "Raspberry Pi 3b+ Cartographie" alt = "Raspberry Pi 3b+ Cartographie" >

Reliez le capteur à la Raspberry Pi selon le tableau suivant : 


  
<table>
	<thead>
		<tr>
			<th> Pins (Capteur)</th>  
			<th align="center">Broches (Rasbperry Pi)</th>  
			<th align="right">Fonction</th>  
		</tr>  
	</thead>  
	<tbody>  
		<tr>  
			<td>VCC</td>  
			<td align="center">Broche 5V (2 ou 4)</td>  
			<td align="left">Alimentation</td>  
		</tr>
		<tr>  
			<td>GND</td>  
			<td align="center">Broche GND (6)</td>  
			<td align="left">Masse</td>  
		</tr>  
		<tr>  
			<td>SDI</td>  
			<td align="center">Broche I2CI_SDA (3)</td>  
			<td align="left">Alimentation</td>  </tr>  
		<tr>  
			<td>SCK</td>  
			<td align="center">Broche I2CI_SCL (5)</td>  
			<td align="left">Clock du capteur</td>  
		</tr>  
	</tbody>  
</table>
   
   
- Vérification du branchement:

Afin de vérifier le bon branchement, veuillez taper la commandes suivantes :

Installation des outils i2c : `sudo apt-get install i2c-tools`

Vérification du branchement i2c : `sudo i2cdetect -y 1`

Si le branchement est bien réalisé, la dernière commande doit avoir comme résultat : 
	<pre><code>code</code></pre>

2. Téléchargement des fichiers nécessaire :

Dans le répertoire de votre choix, télécharger les fichiers du projet via la commande suivante : 
`git clone https://github.com/mehditag/Meteo.git `

L'application utilisant plusieurs librairies, il est nécessaire de les installer :
`sudo apt-get install ...`

3. Création de l’exécutable:

Placez-vous dans le répertoire build du projet Meteo : `cd Meteo/build`

Créons maintenant l’exécutable de l'application : `cmake && make`

4. Ouverture de l’exécutable : 

Toujours dans le répertoire build du projet Meteo, il suffit de taper la commande suivante pour ouvrir l'application : `./src/meteo`

L'application s'ouvre alors :

<img src = "https://drive.google.com/file/d/11UPyrnMteoHo-5ndGW0SBhQ6i_8G8ESu/view" title = "Capture d'écran Application Météo" alt = "Capture d'écran Application Météo" >
