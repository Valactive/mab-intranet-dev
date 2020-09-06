$(function () {

	// Notification Close Button
	$('.close-notification').click(
		function () {
			$(this).parent('.container_').fadeTo(350, 0, function () {$(this).slideUp(600);});
			return false;
		}
	);

	// jQuery Tipsy
	$('[rel=tooltip], #main-nav span, .loader').tipTip({maxWidth:'auto', edgeOffset:10, delay:50}); // TipTip

	// jQuery Facebox Modal
	$('.open-modal').nyroModal();

	// jQuery jWYSIWYG Editor
	$('.wysiwyg').wysiwyg({ iFrameClass:'wysiwyg-iframe' });
	
	// jQuery dataTables
	$('.datatable').dataTable(
		{
			"oLanguage": {
			    "sProcessing":   "Traitement en cours...",
			    "sLengthMenu":   "Afficher _MENU_ éléments",
			    "sZeroRecords":  "Aucun élément à afficher",
			    "sInfo":         "Affichage de l'élement _START_ à _END_ sur _TOTAL_ éléments",
			    "sInfoEmpty":    "Affichage de l'élement 0 à 0 sur 0 éléments",
			    "sInfoFiltered": "(filtré de _MAX_ éléments au total)",
			    "sInfoPostFix":  "",
			    "sSearch":       "Rechercher :",
			    "sUrl":          "",
			    "oPaginate": {
			        "sFirst":    "Premier",
			        "sPrevious": "Précédent",
			        "sNext":     "Suivant",
			        "sLast":     "Dernier"
			    }
			},
			"aaSorting": []
		}
	);

	// jQuery Custome File Input
	//$('.fileupload').customFileInput();

	// jQuery DateInput
	//$('.datepicker').datepick({ pickerClass: 'jq-datepicker', dateFormat: 'dd MM yyyy' });

	// jQuery Data Visualize
	$('table.data').each(function() {
		var chartWidth = $(this).parent().width()*0.90; // Set chart width to 90% of its parent
		var chartType = ''; // Set chart type
			
		if ($(this).attr('data-chart')) { // If exists chart-chart attribute
			chartType = $(this).attr('data-chart'); // Get chart type from data-chart attribute
		} else {
			chartType = 'area'; // If data-chart attribute is not set, use 'area' type as default. Options: 'bar', 'area', 'pie', 'line'
		}
		
		if(chartType == 'line' || chartType == 'pie') {
			$(this).hide().visualize({
				type: chartType,
				width: chartWidth,
				height: '240px',
				lineDots: 'double',
				interaction: true,
				multiHover: 5,
				tooltip: true,
				tooltiphtml: function(data) {
					var html ='';
					for(var i=0; i<data.point.length; i++){
						html += '<p class="chart_tooltip"><strong>'+data.point[i].value+'</strong> '+data.point[i].yLabels[0]+'</p>';
					}	
					return html;
				}
			});
		} else {
			$(this).hide().visualize({
				type: chartType,
				width: chartWidth,
				height: '240px'
			});
		}
	});

	// Check all checkboxes
	$('.check-all').click(
		function(){
			$(this).parents('form').find('input:checkbox').attr('checked', $(this).is(':checked'));
		}
	)

	// IE7 doesn't support :disabled
	$('.ie7').find(':disabled').addClass('disabled');

	// Menu Dropdown
	$('#main-nav li ul').hide(); //Hide all sub menus
	$('#main-nav li.current a').parent().find('ul').slideToggle('slow'); // Slide down the current sub menu
	$('#main-nav li a').click(
		function (e) {
			if($(e.target).attr('class') === 'products') {
				$(this).parent().siblings().find('ul').slideUp('normal'); // Slide up all menus except the one clicked
				$(this).parent().find('ul').slideToggle('normal'); // Slide down the clicked sub menu
				return false;
			} else {
				//console.log($(this).attr('href'));
				// nothing to do, the normal function is played in order to display the right form.
			}
		}
	);
	$('#main-nav li a.no-submenu').click(
		function () {
			window.location.href=(this.href); // Open link instead of a sub menu
			return false;
		}
	);

	// Widget Close Button
	$('.close-widget').click(
		function () {
			$(this).parent().fadeTo(350, 0, function () {$(this).slideUp(600);}); // Hide widgets
			return false;
		}
	);

	// Table actions
	$('.table-switch').hide();
	$('.toggle-table-switch').click(
		function () {
			$(this).parent().parent().siblings().find('.toggle-table-switch').removeClass('active').next().slideUp(); // Hide all menus expect the one clicked
			$(this).toggleClass('active').next().slideToggle(); // Toggle clicked menu
			$(document).click(function() { // Hide menu when clicked outside of it
				$('.table-switch').slideUp();
				$('.toggle-table-switch').removeClass('active')
			});
			return false;
		}
	);

	// Image actions
	$('.image-frame').hover(
		function() { $(this).find('.image-actions').css('display', 'none').fadeIn('fast').css('display', 'block'); }, // Show actions menu
		function() { $(this).find('.image-actions').fadeOut(100); } // Hide actions menu
	);

		// Tickets
	$('.tickets .ticket-details').hide(); // Hide all ticket details
	$('.tickets .ticket-open-details').click( // On click hide all ticket details content and open clicked one
		function() {
			//$('.tickets .ticket-details').slideUp()
			$(this).parent().parent().parent().parent().siblings().find('.ticket-details').slideUp(); // Hide all ticket details expect the one clicked
			$(this).parent().parent().parent().parent().find('.ticket-details').slideToggle();
			return false;
		}
	);

	// Wizard
	$('.wizard-content').hide(); // Hide all steps
	$('.wizard-content:first').show(); // Show default step
	$('.wizard-steps li:first-child').find('a').addClass('current');
	$('.wizard-steps a').click(
		function() { 
			var step = $(this).attr('href'); // Set variable 'step' to the value of href of clicked wizard step
			$('.wizard-steps a').removeClass('current');
			$(this).addClass('current');
			$(this).parent().prevAll().find('a').addClass('done'); // Mark all prev steps as done
			$(this).parent().nextAll().find('a').removeClass('done'); // Mark all next steps as undone
			$(step).siblings('.wizard-content').hide(); // Hide all content divs
			$(step).fadeIn(); // Show the content div with the id equal to the id of clicked step
			return false;
		}
	);
	$('.wizard-next').click(
		function() { 
			var step = $(this).attr('href'); // Set variable 'step' to the value of href of clicked wizard step
			$('.wizard-steps a').removeClass('current');
			$('.wizard-steps a[href="'+step+'"]').addClass('current');
			$('.wizard-steps a[href="'+step+'"]').parent().prevAll().find('a').addClass('done'); // Mark all prev steps as done
			$('.wizard-steps a[href="'+step+'"]').parent().nextAll().find('a').removeClass('done'); // Mark all next steps as undone
			$(step).siblings('.wizard-content').hide(); // Hide all content divs
			$(step).fadeIn(); // Show the content div with the id equal to the id of clicked step
			return false;
		}
	);

	// Content box tabs and sidetabs
	$('.tab, .sidetab').hide(); // Hide the content divs
	$('.default-tab, .default-sidetab').show(); // Show the div with class 'default-tab'
	$('.tab-switch a.default-tab, .sidetab-switch a.default-sidetab').addClass('current'); // Set the class of the default tab link to 'current'

	if (window.location.hash && window.location.hash.match(/^#tab\d+$/)) {
		var tabID = window.location.hash;
		$('.tab-switch a[href='+tabID+']').addClass('current').parent().siblings().find('a').removeClass('current');
		$('div'+tabID).parent().find('.tab').hide();
		$('div'+tabID).show();
	} else if (window.location.hash && window.location.hash.match(/^#sidetab\d+$/)) {
		var sidetabID = window.location.hash;
		$('.sidetab-switch a[href='+sidetabID+']').addClass('current').parent().siblings().find('a').removeClass('current');
		
		$('.sidetab-switch a[href='+sidetabID+']').addClass('current');
		$('div'+sidetabID).parent().find('.sidetab').hide();
		$('div'+sidetabID).show();
	}
	
	$('.tab-switch a').click(
		function() { 
			var tab = $(this).attr('href'); // Set variable 'tab' to the value of href of clicked tab
			$(this).parent().siblings().find('a').removeClass('current'); // Remove 'current' class from all tabs
			$(this).addClass('current'); // Add class 'current' to clicked tab
			$(tab).siblings('.tab').hide(); // Hide all content divs
			$(tab).show(); // Show the content div with the id equal to the id of clicked tab
			//$(tab).find('.visualize').trigger('visualizeRefresh'); // Refresh jQuery Visualize
			//$('.fullcalendar').fullCalendar('render'); // Refresh jQuery FullCalendar
			return false;
		}
	);

	$('.sidetab-switch a.aTab').click(
		function() { 
			var sidetab = $(this).attr('href'); // Set variable 'sidetab' to the value of href of clicked sidetab
			window.location.hash = sidetab;	
			$(this).parent().siblings().find('a').removeClass('current'); // Remove 'current' class from all sidetabs
			$(this).addClass('current'); // Add class 'current' to clicked sidetab
			$(sidetab).siblings('.sidetab').hide(); // Hide all content divs
			$(sidetab).show(); // Show the content div with the id equal to the id of clicked tab
			//$(sidetab).find('.visualize').trigger('visualizeRefresh'); // Refresh jQuery Visualize
			//$('.fullcalendar').fullCalendar('render'); // Refresh jQuery FullCalendar
			
			return false;
		}
	);
	
	// Content box accordions
	$('.accordion li div').hide();
	$('.accordion li:first-child div').show();
	$('.accordion .accordion-switch').click(
		function() {
			$(this).parent().siblings().find('div').slideUp();
			$(this).next().slideToggle();
			return false;
		}
	);
	
	//Minimize Content Article
	$('article header h2').css({ 'cursor':'s-resize' }); // Minizmie is not available without javascript, so we don't change cursor style with CSS
	$('article header h2').click( // Toggle the Box Content
		function () {
			$(this).parent().find('nav').toggle();
			$(this).parent().parent().find('section, footer').toggle();
		}
	);
	
	// Progress bar animation
	$('.progress-bar').each(function() {
		var progress = $(this).children().width();
		$(this).children().css({ 'width':0 }).animate({width:progress},3000);
	});
	
	//jQuery Full Calendar
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	
	$('.fullcalendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		editable: true,
		events: [
			{
				title: 'All Day Event',
				start: new Date(y, m, 1)
			},
			{
				title: 'Long Event',
				start: new Date(y, m, d-5),
				end: new Date(y, m, d-2)
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: new Date(y, m, d-3, 16, 0),
				allDay: false
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: new Date(y, m, d+4, 16, 0),
				allDay: false
			},
			{
				title: 'Meeting',
				start: new Date(y, m, d, 10, 30),
				allDay: false
			},
			{
				title: 'Lunch',
				start: new Date(y, m, d, 12, 0),
				end: new Date(y, m, d, 14, 0),
				allDay: false
			},
			{
				title: 'Birthday Party',
				start: new Date(y, m, d+1, 19, 0),
				end: new Date(y, m, d+1, 22, 30),
				allDay: false
			},
			{
				title: 'Click for Walking Pixels',
				start: new Date(y, m, 28),
				end: new Date(y, m, 29),
				url: 'http://www.walkingpixels.com/'
			}
		]
	});
	 
	// Upload fields
	$('a.switch').bind('click', function(event) {	
		var dd = $('dd.file');
		// Prevent click trough
		event.preventDefault();

		// Show new empty file input
		dd.hide();
		$(this).parent().parent().find('dd.cfile').show();
	});
	//external link in new window
	$('a[rel="external"]').bind('click', function (event) {
		event.preventDefault();
	    window.open($(this).attr('href'));
	    return false;
	});
	
	//ajax form process
	//injection du formulaire en ajax dans le dom
	$('a.ajax-form, a.ajax-form.edit-cat, a.ajax-form.sup-cat, a.ajax-form.sup-doc').live('click', function(evt){
		evt.preventDefault();
		console.log("this et href : "+$(this).attr('href'));
		
		var form_url = '/intranet/forms/' + $(this).attr('href')+'/';
		var ref_segments = $(this).attr('href').split('/');
		var type = '.'+ref_segments[0];
		var current_categorie_id = '.'+ref_segments[1];
		var tmp_form_id_class = '.'+ref_segments[2];
		var is_table = $(this).is(".table");
		var current_selector = this;

		console.log("type : "+ type);
		console.log("current_selector : "+ current_selector);
		console.log("current_selector");
		console.log(current_selector);

		var is_Sidetab = $(this).parents('div.sidetab').attr('id');
		console.log('is_Sidetab : '+is_Sidetab);
		var currentSidetab;
		if(is_Sidetab){
			currentSidetab = '#'+ is_Sidetab;
		} else {
			currentSidetab = 'table';
		};

		var currentIndex = $(this).parents('tr').index();

		aTabIndex = $(this).parents('li').index();
		
		console.log("is_Sidetab : "+is_Sidetab);
		console.log("currentSidetab : "+currentSidetab);
		console.log("currentIndex : "+currentIndex);
		console.log("aTabIndex : "+aTabIndex);

		switch ( type ) {
				// STM creation sous-rubrique
				 case '.new-sous-rubrique':
					$.get(form_url,
						function(data){
							$(data).insertAfter( $('#main-nav a.new-sous-rubrique').eq( aTabIndex -1 ) );
						})
				break;
				
				// STM edit sous-rubrique
				// STM suppression sous-rubrique
				case '.edit-sous-rubrique':
				case '.sup-sous-rubrique':

					var rubriqueIndex = $(this).parents('li').parents('li').index();
					var rubriqueNav = $('#main-nav li').not('#main-nav ul li ul li').eq(rubriqueIndex);
			
					$.get(form_url,
						function(data){		 
							$(data).insertAfter( $('li',rubriqueNav).eq(aTabIndex-3));
						})
				break;
				// STM fin sous-rubrique

				case '.new-cat':
					$.get(form_url,
						function(data){
							$('a.button.new-cat, a.button-link.new-cat').hide();
							$(data).insertAfter( $('a.button.new-cat, a.button-link.new-cat') );	
						})
				break;
			
				case '.edit-cat' :
					$.get(form_url,
						function(data){
							$(data).insertAfter( $('div.picto-edit-cat').eq( aTabIndex ) );	
						})
				break;

				case '.sup-cat' :
					$.get(form_url,
						function(data){
							$(data).insertAfter( $('div.picto-edit-cat').eq( aTabIndex ) );	
						})
				break;
				
				case '.edit-doc' :
					if( $(type).length ){ 	
						$(type).slideDown('slow').css('display', 'none').fadeIn('fast').css('opacity',100); 
					} else {
						$('.container').slideUp('fast').remove();
						$.get(form_url, 
							function(data){
								if( is_table ){
									data = '<tr class="'+ ref_segments[2] +' black"><td colspan="8">'+ data +'</td></tr>';
									$(data).insertAfter( $('tr',currentSidetab).eq(currentIndex+1) );
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								} else {
									$(data).insertAfter(current_categorie_id,currentSidetab);
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								}	
							});
					}
				break;
				case '.edit-doc-orph' :
					if( $(type).length ){ 	
						$(type).slideDown('slow').css('display', 'none').fadeIn('fast').css('opacity',100); 
					} else {
						$('.container').slideUp('fast').remove();
						
						$.get(form_url, 
							function(data){
								if( is_table ){
									data = '<tr class="'+ ref_segments[2] +' black"><td colspan="8">'+ data +'</td></tr>';
									$(data).insertAfter( $('tr',currentSidetab).eq(currentIndex+12) );
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								} else {
									$(data).insertAfter(current_categorie_id,currentSidetab);
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								}	
							});
					}
				break;
				case '.new-doc' :
					if( $(type).length ){ 	
						return;
					} else {
						$('.container').slideUp('fast').remove();
						$.get(form_url, 
							function(data){
									$(data).insertAfter( $(current_categorie_id,currentSidetab) );
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
							});
					}
				break;
				//STM deplace doc			
				case '.deplace-doc' :
					if( $(type).length ){ 	
						$(type).slideDown('slow').css('display', 'none').fadeIn('fast').css('opacity',100); 
					} else {
						$('.container').slideUp('fast').remove();
						$.get(form_url, 
							function(data){
								console.log("current_selector");
								console.log(current_selector);
								if( is_table ){
									data = '<tr class="'+ ref_segments[2] +' black"><td colspan="8">'+ data +'</td></tr>';
									$(data).insertAfter( $('tr',currentSidetab).eq(currentIndex+1) );
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								} else {
									$(data).insertAfter(current_categorie_id,currentSidetab);
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								}	
							});
					}
				break;

				case '.deplace-doc-orph' :
					if( $(type).length ){ 	
						$(type).slideDown('slow').css('display', 'none').fadeIn('fast').css('opacity',100); 
					} else {
						$('.container').slideUp('fast').remove();
						$.get(form_url, 
							function(data){
								console.log("current_selector");
								console.log(current_selector);
								if( is_table ){
									data = '<tr class="'+ ref_segments[2] +' black"><td colspan="8">'+ data +'</td></tr>';
									$(data).insertAfter( $('tr',currentSidetab).eq(currentIndex+12) );
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								} else {
									$(data).insertAfter(current_categorie_id,currentSidetab);
									$('container_'+tmp_form_id_class).slideDown('slow').css('display', 'none').fadeIn('fast').css('display', 'block');				
								}	
							});
					}
				break;
				//STM fin deplace doc	
				case '.sup-doc' :
					$.get(form_url,
						function(data){
							console.log("current_selector");
							console.log(current_selector);
							$(data).insertAfter(current_selector);
						});	
				break;	
				} //end switch	
	});
	$('.change_input_file').live( 'click', function(){
		$(this).parent().empty().html('<input class="fileupload" name="fields[document]" type="file"/>').next('input').remove();
	});

//close form
	$('.close').live('click',
			function () {
				var container = '.container_' + $(this).parents('form').attr('id');
				$(container).slideUp(500, function(){ 
						$(this).closest('tr').remove(); 
						$(container).remove();
						}
					).delay( 1000, function(){
							if( $('.button.new-cat, .button-link.new-cat').length )
							{
								$('.button.new-cat, .button-link.new-cat').show();
							}
				});
								
				return false;
			}
		);

	$('.close-simple').live('click',
			function () {
				var container = '.container_' + $(this).parents('form').attr('id');
				$(container).slideUp(500);
				$(container).remove();
				if( $('.button.new-cat, .button-link.new-cat').length )
							{
								$('.button.new-cat, .button-link.new-cat').show();
							}
								
				return false;
			}
		);

// survol li
$('nav.sidetab-switch li').mouseover(function(){ $(this).find('div.picto-edit-cat').show(); }).mouseleave( function(){ $(this).find('div.picto-edit-cat').hide(); })
$('#main-nav ul li ul li').mouseover(function(){ $(this).find('div.pen-sous-rubrique').show(); }).mouseleave( function(){ $(this).find('div.pen-sous-rubrique').hide(); })		

});

// show members list

$('a.showMembers').live('click', 
	function (evt) {
		evt.preventDefault();
		$(this).parent().find('ul').slideToggle();
	});