<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/data/intra-document">
	<h1><xsl:value-of select="entry/nom"/></h1>
	<form method="post" action="" enctype="multipart/form-data">
	  <input name="MAX_FILE_SIZE" type="hidden" value="10485760" />
	  <input name="id" type="hidden" value="{entry}"/>
	  <label>Nom
	    <input name="fields[nom]" type="text" value="{entry/nom}" />
	  </label>
	  <label>Auteur
	    <input name="fields[auteur]" type="text" value="{entry/auteur}"/>
	  </label>
	  <label>Date
	    <input name="fields[date][start][]" type="text" value="{entry/date/date/start}"/>
	  </label>
	  <label>Fichier joint
	    <input name="fields[fichier-joint]" type="file" />
	  </label>
	  <label>Publié
	  	<input type="checkbox"></input> 
	  </label>
	  <input name="fields[categorie]" type="hidden" value="{entry/categorie/item}" />
	  <input name="action[add-documents]" type="submit" value="Envoyer" />
	</form>
</xsl:template>

</xsl:stylesheet>