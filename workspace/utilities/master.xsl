<?xml version="1.0" encoding="UTF-8"?>
<!-- master des pages du site mab-france.org -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:string="http://symphony-cms.com/functions"
	>

	<xsl:import href="page-title.xsl"/>
	<xsl:import href="date-time.xsl"/>
	<xsl:import href="mab-menu-principal.xsl"/>
	<xsl:import href="mab-menu-secondaire.xsl"/>
	<xsl:import href="mab-menu-footer.xsl"/>
	<xsl:import href="menu-langue.xsl"/>
	<xsl:import href="get-diaporama.xsl"/>
	<xsl:import href="get-actualites.xsl"/>
	<xsl:import href="get-publications.xsl"/>
	<xsl:import href="string-utils.xsl"/>
	<xsl:import href="actions.xsl"/>
	<xsl:import href="tools.xsl"/>

	<xsl:output method="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		omit-xml-declaration="yes"
		encoding="UTF-8"
		indent="yes" />

		<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
		<xsl:variable name="labels" select="/data/textes-statiques/entry"/>
		<xsl:variable name="titre"/>

		<xsl:template match="/">
			<xsl:comment><![CDATA[[if IE 6]> <html lang="en" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6"> <![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if IE 7]> <html lang="en" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if IE 8]> <html lang="en" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if IE 9]> <html lang="en" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if !(lte IE 9)]><!]]></xsl:comment> <html lang="en" class="no-js"> <xsl:comment><![CDATA[<![endif]]]></xsl:comment>

			<xsl:comment>master.xsl</xsl:comment>

			<head>

				<title>
					<xsl:choose>
						<xsl:when test="/data/action/entry/referencement-balise-title != ''">
							<xsl:value-of select="/data/action/entry/referencement-balise-title"/>
						</xsl:when>
						<xsl:when test="$page != ''">
							<xsl:variable name="pg-name">
								<xsl:value-of select="/data/action/entry[nom/@handle = $page]/nom"/>
							</xsl:variable>

							
							<xsl:value-of select="concat('MAB France - ', $pg-name)"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="page-title"/>
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


		  	<!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
		  	<script src="{$workspace}/js/libs/modernizr-1.7.min.js"></script>
		  	<script language='javascript'>
		  		var root = "<xsl:value-of select='$root'/>";
		  		var page = "<xsl:value-of select='$current-page'/>";
		  		var language = "<xsl:value-of select='$url-language'/>";
		  	</script>
		  	<script src='https://www.google.com/recaptcha/api.js'></script>
		  </head>

		  <body>
		  	<xsl:attribute name="class"><xsl:value-of select="$url-language"/> mab <xsl:if test="/data/parametres/entry[nom-du-parametre/@handle = 'langues']/actif = 'No'">noLang</xsl:if></xsl:attribute>
		  	<div id="jnotif">
		  		<p id="jnotif-message">Ici mon message</p>
		  	</div>
		  	<div id="container">
		  		<div id="col-gauche">
		  			<header>
		  				<a class="logo bg" href="{$root}/{$url-language}/" title="{$labels[nom/@handle='retour-a-la-page-daccueil']/texte}">home</a>
		  				<div id="top-menu" class="bg">
		  					<!-- ds-menu-secondaire -->
		  					<ul class="menu-secondaire">
		  						<!-- partenaires / questions-reponses -->
		  						<xsl:apply-templates select="data/menu-secondaire/entry"/>
		  						<!-- actualités -->
		  						<li><a href="{$root}/{$url-language}/{data/navigation/page[@handle='actualites']/item/@handle}/">
		  							<xsl:if test="$current-page = 'actualites'">
		  								<xsl:attribute name="class">active</xsl:attribute>
		  							</xsl:if>
		  							<xsl:value-of select="data/navigation/page[@handle='actualites']/item"/></a></li>
		  							<!-- publications -->
		  							<li><a href="{$root}/{$url-language}/{data/navigation/page[@handle='publications']/item/@handle}/">
		  								<xsl:if test="$current-page = 'publications'">
		  									<xsl:attribute name="class">active</xsl:attribute>
		  								</xsl:if>
		  								<xsl:value-of select="data/navigation/page[@handle='publications']/item"/></a></li>

		  								<!-- newsletter -->
		  								<li><a href="{$root}/{$url-language}/{data/navigation/page[@handle='lettres-de-la-biosphere']/item/@handle}/">
		  									<xsl:if test="$current-page = 'lettres-de-la-biosphere'">
		  										<xsl:attribute name="class">active</xsl:attribute>
		  									</xsl:if>
		  									<xsl:value-of select="data/navigation/page[@handle='lettres-de-la-biosphere']/item"/></a></li>
		  								</ul>
		  								<!-- lang switcher -->
		  								<xsl:call-template name="menu-langue">
		  									<xsl:with-param name="supported-language-codes" select="data/events/language-redirect/supported-languages/item"/>
		  									<xsl:with-param name="current-language-code" select="$url-language" />
		  								</xsl:call-template>

		  								<xsl:call-template name="tools"/>

		  							</div>
		  							<div id="titre-menu" class="bg"></div>
		  							<div class="menu-principal-container">
		  								<ul>
		  									<xsl:apply-templates name="mab-menu-principal" select="data/actions-rubriques/entry"/>
		  								</ul>
		  							</div>
		  						</header>

		  						<div id="main" class="action" role="main">
		  							<div class="t-main bg"></div>
		  							<div class="c-main">
		  								<xsl:apply-templates />
		  							</div>
		  							<div class="b-main bg"></div>
		  						</div>
		  					</div>
		  					<!-- COLONNE DE DROITE -->
		  					<div id="col-droite">
		  						<ul id="top-col-droite" class="bg">
		  							<a href="{$root}/{$url-language}/{data/navigation/page[@handle='mab-france']/item/@handle}/" class="liste-mab home accordion-btn bg">
		  								<xsl:value-of select="string:upper-case(data/navigation/page[@handle='mab-france']/item)"/>
		  							</a>
		  							<div class="top-mab-content bg accordion-content">
		  								<p>
		  									<xsl:value-of select="/data/textes-statiques/entry[nom/@handle='mab-france-intro']/texte"/>
		  									<a class="lien_vert" href="{$root}/{$url-language}/{data/navigation/page[@handle='mab-france']/item/@handle}/"><xsl:value-of select="/data/textes-statiques/entry[nom/@handle='en-savoir-plus']/texte"/></a>
		  								</p>
		  							</div>
		  							<a href="#" class="liste-bio home active accordion-btn bg"><xsl:value-of select="string:upper-case(data/navigation/page[@handle='biospheres']/item)"/></a>
		  							<div class="top-biosphere-content accordion-content">
		  								<a href="{$root}/{$url-language}/{data/navigation/page[@handle='biospheres']/item/@handle}/" class="bg"><xsl:value-of select="data/navigation/page[@handle='biospheres']/item"/></a>
		  							</div>
		  						</ul>
		  						<div id="blocs-col-droite" class="bg">
		  							<!-- actualités -->
		  							<a href="{$root}/{$url-language}/{data/navigation/page[@handle='actualites']/item/@handle}/" class="btn-actu bg" title="actualités"><xsl:value-of select="data/navigation/page[@handle='actualites']/item"/></a>
		  							<!-- rss link -->
		  							<a href="{$root}/{$url-language}/rss/" rel="#overlay" class="btn-rss bg" title="fil rss">Abonnez-vous au fil rss de nos actualités</a>
		  							<!-- remonté des deux dernières actus -->
		  							<div class="content-actu">
		  								<xsl:apply-templates select="data/widget-actualites/entry">
		  									<xsl:with-param name="nb" select="3"/>
		  								</xsl:apply-templates>
		  							</div>

		  							<!-- remonté des trois dernières publications -->
		  							<!-- remonté des trois dernières publications -->
		  							<a href="{$root}/{$url-language}/{data/navigation/page[@handle='publications']/item/@handle}/" class="btn-publications bg" title="actualités"><xsl:value-of select="data/navigation/page[@handle='publications']/item"/></a>
		  							<div class="publications">
		  								<ul>
		  									<xsl:apply-templates select="data/widget-publications/entry">
		  										<xsl:with-param name="nb" select="3"/>
		  									</xsl:apply-templates>
		  								</ul>
		  							</div>
		  						</div>
		  					</div>


		  				</div><!-- end of container -->
		  				<footer>
		  					<ul>
		  						<li>
		  							<a href="{$root}/{$url-language}/{data/navigation/page[@handle='intranet']/item/@handle}/" ><xsl:value-of select="data/navigation/page[@handle='intranet']/item"/></a>
		  						</li>
		  						<li>
		  							<a href="{$root}/{$url-language}/{data/navigation/page[@handle='plan-du-site']/item/@handle}/"><xsl:value-of select="data/navigation/page[@handle='plan-du-site']/item"/></a>
		  						</li>
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
		  				<script src="{$workspace}/js/main.js"></script>
		  				<script src="{$workspace}/js/notify.js"></script>
		  				<script src="{$workspace}/js/libs/tipTipv13/jquery.tipTip.minified.js"></script>

		  				<!-- end scripts-->
		  				<xsl:if test="$root-page = 'biospheres'">
		  					<script>
		  						//tiptip tooltip
		  						$(".tooltip").tipTip();
		  					</script>
		  				</xsl:if>
		  				<xsl:comment><![CDATA[[if lt IE 7]>
		  					<script src="js/libs/dd_belatedpng.js"></script>
		  					<script> DD_belatedPNG.fix('img, .png_bg'); //fix any <img> or .png_bg background-images </script>
		  					<![endif]]]></xsl:comment>




		  					<script>
		  						(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  						(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  						m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  						})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		  						ga('create', 'UA-2132372-18', 'mab-france.org');
		  						ga('send', 'pageview');

		  					</script>

		  					<script>
		  						$('#content-wrapper').hide();
		  						$('#content-wrapper').fadeIn(3000);
		  					</script>
		  					<!-- overlayed element -->
		  					<div class="apple_overlay" id="overlay">
		  						<!-- the external content is loaded inside this tag -->
		  						<div class="contentWrap"></div>
		  					</div>

		  				</body>

		  			</html>

		  		</xsl:template>

		  	</xsl:stylesheet>