<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:members="http://michael-eichelsdoerfer.de/xslt/members"
	extension-element-prefixes="exsl members">

<xsl:import href="members-forms/members.forms.xsl"/>

<xsl:template name="members-form-login">

	<xsl:variable name="event" select="'member-login-info'"/>

<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta charset="UTF-8"/>
	<title>Login | Chromatron Admin Theme</title>
	<meta name="description" content=""/>
	<meta name="author" content=""/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	
	<link rel="shortcut icon" href="{$workspace}/intranet/favicon.ico"/>
	<link rel="apple-touch-icon" href="{$workspace}/intranet/apple-touch-icon.png"/>
	
	<!-- CSS Styles -->
	<link rel="stylesheet" href="{$workspace}/intranet/css/style.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/colors.css"/>
	<link rel="stylesheet" href="{$workspace}/intranet/css/jquery.tipsy.css"/>
	
	<!-- Google WebFonts -->
	<link href='http://fonts.googleapis.com/css?family=PT+Sans:regular,italic,bold,bolditalic' rel='stylesheet' type='text/css'/>
	
	<script src="{$workspace}/intranet/js/libs/modernizr-1.7.min.js"></script>
</head>
<body class="login">
	<section role="main">
	
		<a href="/" title="Back to Homepage"></a>
	
		<!-- Login box -->
		<article id="login-box">
		
			<div class="article-container">
			
				<p>Veuillez renseigner votre identifiant et mot de passe pour vous connecter à l'intranet.</p>
				
				<!-- Notification -->
				<div class="notification error">
					<a href="#" class="close-notification" title="Hide Notification" rel="tooltip">x</a>
					<p>	<xsl:call-template name="members:validate">
							<xsl:with-param name="event" select="$event"/>
						</xsl:call-template>
					</p>
				</div>
				<!-- /Notification -->

				<form method="post" autocomplet="off">
					<fieldset>
						<dl>
							<dt>
							</dt>
							<dd>
								<xsl:call-template name="members:input-identity">
									<xsl:with-param name="event" select="$event"/>
								</xsl:call-template>
							</dd>
							<dt>
							</dt>
							<dd>
								<xsl:call-template name="members:input-password">
									<xsl:with-param name="event" select="$event"/>
									<xsl:with-param name="mode" select="'login'"/>
								</xsl:call-template>
							</dd>
							<dt class="checkbox"><label>Se souvenir de moi</label></dt>
							<dd><input type="checkbox"/></dd>
						</dl>
					</fieldset>
						<xsl:call-template name="members:input-submit">
							<xsl:with-param name="event" select="$event"/>
							<xsl:with-param name="name" select="'member-action[login]'"/>
						</xsl:call-template>
				</form>
	


			</div>
		
		</article>
		<!-- /Login box -->
		<ul class="login-links">
			<li><a href="#">Lost password?</a></li>
			<li><a href="#">Wiki</a></li>
			<li><a href="#">Back to page</a></li>
		</ul>
		
	</section>

	<!-- JS Libs at the end for faster loading -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
	<xsl:text disable-output-escaping="yes"><![CDATA[<script>!window.jQuery && document.write(unescape('%3Cscript src="js/jquery/jquery-1.5.1.min.js"%3E%3C/script%3E'))</script>]]></xsl:text>
	<script src="{$workspace}/intranet/js/libs/selectivizr.js"></script>
	<script src="{$workspace}/intranet/js/jquery/jquery.tipsy.js"></script>
	<script src="{$workspace}/intranet/js/login.js"></script>
	<xsl:text disable-output-escaping="yes"><![CDATA[<script>
		var _gaq=[['_setAccount','UA-XXXXXX'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.async=1;
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>]]></xsl:text>
</body>
</html>

</xsl:template>

</xsl:stylesheet>
