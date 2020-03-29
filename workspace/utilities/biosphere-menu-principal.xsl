<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="biosphere-menu-principal" match="/data/biosphere-rubriques/entry">

	<xsl:variable name="rub" select="nom/@handle"/>
	<xsl:variable name="cur-page" select="/data/plh-page/page/@handle"/>
	
		<li><a title="{nom}" href="{$root}/{$url-language}/{nom/@handle}/" >
				<xsl:if test="$current-page = nom/@handle-fr">
					<xsl:attribute name="class"><xsl:text>bouton-vert bg </xsl:text><xsl:value-of select="class"/> <xsl:text> active</xsl:text></xsl:attribute>
				</xsl:if>
				<xsl:if test="$current-page != nom/@handle-fr">
					<xsl:attribute name="class"><xsl:text>bouton-vert bg </xsl:text><xsl:value-of select="class"/></xsl:attribute>
				</xsl:if>
			<xsl:value-of select="nom"/>
			</a>
			
		</li>
</xsl:template>
</xsl:stylesheet>