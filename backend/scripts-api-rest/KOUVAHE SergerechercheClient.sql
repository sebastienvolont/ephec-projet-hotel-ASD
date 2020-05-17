-- -KOUVAHE Folly Serge  HE201817--

 --Procédure qui fait la recherche du client à base de son mail  --

CREATE PROCEDURE searchClient( IN email CHAR (30) )
    RESULT(idclt INTEGER , nomClient CHAR (50), prenomClient CHAR (50), clientDateNaissance  DATE, mail CHAR (30))
BEGIN
	Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    call sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    SELECT c.id, c.nomClient, c.prenomClient,c.clientDateNaissance, c.mailClient  FROM client c
    WHERE c.mailClient = email
END

-------------------------------------------------------------------- Création des webservices------------------------------------------------------------------------------------

CREATE SERVICE "descriptionChambre" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call descriptionChambres();
