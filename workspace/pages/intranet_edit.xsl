<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/date-time.xsl"/>

<xsl:template match="/">
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta charset="UTF-8"/>
	<title>Intranet | Mab France</title>
	<meta name="description" content=""/>
	<meta name="author" content=""/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<link rel="shortcut icon" href="/favicon.ico"/>
	<link rel="apple-touch-icon" href="/apple-touch-icon.png"/>
	
	<!-- CSS Styles -->
	<link rel="stylesheet" href="{$workspace}/intranet/css/style.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/colors.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.tipsy.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.wysiwyg.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.datatables.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.nyromodal.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.datepicker.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.fileinput.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.fullcalendar.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.visualize.css"/>
	
	<!-- Google WebFonts -->
	<link href='http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic' rel='stylesheet' type='text/css'/>
	
	<script src="{$workspace}/intranet/js/libs/modernizr-1.7.min.js"></script>
</head>
<body class="popup">
	<section role="main">
		<form method="post" action="" enctype="multipart/form-data">
		  <fieldset>
		  	<legend>Modifier les informations</legend>
			  <input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
			  <input name="id" type="hidden" value="{data/intra-document/entry/@id}"/>
			  <dl>
				  <dt><label>Nom</label></dt>
				  <dd><input name="fields[nom]" class="medium" type="text" value="{data/intra-document/entry/nom}" /></dd>

				 <!-- ************************************* -->
				  
				  <dt><label>Auteur</label></dt>
				  <dd><input name="fields[auteur]" class="medium" type="text" value="{data/intra-document/entry/auteur}"/></dd>

				 <!-- ************************************* -->

				  <dt><label>Date</label></dt>
				  <dd><input name="fields[date][start][]" type="text" class="datepicker medium">
					  <xsl:attribute name="value">
					  	<xsl:call-template name="format-date">
							<xsl:with-param name="date" select="data/intra-document/entry/date/date/start"/>
							<xsl:with-param name="format" select="'d M Y'"/>
						</xsl:call-template>
					  </xsl:attribute>
				  </input></dd>


				 <!-- ************************************* -->
				 
				  <dt><label>Fichier joint</label></dt>
				  <xsl:choose>
				  
				  	<xsl:when test="data/intra-document/entry/fichier-joint != ''">
				  		<dd class="file text">
				  		<a href="{$workspace}{/data/intra-document/entry/fichier-joint/@path}/{data/intra-document/entry/fichier-joint/filename}" title="supprimer" class="text">
				  			<xsl:value-of select="/data/intra-document/entry/fichier-joint/filename"/></a>
				  			<a href="#" class="button-link switch left-25">Supprimer</a></dd>
				  		<dd style="display:none" class="cfile"><input class="fileupload" name="fields[fichier-joint]" type="file" /></dd>
	
				  	</xsl:when>
				 
				  	<xsl:otherwise>
				  		<dd><input class="fileupload" name="fields[fichier-joint]" type="file" /></dd>
				  	</xsl:otherwise>
				  </xsl:choose>
				 
				 <!-- ************************************* -->
				 
				  <dt><label>Publié</label></dt>
				  <dd><input type="checkbox">
				  		<xsl:if test="/data/intra-document/entry/publie = 'Yes'">
				  			<xsl:attribute name="checked"></xsl:attribute>
				  			</xsl:if>
				  	</input>
				  </dd>

				 <!-- ************************************* -->
				  
				  <dt><label>Catégorie</label></dt>	
				  	<dd><select name="fields[categorie]">
				  		<xsl:for-each select="/data/intra-categories-filtre-par-sous-rubrique/entry">
				  			<option value="{@id}">
				  				<xsl:if test="@id = /data/intra-document/entry/categorie/item/@id"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
				  				<xsl:value-of select="nom"/></option>
				  		</xsl:for-each>
				  	</select></dd>
				</dl>
			</fieldset>
			<button name="action[add-documents]" type="submit" value="Envoyer">Envoyer</button>
		</form>
</section>
		<!-- JS Libs at the end for faster loading -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<xsl:text disable-output-escaping="yes"><![CDATA[<script>!window.jQuery && document.write(unescape('%3Cscript src="js/jquery/jquery-1.5.1.min.js"%3E%3C/script%3E'))</script>]]></xsl:text>
	<script src="{$workspace}/intranet/js/libs/selectivizr.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.nyromodal.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.tipsy.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.wysiwyg.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.datatables.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.datepicker.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.fileinput.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.fullcalendar.min.js"></script>
	<script src="{$workspace}/intranet/js/jquery/excanvas.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.visualize.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.visualize.tooltip.js"></script>
	<script src="{$workspace}/intranet/js/script.js"></script>
	
	<xsl:text disable-output-escaping="yes"><![CDATA[<script>
		var _gaq=[['_setAccount','UA-XXXXXXX'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>]]></xsl:text>
</body>
</html>		

</xsl:template>

</xsl:stylesheet>