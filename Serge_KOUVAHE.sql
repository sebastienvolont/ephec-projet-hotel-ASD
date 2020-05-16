-- -KOUVAHE Folly Serge  HE201817--

-- Procedure de modification des données du client--

ALTER PROCEDURE "DBA"."updateClient"( IN idclient INTEGER , nom CHAR (50), prenom CHAR (50), dateNaiss DATE )
    RESULT( idclient INTEGER , nom CHAR(50), pren CHAR (50), dateNaiss DATE ) 
BEGIN
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    UPDATE client c
    SET nomClient = nom, prenomClient = prenom, clientDateNaissance = dateNaiss
    WHERE c.id = idclient
 END
 --Procédure qui fait la recherche du client à base de son mail  --

ALTER PROCEDURE "DBA"."searchClient"( IN email CHAR (30) )
    RESULT(idclt INTEGER , nomClient CHAR (50), prenomClient CHAR (50), clientDateNaissance  DATE, mail CHAR (30))
BEGIN
	Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    call sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    SELECT c.id, c.nomClient, c.prenomClient,c.clientDateNaissance, c.mailClient  FROM client c
    WHERE c.mailClient = email
END


-- Procedure qui charge le contenu des pages depuis  de la base de données --
ALTER PROCEDURE "DBA"."descriptionChambres"()
 RESULT( detailChambre CHAR(500),nombreLit INTEGER, prixChambre INTEGER)
BEGIN
    CALL sa_set_http_header('Access-Control-Allow-Origin','*');
    CALL sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    SELECT c.Description, c.nbreLit, c.prixChambreParNuit  
    FROM  CHAMBRES c
END
			

-------------------------------------------------------------------- Création des webservices------------------------------------------------------------------------------------




CREATE SERVICE "updateClient" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call updateClient(:idclient,:nom,:prenom,:dateNaiss);


CREATE SERVICE "http_searchClient" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call searchClient(:email);


CREATE SERVICE "descriptionChambre" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call descriptionChambres();
