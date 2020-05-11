/* Author:
   valéry Frisch :: valery@valactive.com
*/
'use strict';
//GLOBAL VARS

var myMAB = {

	getLang:function(){

	},

	getNewsletterSuccessMessage:function(){
		var msg = '';
		msg = 'Parfait ! Un email vient de vous être envoyé afin de vérifier votre adresse email. Merci de cliquer sur le lien se trouvant dans celui-ci afin de confirmer votre inscription.';
		return msg;
	},
	getContactSuccessMessage:function(){
		var msg = '';
		msg = 'Parfait ! Votre message nous est bien parvenu. Nous prendrons connaissance de celui-ci très prochainement.';
		return msg;
	},
	getContactErrorMessage:function(){
		var msg = '';
		msg = 'Tous les champs sont obligatoires, merci de vérifier et recommencez.';
		return msg;
	},
	clear_form_elements:function(ele) {

	    $(ele).find(':input').each(function() {
	        switch(this.type) {
	            case 'password':
	            case 'select-multiple':
	            case 'select-one':
	            case 'text':
	            case 'textarea':
	            case 'number':
	            case 'email':
	                $(this).val('');
	                break;
	            case 'checkbox':
	            case 'radio':
	                this.checked = false;
	        }
	    });
	}
}

//MAB FUNCTION
var MAB = function ($) {

	MAB = {
		initialise: function (event) {
		//DOM ready

		//show avis
		$('div.avis a.avisSuite').click(function() {
			$('div.avis').animate({
				height: '660px'
			});
		});
		$('div.avis a.fermer').click(function() {
			$('div.avis').animate({
				height: '179px'
			});
		});
		//show active menu when over sub ul
		$('#titre-menu ul ul').bind('mouseover', function(){
			if( $(this).parent().find('a').hasClass('active') )
			{
				$(this).parent().find('a').addClass('current');
			} else {
				$(this).parent().find('a').addClass('active');
			}
		}).mouseout(function(){
			if( $(this).parent().find('a').hasClass('current') )
			{
				return;
			} else {
				$(this).parent().find('a').removeClass('active');
			}
		})

		//show default item for mab info
		$('a.point').addClass('active').next('div').show();
//		$('a.point').last().addClass('active').next('div').show();
		//show info on point rollover
//		$('a.point').bind('mouseenter', myMAB.showInfo);

		//display tools-form on click
		//$('ul.tools a').bind('click', myMAB.displayForm);
		$('.tool-btn').click( function(e){
			e.preventDefault();
			$('a.tool-btn').removeClass('active');
			$('.error').css('visibility','hidden');
			$('.tool-content').slideUp('normal');
			$(this).addClass('active');
			$(this).next().slideDown('normal');
		});


		//slide mab/biosphere col droite
		//accordion mab/biosphere
		$('.accordion-btn').click(function(e){
			e.preventDefault();
			$('a.accordion-btn').removeClass('active');
			$('.accordion-content').slideUp('normal');
			$(this).addClass('active');
			$(this).next().slideDown('normal');
		});


		//setup home diaporama
		$(".scrollable").scrollable( {circular: true } ).autoscroll({ autoplay:true, interval:8000 }).navigator();

	//	programmaticaly load popup over website
	/* trigger overlay programmaticaly on load */
		var pophash = location.hash;
		var pophashSegments = pophash.split('?');
		var popOverlay = pophashSegments[1];


		if(pophashSegments[0]=="#overlay"){

			$('#overlay').overlay({
						mask: '#fff',
						effect: 'apple',
						onBeforeLoad: function() {
							// grab wrapper element inside content
							var wrap = this.getOverlay().find(".contentWrap");
							
							// load the page specified in the trigger
							wrap.load(popOverlay);
						},
						load: true
					});
		}
		//popup windows
			// if the function argument is given to overlay,
			// it is assumed to be the onBeforeLoad event listener

//		if(page!='biospheres' || page!='biosphere'){
			$('a[rel="#overlay"]').overlay({
				mask: '#fff',
				effect: 'apple',
				onBeforeLoad: function() {
					// grab wrapper element inside content
					var wrap = this.getOverlay().find(".contentWrap");
					// load the page specified in the trigger
					wrap.load(this.getTrigger().attr("href"));
				}
			});
//		}
		// ******************************************************************************************
		// FORMS
		// ******************************************************************************************

		$.tools.validator.fn('select.required', "Merci de faire un choix.",
			function(input,value){
				return value != 'choisissez';
			});


		$.tools.validator.fn('select.required', 'Please, make a choice!',
			function(input,value){
				return value != 'choose';
			});

		// supply the language
		$.tools.validator.localize("fr", {
			'*'			: 'Merci de corriger ce champ',
			':email'  	: 'Le format de votre email est incorrect, merci de le corriger',
			':number' 	: 'Merci de saisir une valeur numérique',
			':url' 		: 'Merci de saisir une URL valide',
			'[max]'	 	: 'Trop long ! Merci de saisir moins de $1 caractères',
			'[min]'		: 'Trop court ! Merci de saisir au moins $1 caractères',
			'[required]': 'Merci de remplir ce champ',
			'[heure]'	: 'Merci d\'indiquer une heure entre 09 et 18',
			'[age]'		: 'Merci de choisir une tranche d\'âge.'
		});

		},
	  	loaded: function (event) {
		  	//DOM loaded
		  	//AJAX newsletter subscription
		  	$('#subForm, #form-contact, #form-search, #newsletter').attr('novalidate', 'novalidate');

			$("#subForm").validator({ lang: myMAB.getLang(), inputEvent: "blur", position: "center right" }).submit(function(e){

				if(!e.isDefaultPrevented()) {
				var form = $(this);
				var action = form.attr("action");

					$.getJSON(
			            action + "?callback=?",
			            form.serialize(),
			            function (data) {
			                if (data.Status === 400) {
			                    jnotif({
									style:"nok",
									message:"Attention ! " + data.Message,
									position:"top"
								});
							} else { // 200
			                    $('ul.tools a').removeClass('active');
			                    $('.tools-form.newsletter').slideUp(500);
			                    jnotif({
									style:"ok",
									message: myMAB.getNewsletterSuccessMessage(),
									position:"top"
								})
								myMAB.clear_form_elements(form);
								$('ul.tools a.recherche').delay(6000).addClass('active');
			                    $('.tools-form.recherche').delay(6000).slideDown(500);

			                    //alert("Success: " + data.Message);
			                }
			            });
					e.preventDefault();
				}
			});

			$("#newsletter").validator({ lang: myMAB.getLang(), inputEvent: "blur", position: "center right" }).submit(function(e){

				if(!e.isDefaultPrevented()) {
				var form = $(this);
				var action = form.attr("action");

					$.getJSON(
			            action + "?callback=?",
			            form.serialize(),
			            function (data) {
			                if (data.Status === 400) {
			                    jnotif({
									style:"nok",
									message:"Attention ! " + data.Message,
									position:"top"
								});
							} else { // 200
			                    $('.tools-form.visible').slideUp(500);
			                    jnotif({
									style:"ok",
									message: myMAB.getNewsletterSuccessMessage(),
									position:"top"
								})
								myMAB.clear_form_elements(form);
					            $('.tools-form.visible').slideDown(500);

			                    //alert("Success: " + data.Message);
			                }
			            });
					e.preventDefault();
				}
			});
			//AJAX contact submission
			$("#form-contact").validator({ lang: myMAB.getLang(),inputEvent: "blur", position: "center right" }).submit( function(e){
				if(!e.isDefaultPrevented()){
					var form = $(this);
					var formData = form.serialize();
					var action = root+"/"+language+"/contact-form-traitement-url/";
					$.post( action, formData,
						function(xml){
							var result = $(xml).find('new-contact').attr('result');
console.log(result);
							if(result == 'success'){
		                    $('ul.tools a').removeClass('active');
		                    $('.tools-form.contact').slideUp(500);
								jnotif({
									style:"ok",
									message: myMAB.getContactSuccessMessage(),
									position:"top"
								})
								$('ul.tools a.recherche').delay(6000).addClass('active');
			                    $('.tools-form.recherche').delay(6000).slideDown(500);

							} else if(result == 'error'){
								jnotif({
									style:"nok",
									message: myMAB.getContactErrorMessage(),
									position:"top"
								})
							} else if ( !result ){
								jnotif({
									style:"nok",
									message: "hu, sounds like a problem !",
									position:"top"
								})
							}
						});
				e.preventDefault();
				}
			});



			$("#form-search").validator({ lang: myMAB.getLang(),inputEvent: "blur", position: "center right" });

			// ******************************************************************************************
			// DISPLAY EXTERNAL LINK ON NEW WINDOW
			// ******************************************************************************************
			$('a[rel="external"]').bind('click', function (event) {
	       		event.preventDefault();
	        	window.open($(this).attr('href'));
	        	return false;
	      	});

	  	}
	}
	$(document).bind('ready', MAB.initialise);
	$(window).bind('load', MAB.loaded);

 	return MAB;

	};

MAB = (MAB)(jQuery);