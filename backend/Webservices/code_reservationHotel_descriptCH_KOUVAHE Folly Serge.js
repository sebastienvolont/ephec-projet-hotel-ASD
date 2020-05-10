/*KOUVAHE Folly Serge HE201817* /
/*  Description chambre */
function chargement(){
	let xhr = new XMLHttpRequest();
	xhr.open('GET','http://localhost/descriptionChambre',true);
	xhr.onload = function test() {
		affichage(JSON.parse(xhr.responseText));
	}
	xhr.send();
}
function  affichage(data) {
	console.log(data);
	let str = "<table> " +
		"<thead> " +
		"<tr>" +
		"<th> Description</th>" +
		"<th> Lit </th>"+
		"<th> Prix</th>"+
		" </tr>" +
		"</thead>"+
		"<tbody>";
	for(let d in data) {
		str= "";
		str += "<tr>";
		str += "<th>" + data[d]["detailChambre"]+ "  avec " + "</th>";
		str += "<th>" + data[d]["nombreLit"] +" lit(s) et coûte "+ "</th>";
		str += "<th>" + data[d]["prixChambre"] + " €"+ "</th>";
		str += "</tr>";
		if(d==0) {document.getElementById("photo2").innerHTML = str;}
		if(d==1) {document.getElementById("photo3").innerHTML = str;}
		if(d==2) {document.getElementById("photo4").innerHTML = str;}
		if(d==3) {document.getElementById("photo0").innerHTML = str;}
		if(d==4) {document.getElementById("photo1").innerHTML = str;}
	}
str +="</table>";
}


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

/*Modification css*/


.photosChambres img {
    height : 400px;


}

.photosChambres .decriChambre{
    overflow: auto;
}


.photosChambres .bloc1{
    width: 60%;
    float: left;
}

.photosChambres .bloc2{
    overflow: auto;
}

.photosChambres label{
    color: #4682B4;
    font-size: 30px;
}

#ongletReservation label { display:inline-block; width:50em; }

#ongletReservation input,textarea { display:inline-block; }
