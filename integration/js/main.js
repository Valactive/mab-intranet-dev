/* Author: 
   valéry Frisch :: valery@valactive.com
*/
/* 'use strict'; */
//GLOBAL VARS

var myMAB = {

	showInfo:function(evt){
		if( $(this).hasClass('active') ){
			return;
		} else {
			$('a.point').next('div').fadeOut(1100);
			$(this).siblings().removeClass('active');
			$(this).addClass('active').next('div').fadeIn(800);
		}
	},
	displayForm:function(evt){
		evt.preventDefault();
		var targetDiv = $(this);
		if( $(this).hasClass('active') ){
			targetDiv.parent().next('div').slideUp();
			targetDiv.removeClass('active');
		} else {
			$('ul.tools a').removeClass('active');
			targetDiv.addClass('active');
			
			$('ul.tools li').next('div').hide();
			targetDiv.parent().next('div').slideDown(500);
		}	

	}

}

//MAB FUNCTION
var MAB = function ($) {

	MAB = {
		initialise: function (event) {
		//DOM ready
		
		//show active menu when over sub ul
		$('#titre-menu ul ul').bind('mouseover', function(){
			$(this).parent().find('a').addClass('active');
		}).mouseout(function(){
			$(this).parent().find('a').removeClass('active')
		})
		
		//show default item for mab info
		$('a.point').last().addClass('active').next('div').show();
		//show info on point rollover
		$('a.point').bind('mouseenter', myMAB.showInfo);
		
		//display tools-form on click
		$('ul.tools a').bind('click', myMAB.displayForm);
		
		//slide mab/biosphere col droite
		
		$('#top-col-droite li a').click(function(){ 
			$(this).addClass('active');
			$(this).parent().parent().children('div').slideToggle('slow', function(){
				$('#top-col-droite div').each(function(){ 
					if( this.offsetHeight > 10 ){ 
						$(this).prev().addClass('active');
						} 
					else if( this.offsetHeight < 10 ) { 
						$(this).prev().removeClass('active'); 
					} 
				})		
			});
		
		})
		
		//setup diaporama
		$(".scrollable").scrollable( {vertical: true, circular: true} ).autoscroll({ autoplay:true }).navigator();
		
		},		
	  	loaded: function (event) {
	  	//DOM loaded
	  	}
	}
	$(document).bind('ready', MAB.initialise);
	$(window).bind('load', MAB.loaded);
 
 	return MAB;
 
	};

MAB = (MAB)(jQuery);