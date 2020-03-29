<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="mab-menu-principal" match="/data/actions-rubriques/entry">
<!--
	<xsl:for-each select="entry">
-->
	<xsl:variable name="rub" select="nom/@handle"/>
	<xsl:variable name="cur-page" select="/data/plh-page/page/@handle"/>
		<li><a title="{nom}" href="{$root}/{$url-language}/{nom/@handle}/" >
				<xsl:if test="$current-page = nom/@handle-fr">
					<xsl:attribute name="class"><xsl:text>bouton-vert first </xsl:text><xsl:value-of select="class"/> <xsl:text> active</xsl:text></xsl:attribute>
				</xsl:if>
				<xsl:if test="$current-page != nom/@handle-fr">
					<xsl:attribute name="class"><xsl:text>bouton-vert first </xsl:text><xsl:value-of select="class"/></xsl:attribute>
				</xsl:if>
			<xsl:value-of select="nom"/>
			</a>
		
			<!-- ajout des sous-rubriques via le datasource mab-sous-rubrique -->	

			<xsl:if test="/data/mab-sous-rubriques/entry[rubrique-parente/item/@handle = $rub]">
	
				<ul>
					<xsl:apply-templates select="/data/mab-sous-rubriques/entry" >
						<xsl:with-param name="rubrique" select="nom/@handle"/>
					</xsl:apply-templates>
				</ul>
			

			</xsl:if>
	
		</li>
<!--
	</xsl:for-each>
-->
</xsl:template>

<xsl:template match="/data/mab-sous-rubriques/entry">
	<xsl:param name="rubrique"/>
	<xsl:variable name="page"/>

	<xsl:if test="rubrique-parente/item/@handle = $rubrique">
		<li>
			<xsl:if test="$page != '' and $page = nom/@handle"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
			
			<a href="{$root}/{$url-language}/{rubrique-parente/item/@handle}/{nom/@handle}/{@id}/" title="{nom}">
			<xsl:value-of select="nom"/></a>
		</li>
	</xsl:if>
</xsl:template>

</xsl:stylesheet>