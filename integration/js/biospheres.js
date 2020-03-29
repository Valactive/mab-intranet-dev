/* Author: 
   valéry Frisch :: valery@valactive.com
*/
/* 'use strict'; */
//GLOBAL VARS

var myBIOSPHERES = {

}

//BIOSPHERES FUNCTION
var BIOSPHERES = function ($) {

	BIOSPHERES = {
		initialise: function (event) {
		//DOM ready
				
		//setup accordion for biosphere pages
		if($('#infos-bio')){
			$('#infos-bio').hoverAccordion({ 
	      		keepHeight: true, 
	     	 	activateItem: 1,
	     	 	onClickOnly: true, 
	      		speed: 'fast' 
	   		}); 
		}
		//trigger click event on first accordion for open it.
   		$('#infos-bio a').first().trigger('click');
		},//end of initialise
		
	  	loaded: function (event) {
	  	//DOM loaded
	  	}
	}
	$(document).bind('ready', BIOSPHERES.initialise);
	$(window).bind('load', BIOSPHERES.loaded);
 
 	return BIOSPHERES;
 
	};

BIOSPHERES = (BIOSPHERES)(jQuery);