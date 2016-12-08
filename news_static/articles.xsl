<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="django-objects">
		<body>
			<xsl:apply-templates/>
		</body>
	</xsl:template>

	<xsl:template match="object">
		<div>
			<xsl:apply-templates select="field"/>
		</div>
	</xsl:template>

	<xsl:template match="field">
		<p><xsl:value-of select="node()"/></p>
	</xsl:template>

</xsl:stylesheet>