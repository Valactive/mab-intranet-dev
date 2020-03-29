<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- affiche le nombre d'actualités demandées via le paramètre nb -->
<xsl:template name="actualites">
<xsl:param name="items"/>
<xsl:param name="nb"/>
<xsl:param name="type"/>
<xsl:param name="current-language"/>

<xsl:variable name="nav" select="/data/navigation"/>

			<xsl:if test="position()&lt;=$nb or $nb=0">
			
			<xsl:for-each select="$items">	
				<div class="mono">
				<span class="date-cartouche bg">
						<span class="jour">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start"/>
								<xsl:with-param name="format" select="'d'"/>
							</xsl:call-template>
						</span>	
						<span class="mois">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start"/>
								<xsl:with-param name="format" select="'m'"/>
							</xsl:call-template>
						</span>	
						<span class="annee">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start"/>
								<xsl:with-param name="format" select="'Y'"/>
							</xsl:call-template>
						</span>	
									
				</span>
		
					<h1><a href="{$root}/{$url-language}/actualite/{titre/@handle}"><xsl:value-of select="titre"/></a></h1>
					
					
					<p>	<xsl:value-of select="concat(
							substring(texte,1,275),
							'...')"/></p><br />
					<a class="lien_vert" href="{$root}/{$url-language}/actualite/{titre/@handle}" >
					<xsl:value-of select="$labels[nom/@handle='en-savoir-plus']/texte"/></a>
				</div>
			</xsl:for-each>	
			</xsl:if>
</xsl:template>

<xsl:template name="widget-actualites" match="data/widget-actualites/entry">
<xsl:param name="current-language"/>
<xsl:param name="nb"/>

			<xsl:if test="position()&lt;=$nb or $nb=0">
				<p>
					<span class="date-actu">
						<xsl:call-template name="format-date">
							<xsl:with-param name="date" select="date/date/start"/>
							<xsl:with-param name="format" select="'d/n/Y'"/>
						</xsl:call-template>
					</span>
					 | <a href="{$root}/{$url-language}/popup/{titre/@handle}" rel="#overlay">
						<xsl:choose>
							<xsl:when test="string-length(titre)&gt;59">
								<xsl:value-of select="concat(
									substring(titre	,1,60),
									'...')"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="titre"/>
							</xsl:otherwise>	
						</xsl:choose>	
					</a><br />
<!--
					<a class="lien_vert" href="{$root}/{$url-language}/popup/{titre/@handle}" rel="#overlay">
					<xsl:value-of select="$labels[nom/@handle='en-savoir-plus']/texte"/></a>
-->
				</p>
			</xsl:if>
</xsl:template>

</xsl:stylesheet>