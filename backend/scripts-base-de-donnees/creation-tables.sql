
CREATE TABLE "ACTIVITEES" (
    "idActivitee" char(10) NOT NULL PRIMARY KEY,
    "nomActivitee" CHAR(50)NOT NULL,
    "nbrPersonne" INTEGER NOT NULL,
    "prix" INTEGER NOT NULL,
    "typeActivitee" CHAR(20)NOT NULL,
    "jourSemaine" CHAR(20)NOT NULL,
    "horaires" char(30)  NOT NULL,
    "idAgent" char(10) NOT NULL,
    FOREIGN KEY (IdAgent) REFERENCES AGENTS(IdAgent)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE "DBA"."AGENTS" (
	"IdAgent" CHAR(10) NOT NULL,
	"nomAgent" CHAR(30) NULL,
	"prenomAgent" CHAR(30) NULL,
	"posteAgent" CHAR(30) NULL,
	PRIMARY KEY ( "IdAgent" ASC )
) IN "system";

CREATE TABLE "DBA"."CHAMBRES" (
	"chambreId" CHAR(10) NOT NULL,
	"nomChambre" CHAR(30) NOT NULL,
	"prixChambreParNuit" INTEGER NOT NULL,
	"nbreLit" INTEGER NOT NULL,
	"Description" CHAR(5000) NULL,
	CONSTRAINT "pkChambreId" PRIMARY KEY ( "chambreId" ASC )
) IN "system";

CREATE TABLE "DBA"."client" (
	"id" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"nomClient" VARCHAR(50) NOT NULL,
	"prenomClient" VARCHAR(50) NOT NULL,
	"clientDateNaissance" DATE NOT NULL,
	"mailClient" VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT "pkClient" PRIMARY KEY ( "id" ASC )
) IN "system";

CREATE TABLE "DBA"."reservations" (
	"idReservation" INTEGER NOT NULL DEFAULT AUTOINCREMENT,
	"dateDebut" DATE NOT NULL,
	"dateFin" DATE NOT NULL,
	"prixTotal" INTEGER NULL,
	"idClient" INTEGER NOT NULL,
	"idChambre" CHAR(10) NULL,
	CONSTRAINT "pkResrv" PRIMARY KEY ( "idReservation" ASC )
) IN "system";

CREATE TABLE "DBA"."RESTAURATION" (
	"idRestauration" CHAR(10) NOT NULL,
	"nomReservation" CHAR(20) NOT NULL,
	"nbrePerso" INTEGER NOT NULL,
	"dateResto" DATE NOT NULL,
	"Id" INTEGER NULL,
	PRIMARY KEY ( "idRestauration" ASC )
) IN "system";


