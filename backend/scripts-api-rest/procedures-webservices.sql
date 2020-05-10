//Thomas Blervaque 

CREATE PROCEDURE "DBA"."sp_getIdClient"(in lenom char(50),leprenom char(50),dteNaiss DATE)
RESULT(idCl INTEGER)
BEGIN 
call sa_set_http_header('Access-Control-Allow-Origin','*');
call sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
SELECT id from client where nomClient = lenom and prenomClient = leprenom and clientDateNaissance = dteNaiss
END

CREATE SERVICE "getIdClient"
TYPE 'RAW'
AUTHORIZATION OFF
USER "DBA"
URL ON 
METHODS 'GET' 
AS call sp_getIdClient(:lenom,:leprenom,:dteNaiss)


CREATE PROCEDURE "DBA"."sp_getListeChambre"()
result(chambre char(5),typeChambre char(50))
BEGIN 
call sa_set_http_header('Access-Control-Allow-Origin','*');
call sa_set_http_header('Content-type','text/html');
SELECT '<option value="'||chambreId||'">' || nomChambre||' ('||prixChambreParNuit||' euros)'||'</option>' from CHAMBRES order by prixChambreParNuit ASC
END

CREATE SERVICE "getListeChambre"
TYPE 'RAW'
AUTHORIZATION OFF
USER "DBA"
URL ON 
METHODS 'GET' 
AS call sp_getListeChambre()


CREATE PROCEDURE "DBA"."sp_getReservation"(in ladateDeb DATE, ladateFin DATE,leprixTotal INTEGER,clientId integer,lidchambre CHAR(10))
RESULT (dateDeb DATE, dateFin DATE,prixTot INTEGER,clientIdd INTEGER,chambreIdd CHAR(10))
BEGIN 
call sa_set_http_header('Access-Control-Allow-Origin','*');
INSERT into reservations(dateDebut,dateFin,prixTotal,idClient,idChambre)values 
(ladateDeb,ladateFin,leprixTotal,clientId,lidchambre);
END

CREATE SERVICE "getReservation"
TYPE 'RAW'
AUTHORIZATION OFF
USER "DBA"
URL ON 
METHODS 'GET' 
AS call sp_getReservation(:ladateDeb,:ladateFin,:leprixTotal,:clientId,:lidchambre)
