-- -KOUVAHE Folly Serge  HE201817--

-- Procedure qui charge le contenu de la  page web  chambre depuis  de la base de données --
ALTER PROCEDURE descriptionChambres()
 RESULT( detailChambre CHAR(500),nombreLit INTEGER, prixChambre INTEGER)
BEGIN
    CALL sa_set_http_header('Access-Control-Allow-Origin','*');
    CALL sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    SELECT c.Description, c.nbreLit, c.prixChambreParNuit  
    FROM  CHAMBRES c
END
			

-------------------------------------------------------------------- Création des webservices------------------------------------------------------------------------------------


CREATE SERVICE "http_searchClient" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call searchClient(:email);



