//HE201833 VOLONT Sébastien


// Charge les options du select
window.onload=function() {
    document.getElementById("afficherResultats").click();
};
    document.addEventListener('DOMContentLoaded',initPage);
// Initialise la page
function initPage(){
    let formActivitee = document.getElementById('formActivitees');
    formActivitee.addEventListener('submit', soumettreRequete);
}

// Soumission de la requête
function soumettreRequete(event){
    event.preventDefault();
    let form = this;
    envoyerRequete(form.jour.value, form.typeActivitee.value);
}

//Envoi des paramètres à localhost
function envoyerRequete(jour, typeActivitee){
    let xhr = new XMLHttpRequest();
    xhr.open('get', 'http://localhost/getActivitees?jour=' + jour + '&typeActi=' + typeActivitee, true);
    xhr.onload = function traiterReponse(){
        affichage(JSON.parse(xhr.responseText));
    };
    xhr.send();
}

// Affichage des données
function affichage(data){
    let str = "<table id='affichageTable'>";
    let keys = Object.keys(data[0]);
    str += "<tr>";
    str += "<th> </th>";
    str += "<th><i> Activitée </i></th>";
    str += "<th><i>Nombre de personnes</i></th>";
    str += "<th><i>Prix de l'activitée </i></th>";
    str += "<th><i>Jour de la semaine </i></th>";
    str += "<th><i>Horaires</i></th>";
    str += "<th><i>Animateur </i><th>"


    str += "</tr>";
    for(let d in data){
        str += "<tr>";

        str += "<td>" + "<img src='img/Activiteesimg/" + data[d].nomActivitee + ".jpg'>" + "</td>";
        str += "<td>" + data[d].nomActivitee + "</td>";
        str += "<td>" + 'Maximum ' + data[d].nbrPersonne+ ' personnes' + "</td>";
        str += "<td>" + data[d].prix + "€ par personne "+ "</td>";
        str += "<td>" + data[d].jourSemaine + "</td>";
        str += "<td>" + "De "+ data[d].horaires + "</td>";
        str += "<td>" + data[d].nomAgent + "</td>";
        str += "</tr>";
        str += "</section>";
    }
    str += "</table>";
    document.getElementById("affichage").innerHTML = str;
}
