# projet-hotel-ASD

**Étudiants :** KOUVAHE Folly Serge, BLERVAQUE Thomas, PARMENTIER Charles, VOLONT Sébastien

**Classe :** 1TM1

**Description du projet :** Notre projet a pour but:
- La réservation des chambres via le site de l'hôtel
Grâce à un formulaire de réservation sur le site de l'hôtel le client soumet une réservation.\
Après soumission de la réservation il y a une vérification dans la base de données qui vérifie si le client existe ou non. \
S'il n'existe pas un numéro client lui est attribué et grâce aux données recupérées sur le formulaire ces données sont créés.
Afin de s'assurer de l'unicité de l'id du client le numéro du client se crée après la test du nom, prénom et date de naissance.\
Il est a noté. Après la création du client la réservation était aussi enregistrée dans la base de donnée qu'un client ne peut avoir 2 adresses mails différentes.

- La réservation pour le restaurant pour les clients ou non de l'hôtel
Un formulaire de réservation restaurant nous permet de réserver pour une date donnée des tables du restaurant. Il est a noter que les clients qui ne séjournent pas à l'hôtel peuvent aussi faire des réservations.

- La gestion des activités qui sont organisées à l'hôtel
Grâce à un formulaire interactif le client par ses choix peut voir de manière instantanée le résultat de ses recherches.

**Aspects implémentés :**
backend : Une base de données permettant de mémoriser les données de réservation chambre et restautant encodées par le client.
Une base de donnée qui permet de faire des recherches sur les activités proposées par l'hôtel.
backend : Un serveur web capable de fournir les pages html, js, css, ainsi que de proposer des webservices
backend : Des webservices (avec les procédures associées) :
- Un webservice qui charge la description des chambres depuis la base de données et la mise à jours des données clients. (KOUVAHE)
- Un webservice qui permet d'insérer les données dans la table client  après soumission du formulaire réservation. (BLERVAQUE)
- Un webservice permettant de renvoyer une liste d'activités proposées par l'hôtel selon le jour de la semaine et le type d'activité.
(VOLONT)
- un webservice permettant d'insérer les données dans la table restauration grâce au formulaire de réservation. (PARMENTIER)


frontend : Une page web (html, js, css) permettant d'appeler les webservices et de traiter les réponses, qui propose une interface utilisateur pour:
-Réserver sa chambre
-Réserver une table au restaurant
-Encoder ses informations (nom, prénom, nombre de personne, date)
-Permettant de voyager sur différentes pages du site (Accueil, réservation, Chambres, Contact...)

**Détail api rest :**

   **- VOLONT Sébastien**\
CREATE SERVICE "getActivitees" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call proc_getActivitee(:jour,:typeActi);
-- Permet d'afficher les resultats de la recherche en fonction du jour et du type d'activité --\
-- Paramètres reçus pour la recherche selon le jour et du typeActivité --\
-- Le réponse de la procédure renvoie un type JSON  --	

   **- BLERVAQUE Thomas**\
CREATE SERVICE "getReservation" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getReservation(:ladateDeb,:ladateFin,:leprixTotal,:clientId,:lidchambre);\
-- Permet d'insérer les données dans la table de reservation dans la base de données --\
-- Paramètre reçu pour la requête date début, date fin, prix chambre, Id du client, Id de la chambre --\
-- Le réponse de la procédure renvoie un type RAW  --

CREATE SERVICE "getListeChambre" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getListeChambre();\
-- Permet d'afficher en le type de chambre, la catégorie et le prix sur le champ prix du formulaire de reservation--\
-- Paramètre reçu pour la requête nom, prénom, date de naissance --\
-- Le réponse de la procédure renvoie un type RAW  --

CREATE SERVICE "getIdClient" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getIdClient(:lenom,:leprenom,:dteNaiss); \
-- Sélectionne l'id, le nom et le prix de la chambre dans le champs prix du formulaire  --\
-- Paramètres reçu pour la requête nom, prénom, date de naissance --\
-- Le réponse de la procédure renvoie un type JSON  --

   **- PARMENTIER Charles**\
