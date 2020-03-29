/* Author:
   valéry Frisch :: valery@valactive.com
*/
/* 'use strict'; */
//GLOBAL VARS

var myBIOSPHERES = {

};

//BIOSPHERES FUNCTION
var BIOSPHERES = function ($) {

	BIOSPHERES = {
		initialise: function (event) {
		//DOM ready
				
		//setup accordion for biosphere pages
		if($('#infos-bio')){
			$('#infos-bio').hoverAccordion({
				keepHeight:true,
				activateItem:1,
				onClickOnly:true,
				speed:'fast'
			});
		}
		//trigger click event on first accordion for open it.
		$('#infos-bio a').first().trigger('click');
		
		/* display territories map on popup */
		$('a.carte-territoire[rel="#full-img"]').overlay();
		/* trigger overlay programmaticaly on load */
		//var pophash = location.hash;
		//var pophashSegments = location.search;

		var popOverlay = location.search;
		var popupUrlSegments = popOverlay.split('=');
		var popupUrl = popupUrlSegments[1];
		//popupUrl = popupUrl.replace('https://mab-france.org','https://www.mab-france.org');
		var motif = new RegExp("[overlay]","g");
		
		//correction typo lien lettre 98
console.log(popupUrl);

		if (popupUrlSegments[0] === '?overlay'){
			$('#overlay').overlay({
						mask: '#fff',
						effect: 'apple',
						onBeforeLoad: function() {
							// grab wrapper element inside content
							var wrap = this.getOverlay().find(".contentWrap");
							// load the page specified in the trigger
							//console.log(wrap);
							wrap.load(popupUrl);
						},
						load: true

					});
		}

/*		if(popOverlay){
			$('a[href="'+ popOverlay +'"]').trigger('click');
		}
*/
		if( $('a[rel="#overlay"]').length ){
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
		} //end if

		},//end of initialise
		
		loaded: function (event) {
		//DOM loaded

			// ******************************************************************************************
			// DISPLAY EXTERNAL LINK ON NEW WINDOW
			// ******************************************************************************************
			$('a[rel="external"]').bind('click', function (event) {
				event.preventDefault();
				window.open($(this).attr('href'));
				return false;
			});
		}
	};

	$(document).bind('ready', BIOSPHERES.initialise);
	$(window).bind('load', BIOSPHERES.loaded);
 
	return BIOSPHERES;
 
	};

BIOSPHERES = (BIOSPHERES)(jQuery);
