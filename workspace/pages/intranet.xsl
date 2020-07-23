<?xml version="1.0" encoding="UTF-8"?>
<!-- page intranet.xsl -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/login-panel.xsl" />
<xsl:import href="../utilities/intranet.xsl" />

<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>


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
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.checkbox.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/tipTip.css"/>

	<!-- Google WebFonts -->
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic' rel='stylesheet' type='text/css'/>

	<script src="{$workspace}/intranet/js/libs/modernizr-1.7.min.js"></script>
</head>
<body>
		<xsl:choose>
		    <xsl:when test="$member-is-logged-in">
		    	<div class="notification" style="display:none;"></div>
		        <xsl:call-template name="intranet" />
		    </xsl:when>
		    <xsl:otherwise>
		    	<xsl:attribute name="class">login</xsl:attribute>
		        <xsl:call-template name="login-panel" />
		    </xsl:otherwise>
		</xsl:choose>
	<!-- JS Libs at the end for faster loading -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<xsl:text disable-output-escaping="yes"><![CDATA[<script>!window.jQuery && document.write(unescape('%3Cscript src="js/jquery/jquery-1.5.1.min.js"%3E%3C/script%3E'))</script>]]></xsl:text>
	<script src="{$workspace}/intranet/js/libs/selectivizr.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.nyromodal.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.tipsy.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.wysiwyg.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.datatables.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.datepicker.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.datepick-fr.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.fileinput.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.fullcalendar.min.js"></script>
	<script src="{$workspace}/intranet/js/jquery/excanvas.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.visualize.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.visualize.tooltip.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.validate.min.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.form.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.tipTip.minified.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.checkbox.js"></script>
	<script src="{$workspace}/intranet/js/script.js"></script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-2132372-18', 'mab-france.org');
  ga('send', 'pageview');

</script>
</body>
	<div id="overLoader"></div>

</html>
</xsl:template>

</xsl:stylesheet>