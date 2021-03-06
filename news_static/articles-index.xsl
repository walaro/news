<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:template match="django-objects">
		<html>
			<head>
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
			</head>
			<body>
				<form action="/your-name/" method="post">
				    <label for="your_name">Your name: </label>
				    <input id="your_name" type="text" name="your_name" value="{{ current_name }}"/>
				    <input type="submit" value="OK"/>
				</form>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="object">

		<div>
			<h1>
				<a> 
					<xsl:attribute name="href">
						<xsl:value-of select="@pk"/>
					</xsl:attribute>
					<xsl:value-of select="field[@name='article_headline']"/>
				</a>
			</h1>
			<h4><xsl:value-of select="field[@name='date_published']"/></h4>
			<i><xsl:value-of select="field[@name='article_ingress']"/></i>
			<p><xsl:value-of select="field[@name='html_article_content']"/></p>
		</div>
	</xsl:template>

	<xsl:template match="field">
		<p><xsl:value-of select="node()"/></p>
	</xsl:template>

</xsl:stylesheet>