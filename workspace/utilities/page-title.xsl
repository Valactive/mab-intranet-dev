<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="titre"/>
	<xsl:variable name="nom"/>
	<xsl:template name="page-title">
		<xsl:value-of select="$website-name"/>
		<xsl:text> &#8212; </xsl:text>
		<xsl:choose>
			<xsl:when test="$titre !=''">
				<xsl:value-of select="/data/mab-une-actualite/entry/titre"/>
			</xsl:when>
			<xsl:when test="$current-page = 'home'">
				<xsl:value-of select="'Les réserves de biosphère en france'"/>
			</xsl:when>
			<xsl:when test="$nom !='' and $current-page = 'biosphere'">
				<xsl:value-of select="/data/biosphere-coordonnees/entry/biosphere/item"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$page-title"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>