CREATE SERVICE "restaurant" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call insertRestaurantReservation(:nomResa,:nbPersonnes,:dateCheck); \
-- Permet d'insérer les données dans la table Restauration  --\
-- Paramètre reçu pour la requête nom de la réservation, nombre de personne, date de la réservation --\
-- Le réponse de la procédure renvoie un type RAW  --

   **-KOUVAHE Serge**\
CREATE SERVICE "updateClient" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call updateClient(:idclient,:nom,:prenom,:dateNaiss);\
-- Permet de modifier les données dans la table client  --\
-- Paramètre reçu pour la requête: nom, prénom, date de naissance  --\
-- Le réponse de la procédure renvoie un type RAW  --

 
CREATE SERVICE "http_searchClient" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call searchClient(:email);\
-- Permet de faire la recherche du client grâce à son email  --\
-- Paramètre reçu pour la requête: email --\
-- Le réponse de la procédure renvoie un type JSON  --


CREATE SERVICE "descriptionChambre" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call descriptionChambres();\
-- Permet d'insérer les données dans la table Chambre  --\
-- Paramètre reçu pour la requête: aucun --\
-- Le réponse de la procédure renvoie un type JSON  --


**Détails de la DB (Diagramme, Tables et Champs) :**

<img src="frontend/img/diagramme DB hotel projet.png">


/* Création des tables */

	/*Table CLIENT : enregistre les clients venants à l'hotel*/
CREATE TABLE "client" (\
	"id" //Identifiant de la table ; clé autoincrémentée,\
	"nomClient" //Nom du client,\
	"prenomClient" //prénom du client ,\
	"clientDateNaissance" //Date de naissance du client,\
	"mailClient" //Clé unique enregistrant le mail du client\	
) 
		
		/* Table RESERVATION: Enregistre les réservation de la chambre client*/

CREATE TABLE "reservations" (\
	"idReservation" //Identifiant de la table reservations,\
	"dateDebut" //Date du début séjour,\
	"dateFin" //Date de fin séjour,\
	"prix" // Prix de la chambre,\
	"idClient" //Client associé à la réservation; clé étrangère dans cette table,\
	"idChambre" //Chambre associée à la réservation;clé étrangère dans cette table,\
	"IdAgent" /Agent associé à une réservation; clé étrangère dans cette table\
	)

		/* Table RESTAURATION : Enregistre les reservations du restaurant de l'hôtel */
		
CREATE TABLE "RESTAURATION" (\
	"idRestauration" //Identifiant de la table restauration,\
	"nomReservation" //Nom de la restauration restauration,\
	"nbrePerso" //Nombre de personne,\
	"dateResto" //Date de la restauration restauration,\
	"chambreId" // chambre associée à la réservation du restaurant; clé étrangère dans cette table\
	)
	
		/* Table CHAMBRES : Enregistre les chambres */
CREATE TABLE "CHAMBRES" (\
	"chambreId" //Identifiant de la table Chambre,\
	"nomChambre" //Nom de la chambre,\
	"prixChambreParNuit" //Prix nuitée,\
	"nbreLit" //Nombre de lit possible,\
	"Description" //Description de la chambre\
	)
		
		/* Table AGENTS : Enregistre les agents de l'hôtel*/
CREATE TABLE "AGENTS" (\
	"IdAgent" //Identifiant de la table Agent,\
	"nomAgent" //Nom de l'agent,\
	"prenomAgent" //Prénom de l'agent,\
	"posteAgent" //Poste de l'agent\
	)
	
		/* Table ACTIVITES : Enregistre les activitées proposées par l'hôtel*/
CREATE TABLE "ACTIVITEES" (\
	"idActivitee" //Identifiant de la table,\
	"nomActivitee" //Nom de l'activité,\
	"nbrPersonne" // Nombre de participant maximum,\
	"prix" //Prix de l'activité,\
	"typeActivitee" //Type d'activité,\
	"jourSemaine" // Jour d'ouverture,\
	"horaires" CHAR(30) //Horaire de l'activité,\
	"idAgent" // Agent s'occupant de l'activité: clé étrangère dans cette table\
	)
