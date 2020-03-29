<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="titre"/>
	<xsl:variable name="nom"/>
	<xsl:template name="page-title-biosphere">
		<xsl:value-of select="concat(/data/mab-one-biosphere/entry/nom-premiere-partie,' ',/data/mab-one-biosphere/entry/nom-deuxieme-partie)"/>
		<xsl:text> &#8212; </xsl:text>
		<xsl:value-of select="$website-name"/>
	</xsl:template>
</xsl:stylesheet>