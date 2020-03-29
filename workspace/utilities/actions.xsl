<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:function="http://example.com">

	<!-- <xsl:import href="ninja.xsl" /> -->

	<!-- EXSL Function Manager: -->
	<!-- <xsl:include href="efm://functions" /> -->

	<xsl:template name="actions" match="data">
		<xsl:variable name="active-page" select="/data/plh-page/page/item/@handle"/>
		<xsl:variable name="active-page-name" select="/data/plh-page/page/item"/>


		<xsl:choose>
			<xsl:when test="(/data/mab-sous-rubriques/entry[rubrique-parente/item/@handle = $active-page]) or (/data/mab-pages-enfant/entry/rubrique-parente[item/@handle = $active-page])">

			<ul class="sub-menu">
					<!-- <xsl:apply-templates select="/data/mab-sous-rubriques/entry" >
						<xsl:with-param name="rubrique" select="/data/plh-page/page/item/@handle"/>
					</xsl:apply-templates> -->
					<xsl:apply-templates select="/data/mab-pages-enfant/entry" >
						<xsl:with-param name="rubrique" select="/data/plh-page/page/item/@handle"/>
					</xsl:apply-templates>

				</ul>
			</xsl:when>
			<xsl:otherwise>
				<ul class="sub-menu">
					<li><a href="{$root}/{$url-language}/{$active-page}"><xsl:value-of select="$active-page-name"/></a></li>
				</ul>
			</xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<!-- intro pages actions -->			

				<xsl:when test="($page = '') and (/data/plh-page/page/@handle != 'mab-france')">
					<div class="i-action">
						<!-- source pour impression -->
						<p class="print-origine 1"><xsl:value-of select="$current-url"/></p>
						<!-- titre -->
						<h1><xsl:copy-of select="/data/intro/entry/nom[@handle-fr=$current-page]"/></h1>
						<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
						<!-- corps -->
						<!-- <xsl:apply-templates select="/data/intro/entry[nom/@handle-fr=$current-page]/contenu" mode="html" /> -->
<xsl:copy-of select="/data/intro/entry[nom/@handle-fr=$current-page]/contenu"/>		
					</div>
				</xsl:when>
				<!-- intro page mab france -->

				<xsl:when test="(/data/plh-page/page/@handle = 'mab-france') and ($page = '')">
					<div class="i-action">		
						<!-- source pour impression -->
						<p class="print-origine 2"><xsl:value-of select="$current-url"/></p>
						<!-- corps -->
						<!-- <xsl:apply-templates select="/data/action/entry[nom/@handle-fr=$current-page]/contenu" mode="html" /> -->
<xsl:copy-of select="/data/action/entry[nom/@handle-fr=$current-page]/contenu"/>			
					</div>
				</xsl:when>
				<!-- sous page mab france -->		
				<xsl:when test="(/data/plh-page/page/@handle = 'mab-france') and ($page != '')">
					<div class="i-action">
						<!-- source pour impression -->
						<p class="print-origine 2"><xsl:value-of select="$current-url"/></p>
						<!-- corps -->
						<!-- <xsl:apply-templates select="/data/mab-pages-enfants-contenus/entry/contenu" mode="html" /> -->
<xsl:copy-of select="/data/mab-pages-enfants-contenus/entry/contenu"/>			
					</div>
				</xsl:when>

				<!-- sous page secondaire 1 colonne -->		
				<xsl:when test="(/data/action/entry/type-de-page/item/@handle = 'secondaire') or (/data/action/entry/type-de-page/item/@handle = 'pied-de-page')">
					<!-- titre -->
					<h1 class="titre-page"><xsl:copy-of select="/data/action/entry/nom"/></h1>
					<!-- corps -->
					<div class="main-std">
<!-- <xsl:apply-templates select="/data/action/entry/contenu" mode="html" /> -->
<xsl:copy-of select="/data/action/entry/contenu"/>
</div>
				</xsl:when>


				<!-- pages action -->			
				<xsl:otherwise>
					<div class="i-action">
						<!-- source pour impression -->
						<p class="print-origine 3"><xsl:value-of select="$current-url"/></p>
						<!-- titre -->
						<h1><xsl:copy-of select="/data/action/entry/nom"/></h1>
						<a class="imprimer bg" href="javascript:window.print()" title="imprimer cette page">Imprimer</a>
						<!-- corps -->
						<!-- <xsl:apply-templates select="/data/action/entry/contenu" mode="html" /> -->
						<xsl:copy-of select="/data/action/entry/contenu"/>
					</div>	
				</xsl:otherwise>

			</xsl:choose>
		</xsl:template>

		<!-- Adjust the images: -->
		<!-- <xsl:template match="img" mode="html"> -->
			<!-- call the fit-image()-function to do some magic for you: -->
			<!-- <xsl:copy-of select="function:fit-image(@src, 575, @width, @height, @align, @style, @title,@alt)" /> -->
		<!-- </xsl:template> -->

		<xsl:template match="/data/mab-pages-enfant/entry">
			<xsl:param name="rubrique"/>

			<xsl:if test="rubrique-parente/item/@handle = $rubrique">
				<li>
					<xsl:if test="$page != '' and $page = nom/@handle"><xsl:attribute name="class">active</xsl:attribute></xsl:if>
					<a href="{$root}/{$url-language}/{rubrique-parente/item/@handle}/{nom/@handle}/" title="{nom}">
						<xsl:value-of select="nom"/></a>
					</li>
				</xsl:if>
			</xsl:template>
		</xsl:stylesheet>