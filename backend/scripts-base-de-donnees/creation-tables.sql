/* Création des tables */


	/*Table CLIENT*/
CREATE TABLE "client" (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"nomClient" VARCHAR(50) NOT NULL,
	"prenomClient" VARCHAR(50) NOT NULL,
	"clientDateNaissance" DATE NOT NULL,
	"mailClient" VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT "pkClient" PRIMARY KEY ( "id" ASC )
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
)
		
		/* Table RESERVATION*/

CREATE TABLE "reservations" (
	"idReservation" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"dateDebut" DATE NOT NULL,
	"dateFin" DATE NOT NULL,
	"prix" INTEGER NULL,
	"idClient" INTEGER NOT NULL,
	"idChambre" CHAR(10) NULL,
	"IdAgent" CHAR(10) NULL,
	CONSTRAINT "pkResrv" PRIMARY KEY ( "idReservation" ASC )
	CONSTRAINT "fkClientReserv" NOT NULL FOREIGN KEY ( "idClient" ASC ) REFERENCES "DBA"."client" ( "id" )
	CONSTRAINT "fkChambreId" FOREIGN KEY ( "idChambre" ASC ) REFERENCES "DBA"."CHAMBRES" ( "chambreId" )
	CONSTRAINT "AGENTS" FOREIGN KEY ( "IdAgent" ASC ) REFERENCES "DBA"."AGENTS" ( "IdAgent" );
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
)


		/* Table RESTAURATION */
		
CREATE TABLE "RESTAURATION" (
	"idRestauration" CHAR(10) NOT NULL,
	"nomReservation" CHAR(50) NOT NULL,
	"nbrePerso" INTEGER NOT NULL,
	"dateResto" DATE NOT NULL,
	"chambreId" CHAR(10) NULL,
	PRIMARY KEY ( "idRestauration" ASC )
	CONSTRAINT "CHAMBRES" FOREIGN KEY ( "chambreId" ASC ) REFERENCES "DBA"."CHAMBRES" ( "chambreId" )
	ON DELETE CASCADE
	ON UPDATE CASCADE;
	
)

		/* Table CHAMBRES */
CREATE TABLE "CHAMBRES" (
	"chambreId" CHAR(10) NOT NULL,
	"nomChambre" CHAR(50) NOT NULL,
	"prixChambreParNuit" INTEGER NOT NULL,
	"nbreLit" INTEGER NOT NULL,
	"Description" LONG VARCHAR NULL,
	CONSTRAINT "pkChambreId" PRIMARY KEY ( "chambreId" ASC )
	
) 

		/* Table AGENTS*/
		
CREATE TABLE "AGENTS" (
	"IdAgent" CHAR(10) NOT NULL,
	"nomAgent" CHAR(50) NULL,
	"prenomAgent" CHAR(50) NULL,
	"posteAgent" CHAR(50) NULL,
	PRIMARY KEY ( "IdAgent" ASC )
	ON UPDATE CASCADE 
	ON DELETE CASCADE;
)

		/* Table ACTIVITES*/
CREATE TABLE "ACTIVITEES" (
	"idActivitee" CHAR(10) NOT NULL,
	"nomActivitee" CHAR(50) NOT NULL,
	"nbrPersonne" INTEGER NOT NULL,
	"prix" INTEGER NOT NULL,
	"typeActivitee" CHAR(50) NOT NULL,
	"jourSemaine" CHAR(20) NOT NULL,
	"horaires" CHAR(30) NOT NULL,
	"idAgent" CHAR(10) NOT NULL,
	PRIMARY KEY ( "idActivitee" ASC )
	CONSTRAINT "AGENTS" FOREIGN KEY ( "IdAgent" ASC ) REFERENCES "DBA"."AGENTS" ( "IdAgent" )
	ON DELETE CASCADE
	ON UPDATE CASCADE;
)


