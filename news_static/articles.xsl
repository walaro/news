<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="django-objects">
		<html>
			<head>
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
			</head>
			<body>
				<ul class="nav nav-tabs nav-justified">
					<li><a href="/">Alla</a></li>
					<li><a href="/Politik">Politik</a></li>
					<li><a href="/Sport">Sport</a></li>
					<li><a href="/Väder">Väder</a></li>
				</ul>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="object">

		<div class="col-md-6 col-md-offset-3">
			<h1>
				<a> 
					<xsl:attribute name="href">
						<xsl:value-of select="@pk"/>
					</xsl:attribute>
					<xsl:value-of select="field[@name='article_headline']"/>
				</a>
			</h1>
			<h4><xsl:value-of select="field[@name='date_published']"/></h4>
			<p><xsl:value-of select="field[@name='tags']"/></p>
			<i><xsl:value-of select="field[@name='article_ingress']"/></i>
			<p><xsl:value-of select="field[@name='html_article_content']"/></p>
		</div>
	</xsl:template>

	<xsl:template match="field">
		<p><xsl:value-of select="node()"/></p>
	</xsl:template>

</xsl:stylesheet>