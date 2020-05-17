-- -KOUVAHE Folly Serge  HE201817--

-- Procedure de modification des données du client--

ALTER PROCEDURE updateClient( IN idclient INTEGER , nom CHAR (50), prenom CHAR (50), dateNaiss DATE )
    RESULT( idclient INTEGER , nom CHAR(50), pren CHAR (50), dateNaiss DATE ) 
BEGIN
    Call sa_set_http_header('Access-Control-Allow-Origin', '*');
    UPDATE client c
    SET nomClient = nom, prenomClient = prenom, clientDateNaissance = dateNaiss
    WHERE c.id = idclient
 END
 
 -------------------------------------------------------------------- Création des webservices------------------------------------------------------------------------------------
 
 CREATE SERVICE "updateClient" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call updateClient(:idclient,:nom,:prenom,:dateNaiss);
