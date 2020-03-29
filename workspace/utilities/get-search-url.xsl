<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="search-url">
		<xsl:param name="entry-id" />
		<xsl:param name="section" />
		<xsl:param name="entry" />

		<!-- ACTUALITES -->
		<xsl:choose>
			<xsl:when test="$section = 'actualites'">
				<xsl:variable name="texte" select="$entry/excerpt"/>
				<xsl:value-of select="concat('[',/data/navigation/page[@handle='actualite']/item,']',' ')"/>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="/data/navigation/page[@handle='actualite']/item/@handle"/>/<xsl:value-of select="/data/search-actualites-informations/entry[@id = $entry-id]/titre/@handle"/>
					</xsl:attribute>

					
					<xsl:copy-of select="$texte" />

				</a>
				<p class="url">
					<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="/data/navigation/page[@handle='actualite']/item/@handle"/>/<xsl:value-of select="/data/search-actualites-informations/entry[@id = $entry-id]/titre/@handle"/>
				</p>
				<xsl:variable name="content-actu" select="/data/search-actualites-informations/entry[@id = $entry-id]/contenu"/>
				
				<xsl:choose>
					<xsl:when test="string-length($content-actu) > 300">
						<xsl:value-of select="concat(substring($content-actu,1,300),'...' )" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$content-actu" />
					</xsl:otherwise>
				</xsl:choose>

			</xsl:when>
		</xsl:choose>

		<!-- PUBLICATIONS -->
		<xsl:choose>
			<xsl:when test="$section = 'publications'">
				<xsl:variable name="texte" select="$entry/excerpt"/>
				<xsl:value-of select="concat('[',/data/navigation/page[@handle='publication']/item,']',' ')"/>

				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="/data/navigation/page[@handle='publication']/item/@handle"/>/<xsl:value-of select="/data/search-publications-informations[entry/@id = $entry-id]/entry/titre/@handle"/>
					</xsl:attribute>

					<xsl:copy-of select="$texte" />

				</a>
				<p class="url">
					<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="/data/navigation/page[@handle='publication']/item/@handle"/>/<xsl:value-of select="/data/search-publications-informations[entry/@id = $entry-id]/entry/titre/@handle"/>
				</p>

			</xsl:when>
		</xsl:choose>

		<!-- BIOSPHERE -->
		<xsl:choose>
			<xsl:when test="$section = 'présentation' or $section = 'identite' or $section = 'territoire' or $section = 'coordonnees' or $section = 'action'">
				<xsl:variable name="hashTagSection">
					<xsl:choose>
						<xsl:when test="$section = 'présentation'">
							<xsl:value-of select="'presentation'"/>
						</xsl:when>
						<xsl:when test="$section = 'identite'">
							<xsl:value-of select="'identite'"/>
						</xsl:when>
						<xsl:when test="$section = 'coordonnees'">
							<xsl:value-of select="'coordonnees'"/>
						</xsl:when>
						<xsl:when test="$section = 'territoire'">
							<xsl:value-of select="'territoire'"/>
						</xsl:when>
						<xsl:when test="$section = 'action'">
							<xsl:value-of select="'actions'"/>
						</xsl:when>					
					</xsl:choose>
				</xsl:variable>

				<xsl:value-of select="concat('[',/data/navigation/page[@handle='biosphere']/item,' /',' ',$hashTagSection,']')"/>


				<xsl:variable name="titre" select="/data/search-presentation-informations/entry[@id = $entry-id]/reserve/item"/>
				
				<xsl:variable name="rub-nom-handle">
					<xsl:choose>
						<xsl:when test="$section = 'présentation'">
							<xsl:value-of select="/data/search-presentation-informations/entry[@id = $entry-id]/reserve/item/@handle"/>
						</xsl:when>
						<xsl:when test="$section = 'identite'">
							<xsl:value-of select="/data/search-identites-informations[entry/@id = $entry-id]/entry/reserve/item/@handle"/>
						</xsl:when>
						<xsl:when test="$section = 'coordonnees'">
							<xsl:value-of select="/data/search-coordonnees-informations[entry/@id = $entry-id]/entry/biosphere/item/@handle"/>
						</xsl:when>
						<xsl:when test="$section = 'territoire'">
							<xsl:value-of select="/data/search-territoires-informations[entry/@id = $entry-id]/entry/reserve/item/@handle"/>
						</xsl:when>
						<xsl:when test="$section = 'action'">
							<xsl:value-of select="/data/search-action-informations[entry/@id = $entry-id]/entry/reserve/item/@handle"/>
						</xsl:when>					
					</xsl:choose>
				</xsl:variable>

				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/biosphere/<xsl:value-of select="concat($rub-nom-handle,'/#',$hashTagSection)"/>
					</xsl:attribute>

					<xsl:copy-of select="$entry/excerpt" />

				</a>
				<p class="url">
					<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/biosphere/<xsl:value-of select="concat($rub-nom-handle,'/#',$hashTagSection)"/>
				</p>

			</xsl:when>
		</xsl:choose>

	<!-- PAGES -->
	<xsl:choose>
		<xsl:when test="$section = 'pages'">

			<xsl:variable name="nom-rub">
				<xsl:choose>
					<xsl:when test="/data/search-pages-informations/entry[@id=$entry-id]/rubrique-parente/item !='' ">
						<xsl:value-of select="/data/search-pages-informations/entry[@id=$entry-id]/rubrique-parente/item" />	
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'actions'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="nom-rub-handle">
				<xsl:choose>
					<xsl:when test="/data/search-pages-informations/entry[@id=$entry-id]/rubrique-parente/item/@handle != ''">
						<xsl:value-of select="/data/search-pages-informations/entry[@id=$entry-id]/rubrique-parente/item/@handle"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'actions'" />
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>	


			<xsl:variable name="nom-page" select="/data/search-pages-informations/entry[@id=$entry-id]/nom"/>
			
			<xsl:variable name="nom-page-handle"><xsl:value-of select="/data/search-pages-informations/entry[@id=$entry-id]/nom/@handle"/>/</xsl:variable>
			
			<xsl:value-of select="concat('[',$section,']')"/>

			<a>
				<xsl:attribute name="href">
					<xsl:choose>

						<xsl:when test="/data/search-pages-informations/entry[type-de-page/item/@handle='biosphere']/@id = $entry-id">
							<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/biosphere/<xsl:value-of select="$nom-page-handle"/><xsl:value-of select="$entry-id"/>/<xsl:value-of select="/data/search-pages-informations/entry[@id = $entry-id] //rubrique-parente/item/@id"/>/
						</xsl:when>

						<xsl:when test="/data/search-pages-informations/entry/rubrique-parente=''">
							<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="concat($nom-rub-handle,'/')"/>
						</xsl:when>

						<xsl:otherwise>
							<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="concat($nom-rub-handle,'/')"/><xsl:value-of select="$nom-page-handle"/>
						</xsl:otherwise>

					</xsl:choose>
				</xsl:attribute>
				<xsl:copy-of select="$entry/excerpt" />
			</a>
			<p class="url">
				<xsl:choose>

					<xsl:when test="/data/search-pages-informations/entry[type-de-page/item/@handle='biosphere']/@id = $entry-id">
						<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/biosphere/<xsl:value-of select="$nom-page-handle"/><xsl:value-of select="$entry-id"/>/<xsl:value-of select="/data/search-pages-informations/entry[@id = $entry-id] //rubrique-parente/item/@id"/>/
					</xsl:when>

					<xsl:when test="/data/search-pages-informations/entry/rubrique-parente/item =''">
						<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="concat($nom-rub-handle,'/')"/>
					</xsl:when>

					<xsl:otherwise>
						<xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="concat($nom-rub-handle,'/')"/><xsl:value-of select="$nom-page-handle"/>
					</xsl:otherwise>

				</xsl:choose>
			</p>

		</xsl:when>
	</xsl:choose>

</xsl:template>

</xsl:stylesheet>