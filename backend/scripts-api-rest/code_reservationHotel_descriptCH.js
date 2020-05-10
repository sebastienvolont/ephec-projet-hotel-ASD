
/*Procedure descriptionChambres pour récupérer les données dans le table chambre*/

ALTER PROCEDURE "DBA"."descriptionChambres"()
 RESULT( detailChambre CHAR(500),nombreLit INTEGER, prixChambre INTEGER)
BEGIN
    CALL sa_set_http_header('Access-Control-Allow-Origin','*');
    CALL sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    SELECT c.Description, c.nbreLit, c.prixChambreParNuit  
    FROM  CHAMBRES c
END

/*Web service descriptionChambre*/
call descriptionChambres()
