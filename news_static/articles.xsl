<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="django-objects">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="object">
		<p><xsl:value-of select="field"/></p>
	</xsl:template>

</xsl:stylesheet>