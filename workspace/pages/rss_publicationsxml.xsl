<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/date-time.xsl"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template match="data">
	<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
		<channel>
			<title><xsl:value-of select="$website-name"/></title>
			<link><xsl:value-of select="$root"/></link>
			<description><xsl:value-of select="$website-name"/> Feed</description>
			<language>fr-fr</language>
			<generator>Symphony (build <xsl:value-of select="$symphony-version"/>)</generator>
			<atom:link href="{$root}/rss/" rel="self" type="application/rss+xml" />
			<xsl:for-each select="rss-publications/entry">
				<item>
					<title><xsl:value-of select="titre"/></title>
					<link><xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="/data/navigation/page[@handle='publication']/item/@handle"/>/<xsl:value-of select="titre/@handle"/>/</link>
					<pubDate>
						<xsl:call-template name="format-date">
							<xsl:with-param name="date" select="date/date/start"/>
							<xsl:with-param name="format" select="'w, d m Y T'"/>
						</xsl:call-template>
						<xsl:text> </xsl:text>
						<xsl:value-of select="translate($timezone,':','')"/>
					</pubDate>
					<guid><xsl:value-of select="$root"/>/<xsl:value-of select="$url-language"/>/<xsl:value-of select="/data/navigation/page[@handle='publication']/item/@handle"/>/<xsl:value-of select="titre/@handle"/>/</guid>
					<description><xsl:value-of select="auteur-de-la-publication"/></description>
				</item>
			</xsl:for-each>
		</channel>
	</rss>
</xsl:template>

</xsl:stylesheet>