<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/deplace-document.xsl"/>

<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
	<!-- types : new-doc ; edit-doc ; new-cat ; new-sous-rubrique ; deplace-doc -->
	<!-- paramètres url : type/cat_id/tmp_form_id/sous_rub_id/doc_id/rub_id -->

<xsl:variable name="id_auteur"><xsl:value-of select="/data/intranet-document/entry[@id=$doc_id]/auteur/item/@id"/></xsl:variable>


<xsl:if test="($type = 'new-doc' or $type = 'edit-doc')">

<!-- new document -->
	<div>
		<xsl:attribute name="class">edit article-container black nested container_<xsl:value-of select="$tmp_form_id"/><xsl:text> </xsl:text><xsl:value-of select="$type"/></xsl:attribute>
	<!-- new document -->
	<section>
		<form id="{$tmp_form_id}" method="post" action="" enctype="multipart/form-data">
		
		<xsl:if test="$doc_id">
			<input name="id" value="{$doc_id}" type="hidden"/>
		</xsl:if>	
		
		 	<fieldset>
		 		<legend>Information sur le document</legend>
			 	<dl>
				 	<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
				 	<input name="fields[publie]" type="hidden" value="No" />
				  	<dt><label>Nom</label></dt>
				    <dd><input name="fields[nom-du-document]" type="text" class="medium" value="{/data/intranet-document/entry[@id=$doc_id]/nom-du-document}" /></dd>

				  	<dt><label>Auteur</label></dt>
				   	<dd>
					   <xsl:choose>
				   			<xsl:when test="$type= 'edit-doc'">
				   			   	<select name="fields[auteur]">
				   			   			<option value="{/data/intranet-membres/entry[@id = $id_auteur]/@id}">
					   			   			<xsl:value-of select="/data/intranet-membres/entry[@id = $id_auteur]/identifiant"/></option>
					   			</select>
				   			</xsl:when>
				   			<xsl:otherwise>
				   				<select name="fields[auteur]">
				   					<option value="{$member-id}"><xsl:value-of select="/data/intranet-membres/entry[@id = $member-id]/identifiant"/></option>
				   				</select>
				   			</xsl:otherwise>
				   		</xsl:choose>	
				   	</dd>
				  	
				  	<dt><label>Date</label></dt>
					
					<xsl:variable name="current-date">
						<xsl:choose>
							<xsl:when test="$type= 'edit-doc'">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="/data/intranet-document/entry[@id=$doc_id]/date/date/start"/>
									<xsl:with-param name="format" select="'d M Y'"/>
								</xsl:call-template>
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="$today"/>
									<xsl:with-param name="format" select="'d M Y'"/>
								</xsl:call-template>
							</xsl:otherwise>
						</xsl:choose>	
					</xsl:variable>

				    <dd><input name="fields[date][start][]" type="text" class="datepicker medium" value="{$current-date}" /></dd>
				  	
				  	<dt><label>Document</label></dt>
				    
					<xsl:choose>    
				    	<xsl:when test="$doc_id">
					    	<dd class="file-name">
						   		<a class="view" href="http://docs.google.com/viewer?url={$workspace}{/data/intranet-document/entry[@id=$doc_id]/document/@path}/{/data/intranet-document/entry[@id=$doc_id]/document/filename}" title="Voir dans google viewer" target="_blank" rel="tooltip"><xsl:value-of select="/data/intranet-document/entry[@id=$doc_id]/document/filename"/></a>
						    	<a class="button-link left-25 change_input_file" href="#">Supprimer le fichier</a>
							</dd>
					    	<input name="fields[document]" type="hidden" value="{/data/intranet-document/entry[@id=$doc_id]/document/@path}/{/data/intranet-document/entry[@id=$doc_id]/document/filename}" />
				   		</xsl:when>
				    	<xsl:otherwise>
					    	<dd><input name="fields[document]" type="file"/></dd>
						</xsl:otherwise>
					</xsl:choose>  	
			  	
			  		<xsl:if test="$member-role = 'Administrateur'">
			  			<dt><label>Publié</label></dt>
				   		<dd>
					    	<xsl:element name="input">
					    		<xsl:attribute name="type">checkbox</xsl:attribute>
					    		<xsl:attribute name="name">fields[publie]</xsl:attribute>
								<xsl:if test="(/data/intranet-document/entry[@id=$doc_id]/publie='Yes' or $type = 'new-doc')">
									<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
							</xsl:element>
						</dd>	
			 		</xsl:if>
				  	<input name="fields[categorie]" type="hidden" value="{$cat_id}" />
				</dl>	
			</fieldset>

			<fieldset>
				<legend>Envoyer une notification</legend>
				<dl>
					<dt><label>Destinataires</label><br />Utilisez la touche Cmd(mac) ou Ctrl(pc) pour sélectionner plusieurs membres.</dt>
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

