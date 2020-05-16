//PARMENTIER CHARLES HE201787
// Appel la fonction Date minimum
function initPage(){
    let formResto = document.getElementById("formRestaurant");
    dateMin();
    console.log("loaded");


};

// Fonction qui crée la date minimum
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

// Fonction qui fait référence au formulaire
function getId(id){
    return document.getElementById(id);
};
// Fonction reçoit les valeurs des champs nom et prénom du formulaire
function  nomResa(){
    
    let nomResa= String( getId("name").value+" "+ getId("firstName").value);
    console.log(nomResa);
    return nomResa;
    
};

// Soumission de la page reservation
function resaResto() {
    event.preventDefault();
    let xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://localhost/restaurant?nomResa='
        + nomResa()
        + '&nbPersonnes='
        + formResto.personne.value
        + '&dateCheck='
        + formResto.dateResto.value,
        true);

    xhr.onload = function check() {

        getId("zoneTexte").innerHTML = message;

        console.log("ok");

    }

    xhr.send();
    console.log("fait aussi");
    let message = "<p>votre réservation a bien été prise en compte</p>";
}

