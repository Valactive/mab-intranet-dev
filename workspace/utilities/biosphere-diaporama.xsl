<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- template for whole slideshow -->
<xsl:template name="biosphere-diaporama" match="data/biosphere-diaporama/entry/images/item">

	<!-- wrapper element for the large image -->
	<div id="image_wrap">
	
		<!-- Initially the image is a simple 1x1 pixel transparent GIF -->
		<img src="{$workspace}/img/blank.gif" width="500" />
		<!-- legende -->
		<p class="legende">Chargement légende</p>
		<p class="copyright">Chargement copyright...</p>
	
	</div>
	<!-- "previous page" action -->
	<a class="prev browse left"></a>
	
	<!-- root element for scrollable -->
	<div class="scrollable">   
	   
	   <!-- root element for the items -->
	   <div class="items">
		   <xsl:apply-templates name="diapo-images" select="data/biosphere-diaporama/entry/images/item[position() mod 5 = 1]" mode="slide"/>
	   </div>
	   
	</div>
	
	<!-- "next page" action -->
	<a class="next browse right"></a>


</xsl:template>
<!-- template for 5 images -->
<xsl:template match="/data/biosphere-diaporama/entry/images/item" mode="slide">
<div>
<!-- current item and 4 siblings after-->
	<xsl:apply-templates select=". | following-sibling::item[position()  &lt;= 5]" mode="entry" />
</div>
</xsl:template>

<!-- template for one image -->
<xsl:template match="/data/biosphere-diaporama/entry/images/item" mode="entry">
	<xsl:variable name="imgPath" select="image/@path"/>
	<img src="{$root}/image/2/100/75/5{$imgPath}/{image/filename}" alt="{legende}_{copyright}" />
</xsl:template>
</xsl:stylesheet>