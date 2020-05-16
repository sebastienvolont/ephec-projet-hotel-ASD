CREATE PROCEDURE "sp_getClient"(IN lenom char(50),
                                     IN leprenom char(50),
                                     IN dteNaiss DATE ,
                                     IN lemail char(70))
RESULT (nom char(50),prenom char(50),dateNaiss DATE,mail char(70))
BEGIN 
    call sa_set_http_header('Access-Control-Allow-Origin','*');
    call sa_set_http_header('Content-Type', 'application:json; charset-utf-8');
    IF(SELECT count(*) from client where nomClient = lenom and prenomClient = leprenom and clientDateNaissance = dteNaiss)>0
        THEN 
    ELSE 
        INSERT into client(nomClient,prenomClient,clientDateNaissance,mailClient)values 
            (lenom,leprenom,dteNaiss,lemail);
    ENDIF;
END;

/* ******************************** */

CREATE SERVICE "getClient" TYPE 'RAW' AUTHORIZATION OFF USER "DBA" URL ON METHODS 'GET' AS call sp_getClient(:lenom,:leprenom,:dteNaiss,:lemail);

