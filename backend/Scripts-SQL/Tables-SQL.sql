CREATE TABLE CLIENTS(
IdClient CHAR(10) PRIMARY KEY, 
nomClient CHAR(30),
prenomClient CHAR(30),
clientDateNaissance DATE,
sexeClient DSEXE,
etatCivilClient DETATCIVIL,
professionClient CHAR(30),
nationaliteClient CHAR(30),
mailClient CHAR(30),
adresseClient CHAR(50),
)

CREATE TABLE RESERVATIONS(
IdReservation CHAR(10)PRIMARY KEY,
dateDebut DATE,
dateFin DATE ,
pension DPENSION,
montantAvance INTEGER,
IdClient FOREIGN KEY REFERENCES CLIENTS(IdClient),
IdChambre FOREIGN  KEY REFERENCES CHAMBRES(IdChambre),
IdAgent  FOREIGN KEY REFERENCES AGENTS(IdAgent)
)

CREATE TABLE AGENTS(
IdAgent CHAR (10) PRIMARY KEY ,
nomAgent CHAR (30),
prenomAgent CHAR (30),
posteAgent CHAR(30)
)

CREATE TABLE CHAMBRES(
IdChambre CHAR (10) PRIMARY KEY ,
nomChambre CHAR (30)
Position
)

/* J’ai créé des domaine pour :
-	Sexe DSEXE
-	etatCivil  DETAT_CIVIL
-	pension DPENSION */ 


