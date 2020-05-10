ALTER FUNCTION "DBA"."idChambre"()
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
	DECLARE id_chambre CHAR(10);
	    set id_chambre = (SELECT 'CH_00'+string((SELECT count()+1 from CHAMBRES)));
	RETURN id_chambre;
END;
                        
ALTER FUNCTION "DBA"."idClient"( IN nomClt CHAR(30),prenomClt CHAR(30) )
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
	DECLARE id_client CHAR(10);
    set id_client = (SELECT left( nomClt,5 ) ||'_'|| left(prenomClt,4) 
                    FROM CLIENTS );	

	RETURN id_client;
END
                        
ALTER FUNCTION "DBA"."idContact"( )
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
	DECLARE id_contact CHAR(10);
	SET id_contact = (SELECT 'Dde_'+string((SELECT  count(*) + 1 from CONTACT)));
	RETURN id_contact;
END
                    
ALTER FUNCTION "DBA"."idReservation"( )
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	DECLARE id_reservation CHAR(15);
     set id_reservation = (SELECT 'RES_000'
    +string((select count()+1 from RESERVATIONS)));
	RETURN id_reservation;
END
                           
ALTER FUNCTION "DBA"."idReservationRestaurant"( )
RETURNS CHAR(15)
DETERMINISTIC
BEGIN
	DECLARE idReservationRestaurant CHAR(10);
     set idReservationRestaurant = (SELECT 'ID_000'
    +string((select count()+1 from RESTAURATION)));
	RETURN idReservationRestaurant;
END
