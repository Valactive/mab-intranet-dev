<?xml version="1.0" encoding="UTF-8"?>
<!-- template master biosphere -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:string="http://symphony-cms.com/functions"
	>

<xsl:import href="page-title-biosphere.xsl"/>
<xsl:import href="date-time.xsl"/>
<xsl:import href="mab-menu-secondaire.xsl"/>
<xsl:import href="mab-menu-footer.xsl"/>
<xsl:import href="menu-langue-biosphere.xsl"/>
<xsl:import href="get-actualites.xsl"/>
<xsl:import href="get-publications.xsl"/>
<xsl:import href="biosphere-diaporama.xsl"/>
<xsl:import href="string-utils.xsl"/>


<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="labels" select="/data/textes-statiques/entry"/>

<xsl:template match="/">
	<xsl:comment><![CDATA[[if IE 6]> <html lang="en" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html lang="en" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html lang="en" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 9]> <html lang="en" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if !(lte IE 9)]><!]]></xsl:comment> <html lang="en" class="no-js"> <xsl:comment><![CDATA[<![endif]]]></xsl:comment>
<xsl:comment>master-biosphere.xsl</xsl:comment>

	<head>

				<title>
					<xsl:choose>
						<xsl:when test="/data/action/entry/referencement-balise-title != ''">
							<xsl:value-of select="/data/action/entry/referencement-balise-title"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="page-title-biosphere"/>
						</xsl:otherwise>
					</xsl:choose>

				</title>
				<meta charset="utf-8"/>
		  <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		  Remove this if you use the .htaccess -->
		  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		  <xsl:choose>
		  	<xsl:when test="data/mab-une-actualite and $current-page='actualite'">
		  		<meta name="Description">
		  			<xsl:attribute name="content"><xsl:value-of select="data/mab-une-actualite/entry/texte"/></xsl:attribute>
		  		</meta>
		  	</xsl:when>
		  	<xsl:when test="/data/action/entry/referencement-balise-description != ''">
		  		<meta name="description">
		  			<xsl:attribute name="content"><xsl:value-of select="/data/action/entry/referencement-balise-description"/>
		  		</xsl:attribute>
		  	</meta>
		  </xsl:when>
		  <xsl:otherwise>
		  	<meta name="Description" content="Le comité MAB France anime au niveau national les activités menées dans le cadre du Programme MAB de l'UNESCO et coordonne les actions de développement durable dans les 10 réserves de biosphère françaises en favorisant les échanges d'information et d'expérience "/>
		  </xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="/data/action/entry/referencement-mots-cles != ''">
				<meta name="keywords">
					<xsl:attribute name="content">
						<xsl:value-of select="/data/action/entry/referencement-mots-cles"/>
					</xsl:attribute>
				</meta>
			</xsl:when>
			<xsl:otherwise>
				<meta name="keywords" content="MAB France, mab, Comité MAB France, Réserves de biosphère, Développement durable, programme mab, UNESCO, Comité français du mab, l'homme et la biosphère, Guadeloupe, Camargue, Cévennes, Luberon, Iroise, Ventoux, Fontainebleau, Tuamotu, Corse, Vosges"/>
			</xsl:otherwise>
		</xsl:choose>


		  <meta name="author" content="valactive"/>

		  <!-- Mobile viewport optimized: j.mp/bplateviewport -->
		  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		  <meta name="google-site-verification" content="AJta6kSh11NpeCGrwds_aC7awKODbNvE4hh7jv9hW9U" />

		  <!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
		  <link rel="shortcut icon" href="/favicon.ico"/>
		  <link rel="apple-touch-icon" href="/apple-touch-icon.png"/>


		  <!-- CSS: implied media="all" -->
		  <link rel="stylesheet" href="{$workspace}/css/style.css?v=2"/>
		  <link rel="stylesheet" href="{$workspace}/css/tipTip.css?v=2"/>

		  <!-- Uncomment if you are specifically targeting less enabled mobile browsers
		  <link rel="stylesheet" media="handheld" href="css/handheld.css?v=2">  -->

 		 	<!-- google font -->
  			<link href='https://fonts.googleapis.com/css?family=OFL+Sorts+Mill+Goudy+TT' rel='stylesheet' type='text/css'/>

		  <!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
		  <script src="{$workspace}/js/libs/modernizr-1.7.min.js"></script>

		  <script language='javascript'>
		  var root = "<xsl:value-of select='$root'/>";
		  var page = "<xsl:value-of select='$current-page'/>";
		  var language = "<xsl:value-of select='$url-language'/>";
		  </script>

	</head>

	<body>
	<xsl:attribute name="class"><xsl:text>biosphere </xsl:text> <xsl:value-of select="/data/mab-one-biosphere/entry/class"/><xsl:text> </xsl:text><xsl:value-of select="$url-language"/> <xsl:if test="/data/parametres/entry[nom-du-parametre/@handle = 'langues']/actif = 'No'"> noLang</xsl:if> </xsl:attribute>
	   <div id="background" class="{/data/mab-one-biosphere/entry/class}"></div>


	<div id="container">
	  	<div id="col-gauche">
	  	  <header>
				<a href="{$root}/{$url-language}/biosphere/{$nom}/{$id-page}/{$id-rub}/" title="{$labels[nom/@handle='retour-a-la-page-daccueil']/texte}">
				<xsl:attribute name="class"><xsl:text>logo logos </xsl:text> <xsl:value-of select="/data/mab-one-biosphere/entry/class"/></xsl:attribute>
				home</a>

				<div id="titre-menu" class="">
					<div class="titre">
						<h1 class="nom-part1"><xsl:value-of select="/data/mab-one-biosphere/entry/nom-premiere-partie"/></h1>
						<h1 class="nom-part2"><xsl:value-of select="/data/mab-one-biosphere/entry/nom-deuxieme-partie"/></h1>
					</div>
						<!-- lang switcher -->
						<xsl:call-template name="menu-langue-biosphere">
							  <xsl:with-param name="supported-language-codes" select="data/events/language-redirect/supported-languages/item"/>
		    					<xsl:with-param name="current-language-code" select="$url-language" />
						</xsl:call-template>
				</div>

				<ul class="menu-princ tabs">
					<li><a class="pres bg" href="#presentation">Présentation</a></li>
					<li><a class="ter bg" href="#territoire">Territoire</a></li>
					<li><a class="act bg" href="#actions">Actions</a></li>
					<li><a class="dia bg" href="#diaporama">Diaporama</a></li>
				</ul>
	    	</header>

    	<div id="main" class="action" role="main">
			<div class="panes">
				<div>
					<div class="t-main bg"></div>
					<div class="c-main">
						<!-- source pour impression -->
						<p class="print-origine 1"><xsl:value-of select="$current-url"/></p>
						<!-- titre -->
						<h1><xsl:value-of select="$labels[nom/@handle='presentation']/texte"/></h1>
						<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
							<!-- corps -->
							<!-- presentation -->
							<div class="clearfix"></div>
							<xsl:copy-of select="/data/biosphere-presentation/entry"/>
					</div>
					<div class="b-main bg identite">
							<!-- tableau identité -->
						<table cellpadding="0" cellspacing="0" width="570" class="i-table">
							<tr>
								<td class="c-gauche"><xsl:value-of select="$labels[nom/@handle='nombre-de-communes']/texte" /></td><td class="c-droite"><xsl:copy-of select="/data/biosphere-identite/entry/nombre-de-communes"/></td>
							</tr>
							<tr>
								<td class="c-gauche"><xsl:value-of select="$labels[nom/@handle='nombre-dhabitants']/texte" /></td><td class="c-droite"><xsl:copy-of select="/data/biosphere-identite/entry/nombre-dhabitants"/></td>
							</tr>
							<tr>
								<td class="c-gauche"><xsl:value-of select="$labels[nom/@handle='superficie']/texte" /></td><td class="c-droite"><xsl:copy-of select="/data/biosphere-identite/entry/superficie-en-ha"/></td>
							</tr>
							<tr>
								<td class="c-gauche"><xsl:value-of select="$labels[nom/@handle='regions']/texte" /></td><td class="c-droite"><xsl:copy-of select="/data/biosphere-identite/entry/regions"/></td>
							</tr>
							<tr>
								<td class="c-gauche"><xsl:value-of select="$labels[nom/@handle='departements']/texte" /></td><td class="c-droite"><xsl:copy-of select="/data/biosphere-identite/entry/departements"/></td>
							</tr>
							<tr>
								<td class="c-gauche"><xsl:value-of select="$labels[nom/@handle='date-de-creation']/texte" /></td><td class="c-droite"><xsl:copy-of select="/data/biosphere-identite/entry/date-de-creation"/></td>
							</tr>
						</table>

					</div>
				</div>
				<div>
					<div class="t-main bg"></div>
					<div class="c-main">
						<!-- source pour impression -->
						<p class="print-origine 1"><xsl:value-of select="$current-url"/></p>
						<!-- titre -->
						<h1><xsl:value-of select="$labels[nom/@handle='territoire']/texte"/></h1>
						<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
							<div class="clearfix"></div>
							<!-- corps -->
							<!-- Territoire -->
							<xsl:if test="/data/biosphere-territoire/entry/carte-du-territoire">
								<xsl:variable name="img-path">
									<xsl:value-of select="/data/biosphere-territoire/entry/carte-du-territoire/@path"/>/<xsl:value-of select="/data/biosphere-territoire/entry/carte-du-territoire/filename"/>
								</xsl:variable>

								<a href="#" rel="#full-img">
									<!-- TODO  utiliser $class au lieu de $nom et mettre à jour css -->
								<xsl:attribute name="class"><xsl:text>carte-territoire carte-</xsl:text><xsl:value-of select="/data/mab-one-biosphere/entry/class"/></xsl:attribute>carte du territoire</a>
							</xsl:if>

							<xsl:copy-of select="/data/biosphere-territoire/entry/territoire"/>
					</div>
					<div class="b-main bg"></div>
				</div>
				<div>
					<div class="t-main bg"></div>
					<div class="c-main">
						<!-- source pour impression -->
						<p class="print-origine 1"><xsl:value-of select="$current-url"/></p>
						<!-- titre -->
						<h1><xsl:value-of select="$labels[nom/@handle='actions']/texte"/></h1>
						<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
							<div class="clearfix"></div>
							<!-- corps -->
							<!-- Actions -->
							<xsl:copy-of select="/data/biosphere-actions/entry/actions"/>
					</div>
					<div class="b-main bg"></div>
				</div>
				<div>
					<div class="t-main bg"></div>
					<div class="c-main">
						<!-- source pour impression -->
						<p class="print-origine 1"><xsl:value-of select="$current-url"/></p>
						<!-- titre -->
						<h1><xsl:value-of select="$labels[nom/@handle='diaporama']/texte"/></h1>
						<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
							<div class="clearfix"></div>
							<!-- corps -->
						<!-- Diapo -->
						<xsl:call-template name="biosphere-diaporama"/>
					</div>
					<div class="b-main bg"></div>
				</div>
			</div>
		</div>
  	</div>
  	<!-- COLONNE DE DROITE -->
    <div id="col-droite">
	    <ul id="top-col-droite" class="bg">
	    	<a href="{$root}" class="liste-mab bg">MAB FRANCE</a>
	    </ul>

	   <div class="bot-col-droite bg">
		    <ul id="infos-bio">



		    	<li><a class="actu titre bg" href="#">Actualités</a>
				    <ul>
		    		    	<!-- remonté des deux dernières actus -->
					    	<div class="scroll-content content-actu">
					    		<xsl:apply-templates select="data/widget-actualites/entry">
					    			<xsl:with-param name="nb" select="3"/>
					    		</xsl:apply-templates>
					    	</div>
					</ul>
				 </li>

		    	<li><a class="coor titre bg" href="#">Coordonnées</a>
			    	<ul>
			    		<div class="scroll-content scroll-pane">
							<div class="scrollbar"><div class="track"><div class="thumb"><div class="end"></div></div></div></div>
								<div class="viewport">
				    				<div class="overview">
				    					<xsl:copy-of select="/data/biosphere-coordonnees/entry/coordonnees"/>
				    				</div>
				    			</div>
				    	</div>
					</ul>
				</li>

				<li><a class="web titre bg" href="#">site web</a>
		    		<ul class="web-content">
		    			<li><xsl:copy-of select="/data/biosphere-coordonnees/entry/sites-web"/></li>
		    		</ul>
		    	</li>




				 <!-- remonté des trois dernières publications -->
		    	 <li><a class="publi titre bg" href="#">Publications</a>
					   <ul class="publications">
								<xsl:apply-templates select="data/widget-publications/entry">
					    			<xsl:with-param name="nb" select="3"/>
					    		</xsl:apply-templates>
		    			</ul>
		    	</li>
		    </ul>
		</div> <!-- end .bot-col-droite -->
		<div class="clearfix"></div>
		<!-- start .logos-col-droite -->
		<div class="logos-col-droite">
			<xsl:apply-templates select="data/biosphere-logos/entry"/>
		</div>

		 </div>


	   </div><!-- end of container -->
		<footer>
			<ul>
				<!-- <li>
					<a href="{$root}/{$url-language}/{data/navigation/page[@handle='intranet']/item/@handle}/" ><xsl:value-of select="data/navigation/page[@handle='intranet']/item"/></a>
				</li>
				<li>
					<a href="{$root}/{$url-language}/{data/navigation/page[@handle='plan-du-site']/item/@handle}/"><xsl:value-of select="data/navigation/page[@handle='plan-du-site']/item"/></a>
				</li> -->
				<xsl:apply-templates select="data/menu-footer/entry"/>
			</ul>
	   </footer>

			 <!-- JavaScript at the bottom for fast page loading -->
			 <!-- Grab Google CDN's jQuery. fall back to local if necessary -->
			  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.js"></script>
			  <script><![CDATA[window.jQuery || document.write(unescape('%3Cscript src="js/libs/jquery-1.6.4.js"%3E%3C/script%3E'))]]></script>
			<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script> -->
			  <!-- Grab flowplayer CDN's jquery tools, with a protocol relative URL; fall back to local if necessary -->
  			<script src="{$workspace}/js/jquery.tools.min.js"></script>
			  <script><![CDATA[window.jQuery || document.write(unescape('%3Cscript src="js/libs/jquery.tools.full.min.js"%3E%3C/script%3E'))]]></script>



			  <!-- scripts concatenated and minified via ant build script-->
			  <script src="{$workspace}/js/plugins.js"></script>
		      <script src="{$workspace}/js/libs/jquery.tinyscrollbar.min.js"></script>
			  <script src="{$workspace}/js/biospheres.js"></script>
		      <script src="{$workspace}/js/libs/jquery.hoveraccordion.min.js"></script>
			  <!-- end scripts-->

			  <xsl:text disable-output-escaping="yes"><![CDATA[<!--[if lt IE 7 ]>
			    <script src="js/libs/dd_belatedpng.js"></script>
			    <script>DD_belatedPNG.fix("img, .png_bg"); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb </script>
			  <![endif]-->]]></xsl:text>

			  <script src="{$workspace}/js/jquery.mousewheel.js"></script>
			  <script src="{$workspace}/js/jquery.jscrollpane.min.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-2132372-18', 'mab-france.org');
  ga('send', 'pageview');

