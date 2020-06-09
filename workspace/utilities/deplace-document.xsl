<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:math="http://exslt.org/math">

	<xsl:import href="../utilities/date-time.xsl"/>
	<xsl:import href="../utilities/get-file-extension.xsl"/>
<!-- ********************************************************************* -->
<!-- ******* 2020/06  **************************************************** -->	
<!-- template appelé par la page intranet-form 
	c'est le formulaire qui permet de déplacer un document 
	rubrique/sous-rubrique/catégorie
	accessible unuiquement aux admin
	par un icone sur le tableau de bord et les autres affichages-->
<!-- ********************************************************************* -->

	<xsl:template name="deplace-document">

	<div>
		<xsl:attribute name="class">edit article-container black nested container_<xsl:value-of select="$tmp_form_id"/><xsl:text> </xsl:text><xsl:value-of select="$type"/></xsl:attribute>
	
		<section>
			<form id="{$tmp_form_id}" method="post" action="" enctype="multipart/form-data">
		
				<xsl:if test="$doc_id">
					<input name="id" value="{$doc_id}" type="hidden"/>
				</xsl:if>	
		
		 		<fieldset>
		 			<legend>Information sur le document</legend>
			 		<dl>
					 	<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
					  	<dt><label>Nom</label></dt>
					    <dd><input name="fields[nom-du-document]" type="text" class="medium" value="{/data/intranet-document/entry[@id=$doc_id]/nom-du-document}" /></dd>
						<!-- STM ajout des rubriques, sous-rubriques et categories -->
						<!-- paramètres url : type/cat_id/tmp_form_id/sous_rub_id/doc_id/rub_id -->
						<dt><label>Rubrique<br/>Sous-rubrique<br/>Catégorie</label></dt>
					    <dd>
							<div class="quarter-block">
								<select id="deplace-rubrique" name="fields[rubrique][]" size="3">
									<xsl:for-each select="data/liste-rubrique/entry">
						   			<option value="{deplace-rubrique}"><xsl:value-of select="nom"/></option>
									</xsl:for-each>
								</select>
							</div>
							<div class="quarter-block">
								<select id="deplace-sous-rubrique" name="fields[sous-rubrique][]" size="8">
									<xsl:for-each select="data/liste-sous-rubrique/entry">
						   			<option value="{deplace-sous-rubrique}"><xsl:value-of select="nom"/></option>
									</xsl:for-each>
								</select>
							</div>
							<div class="quarter-block">
								<select id="deplace-categorie" name="fields[catégorie][]" size="8">
									<xsl:for-each select="data/liste-sous-rubrique/entry">
						   			<option value="{deaplce-categorie}"><xsl:value-of select="nom"/></option>
									</xsl:for-each>
								</select>
							</div>
							<div class="rubrique-notifie"></div>
						</dd>
						<!-- STM fin ajout des rubriques, sous-rubriques et categories -->
				  		<input name="fields[categorie]" type="hidden" value="{$cat_id}" />
					</dl>	
				</fieldset>

			<fieldset>
				<legend>Envoyer une notification</legend>
				<dl>
					<dt><label>Destinataires</label><br/>Utilisez la touche Cmd(mac) ou Ctrl(pc) pour sélectionner plusieurs membres.</dt>
					<div class="quarter-block">
						<select id="notifier" name="fields[notifications][]" multiple="multiple" size="8">
							<xsl:for-each select="/data/intranet-membres/entry">
						   		<option value="{email}"><xsl:value-of select="identifiant"/></option>
							</xsl:for-each>
						</select>
					</div>
					<div class=""><p>Chaque membre sélectionné recevra un email l'informant de la mise en ligne de votre document.</p></div>
					<div class=""><a class="button-link select-all">Tous</a><a class="button-link deselect-all">Aucun</a></div>
					<div class="liste-notifie"></div>
				</dl>
			</fieldset>
				<input name="fields[actif]" type="hidden" value="yes"/>
				<input class="{$tmp_form_id} button green input-add" type="submit" value="Envoyer"/>
				<a href="#" class="button-link close {$tmp_form_id}" title="Fermer le formulaire">Annuler</a>
				<input name="action[add-documents]" class="input-add" type="hidden"/>

		</form>
		</section>
	</div>

	<script type="text/javascript">
	var root = "<xsl:value-of select='$root'/>";
	var form_id = "<xsl:value-of select='$tmp_form_id'/>";
	var form_id_selector = '#'+ form_id;
	var form_id_class='.'+ form_id;
	var cat_id_class = "<xsl:value-of select='concat(".", $cat_id)'/>";
	
	$('.fileupload').customFileInput();
	$('.datepicker').datepick({ pickerClass: 'jq-datepicker', dateFormat: 'dd MM yyyy' });

	$("select#notifier").live('change',function () {
          var str = "";
          $("select#notifier option:selected").each(function () {
                str += '<a id="'+ $(this).index() +'" class="button-link button-close">'+ $(this).text() + '</a> ';
              });
          $(".liste-notifie").html(str);
        	//check if notifications selected or not and put the right value for form action.
			//console.log($('select#notifier option:selected').length);
          if($('select#notifier option:selected').length == 0){
          	$('.input-add').attr('name','action[add-documents]')
          }else{
          	$('.input-add').attr('name','action[add-documents-with-notifications]')
          }
        })
        .change();	

	$('.select-all').click( function(){
		$('select#notifier option').attr('selected','selected').change();
	});

	$('.deselect-all').click( function(){
		$('select#notifier option').removeAttr("selected").change();
	});
	$('a.button-close').live('click',function(){
		var select_id  = $(this).attr('id');
		console.log(select_id);
		console.log($('select#notifier option:eq('+select_id+')'));
		$('select#notifier option:eq('+select_id+')').attr("selected",false).change();
	});
	//ajaxForm solution
 	var options = { 
   	     //target:        '#messages',   // target element(s) to be updated with server response 
   	     beforeSubmit:  showRequest,  // pre-submit callback 
    	    success:       showResponse,  // post-submit callback 
 
        // other available options: 
        url:       root+'/form-traitement-xml/',        // override for form's 'action' attribute 
        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
        dataType:  'xml',       // 'xml', 'script', or 'json' (expected server response type) 
        clearForm: false,        // clear all form fields after successful submit 
        resetForm: false        // reset the form after successful submit 
 
        // $.ajax options can be used here too, for example: 
        //timeout:   3000 
    }; 
 
    // bind form using 'ajaxForm' 
    $(form_id_selector).ajaxForm(options); 
      
    // pre-submit callback 
	function showRequest(formData, jqForm, options) { 
 		jqForm.validate();
    
 		$('#overLoader').show();
		$('html, body').animate({
     	   scrollTop: $('body').offset().top
     	  }, 2000);

    	 return XMLHttpRequest; 
	} 
 
	// post-submit callback 
	function showResponse(responseXML)  { 
 
  		var message = $( responseXML ).find( 'message' ).text()+"<br/>";
						
			$( responseXML ).find( 'add-documents,add-documents-with-notifications' ).children()
												.each(function (){
					   							if ( $(this).attr('message') )
					   							{
					   								message+=$(this).attr('message')+"<br/>";
						   								
									   			}
									   		});

   		var result=$( responseXML ).find( 'add-documents,add-documents-with-notifications' ).attr('result');

		if(result=='success')
		{
		 	 
		 	$(form_id_class).hide();
			$('.notification.edit').slideUp(100).remove();

		 	var result = '<a class="close-notification" rel="tooltip" title="Fermer">X</a><p>Felicitation !<br />'+message+'</p>';
				$('.notification').addClass('success')
									.empty()
									.html(result)
									.fadeIn('slow')
									.animate({opacity:1.0},3000)
									.fadeOut('slow', function () {
									$(this).slideUp(600,function(){
										$('body').fadeIn('slow');
									}
									);
									location.reload();
								});
		}
		else if(result=='error')
		{
		 	var result = '<a class="close-notification" rel="tooltip" title="Fermer">X</a><p>Attention !<br />'+message+'</p>';
			$('.notification').addClass('error')
								.empty()
								.html(result)
								.fadeIn('slow')
								.animate({opacity:1.0},3000)
								.fadeOut('slow', function(){ $('#overLoader').hide(); });
 	
		} 
	}   
	</script>
	</xsl:template>
</xsl:stylesheet >