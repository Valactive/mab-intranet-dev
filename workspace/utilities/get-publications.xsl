<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- affiche le nombre publication demandées via le paramètre nb -->
<xsl:template name="publications">
<xsl:param name="items"/>
<xsl:param name="nb"/>
<xsl:param name="type"/>
<xsl:variable name="nav" select="/data/navigation"/>

			<xsl:for-each select="$items">
				<li>
<!-- 					<p class="date-publi">
						<span class="jour">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start"/>
								<xsl:with-param name="format" select="'d'"/>
							</xsl:call-template>
						</span>	
						<span class="mois">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start"/>
								<xsl:with-param name="format" select="'M'"/>
							</xsl:call-template>
						</span>	
						<span class="annee">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start"/>
								<xsl:with-param name="format" select="'Y'"/>
							</xsl:call-template>
						</span>
					</p>	 -->
				

					<a rel="external" href="{$root}/workspace{fichier-joint/@path}/{fichier-joint/filename}">
				 		<span class="el-finder-cwd pdf">
				 			<xsl:attribute name="class">
				 				<xsl:text>el-finder-cwd </xsl:text>
				 				<xsl:copy-of select="substring-after(fichier-joint/@type, '/')"/>
				 			</xsl:attribute>
				 		
				 		</span><xsl:value-of select="titre"/>
					</a>
					<span class="auteur">
						<xsl:value-of select="$labels[nom/@handle='auteur']/texte"/><xsl:value-of select="auteur-de-la-publication"/>
					</span>
					<xsl:if test="editeur !='' ">
					<span class="editeur">
						<xsl:value-of select="$labels[nom/@handle='editeur']/texte"/><xsl:value-of select="editeur"/>
					</span>
					</xsl:if>
	
				</li>
			</xsl:for-each>	

</xsl:template>

<xsl:template match="data/widget-publications/entry">
<xsl:param name="nb"/>
<xsl:variable name="nav" select="/data/navigation"/>

		<xsl:if test="position()&lt;=$nb or $nb=0 ">
			<li><a href="{$root}/{$url-language}/{/data/navigation/page[@handle='publication']/item/@handle}/{titre/@handle}">
			 	<xsl:value-of select="concat(
							substring(titre,1,75),
							'...')"/> <!-- /  -->
			 			<!-- <xsl:call-template name="format-date">
						<xsl:with-param name="date" select="date/date/start"/>
						<xsl:with-param name="format" select="'Y'"/>
						</xsl:call-template> -->
				</a>
			</li>
		</xsl:if>
</xsl:template>

</xsl:stylesheet>