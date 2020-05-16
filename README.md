# projet-hotel-ASD

**Étudiants :** KOUVAHE Folly Serge, BLERVAQUE Thomas, PARMENTIER Charles, VOLONT Sébastien

**Classe :** 1TM1

**Description du projet :** Site internet d'un hôtel qui permet de pouvoir réserver des chambres,

**Aspects implémentés :**\
backend : Une base de données permettant de mémoriser les données de réservation encodé par le client.\
backend : Un serveur web capable de fournir les pages html, js, css, ainsi que de proposer des webservices\
backend : Des webservices (avec les procédures associées) :
- Un webservice qui renvoie qui charge la description des chambres depuis la depuis la base de donnée. (KOUVAHE)\
- Un webservice qui permet d'inserer les données dans la table client  après soumission du formulaire réservation. (BLERVAQUE)\
- Un webservice permettant de renvoyer une liste d'activitées proposées par l'hôtel selon le jour de la semaine et le type d'activitée.\
(VOLONT)
- un webservice permettant d'inserer les données dans la table restauration grâce du formulaire de réservation. (PARMENTIER)\


frontend : Une page web (html, js, css) permettant d'appeler les webservices et de traiter les réponses, qui propose une interface utilisateur pour:\
-Réserver sa chambre\
- Réserver une table au restaurant\
-Encoder ses informations (nom, prénom, nombre de personne, date)\
-Permettant de voyager sur différente page du site (Accueil, réservation, Chambres, Contact...)\

**Détails de la DB (Diagramme, Tables et Champs)**\
<img src="frontend/img/diagramme DB hotel projet.png">

/* Création des tables */

	/*Table CLIENT : enregistre les clients venants à l'hotel*/
CREATE TABLE "client" (\
	"id" //Identifiant de la table ; clé autoincrémentée,\
	"nomClient" //Nom du client,\
	"prenomClient" //prénom du client ,\
	"clientDateNaissance" //Date de naissance du client,\
	"mailClient" //Clé unique enrigistrant le mail du client,\	
) 
		
		/* Table RESERVATION: Enregistre les réservation de la chambre client*/

CREATE TABLE "reservations" (\
	"idReservation" //Identifiant de la table reservations,\
	"dateDebut" //Date du début séjour,\
	"dateFin" //Date de fin séjour,\
	"prix" // Prix de la chambre,\
	"idClient" //Client associé à la reservation; clé étrangère dans cette table,\
	"idChambre" //Chambre associée à la reservation;clé étrangère dans cette table,\
	"IdAgent" /Agent associé àune reservation; clé étrangère dans cette table,\
	)

		/* Table RESTAURATION : Enregistre les restaurations de l'hôtel */
		
CREATE TABLE "RESTAURATION" (\
	"idRestauration" //Identifiant de la table restauration,\
	"nomReservation" //Nom de la restauration restauration,\
	"nbrePerso" //Nombre de personne,\
	"dateResto" //Date de la restauration restauration,\
	"chambreId" // chambre associée à la reservation du restaurant; clé étrangère dans cette table,\
	)
	
		/* Table CHAMBRES : Enregistre les chambres */
CREATE TABLE "CHAMBRES" (\
	"chambreId" //Identifiant de la table Chambre,\
	"nomChambre" //Nom de la chambre,\
	"prixChambreParNuit" //Prix nuitée,\
	"nbreLit" //Nombre de lit possible,\
	"Description" //Description de la chambre,\
	)
		
		/* Table AGENTS : Enregistre les agents de l'hôtel*/
CREATE TABLE "AGENTS" (\
	"IdAgent" //Identifiant de la table Agent,\
	"nomAgent" //Nom de l'agent,\
	"prenomAgent" //Prénom de l'agent,\
	"posteAgent" //Poste de l'agent,\
	)
	
		/* Table ACTIVITES : Enregistre les activitées proposées par l'hôtel*/
CREATE TABLE "ACTIVITEES" (\
	"idActivitee" //Identifiant de la table,\
	"nomActivitee" //Nom de l'activité,\
	"nbrPersonne" // Nombre de participant maximum\
	"prix" //Prix de l'activité,\
	"typeActivitee" //Type d'activité,\
	"jourSemaine" // Jour d'ouverture,\
	"horaires" CHAR(30) //Horaire de l'activité\
	"idAgent" // Agent s'occupant de l'activité: clé étrangère dans cette table,\
	)
