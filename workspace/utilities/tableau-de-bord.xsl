<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:math="http://exslt.org/math">

	<xsl:import href="../utilities/date-time.xsl"/>
	<xsl:import href="../utilities/get-file-extension.xsl"/>

	<xsl:template name="tableau-de-bord">

		<article class="full-block clearfix">
			<div class="article-container">
				<header>
					<h2>Tableau de bord</h2>
				</header>
				<section>
					<h3 class="clearfix">Documents récents</h3>

						<table>
							<thead>
								<tr>
									<th>Nom</th>
									<th>Date</th>
									<th>rubrique</th>
									<th>Sous-rubrique</th>
									<th>Catégorie</th>
									<th class="text-center">Statut</th>
									<xsl:if test="$member-role = 'Administrateur'">
										<th>Actions</th>
									</xsl:if>	
								</tr>
							</thead>

							<tbody>
								<xsl:for-each select="/data/intra-last-documents/entry">
									<xsl:variable name="publie">
										<xsl:value-of select="publie"/>
									</xsl:variable>
									<xsl:variable name="current-categorie-id">
										<xsl:value-of select="/data/intra-last-documents/entry[@id=@id]/categorie/item/@id"/>
									</xsl:variable>
									<xsl:variable name="current-categorie-nom">
										<xsl:value-of select="categorie/item/@handle"/>
									</xsl:variable>
									<xsl:variable name="current-sous-rubrique-id">
										<xsl:value-of select="/data/intra-categories-filtre-par-sous-rubrique/sous-rubrique-parente/entry[nom/@handle = $current-categorie-nom]/sous-rubrique-parente/item/@id"/>
									</xsl:variable>
									<xsl:variable name="current-rubrique-id">
										<xsl:value-of select="/data/intra-categories-filtre-par-sous-rubrique/sous-rubrique-parente/entry[nom/@handle = $current-categorie-nom]/sous-rubrique-parente/item/@id"/>
									</xsl:variable>
									<!-- admin voit tout -->
									<!-- contributeur voit ses docuemnts et les doc publiés -->
									<xsl:if test="($member-role = 'Administrateur' or $member-id = auteur/item/@id or ($member-role != 'Administrateur' and$publie='Yes'))">	
									<tr>
										<td>
											<xsl:choose>
												<xsl:when test="count(/data/intranet-sous-rubriques-handle-par-membre/rubrique-parente/entry[@id = $current-sous-rubrique-id]) = 0 and $member-role !='Administrateur'">
													<xsl:value-of select="nom-du-document"/>
												</xsl:when>
												<xsl:otherwise>
													<a rel="external" href="{$workspace}{document/@path}/{document/filename}">
														<xsl:attribute name="class">
															<xsl:text>extension </xsl:text>
															<xsl:call-template name="get-file-extension">
																<xsl:with-param name="path" select="document/filename" />
															</xsl:call-template>
														</xsl:attribute>
														<xsl:value-of select="nom-du-document"/>
													</a>
												</xsl:otherwise>
											</xsl:choose>
										</td>
										<td><xsl:call-template name="format-date">
											<xsl:with-param name="date" select="date/date/start"/>
											<xsl:with-param name="format" select="'d M Y'"/>
											</xsl:call-template>
										</td>
		
										<xsl:variable name="id-categorie"><xsl:value-of select="categorie/item/@id"/> </xsl:variable> 
										
										<td> <xsl:value-of select="/data/intra-sous-rubriques/rubrique-parente/entry[@id = $current-sous-rubrique-id]/rubrique-parente"/> </td>
										<td> <xsl:value-of select="/data/intra-categories-filtre-par-sous-rubrique/sous-rubrique-parente/entry[@id = $id-categorie]/sous-rubrique-parente"/> 
										</td>
										<td><xsl:value-of select="categorie/item/@handle"/></td>
										<td><xsl:choose>
											<xsl:when test="$publie='Yes'"><span class="tag green">Publié</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="tag red">En attente</span>
											</xsl:otherwise>
										</xsl:choose>
										</td>
										<xsl:if test="$member-role = 'Administrateur'">
											<td>
												<ul class="actions" style="display:flex"> <!-- icones d'action -->
													<li>
														<a class="edit open ajax-form table" title="Editer" rel="tooltip" target="_blank">
															<xsl:attribute name="href">edit-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/>/<xsl:value-of select="@id"/>/no/</xsl:attribute>Editer</a>
													</li>
													<li>
														<a class=" deplace open ajax-form table" title="Deplacer" rel="tooltip" target="_blank">
															<!-- paramètres url : type/cat_id/tmp_form_id/sous_rub_id/doc_id/rub_id -->
															<xsl:attribute name="href">deplace-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/>/<xsl:value-of select="@id"/>/no</xsl:attribute>Déplacer</a>
													</li>
													<li>
														<a class="delete sup-doc ajax-form picto-sup-doc" title="Supprimer" rel="tooltip" target="_blank">
															<xsl:attribute name="href">sup-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/>/<xsl:value-of select="@id"/>/no/</xsl:attribute>Supprimer</a>
													</li>
												</ul> <!-- fin icones d'action -->
											</td>
										</xsl:if>
									</tr>
									</xsl:if>
								</xsl:for-each>
							</tbody>
						</table>

				</section>	
			</div>
		</article>
	</xsl:template>

</xsl:stylesheet>