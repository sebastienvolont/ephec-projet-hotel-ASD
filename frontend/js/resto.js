//PARMENTIER Charles HE201787

// Appel de la fonction DateMin()
// déclaration de la variable formResto qui fait référence au formulaire
function initPage(){
    let formResto = document.getElementById("formRestaurant");
    dateMin();
    console.log("loaded");
};

// Fonction qui définit la date actuelle en date minimum dans le formulaire
function dateMin(){
    let currentDate = new Date();

    let formattedDate = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();

    if (formattedDate.length = 9){
        formattedDate = currentDate.getFullYear() + "-0" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();
        getId("dateResto").min = String(formattedDate);
    }
    else{
        getId("dateResto").min = String(formattedDate);
    }
};

// Fonction utile
function getId(id){
    return document.getElementById(id);
};

// Fonction qui recupere les valeurs des champs nom et prénom du formulaire, fait une concaténation puis retourne le resultat
function  nomResa(){
    let nomResa= String( getId("name").value+" "+ getId("firstName").value);
    console.log(nomResa);
    return nomResa;
};

// Soumission du formulaire
// appel au webservice
// création d'un message de confimation dès que la requête est correctement exécutée
function resaResto() {
    event.preventDefault();
    let xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://localhost/restaurant?nomResa='
        + nomResa()
        + '&nbPersonnes='
        + formResto.personne.value
        + '&dateCheck='
        + formResto.dateResto.value
        + '&numeroChambre='
        + formResto.idChambre.value,
        true);

    xhr.onload = function check() {

        getId("zoneTexte").innerHTML = message;

        console.log("ok");

    }

    xhr.send();
    console.log("fait aussi");
    let message = "<p>votre réservation a bien été prise en compte</p>";

}

