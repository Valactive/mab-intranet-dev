<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="diaporama" match="data/diaporama/entry">
<xsl:variable name="imgPath" select="image/@path"/>
<xsl:variable name="imgPathEn" select="image-en/@path"/>
<xsl:variable name="biosphere-handle" select="biosphere-liee/item/@handle"/>
<xsl:variable name="rubrique-parente-handle" select="/data/mab-navigation-pages/entry[nom/@handle=$biosphere-handle]/rubrique-parente/item/@handle"/>
<xsl:variable name="type-link">
		<xsl:if test="$biosphere-handle!=$rubrique-parente-handle">page</xsl:if>
</xsl:variable>



		<div class="item">
		<!-- lien rubrique -->
		<a class="lien-action" href="{$root}/{$url-language}/{rubrique-liee/item/@handle}/"><xsl:value-of select="nom-du-lien-pour-la-rubrique-liee"/></a>
		<!-- caption  -->

		<!-- lien biosphere ou page dans une rubrique -->

		<xsl:choose>
			<xsl:when test="$url-language = 'fr'">
				<xsl:choose>
					<xsl:when test="$type-link = 'page'">
						<a class="lien-biosphere" href="{$root}/{$url-language}/{$rubrique-parente-handle}/{$biosphere-handle}/">
						<xsl:value-of select="biosphere-liee/item"/></a>
					</xsl:when>
					<xsl:otherwise>
						<a class="lien-biosphere" href="{$root}/{$url-language}/{/data/navigation/page[@handle='biosphere']/item/@handle}/{biosphere-liee/item/@handle}/" rel="external">

						<xsl:value-of select="biosphere-liee/item"/></a>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
					<xsl:when test="$type-link = 'page'">
						<a class="lien-biosphere" href="{$root}/{$url-language}/{$rubrique-parente-handle}/{$biosphere-handle}/">
						<xsl:value-of select="biosphere-liee/item"/></a>
					</xsl:when>
					<xsl:otherwise>
		<a class="lien-biosphere" href="{$root}/{$url-language}/{/data/navigation/page[@handle='biosphere']/item/@handle}/{biosphere-liee/item/@handle}/" rel="external"><xsl:value-of select="biosphere-liee/item"/></a>

					</xsl:otherwise>
				</xsl:choose>

		</xsl:otherwise>
		</xsl:choose>

		<!-- image x10 -->
		<xsl:choose>
			<xsl:when test="$url-language = 'fr'">
				<img src="{$root}/image/2/605/189/5{$imgPath}/{image/filename}" alt="{image/filename}" width="605" height="189" />
			</xsl:when>
			<xsl:otherwise>
				<img src="{$root}/image/2/605/189/5{$imgPathEn}/{image-en/filename}" alt="{image-en/filename}" width="605" height="189"/>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

</xsl:stylesheet>