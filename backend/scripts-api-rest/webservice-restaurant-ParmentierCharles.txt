
CREATE SERVICE "restaurant" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON AS call insertRestaurantReservation(:nomResa,:nbPersonnes,:dateCheck);


ALTER FUNCTION "DBA"."idReservationRestaurant"( )
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	DECLARE idReservationRestaurant CHAR(10);
     set idReservationRestaurant = (SELECT 'ID_000'
    +string((select count()+1 from RESTAURATION)));
	RETURN idReservationRestaurant;
END;

CREATE SERVICE "restaurant" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON AS call insertRestaurantReservation(:nomResa,:nbPersonnes,:dateCheck);


ALTER FUNCTION "DBA"."idReservationRestaurant"( )
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	DECLARE idReservationRestaurant CHAR(10);
     set idReservationRestaurant = (SELECT 'ID_000'
    +string((select count()+1 from RESTAURATION)));
	RETURN idReservationRestaurant;
END;
