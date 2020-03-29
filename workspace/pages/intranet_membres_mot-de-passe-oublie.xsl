<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/intranet-master.xsl" />
<xsl:import href="../utilities/members-form-generate-recovery-code.xsl"/>
<xsl:import href="../utilities/members-form-reset-password.xsl"/>


<xsl:variable name="member-is-logged-in" select="boolean(//events/member-login-info/@logged-in = 'yes')"/>

<xsl:template match="data">

<section role="main">
	
		<a href="/intranet" title="Back to Homepage"></a>
	
		<!-- Login box -->
		<article id="login-box">
		
			<div class="article-container">
			
				<fieldset>
					<legend>1 | Saisissez votre identifiant pour générer votre code : </legend>
					<xsl:call-template name="members-form-generate-recovery-code"/>
				</fieldset>

				<xsl:if test="(/data/events/members-generate-recovery-code/recovery-code)or(/data/events/members-reset-password)">
				
				<fieldset>
					<legend><p>2 | Utilisez le code suivant pour remplir le formulaire</p></legend>				
					<input type="text" class="code" value="{/data/events/members-generate-recovery-code/recovery-code}"/>
				</fieldset>	
					
				<fieldset>
					<legend>3 | remplissez le formulaire</legend>
					<xsl:call-template name="members-form-reset-password"/>
				</fieldset>
				</xsl:if>

			</div>
		</article>
</section>				


</xsl:template>

</xsl:stylesheet>