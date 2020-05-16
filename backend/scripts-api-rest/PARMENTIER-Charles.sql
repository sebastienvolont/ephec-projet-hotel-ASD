CREATE TABLE "DBA"."RESTAURATION" (
	"idRestauration" CHAR(10) NOT NULL,
	"nomReservation" CHAR(20) NOT NULL,
	"nbrePerso" INTEGER NOT NULL,
	"dateResto" DATE NOT NULL,
	"chambreId" CHAR(10) NULL,
	PRIMARY KEY ( "idRestauration" ASC )
) IN "system";














ALTER TABLE "DBA"."RESTAURATION"
 ADD CONSTRAINT "CHAMBRES" FOREIGN KEY ( "chambreId" ASC ) REFERENCES "DBA"."CHAMBRES" ( "chambreId" );















ALTER PROCEDURE "DBA"."insertRestaurantReservation"( IN nomResa CHAR(20),
                                                     IN nbPersonnes INTEGER,
                                                     IN dateCheck DATE,
                                                     IN idChambre char(10) )
 
/* RESULT( nom_colonne type_colonne, ... ) */
BEGIN
    CALL sa_set_http_header('Access-Control-Allow-Origin', '*');
	CALL sa_set_http_header('Content-Type','text/json');
    

    INSERT INTO RESTAURATION (idRestauration, nomReservation, nbrePerso, dateResto, chambreId)
 values ((SELECT idReservationRestaurant()), -- Id Reservation
                                            nomResa,
                                            nbPersonnes,
                                           dateCheck,
                                            idChambre 
                                             
                                           
    );
END











CREATE SERVICE "restaurant" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call insertRestaurantReservation(:nomResa,:nbPersonnes,:dateCheck,:numeroChambre);










ALTER FUNCTION "DBA"."idReservationRestaurant"( )
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	DECLARE idReservationRestaurant CHAR(10);
     set idReservationRestaurant = (SELECT 'ID_000'
    +string((select count()+1 from RESTAURATION)));
	RETURN idReservationRestaurant;
END







