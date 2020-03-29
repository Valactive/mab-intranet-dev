<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:members="http://michael-eichelsdoerfer.de/xslt/members"
	extension-element-prefixes="exsl members">

<xsl:import href="members-forms/members.forms.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template name="login-panel" match="/">
<xsl:variable name="event" select="'member-login-info'"/>

	<section role="main">
	
		<a href="/" title="Back to Homepage"></a>
	
		<!-- Login box -->
		<article id="login-box">
		
			<div class="article-container">
			
				<p>Veuillez renseigner votre identifiant et mot de passe pour vous connecter à l'intranet.</p>
				
				<!-- Notification -->
						<xsl:call-template name="members:validate">
							<xsl:with-param name="event" select="$event"/>
						</xsl:call-template>
				<!-- /Notification -->
			
				<form method="post" autocomplet="off">
					<fieldset>
						<dl>
							<xsl:call-template name="members:input-identity">
								<xsl:with-param name="event" select="$event"/>
							</xsl:call-template>
							<xsl:call-template name="members:input-password">
								<xsl:with-param name="event" select="$event"/>
								<xsl:with-param name="mode" select="'login'"/>
							</xsl:call-template>
							
							<!--
<dt>
								<label>Identifiant</label>
							</dt>
							<dd>
								<input name="fields[identifiant]" type="text" class="large"/>
							</dd>
							<dt>
								<label>Mot de passe</label>
							</dt>
							<dd>
								<input name="fields[password]" type="password" class="large"/>
							</dd>
							<dt class="checkbox"><label>Se souvenir de moi</label></dt>
							<dd><input type="checkbox"/></dd>
-->
						</dl>
					</fieldset>
					    <input name="redirect" type="hidden" value="/intranet/" />
						<button name="member-action[login]" type="submit" class="right green">Connection</button>
				</form>
			
			</div>
		
		</article>
		<!-- /Login box -->
<!--
		<ul class="login-links">
			<li><a href="#">Lost password?</a></li>
			<li><a href="#">Wiki</a></li>
			<li><a href="#">Back to page</a></li>
		</ul>
-->
		
	</section>


</xsl:template>

</xsl:stylesheet>