</script>
		<xsl:text disable-output-escaping="yes"><![CDATA[<script>
			$(document).ready(function () {

				$('#content-wrapper').hide();
				$('#content-wrapper').fadeIn(3000);

				/* onglets */
				$("ul.tabs").tabs("div.panes > div", { history: true });

				/*diaporama*/
				$(".scrollable").scrollable();

				/*scrollbar tinyscrollbar */
				$('.scroll-pane').tinyscrollbar();

				/* diaporama events */
				$(".items img").click(function() {

					// see if same thumb is being clicked
					if ($(this).hasClass("active")) { return; }

					// calclulate large image's URL based on the thumbnail URL (flickr specific)
					var url = $(this).attr("src").replace("/2/100/75/5", "/2/500/0/5");
					var infos = $(this).attr("alt").split('_');
					var legende = infos[0];
					var copyright = infos[1];

					// get handle to element that wraps the image and make it semi-transparent
					var wrap = $("#image_wrap").fadeTo("medium", 0.5);

					// the large image
					var img = new Image();


					// call this function after it's loaded
					img.onload = function() {

						// make wrapper fully visible
						wrap.fadeTo("fast", 1);

						// change the image
						wrap.find("img").attr("src", url);
						$("p.legende").empty().html(legende);
						$("p.copyright").empty().html(copyright);

					};

					// begin loading the image from www.flickr.com
					img.src = url;

					// activate item
					$(".items img").removeClass("active");
					$(this).addClass("active");

				// when page loads simulate a "click" on the first image
				}).filter(":first").click();
			});
			</script>]]></xsl:text>
	<!-- overlayed element -->
	<div class="apple_overlay" id="overlay">
		<!-- the external content is loaded inside this tag -->
		<div class="contentWrap"></div>
	</div>


		<xsl:if test="/data/biosphere-territoire/entry/carte-du-territoire">
			<xsl:variable name="img-path">
				<xsl:value-of select="/data/biosphere-territoire/entry/carte-du-territoire/@path"/>/<xsl:value-of select="/data/biosphere-territoire/entry/carte-du-territoire/filename"/>
			</xsl:variable>
			<div class="simple_overlay" id="full-img">
				<img src="{$root}/image/1/940/0{$img-path}"/>
			</div>
		</xsl:if>
	</body>
</html>

</xsl:template>
<xsl:template match="data/biosphere-logos/entry">
	<xsl:if test="lien-http-logo-1 != ''">
			<a href="{lien-http-logo-1}" rel="external" title="{titre-logo-1}"><img src="{$root}/image/2/80/0/5{logo-1/@path}/{logo-1/filename}" alt="{titre-logo-1}" width="80" /></a>
	</xsl:if>
	<xsl:if test="lien-http-logo-2 != ''">
			<a href="{lien-http-logo-2}" rel="external" title="{titre-logo-2}"><img src="{$root}/image/2/80/0/5{logo-2/@path}/{logo-2/filename}" alt="{titre-logo-2}" width="80" /></a>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>