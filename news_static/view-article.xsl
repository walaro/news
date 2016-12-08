<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="django-objects">
		<html>
			<head>
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

				<style>
					.center {
						text-align: center;
					}

				</style>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="object">

		<div class="row">
			<div class="col-md-6 col-md-offset-3">
			<h1 class="title">
				<a> 
					<xsl:attribute name="href">
						<xsl:value-of select="@pk"/>
					</xsl:attribute>
					<xsl:value-of select="field[@name='article_headline']"/>
				</a>
			</h1>
			<h4><xsl:value-of select="field[@name='date_published']"/></h4>
			<i><xsl:value-of select="field[@name='article_ingress']"/></i>
			<br/><br/>
			<p><xsl:value-of select="field[@name='html_article_content']"/></p>
		</div>
		</div>
	</xsl:template>

	<xsl:template match="field">
		<p><xsl:value-of select="node()"/></p>
	</xsl:template>

</xsl:stylesheet>