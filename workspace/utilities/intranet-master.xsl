<?xml version="1.0" encoding="UTF-8"?>
<!-- utilitaire : intranet-master.xsl -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- STM <xsl:import href="page-title.xsl"/> -->


<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

	<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>


<xsl:template match="/">
	<xsl:comment><![CDATA[[if IE 6]> <html lang="en" class="no-js ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]> <html lang="en" class="no-js ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]> <html lang="en" class="no-js ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 9]> <html lang="en" class="no-js ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6"> <![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if !(lte IE 9)]><!]]></xsl:comment> <html lang="en" class="no-js"> <xsl:comment><![CDATA[<![endif]]]></xsl:comment>
<head> <!-- STM 
		<title>
			 <xsl:call-template name="page-title"/>
		</title>-->
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

  	<!-- All JavaScript at the bottom, except for Modernizr which enables HTML5 elements & feature detects -->
  	<script src="{$workspace}/js/libs/modernizr-2.0.6.min.js"></script>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-2132372-18', 'mab-france.org');
  ga('send', 'pageview');

</script>
</head>
<body>
	<xsl:if test="$current-page = 'mot-de-passe-oublie'">
		<xsl:attribute name="class">forgot-password</xsl:attribute>
	</xsl:if>
	<xsl:apply-templates/>
	<div id="overLoader"></div>
</body>
</html>
</xsl:template>

</xsl:stylesheet>