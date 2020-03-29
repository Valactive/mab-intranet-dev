/* Author: 
   valéry Frisch :: valery@valactive.com
*/
/* 'use strict'; */
//GLOBAL VARS

var myTOOLS = {

}

//TOOLS FUNCTION
var TOOLS = function ($) {

	TOOLS = {
		initialise: function (event) {
		//DOM ready
				


		},//end of initialise
		
	  	loaded: function (event) {
	  	//DOM loaded
		// ******************************************************************************************
		// FORMS
		// ******************************************************************************************
		// supply the language
		$.tools.validator.localize("fr", {
			'*'			: 'Merci de corriger ce champ',
			':email'  	: 'Le format de votre email est incorrect, merci de le corriger',
			':number' 	: 'Merci de saisir une valeur numérique',
			':url' 		: 'Virheellinen URL',
			'[max]'	 	: 'Arvon on oltava pienempi, kuin $1',
			'[min]'		: 'Arvon on oltava suurempi, kuin $1',
			'[required]': 'Merci de remplir ce champ',
			'[heure]'	: 'Merci d\'indiquer une heure entre 09 et 18'
		});	


//console.log(language);
			$("#subForm").validator();

/*
		if (language == "fr") {
			$("#subForm").validator({lang:'fr'});
			$("#form-contact").validator({lang:'fr'});
			$("#form-search").validator({lang:'fr'});			
		} else if (language == "en") {
			$("#subForm").validator({lang:'en'});
			$("#form-contact").validator({lang:'en'});
			$("#form-search").validator({lang:'en'});			
		}
*/


	  	}
	}
	$(document).bind('ready', TOOLS.initialise);
	$(window).bind('load', TOOLS.loaded);
 
 	return TOOLS;
 
	};

TOOLS = (TOOLS)(jQuery);