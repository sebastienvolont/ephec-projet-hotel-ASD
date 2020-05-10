
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
