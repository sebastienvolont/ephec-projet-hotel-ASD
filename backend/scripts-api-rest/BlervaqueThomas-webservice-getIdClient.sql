CREATE PROCEDURE "DBA"."sp_getIdClient"(IN lenom char(50),
                                       IN leprenom char(50),
                                       IN dteNaiss DATE)
RESULT(idCl INTEGER)
BEGIN 
    call sa_set_http_header('Access-Control-Allow-Origin','*');
    call sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    SELECT id from client where nomClient = lenom and prenomClient = leprenom and clientDateNaissance = dteNaiss
END;


/*********************************************/

CREATE SERVICE "getIdClient" TYPE 'JSON' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getIdClient(:lenom,:leprenom,:dteNaiss);
