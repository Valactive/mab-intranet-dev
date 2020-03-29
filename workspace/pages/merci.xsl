<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/master.xsl"/>

<xsl:template match="*" mode="html">
	<xsl:element name="{name()}">
		<xsl:apply-templates select="* | @* | text()" mode="html"/>
	</xsl:element>
</xsl:template>

<xsl:template match="@*" mode="html">
	<xsl:attribute name="{name(.)}">
		<xsl:value-of select="."/>
	</xsl:attribute>
</xsl:template>

<xsl:template match="data">
	<h1 class="titre-page"><xsl:value-of select="$labels[nom/@handle='merci']/texte"/></h1>
	<div class="main-std"><xsl:apply-templates name="standart" select="/data/mab-pages-standard/entry[nom/@handle-fr=$current-page]/contenu"/></div>
</xsl:template>

<xsl:template name="standard" match="data/mab-pages-standard/entry">
	<xsl:copy-of select="contenu"/>
</xsl:template>

</xsl:stylesheet>