</xsl:if>

<!-- STM deplacer un document-->

<xsl:if test="($type = 'deplace-doc')">
	<xsl:call-template name="deplace-document"/>
</xsl:if> <!-- fin deplacer un document-->


<xsl:if test="($type = 'sup-doc' )">
<!-- sup document -->
	
	<div class="{$type} container_{$tmp_form_id}">
			<form id="{$tmp_form_id}" method="post" action="/ajaxvalidate/" enctype="multipart/form-data">
			<xsl:if test="$doc_id">
				<input name="id" value="{$doc_id}" type="hidden"/>
			</xsl:if>	

		  		<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
		  		
				  	<label>Voulez-vous vraiment supprimer le document : "<xsl:value-of select="/data/intranet-document/entry[@id=$doc_id]/nom-du-document"/>" ?</label>
					<input name="fields[nom-du-document]" type="hidden" value="{/data/intranet-document/entry[@id=$doc_id]/nom-du-document}" />
					<input name="fields[auteur]" type="hidden" value="{/data/intranet-membres/entry[@id = $id_auteur]/@id}"/>
					<xsl:variable name="current-date">
						<xsl:call-template name="format-date">
							<xsl:with-param name="date" select="/data/intranet-document/entry[@id=$doc_id]/date/date/start"/>
							<xsl:with-param name="format" select="'d M Y'"/>
						</xsl:call-template>
					</xsl:variable>

				    <input name="fields[date][start][]" type="hidden" value="{$current-date}" />

					<input name="fields[categorie]" type="hidden" value="{$cat_id}" />					
					<input type="hidden" name="fields[publie]" value="no"/>
					<input type="hidden" name="fields[actif]" value="no"/>
			  	<!-- this will be added to the submit url as an additional url param -->
			  		<input class="button red" name="action[add-documents]" type="submit" value="Oui"/>
					<a href="#" class="button-link green close-simple {$tmp_form_id}" title="Non">Non</a>						
			</form>
	</div>
	
<script type="text/javascript">

	var root = "<xsl:value-of select='$root'/>";
	var form_id = "<xsl:value-of select='$tmp_form_id'/>";
	var form_id_selector = '#'+ form_id;
	var form_id_class='.'+ form_id;
	var cat_id_class = "<xsl:value-of select='concat(".", $cat_id)'/>";
		$('.fileupload').customFileInput();
		$('.datepicker').datepick({ pickerClass: 'jq-datepicker', dateFormat: 'dd MM yyyy' });

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

   return XMLHttpRequest; 
} 
 
