/* auteur : Blervaque Thomas HE201709 */

CREATE PROCEDURE "DBA"."sp_getListeChambre"()
result(chambre char(5),typeChambre char(50))
BEGIN 
    call sa_set_http_header('Access-Control-Allow-Origin','*');
    call sa_set_http_header('Content-type','text/html');
    SELECT '<option value="'||chambreId||'">' || nomChambre||' ('||prixChambreParNuit||' euros)'||'</option>' from CHAMBRES order by prixChambreParNuit ASC
END;


/* **************************************************************************** */

CREATE SERVICE "getListeChambre" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getListeChambre();
