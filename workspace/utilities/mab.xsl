<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="actions" match="data">
	<xsl:variable name="active-page" select="/data/plh-page/page/item/@handle"/>
	
			<xsl:if test="/data/mab-sous-rubriques/entry[rubrique-parente/item/@handle = $active-page]">
			
				<ul class="sub-menu">
					<xsl:apply-templates select="/data/mab-sous-rubriques/entry" >
						<xsl:with-param name="rubrique" select="/data/plh-page/page/item/@handle"/>
					</xsl:apply-templates>

				</ul>
			

			</xsl:if>
	<div class="i-action">
		<xsl:choose>	
			<xsl:when test="$page = ''">
				<!-- source pour impression -->
				<p class="print-origine"><xsl:value-of select="$current-url"/></p>
				<!-- titre -->
				<h1><xsl:value-of select="/data/intro/entry/nom[@handle-fr=$current-page]/nom"/></h1>
				<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
				<!-- corps -->
				<xsl:copy-of select="/data/intro/entry[nom/@handle-fr=$current-page]/contenu"/>		
			</xsl:when>
			
			<xsl:otherwise>
				<!-- source pour impression -->
				<p class="print-origine"><xsl:value-of select="$current-url"/></p>
				<!-- titre -->
				<h1><xsl:value-of select="/data/action/entry/nom"/></h1>
				<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
				<!-- corps -->
				<xsl:copy-of select="/data/action/entry/contenu"/>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>
</xsl:stylesheet>