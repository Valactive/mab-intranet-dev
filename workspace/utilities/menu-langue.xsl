<?xml version="1.0" encoding="UTF-8"?>
<!--
Pour generer une liste LI de liens vers la même  pages dans les autres languages
La fonctions assigne a chaque lien l'url correspondante en changeant l'url de la page courante :
    1 - changement de l'extension langue
    2 - changement du page handle dans la bonne langue (page lhandle extension)
    DEUX PARAMETRES
    1- supported-language-codes : les languages supportes
    2- current-language-code    : language courant du navigateur
    
    
Pour fonctionner la page doit contenir . les datasources "element" et "element-lg"    
                                        . le datasource PLH Page lié à page Handle
                                        . l'évenement Language redirect
-->


<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:string="http://symphony-cms.com/functions"
	>

	<xsl:template name="menu-langue">
		<xsl:param name="page" select="''"/>
	    <xsl:param name="supported-language-codes"/>
	    <xsl:param name="current-language-code" />
	   
	    <xsl:variable name="pageHandle">
	        <xsl:value-of select="/data/plh-page/page/item[@lang=$current-language-code]/@handle" />
	    </xsl:variable>
	
	    <ul class="lang-switcher">
	        <xsl:for-each select="$supported-language-codes">
	           <xsl:variable name="langue"><xsl:value-of select="./@handle" /></xsl:variable>
	           <xsl:variable name="cur-page"><xsl:value-of select="$current-page"/></xsl:variable>
	          
	           	<xsl:variable name="sub-page">
		           	<xsl:choose>
		           	<xsl:when test="$langue='fr' and $page !=''" >
		           		<xsl:value-of select="/data/mab-sous-rubriques/entry/nom[@handle=$page]/@handle-fr"/>/</xsl:when>
		           	<xsl:when test="$langue='en' and $page != ''">
		           		<xsl:value-of select="/data/mab-sous-rubriques/entry/nom[@handle=$page]/@handle-en"/>/</xsl:when>
					</xsl:choose>
				</xsl:variable>	
	           
	           <xsl:variable name="id-page"><xsl:value-of select="/data/mab-sous-rubriques/entry[nom/@handle=$page]/@id"/>/</xsl:variable>
	           
	           <li>
	                <xsl:choose>
	                    <xsl:when test=". = $current-language-code">
	                        <span><xsl:value-of select="."/></span>
	                    </xsl:when>
	                    <xsl:otherwise>
	                    	<xsl:choose>
		                    	<xsl:when test="$pageHandle!=''">
			                        <a>
			                        <xsl:attribute name="href">
			                        	<xsl:value-of select="$root"/>/<xsl:value-of select="$langue"/>/<xsl:value-of select="/data/plh-page/page/item[@lang=$langue]/@handle"/>/<xsl:value-of select="substring-after($current-path,concat('/',$pageHandle,'nada/'))"/>
			                        	<xsl:value-of select="$sub-page"/><xsl:value-of select="$id-page"/>
			                        </xsl:attribute>
			                        
			                        
			                        
			                        
			                        <xsl:if test="./@handle = $current-language-code">
		          		          		<xsl:attribute name="class">active</xsl:attribute>
			                		</xsl:if>
			                            <xsl:value-of select="string:upper-case(./@handle)"/>
		    	                    </a>
								</xsl:when>
				
								<xsl:otherwise>
									<a href="{$root}/{$langue}/">
								                        
	            		            <xsl:if test="./@handle = $current-language-code">
	                    			<xsl:attribute name="class">active</xsl:attribute>
	                				</xsl:if>
	                        	    	<xsl:value-of select="string:upper-case(./@handle)"/>
	                        		</a>
	                        	</xsl:otherwise>
	                        </xsl:choose>
	                    </xsl:otherwise>
	                </xsl:choose>
	            </li>
	            <xsl:if test="position()=1"><xsl:text>|</xsl:text></xsl:if>
	        </xsl:for-each>
	    </ul>
	</xsl:template>
</xsl:stylesheet>