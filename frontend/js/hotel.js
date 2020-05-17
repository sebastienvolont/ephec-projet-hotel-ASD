// auteur : Blervaque Thomas HE201709

/* ************************************* */ 

"use strict";
function client(){
	event.preventDefault();
	checkNom();
	checkPrenom();
	if(!validationemail()){
		alert("Adresse email invalide.");
	}
	else{
		if(checkBirthDate()){
			console.log("Desolé vous n'êtes pas majeur")
		}
		else{
				if(form1.dateFin.value <= form1.dateDebut.value){
				alert("La date de fin séjour ne peut être inférieure à la date du début");
				console.log("on stop date du sejour invalide")
			}
			else{
				let xhr = new XMLHttpRequest();
				xhr.open('GET','http://localhost/getClient?lenom=' + form1.name.value +'&leprenom=' + form1.firstName.value+ '&dteNaiss='+ form1.dateNaiss.value+ '&lemail=' + form1.emailClient.value,true);
				xhr.onload=function titi(){
					let reponse = JSON.stringify(xhr.responseText);
					if(xhr.readyState == 4 && xhr.status == 200){ 
						getidClient();
					}
				}
				xhr.send();
				console.log("fonction client fait");
			}
		}
	}
}

function reservation(idClient){
	console.log(idClient);
	event.preventDefault();
	let xhr = new XMLHttpRequest();
	xhr.open('GET','http://localhost/getReservation?ladateDeb=' + form1.dateDebut.value + '&ladateFin=' + form1.dateFin.value + '&leprixTotal='+ calculPrixFinal(dateDebut,dateFin) +'&clientId=' +idClient+ '&lidchambre='+form1.typeChambre.value,true);
	xhr.onload=function toto(){
		let reponse = JSON.stringify(xhr.responseText);
	}
	xhr.send();
	console.log("fonction reservation fait");
	document.getElementById("zoneT").innerHTML = "<p>Votre chambre à bien été reserver pour la date du " + form1.dateDebut.value + " jusqu'au " + form1.dateFin.value + " , Vous devrez payer sur place " + calculPrixFinal(dateDebut,dateFin) + " Euros."
}

function getidClient(){
	event.preventDefault();
	let xhr = new XMLHttpRequest();
	xhr.open('GET','http://localhost/getIdClient?lenom=' + form1.name.value +'&leprenom=' + form1.firstName.value + '&dteNaiss='+ form1.dateNaiss.value,true);
    xhr.onload=function bobo(){
		console.log(xhr.responseText);
		if(xhr.readyState == 4 && xhr.status == 200){ 
        let reponseid = JSON.parse(xhr.responseText)[0]["idCl"];
		reservation(reponseid);		
		} 
	}
	xhr.send();
	console.log("getidClient");
}

function initPage(){
	dateMin();
	let xhr = new XMLHttpRequest();
	xhr.open('GET','http://localhost/getListeChambre',true);
	
	xhr.onload=function makeTbChambres(){
	let tableauChambres = (xhr.responseText)
	document.getElementById("typeChambre").innerHTML = tableauChambres;
	}
	xhr.send();	
	console.log('fait');
}


function checkDateFin(){
    if(form1.dateFin.value <= form1.dateDebut.value){
        alert("La date de fin séjour ne peut être inférieure à la date du début");
		return false;
    }
}

function checkBirthDate(){
let dateSaisie = document.getElementById("dateNaiss").value;
let dateSaisieObject = new Date(dateSaisie);
let today = new Date().getFullYear();
let saisieYear = dateSaisieObject.getFullYear();
if((today - saisieYear) < 18) {
    alert("Desolé vous n'êtes pas majeur");
	return true;
    }
}


function validationemail(){
	let expressionReguliere = /^(([^<>()[]\.,;:s@]+(.[^<>()[]\.,;:s@]+)*)|(.+))@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}])|(([a-zA-Z-0-9]+.)+[a-zA-Z]{2,}))$/;
	if (expressionReguliere.test(form1.emailClient.value)){	
		return true;
	}
	else{
		return false;
	}
}


function calculPrixFinal(){
    let dateDebut = form1.dateDebut.value;
    let dateFin = form1.dateFin.value;
    let dateDebutObject = new Date(dateDebut);
    let dateFinObject = new Date(dateFin);
    let differenceDate = Math.abs(dateFinObject - dateDebutObject);
    let nbrJourTotal = Math.ceil(differenceDate / (1000 * 60 * 60 * 24));
    switch (form1.typeChambre.value) {

        case 'ch_04' :
            console.log(25 * nbrJourTotal);
            return(25 * nbrJourTotal);
            break;
        case 'ch_05' :
            console.log(50 * nbrJourTotal);
            return(50 * nbrJourTotal);
            break;
        case 'ch_01' :
            console.log(100 * nbrJourTotal);
            return(100 * nbrJourTotal);
            break;
        case 'ch_02' :
            console.log(200 * nbrJourTotal);
            return(200 * nbrJourTotal);
            break;
        case 'ch_03' :
            console.log(400 * nbrJourTotal);
            return(400 * nbrJourTotal);
            break;
    }
}

function dateMin(){
   let currentDate = new Date();


    let formattedDate = currentDate.getFullYear() + "-" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();

    if (formattedDate.length == 9){
        formattedDate = currentDate.getFullYear() + "-0" + (currentDate.getMonth() + 1) + "-" + currentDate.getDate();
        document.getElementById("dateDebut").min = String(formattedDate);
		document.getElementById("dateFin").min = String(formattedDate);
    }
    else{
        document.getElementById("dateDebut").min = String(formattedDate);
		document.getElementById("dateFin").min = String(formattedDate);
    }
	console.log("date fait");
};
