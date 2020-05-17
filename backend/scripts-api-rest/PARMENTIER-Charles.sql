CREATE PROCEDURE "DBA"."insertRestaurantReservation"( IN nomResa CHAR(20),
                                                     IN nbPersonnes INTEGER,
                                                     IN dateCheck DATE,
                                                     IN idChambre char(10) )
 

BEGIN
    CALL sa_set_http_header('Access-Control-Allow-Origin', '*');
	CALL sa_set_http_header('Content-Type','text/json');
    

    INSERT INTO RESTAURATION (idRestauration, nomReservation, nbrePerso, dateResto, chambreId)
 	values ((SELECT idReservationRestaurant()), 
                nomResa,
                nbPersonnes,
                dateCheck,
                idChambre );
END


CREATE SERVICE "restaurant" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call insertRestaurantReservation(:nomResa,:nbPersonnes,:dateCheck,:numeroChambre);



CREATE FUNCTION "DBA"."idReservationRestaurant"( )
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	DECLARE idReservationRestaurant CHAR(10);
     set idReservationRestaurant = (SELECT 'ID_000'
    +string((select count()+1 from RESTAURATION)));
	RETURN idReservationRestaurant;
END







