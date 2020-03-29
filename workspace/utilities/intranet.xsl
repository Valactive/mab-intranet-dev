<?xml version="1.0" encoding="UTF-8"?>
<!-- utilitaire : intranet.xsl -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exsl="http://exslt.org/common"
	xmlns:math="http://exslt.org/math">

	<xsl:import href="../utilities/tableau-de-bord.xsl"/>
	<xsl:import href="../utilities/get-file-extension.xsl"/>
	<xsl:template name="intranet">

<!-- test si l'utilsateur est autorisé à voir ce contenu -->
<!-- $sous-rubrique : valeur dans l'url demandée -->
<!-- /data/ds-member-sous-rubrique : sous-rubrique autorisées pour l'utilisateur loggé -->
<!-- si l'utilisateur n'a pas le droit on affiche un simple message avec lien vers la home de l'intranet -->
<xsl:variable name="is_authorized">
	<xsl:value-of select="boolean(/data/intranet-sous-rubriques-handle-par-membre/entry[nom/@handle = $sous-rubrique])"/>
</xsl:variable>
		<!-- Fixed Layout Wrapper -->
		<div class="fixed-wraper">
		<!-- Aside Block -->
			<section role="navigation">
				<!-- Header with logo and headline -->
				<header>
					<a href="/" title="Retour à la page d'accueil"></a>
					<h1>Bienvenue sur votre intranet !</h1>
				</header>

				<!-- User Info -->
				<section id="user-info">
					<img src="{$workspace}/intranet/img/sample_user.png" alt="profil par defaut"/>
					<div>
						<a href="#" title="Account Settings and Profile Page"><xsl:value-of select="/data/intranet-membre/entry/identifiant"/></a>
						<em><xsl:value-of select="$member-role"/></em>
						<ul>
							<li><a class="button-link green" href="?member-action=logout&amp;redirect={$current-url}" title="Déconnection" rel="tooltip">Déconnexion</a></li>
						</ul>
					</div>
				</section>
				<!-- /User Info -->

				<!-- Main Navigation -->
				<xsl:choose>
					<xsl:when test="$member-role = 'Administrateur'">
						<nav id="main-nav">
							<ul>
								<li>
									<xsl:if test="$rubrique =''"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
									<a href="/intranet/" title="Tableau de bord" class="dashboard no-submenu">Tableau de bord</a>
								</li>


								<xsl:for-each select="/data/intranet-admin-menu/rubrique-parente">
									<xsl:variable name="nsr"><xsl:value-of select="count(entry)"/></xsl:variable>
									<xsl:variable name="rub-handle"><xsl:value-of select="@link-handle"/></xsl:variable>
									<li>
										<xsl:attribute name="class"><xsl:if test="$rub-handle = $rubrique">current</xsl:if></xsl:attribute>
										<a href="intranet/{link-handle}" class="products"><xsl:value-of select="@value"/></a><span original-title="Il y a {$nsr} sous-rubrique(s)"><xsl:value-of select="$nsr"/></span>
										<ul>
											<xsl:for-each select="entry">
												<li>
													<xsl:if test="nom/@handle = $sous-rubrique"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
													<a href="{$root}/intranet/{$rub-handle}/{nom/@handle}/#sidetab1" title="{nom}"><xsl:value-of select="nom"/></a>
												</li>
											</xsl:for-each>
										</ul>
									</li>
								</xsl:for-each>
							</ul>
						</nav>
						<!-- /Main Navigation -->
					</xsl:when>
					<xsl:otherwise>

						<nav id="main-nav">

							<ul>
								<li>
									<xsl:if test="$rubrique =''"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
									<a href="/intranet/" title="Tableau de bord" class="dashboard no-submenu">Tableau de bord</a>
								</li>


								<xsl:for-each select="/data/intranet-rubriques-par-membre/rubrique-parente">
									<xsl:variable name="nsr"><xsl:value-of select="count(entry)"/></xsl:variable>
									<xsl:variable name="rub-handle"><xsl:value-of select="@link-handle"/></xsl:variable>
									<li>
										<xsl:attribute name="class"><xsl:if test="$rub-handle = $rubrique">current</xsl:if></xsl:attribute>
										<a href="intranet/{link-handle}" class="products"><xsl:value-of select="@value"/></a><span original-title="Il y a {$nsr} sous-rubrique(s)"><xsl:value-of select="$nsr"/></span>
										<ul>
											<xsl:for-each select="entry">
												<li>
													<xsl:if test="nom/@handle = $sous-rubrique"><xsl:attribute name="class">current</xsl:attribute></xsl:if>
													<a href="{$root}/intranet/{$rub-handle}/{nom/@handle}/#sidetab1" title="{nom}"><xsl:value-of select="nom"/></a>
												</li>
											</xsl:for-each>
										</ul>
									</li>
								</xsl:for-each>
							</ul>
						</nav>
						<!-- /Main Navigation -->
					</xsl:otherwise>
				</xsl:choose>
				<!-- bloc info members -->
				<section class="sidebar nested">
					<h2>Membres (<xsl:value-of select="count(/data/intranet-membres/entry)" />)</h2><a href="#" class="showMembers">
					Voir la liste
				</a>
				<ul class="members">
					<xsl:for-each select="/data/intranet-membres/entry">
						<li><xsl:value-of select="identifiant"/></li>
					</xsl:for-each>
				</ul>
			</section>
		</section>
		<!-- /Aside Block -->

		<!-- Main Content -->
		<section role="main">

			<!-- Breadcumbs -->
