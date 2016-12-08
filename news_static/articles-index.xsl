<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="articles">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="article">
		<a href="{title}">
			<xsl:value-of select="title"/>
		</a>
	</xsl:template>

</xsl:stylesheet>