// post-submit callback 
function showResponse(responseXML)  { 
 
    var message = $( responseXML ).find( 'message' ).text()+"<br/>";
						
		$( responseXML ).find( 'add-documents' ).children()
												.each(function (){
					   							if ( $(this).attr('message') )
					   							{
					   								message+=$(this).attr('message')+"<br/>";
						   								
									   			}
									   		});

    var result=$( responseXML ).find( 'add-documents' ).attr('result');

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
									$(this).slideUp(600);
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

</xsl:if>

<!-- STM creation nouvelle sous-rubrique -->
<xsl:if test="($type = 'new-sous-rubrique' )">
	<div class="{$type} container_{$tmp_form_id}">
		<form id="{$tmp_form_id}" method="post" action="/ajaxvalidate/" enctype="multipart/form-data">
		  		<input name="MAX_FILE_SIZE" type="hidden" value="33554432" />
				  	<label>Sous-rubrique</label>
					<input name="fields[nom]" type="text" />
					<input name="fields[rubrique-parente]" type="hidden" value="{$rub_id}" />
			  	<!-- this will be added to the submit url as an additional url param -->
            		<input type="hidden" value="hello-world" name="fields[entry]"/>
            		<input type="hidden" value="Yes" name="fields[actif]"/>
			  		<input class="button green" name="action[add-sous-rubrique]" type="submit" value="Envoyer" />
					<a href="#" class="button-link close {$tmp_form_id}" title="Fermer le formulaire">Annuler</a>
		</form>
	</div>
	
		<script>
			$('.fileupload').customFileInput();
		$('.datepicker').datepick({ pickerClass: 'jq-datepicker' });
	var root = "<xsl:value-of select='$root'/>";
	var form_id = "<xsl:value-of select='$tmp_form_id'/>";
	var form_id_selector = '#'+ form_id;
	var form_id_class='.'+ form_id;
	var rub_id_class = "<xsl:value-of select='concat(".", $rub_id)'/>";
	
	//ajaxForm solution
 var options = { 
        beforeSubmit:  showRequest,  // pre-submit callback 
        success:       showResponse,  // post-submit callback 
 
        // other available options: 
        url:       root+'/form-traitement-xml/',        // override for form's 'action' attribute 
        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
        dataType:  'xml',       // 'xml', 'script', or 'json' (expected server response type) 
        clearForm: false,        // clear all form fields after successful submit 
        resetForm: false        // reset the form after successful submit 
     }; 
 
    // bind form using 'ajaxForm' 
    $(form_id_selector).ajaxForm(options); 

// pre-submit callback 
function showRequest(formData, jqForm, options) { 

 	jqForm.validate();
   
 	//show overlay loader	
 	$('#overLoader').show();

    return XMLHttpRequest; 
} 
 
// post-submit callback 
function showResponse(responseXML)  { 
 
    var message = $( responseXML ).find( 'message' ).text()+"<br/>";
	
				
		$( responseXML ).find( 'add-sous-rubrique' ).children()
												.each(function (){
					   							if ( $(this).attr('message') )
					   							{
					   								message+=$(this).attr('message')+"<br/>";
						   								
									   			}
									   		});

    var result=$( responseXML ).find( 'add-sous-rubrique' ).attr('result');

		if(result=='success')
		{
		 	 
		 	$(form_id_class).hide();
			$('.notification.edit').slideUp(100).remove();
			$('.notification.information').remove();
			$('div.new-sous-rubrique').remove();

		 	var result = '<a class="close-notification" rel="tooltip" title="Fermer">X</a><p>Félicitation !<br />'+message+'</p>';
				$('.notification').addClass('success')
									.empty()
									.html(result)
									.fadeIn('slow')
									.animate({opacity:1.0},3000)
									.fadeOut('slow', function () {
									$(this).slideUp(600);
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

</xsl:if> <!-- STM fin creation nouvelle sous-rubrique -->

<!-- creation nouvelle catégorie -->
<xsl:if test="$type = 'new-cat'">
	<div class="{$type} container_{$tmp_form_id}">
			<form id="{$tmp_form_id}" method="post" action="/ajaxvalidate/" enctype="multipart/form-data">
		  		<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
				  	<label>Nom</label>
					<input name="fields[nom]" type="text" />
					<input name="fields[sous-rubrique-parente]" type="hidden" value="{$sous_rub_id}" />
				
			  	<!-- this will be added to the submit url as an additional url param -->
            		<input type="hidden" value="hello-world" name="fields[entry]"/>
            		<input type="hidden" value="Yes" name="fields[actif]"/>
            		<input type="hidden" value="{$member-id}" name="fields[auteur]"/>
			  		<input class="button green" name="action[add-categorie]" type="submit" value="Envoyer" />
					<a href="#" class="button-link close-simple {$tmp_form_id}" title="Fermer le formulaire">Annuler</a>						
			</form>
	</div>
	
		<script>
			$('.fileupload').customFileInput();
		$('.datepicker').datepick({ pickerClass: 'jq-datepicker' });
	var root = "<xsl:value-of select='$root'/>";
	var form_id = "<xsl:value-of select='$tmp_form_id'/>";
	var form_id_selector = '#'+ form_id;
	var form_id_class='.'+ form_id;
	var cat_id_class = "<xsl:value-of select='concat(".", $cat_id)'/>";
	
	//ajaxForm solution
 var options = { 
        beforeSubmit:  showRequest,  // pre-submit callback 
        success:       showResponse,  // post-submit callback 
 
        // other available options: 
        url:       root+'/form-traitement-xml/',        // override for form's 'action' attribute 
        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
        dataType:  'xml',       // 'xml', 'script', or 'json' (expected server response type) 
        clearForm: false,        // clear all form fields after successful submit 
        resetForm: false        // reset the form after successful submit 
     }; 
 
    // bind form using 'ajaxForm' 
    $(form_id_selector).ajaxForm(options); 

// pre-submit callback 
function showRequest(formData, jqForm, options) { 

 	jqForm.validate();
    	
 	$('#overLoader').show();

    return XMLHttpRequest; 
} 
 
// post-submit callback 
function showResponse(responseXML)  { 
 
    var message = $( responseXML ).find( 'message' ).text()+"<br/>";
	
				
		$( responseXML ).find( 'add-categorie' ).children()
												.each(function (){
					   							if ( $(this).attr('message') )
					   							{
					   								message+=$(this).attr('message')+"<br/>";
						   								
									   			}
									   		});

    var result=$( responseXML ).find( 'add-categorie' ).attr('result');

		if(result=='success')
		{
		 	 
		 	$(form_id_class).hide();
			$('.notification.edit').slideUp(100).remove();
			$('.notification.information').remove();

		 	var result = '<a class="close-notification" rel="tooltip" title="Fermer">X</a><p>Félicitation !<br />'+message+'</p>';
				$('.notification').addClass('success')
									.empty()
									.html(result)
									.fadeIn('slow')
									.animate({opacity:1.0},3000)
									.fadeOut('slow', function () {
									$(this).slideUp(600);
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
</xsl:if> <!-- fin creation nouvelle catégorie-->

<xsl:if test="$type = 'edit-cat'">
	<div class="{$type} container_{$tmp_form_id}">
			<form id="{$tmp_form_id}" method="post" action="/ajaxvalidate/" enctype="multipart/form-data">
			<xsl:if test="$sous_rub_id">
				<input name="id" value="{$sous_rub_id}" type="hidden"/>
			</xsl:if>	

		  		<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
		  		
				  	<label>Nom</label>
					<input name="fields[nom]" type="text" value="{/data/intra-all-categories/entry[@id=$sous_rub_id]/nom}" />
					
					<input name="fields[sous-rubrique-parente]" type="hidden" value="{$rub_id}" />
				
			  	<!-- this will be added to the submit url as an additional url param -->
            		<input type="hidden" value="hello-world" name="fields[entry]"/>
            		<input type="hidden" name="fields[actif]" value="Yes"/>
			  		<input class="button green" name="action[add-categorie]" type="submit" value="Envoyer" />
			  		<input class="button red" name="action[delete-categorie]" type="submit" value="Supprimer" />
					<a href="#" class="button-link close {$tmp_form_id}" title="Fermer le formulaire">Annuler</a>						
			</form>
	</div>
	
		<script>
			$('.fileupload').customFileInput();
		$('.datepicker').datepick({ pickerClass: 'jq-datepicker' });
	var root = "<xsl:value-of select='$root'/>";
	var form_id = "<xsl:value-of select='$tmp_form_id'/>";
	var form_id_selector = '#'+ form_id;
	var form_id_class='.'+ form_id;
	var cat_id_class = "<xsl:value-of select='concat(".", $cat_id)'/>";
	
	//ajaxForm solution
 var options = { 
        beforeSubmit:  showRequest,  // pre-submit callback 
        success:       showResponse,  // post-submit callback 
 
        // other available options: 
        url:       root+'/form-traitement-xml/',        // override for form's 'action' attribute 
        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
        dataType:  'xml',       // 'xml', 'script', or 'json' (expected server response type) 
        clearForm: false,        // clear all form fields after successful submit 
        resetForm: false        // reset the form after successful submit 
     }; 
 
    // bind form using 'ajaxForm' 
    $(form_id_selector).ajaxForm(options); 

// pre-submit callback 
function showRequest(formData, jqForm, options) { 

 	jqForm.validate();
   
 	//show overlay loader	
 	$('#overLoader').show();

    return XMLHttpRequest; 
} 
 
// post-submit callback 
function showResponse(responseXML)  { 
 
    var message = $( responseXML ).find( 'message' ).text()+"<br/>";
	
				
		$( responseXML ).find( 'add-categorie' ).children()
												.each(function (){
					   							if ( $(this).attr('message') )
					   							{
					   								message+=$(this).attr('message')+"<br/>";
						   								
									   			}
									   		});

    var result=$( responseXML ).find( 'add-categorie' ).attr('result');

		if(result=='success')
		{
		 	 
		 	$(form_id_class).hide();
			$('.notification.edit').slideUp(100).remove();
			$('.notification.information').remove();
			$('div.edit-cat').remove();

		 	var result = '<a class="close-notification" rel="tooltip" title="Fermer">X</a><p>Félicitation !<br />'+message+'</p>';
				$('.notification').addClass('success')
									.empty()
									.html(result)
									.fadeIn('slow')
									.animate({opacity:1.0},3000)
									.fadeOut('slow', function () {
									$(this).slideUp(600);
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
</xsl:if>

<xsl:if test="$type = 'sup-cat'">
	<div class="{$type} container_{$tmp_form_id}">
			<form id="{$tmp_form_id}" method="post" action="/ajaxvalidate/" enctype="multipart/form-data">
			<xsl:if test="$sous_rub_id">
				<input name="id" value="{$sous_rub_id}" type="hidden"/>
			</xsl:if>	

		  		<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
		  		
				  	<label>Voulez-vous vraiment supprimer la catégorie : "<xsl:value-of select="/data/intra-all-categories/entry[@id=$sous_rub_id]/nom"/>" et tout ses documents ?</label>
					<input name="fields[nom]" type="hidden" value="{/data/intra-all-categories/entry[@id=$sous_rub_id]/nom}" />
					
					<input name="fields[sous-rubrique-parente]" type="hidden" value="{$rub_id}" />
					<input type="hidden" name="fields[actif]" value="no"/>
			  	<!-- this will be added to the submit url as an additional url param -->
			  		<input class="button red" name="action[add-categorie]" type="submit" value="Oui" />
					<a href="#" class="button-link green close {$tmp_form_id}" title="Fermer le formulaire">Non</a>						
			</form>
	</div>
	
		<script>
		// jQuery Custome File Input
			$('.fileupload').customFileInput();
		// jQuery DateInput
		$('.datepicker').datepick({ pickerClass: 'jq-datepicker' });
		// Notification Close Button
		$('.close-notification').live('click',
			function () {
				
				$(this).parent().fadeTo(150, 0, function () {$(this).slideUp(600);});
				return false;
			}
		);
	var root = "<xsl:value-of select='$root'/>";
	var form_id = "<xsl:value-of select='$tmp_form_id'/>";
	var form_id_selector = '#'+ form_id;
	var form_id_class='.'+ form_id;
	var cat_id_class = "<xsl:value-of select='concat(".", $cat_id)'/>";
	
	//ajaxForm solution
 var options = { 
        beforeSubmit:  showRequest,  // pre-submit callback 
        success:       showResponse,  // post-submit callback 
 
        // other available options: 
        url:       root+'/form-traitement-xml/',        // override for form's 'action' attribute 
        type:      'post',        // 'get' or 'post', override for form's 'method' attribute 
        dataType:  'xml',       // 'xml', 'script', or 'json' (expected server response type) 
        clearForm: false,        // clear all form fields after successful submit 
        resetForm: false        // reset the form after successful submit 
     }; 
 
    // bind form using 'ajaxForm' 
    $(form_id_selector).ajaxForm(options); 

// pre-submit callback 
function showRequest(formData, jqForm, options) { 

 	jqForm.validate();
    
 	//show overlay loader	
 	$('#overLoader').show();

    // here we could return false to prevent the form from being submitted; 
    // returning anything other than false will allow the form submit to continue 
    return XMLHttpRequest; 
} 
 
// post-submit callback 
function showResponse(responseXML)  { 
 
    var message = $( responseXML ).find( 'message' ).text()+"<br/>";
	
				
		$( responseXML ).find( 'add-categorie' ).children()
												.each(function (){
					   							if ( $(this).attr('message') )
					   							{
					   								message+=$(this).attr('message')+"<br/>";
						   								
									   			}
									   		});

    var result=$( responseXML ).find( 'add-categorie' ).attr('result');

		if(result=='success')
		{
		 	 
		 	$(form_id_class).hide();
			$('.notification.edit').slideUp(100).remove();
			$('.notification.information').remove();
			$('div.edit-cat').remove();

		 	var result = '<a class="close-notification" rel="tooltip" title="Fermer">X</a><p>Félicitation !<br />'+message+'</p>';
				$('.notification').addClass('success')
									.empty()
									.html(result)
									.fadeIn('slow')
									.animate({opacity:1.0},3000)
									.fadeOut('slow', function () {
									$(this).slideUp(600);
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
</xsl:if>
</xsl:template>

</xsl:stylesheet>