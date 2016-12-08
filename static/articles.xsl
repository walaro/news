<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="django-objects">
            <p> <xsl:apply-templates /></p>
	</xsl:template>

    <xsl:template match="object">
            <p><xsl:apply-templates /></p>
    </xsl:template>

    <xsl:template match="field">
            <p>aaaa</p>
    </xsl:template>
</xsl:stylesheet>
