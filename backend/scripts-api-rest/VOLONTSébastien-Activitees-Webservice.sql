
CREATE PROCEDURE "proc_getActivitee" (in jour char(30), in typeActi char(20))
RESULT (nomActivitee char(50), nbrPersonne integer, prix integer, jourSemaine char(20),
        horaires char(50),nomAgent char(60), prenomAgent char(60))
BEGIN 
    call sa_set_http_header('Content-Type', 'application/json');
    call sa_set_http_header('Access-Control-Allow-Origin', '*');
    SELECT nomActivitee, nbrPersonne, prix, jourSemaine, horaires, t2.prenomAgent
    from ACTIVITEES AS t1 join AGENTS as t2 on t1.IdAgent = t2.IdAgent 
    where jour = jourSemaine and typeActi = typeActivitee
END

CREATE SERVICE "getActivitees"
TYPE 'JSON'
AUTHORIZATION OFF
USER "DBA" 
URL ON
METHODS 'GET'
AS call proc_getActivitee(:jour,:typeActi);
