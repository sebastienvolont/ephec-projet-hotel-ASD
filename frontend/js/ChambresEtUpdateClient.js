/*  Description chambre */
function chargement(){
    let xhr = new XMLHttpRequest();
    xhr.open('GET','http://localhost/descriptionChambre',true);
    xhr.onload = function test(){
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

/*Recherche reservation*/

function pageLoad() {
    let xhr = new XMLHttpRequest();
    let valeur = document.getElementById("saisie").value;
    xhr.open("GET","http://localhost/http_searchClient?email="+valeur,true);
    xhr.onload = function  newPage() {
        console.log(JSON.parse(xhr.responseText));
        affiche(JSON.parse(xhr.responseText));
    }
    xhr.send();
}

function affiche(data) {
    for(let d in data)
    {
        document.getElementById("idclient").value = data[d].idclt;
        document.getElementById("name").value = data[d].nomClient;
        document.getElementById("firstName").value = data[d].prenomClient;
        document.getElementById("dateNaiss").value = data[d].clientDateNaissance;
    }
}

/*Mise à jour client*/
function submitMajClient() {
    event.preventDefault();
    let xhrMAJ = new XMLHttpRequest();
    xhrMAJ.open('GET', 'http://localhost/updateClient?idclient='+form1.idclient.value+'&nom='+form1.name.value+ '&prenom='+form1.prenom.value
        +'&dateNaiss='+form1.dateNaiss.value, true)
    xhrMAJ.onload = function() {
        let rep = JSON.stringify(xhrMAJ.responseText);
    }
    xhrMAJ.send();
    javascript:this.value='';
    oninput= function(){

    }
    alert("Modification réussie");

}