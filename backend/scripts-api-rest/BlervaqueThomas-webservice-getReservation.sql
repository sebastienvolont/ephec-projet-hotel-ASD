/* auteur : Blervaque Thomas HE201709 */

CREATE PROCEDURE "DBA"."sp_getReservation"(IN ladateDeb DATE,
                                          IN ladateFin DATE,
                                          IN leprixTotal INTEGER,
                                          IN clientId integer,
                                          IN lidchambre CHAR(10))
RESULT (dateDeb DATE, dateFin DATE,prixTot INTEGER,clientIdd INTEGER,chambreIdd CHAR(10))
BEGIN 
    call sa_set_http_header('Access-Control-Allow-Origin','*');
    INSERT into reservations(dateDebut,dateFin,prixTotal,idClient,idChambre)values 
    (ladateDeb,ladateFin,leprixTotal,clientId,lidchambre);
END;

/* **************************************************** */

CREATE SERVICE "getReservation" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getReservation(:ladateDeb,:ladateFin,:leprixTotal,:clientId,:lidchambre);

