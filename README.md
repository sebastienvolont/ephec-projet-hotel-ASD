# projet-hotel-ASD

**Étudiants :** KOUVAHE Folly Serge, BLERVAQUE Thomas, PARMENTIER Charles, VOLONT Sébastien

**Classe :** 1TM1

**Description du projet :** Site internet d'un hôtel qui permet de pouvoir réserver des chambres

**Aspects implémentés :**\
backend : Une base de données permettant de mémoriser les données de réservation encodé par le client.\
backend : Un serveur web capable de fournir les pages html, js, css, ainsi que de proposer des webservices\
backend : Des webservices (avec les procédures associées) :\
-Un webservice qui renvoie une liste de réservation client d'un certain sexe et d'une certaine ville qui passe x nombre de jour dans l'hôtel (nomVille, nbreJour, Sexe)\
-Un webservice qui renvoie une liste des chambres réservés ou non à une date donné (dates, réservation)\
-Un webservice qui renvoie le nombre de client d'un certain sexe par ville par année (ville, année, sexe)\
-Un webservice qui renvoie une liste de client qui ont choisi une certaine formule donnée pour une date précise (formule, date)\

frontend : Une page web (html, js, css) permettant d'appeler les webservices et de traiter les réponses, qui propose une interface utilisateur pour:\
-Réserver sa chambre\
-Encoder ses informations (nom, prénom, nombre de personne, date)\
-Permettant de voyager sur différente page du site (Accueil, réservation, Chambres, Contact...)\

