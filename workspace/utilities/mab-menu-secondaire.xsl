<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="menu-secondaire" match="data/menu-secondaire/entry">
	<xsl:param name="page" select="$page"/>
	<li>
	<a href="{$root}/{$url-language}/actions/{nom/@handle}/">
	
			<xsl:if test="$page = nom/@handle">
			   <xsl:attribute name="class">active</xsl:attribute>
			</xsl:if>
	
			<xsl:value-of select="nom"/>
		</a>
	</li>
</xsl:template>

</xsl:stylesheet>