<!--
		<ul id="breadcrumbs">
			<li><a href="/" title="Retour à l'accueil">Retour à l'accueil</a></li>
			<xsl:if test="$rubrique !=''">
				<li><a href="#"><xsl:value-of select="$rubrique"/></a></li>
			</xsl:if>

			<xsl:if test="$sous-rubrique !=''">
				<li><xsl:value-of select="$sous-rubrique"/></li>
			</xsl:if>
		</ul>
	-->
	<!-- /Breadcumbs -->

	<!-- Full Content Block -->
	<!-- Note that only 1st article need clearfix class for clearing -->
	<xsl:choose>
		<!-- Tableau de bord -->
		<xsl:when test="$rubrique ='' or $member-role != 'Administrateur' and $is_authorized = 'false'">
			<xsl:call-template name="tableau-de-bord"/>
		</xsl:when>
		<!-- contenu -->
		<xsl:otherwise>
			<article class="full-block clearfix">

				<!-- Article Container for safe floating -->
				<div class="article-container">

					<!-- Sous-rubrique Header -->
					<header>
						<h2><xsl:value-of select="/data/intra-sous-rubriques/entry[nom/@handle = $sous-rubrique]/nom"/></h2>
						<xsl:if test="count(/data/intra-categories-filtre-par-sous-rubrique/entry)>0">
							<nav>
								<ul class="button-switch">
									<!-- url : action/form_id/sous_rubrique_id -->
									<a class="button green ajax-form new-cat" rel="tooltip" title="Ajouter une catégorie dans cette rubrique">
										<xsl:attribute name="href">new-cat/no/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="/data/intra-sous-rubriques/entry[nom/@handle = $sous-rubrique]/@id"/></xsl:attribute><span>Ajouter une </span><strong>Catégorie</strong></a>
									</ul>
								</nav>
							</xsl:if>

							<!-- /Article Header Tab Navigation -->
						</header>
						<!-- /Article Header -->



						<!-- catégories ou non ? -->
						<xsl:choose>
							<!-- pas de catégories -->
							<xsl:when test="count(/data/intra-categories-filtre-par-sous-rubrique/entry)=0">
								<article class="article-container">
									<div class="notification information">
										<ul class="button-switch">
											<h2>Ooops !</h2>
											<p>Il n'y a aucune catégorie pour cette sous-rubrique, il est temps de <a class="button-link green ajax-form new-cat" rel="tooltip" title="Ajouter une catégorie dans cette rubrique"><xsl:attribute name="href">new-cat/no/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="/data/intra-sous-rubriques/entry[nom/@handle = $sous-rubrique]/@id"/></xsl:attribute><span>cliquer sur ce bouton</span></a> pour en créer une.</p>
										</ul>
									</div>
								</article>
							</xsl:when>
							<!-- au moins une catégorie -->
							<xsl:otherwise>
								<section>

									<!-- Tab Content #tab2 with class. sidetabs for side tabs container -->
									<div class="tab sidetabs default-sidetab" id="tab0">
										<!-- Side Tab Navigation -->
										<nav class="sidetab-switch">
											<ul>
												<!-- SOUS-RUBRIQUES-->
												<xsl:for-each select="/data/intra-categories-filtre-par-sous-rubrique/entry">
													<li><a>
														<xsl:if test="position()=1"><xsl:attribute name="class">aTab default-tab current</xsl:attribute></xsl:if>
														<xsl:if test="position()>1"><xsl:attribute name="class">aTab</xsl:attribute></xsl:if>
														<xsl:attribute name="href">
															<xsl:text>#sidetab</xsl:text><xsl:value-of select="position()"/>
														</xsl:attribute>
														<xsl:value-of select="nom"/>
													</a>
													<!-- edit categorie -->

													<xsl:if test="($member-role = 'Administrateur' or $member-id = auteur/item/@id)">

														<div class="picto-edit-cat">
															<a class="pen ajax-form edit-cat" rel="tooltip" title="Editer cette catégorie">
																<xsl:attribute name="href">edit-cat/no/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="@id"/>/no/<xsl:value-of select="/data/intra-categories-filtre-par-sous-rubrique/entry[@id=@id]/sous-rubrique-parente/item/@id"/></xsl:attribute>Editer cette catégorie</a>

																<a class="sup ajax-form sup-cat" rel="tooltip" title="Supprimer cette catégorie">
																	<xsl:attribute name="href">sup-cat/no/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="@id"/>/no/<xsl:value-of select="/data/intra-categories-filtre-par-sous-rubrique/entry[@id=@id]/sous-rubrique-parente/item/@id"/></xsl:attribute>Supprimer cette catégorie</a>
																</div>
															</xsl:if>


														</li>
													</xsl:for-each>
												</ul>
											</nav>
											<!-- /Side Tab Navigation -->

											<!-- Side Tab Content #sidetab1++ -->
											<xsl:variable name="counter" select="0"/>

											<xsl:for-each select="/data/intra-categories-filtre-par-sous-rubrique/entry">
												<xsl:variable name="current-categorie-id" select="@id"/>
												<xsl:variable name="current-sous-rubrique-id" select="sous-rubrique-parente/item/@id"/>

												<div>
													<xsl:if test="position()=1"><xsl:attribute name="class">sidetab default-sidetab</xsl:attribute></xsl:if>
													<xsl:if test="position()>1"><xsl:attribute name="class">sidetab</xsl:attribute></xsl:if>
													<xsl:attribute name="id">
														<xsl:text>sidetab</xsl:text><xsl:value-of select="position()"/>
													</xsl:attribute>
													<!-- tableau -->
													<xsl:choose>
														<xsl:when test="/data/intra-documents-filtre-par-categories/entry">
															<xsl:variable name="nbs-docs" select="count(/data/intra-documents/entry[categorie/item/@id = $current-categorie-id])"/>
															<article class="full-block nested info-tools {$current-categorie-id}">
																<ul class="stats-summary">
																	<li><strong class="stats-count"><xsl:value-of select="$nbs-docs"/></strong><p>document<xsl:if test="$nbs-docs > 1">s</xsl:if> dans cette catégorie.</p>
																	<a class="button gray stats-view ajax-form" rel="tooltip" title="Ajouter un document dans cette catégorie"><xsl:attribute name="href">new-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/></xsl:attribute>
																	<span>Ajouter </span><strong>un Document</strong></a>
																</li>
															</ul>
														</article>
														<div id="comments"></div>

														<xsl:if test="$nbs-docs > 0">
															<table class="datatable">
																<thead>
																	<tr>
																		<th>Nom</th>
																		<th>Date</th>
																		<th>Auteur(s)</th>
																		<th>Actions</th>
																	</tr>
																</thead>
																<tbody>

																	<xsl:for-each select="/data/intra-documents/entry">
																		<xsl:if test="categorie/item/@id = $current-categorie-id">
																			<tr>
																				<td><a rel="external" href="http://docs.google.com/viewer?url={$workspace}{document/@path}/{document/filename}">
																					<xsl:attribute name="class">
																						<xsl:text>extension </xsl:text>
																						<xsl:call-template name="get-file-extension">
																							<xsl:with-param name="path" select="document/filename" />
																						</xsl:call-template>
																					</xsl:attribute>
																					<xsl:value-of select="nom-du-document"/></a></td>
																					<td><xsl:call-template name="format-date">
																						<xsl:with-param name="date" select="date/date/start"/>
																						<xsl:with-param name="format" select="'d M Y'"/>
																					</xsl:call-template>
																				</td>
																				<td><xsl:value-of select="auteur"/></td>
																				<td>
																			<!-- actions
																				member-role : Administrateur = ok
																				member-role : Contributeur = ok uniquement pour ses propres documents
																			-->
																			<xsl:if test="$member-role = 'Administrateur' or $member-id = auteur/item/@id">
																				<ul class="actions">
																					<li>
																						<a class="edit open ajax-form table" title="Editer" rel="tooltip" target="_blank">
																							<xsl:attribute name="href">edit-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/>/<xsl:value-of select="@id"/>/</xsl:attribute>Editer
																						</a>
																					</li>
																					<li>
																						<div class="picto-sup-doc"><a class="delete ajax-form sup-doc" title="Supprimer" rel="tooltip"><xsl:attribute name="href">sup-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/>/<xsl:value-of select="@id"/>/</xsl:attribute>Supprimer</a></div></li>
																					</ul>
																				</xsl:if>
																			</td>

																		</tr>
																	</xsl:if>
																</xsl:for-each>

															</tbody>
														</table>
													</xsl:if>
												</xsl:when>
												<xsl:otherwise>
													<article class="full-block nested info-tools {$current-categorie-id}">
														<ul class="stats-summary">
															<li><strong class="stats-count">0</strong><p>document dans cette catégorie.</p>
															<a class="button gray stats-view ajax-form" rel="tooltip" title="Ajouter un document dans cette catégorie"><xsl:attribute name="href">new-doc/<xsl:value-of select="$current-categorie-id"/>/a<xsl:value-of select="floor(math:random() * 1000000)"/>/<xsl:value-of select="$current-sous-rubrique-id"/></xsl:attribute>
															<span>Ajouter </span><strong>un Document</strong></a>
														</li>
													</ul>
												</article>
											</xsl:otherwise>
										</xsl:choose>
										<!-- !tableau -->
									</div>
								</xsl:for-each>



							</div>
							<!-- /Tab Content #tab2 -->
						</section>
					</xsl:otherwise>
				</xsl:choose>
				<!-- /Article Content -->

				<!-- Article Footer -->
				<footer>
<!--
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse et <a href="#sample" class="open-modal">open modal!</a> Maecenas id augue ac metus tempus aliquam. Sed pharetra placerat suscipit sagittis.</p>
					-->
				</footer>
				<!-- /Article Footer -->

			</div>
			<!-- /Article Container -->

		</article>
		<!-- /Full Content Block -->

	</xsl:otherwise>
</xsl:choose>
<div class="clearfix"></div> <!-- We're really sorry for this, but because of IE7 we still need separated div with clearfix -->

</section>
<!-- /Main Content -->

</div>
<!-- /Fixed Layout Wrapper -->

</xsl:template>

</xsl:stylesheet>