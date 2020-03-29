<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="tools">

		<ul class="tools">


			<a href="#" title="Contact" class="contact bg tool-btn">Contact</a>
			<!-- bloc contact -->
			<div class="tools-form contact tool-content">
				
				<h2><xsl:value-of select="$labels[nom/@handle='une-question-contactez-nous']/texte"/></h2>	
				
				<p>
					<b><xsl:value-of select="$labels[nom/@handle='nos-coordonnees']/texte"/></b>
					<br />MAB France<br />24, chemin de Borderouge,
					<br/>Auzeville CS 532627
					<br/>31326 Castanet Tolosan Cedex
				</p>

				<form method="post" action="" enctype="multipart/form-data" id="form-contact">
					<input name="MAX_FILE_SIZE" type="hidden" value="62914560" />
					<label><xsl:value-of select="$labels[nom/@handle='votre-email']/texte"/></label>
					<input class="radius" name="fields[email]" type="email" required="required" />

					<label><xsl:value-of select="$labels[nom/@handle='votre-message']/texte"/></label>
					<textarea class="radius" name="fields[message]" rows="25" cols="50" required="required" ></textarea>

					<input name="fields[date-de-creation]" type="hidden" style="visibility:hidden" value="{concat($today,' ',$current-time)}" />
					
					<input name="action[new-contact]" type="hidden" />
					<div class="g-recaptcha" data-sitekey="6LeFIhQUAAAAACZTFrrkbVEpEkCdbi3aeo4bNQJU"></div>
					<input name="action[new-contact]" type="submit" value="Envoyer" />
				</form>
			</div>


			<a href="#" title="Recherche" class="recherche bg active tool-btn">Recherche</a>
			<!-- bloc recherche -->
			<div class="tools-form recherche tool-content">

<!--
    <form id="recherche" class="arrondi" action="{$root}/search/" method="get">
    	<input id="champRech" value=" Chercher une vidéo" type="text" name="keywords" class="arrondi" />
		<input id="boutonRech" value="" name="Submit" type="submit" ></input>
    	<input type="hidden" name="sort" value="score-recency" />
    	<input type="hidden" name="per-page" value="10" />
    	<input type="hidden" name="sections" value="articles,comments,categories" />
	</form>
-->


<form method="get" action="{$root}/{$url-language}/search/" id="form-search">

	<label><xsl:value-of select="$labels[nom/@handle='chercher-un-contenu']/texte"/></label>
	<input id="champRech" class="radius" name="keywords" type="text" required="required" />
	<input name="Submit" type="submit" value="ok" />
	<input type="hidden" name="sort" value="frequency" />
	<input type="hidden" name="per-page" value="20" />
	<input type="hidden" name="sections" value="pages,actualites,publications,présentation,territoire,identite,coordonnees,action" />
</form>
</div>
</ul>



</xsl:template>

</xsl:stylesheet>