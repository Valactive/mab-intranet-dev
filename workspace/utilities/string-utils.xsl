<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:string="http://symphony-cms.com/functions"
xmlns:func="http://exslt.org/functions"
extension-element-prefixes="func" 
>
<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#String utility functions (yes, functions)
 
version:  1.01
author:   Simon de Turck
email:    simon@zimmen.com
 
 
To use these functions add the string namespace to your master (or wherever you feel it suits best) stylesheet and import this utility. Add the namespace to all stylesheets where you want to use these functions.
 
Namespace: xmlns:string="http://symphony-cms.com/functions"
Import: String-Utils.xsl
 
*This utility uses some EXSLT that is supported in libxslt 1.0.19 and later*
  
Usage:
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:string="http://symphony-cms.com/functions">
    ...
    </xsl:stylesheet>
 
*Convert string to lowercase:*
    <xsl:value-of select="string:lower-case([selector])" />
 
example: 
    <xsl:value-of select="string:lower-case('ABC')" />
output -> abc        
        
*Convert string to uppercase:*
    <xsl:value-of select="string:upper-case([selector])" />
      
example: 
    <xsl:value-of select="string:upper-case('abc')" />
output -> ABC
 
*Replace in string:*
    <xsl:value-of select="string:replace([selector],[needle],[replace])" />
 
example: 
    <xsl:value-of select="string:replace('a b c',' ',' to the ')" />
output -> a to the b to the c
 
*Split a string (returns a nodeset):*
    <xsl:copy-of select="string:split([selector][,[delimiter],[rootnodename],[nodename]])" />
      
Default delimiter: ','
Default rootnodename: 'nodeset'
Default nodename: 'node'
 
example 1: 
    <xsl:copy-of select="string:split('a,b,c')" />
output -> 
    <nodeset>
        <node>a</node>
        <node>b</node>
        <node>c</node>
    </nodeset>
 
example 2:
    <xsl:copy-of select="string:split('book1#book2#book3','#','bookstore','book')" />
output -> 
    <bookstore>
        <book>book1</book>
        <book>book2</book>
        <book>book3</book>
    </bookstore>
 
example 3:
    <xsl:copy-of select="string:split('item1#item2#item3','#','ul','li')" />
output -> 
    <ul>
	    <li>book1</li>
  		<li>book2</li>
  		<li>book3</li>
    </ul>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
 
  <!-- Convert string to lowercase -->
  <func:function name="string:lower-case">
    <xsl:param name="in" />
    <func:result select="translate($in,'ABCDEFGHIJKLMNOPQRSTUVWXYZÀÈÌÒÙÁÉÍÓÚÝÂÊÎÔÛÃÑÕÄËÏÖÜŸÅÆŒÇÐØ','abcdefghijklmnopqrstuvwxyzàèìòùáéíóúýâêîôûãñõäëïöüÿåæœçðø')" />
  </func:function>
  
  <!-- Convert string to uppercase -->
  <func:function name="string:upper-case">
    <xsl:param name="in" />
    <func:result select="translate($in,'abcdefghijklmnopqrstuvwxyzàèìòùáéíóúýâêîôûãñõäëïöüÿåæœçðø','ABCDEFGHIJKLMNOPQRSTUVWXYZÀÈÌÒÙÁÉÍÓÚÝÂÊÎÔÛÃÑÕÄËÏÖÜŸÅÆŒÇÐØ')" />
  </func:function>
  
  <!-- Replace a string within a string (or find the needle in the haystack and replace it) -->
  <func:function name="string:replace">
    <xsl:param name="in" />
    <xsl:param name="needle" />
    <xsl:param name="replace" select="''" />
     <func:result>
       <xsl:choose>
         <xsl:when test="contains($in, $needle)">
           <xsl:value-of select="substring-before($in, $needle)" />
           <xsl:value-of select="$replace" />
           <xsl:value-of select="string:replace(substring-after($in, $needle),$needle,$replace)" />
         </xsl:when>
         <xsl:otherwise>
           <xsl:value-of select="$in" />
         </xsl:otherwise>
       </xsl:choose>
     </func:result>
  </func:function>
  
  <!-- Splits a string and returns a nodeset -->
  <func:function name="string:split">
    <xsl:param name="in" />
    <xsl:param name="delim" select="','" />
    <xsl:param name="rootnode" select="'nodeset'" />
    <xsl:param name="nodename" select="'node'" />
    <func:result>
      <xsl:element name="{$rootnode}">
        <xsl:copy-of select="string:createnodes($in,$delim,$nodename)" />
      </xsl:element>
    </func:result>
  </func:function>
  <func:function name="string:createnodes">
    <xsl:param name="haystack" />
    <xsl:param name="needle" />
    <xsl:param name="nodename" select="'node'" />
     <func:result>
       <xsl:choose> 
         <xsl:when test="contains($haystack, $needle)">
           <xsl:element name="{$nodename}">
            <xsl:value-of select="substring-before($haystack, $needle)" />
           </xsl:element>
           <xsl:copy-of select="string:createnodes(substring-after($haystack, $needle),$needle,$nodename)" />
         </xsl:when>
         <xsl:otherwise>
           <xsl:element name="{$nodename}">
            <xsl:value-of select="$haystack" />
           </xsl:element>
         </xsl:otherwise>
       </xsl:choose>
     </func:result>
  </func:function>
</xsl:stylesheet>