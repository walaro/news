<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
    <xsl:template match="data">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="logged_in"/> 
    <xsl:template match="django-objects">
		<html>
			<head>
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<style>
					.srch-container {
					}
				.header {
					text-align: center;
				}

				ul {
					display: block;
				}


				input {
					border: 1px solid black;
				}

				h1 {
					font-size: 22px;
				}
				</style>
			</head>
			<body>
				<script>
					function search() {
	                    var query = document.getElementById('search').value;
	                    console.log("what" + query)
	                    window.location.href = "http://localhost:8000/articles?q=" + query;
					}
				</script>

		        <div class="header">

				<ul>
					<li><a href="/">Alla</a></li>
					<li><a href="/Politik">Politik</a></li>
					<li><a href="/Sport">Sport</a></li>
					<li><a href="/Väder">Väder</a></li>
                </ul>

					<input type="text" id="search"/>
					<button type="button" class="btn btn-default" onclick="search()">Search</button>
                    <xsl:choose>
                        <xsl:when test="boolean(/data/logged_in = 'true')">
                            <a href="/logout" class="btn btn-default" role="button">Logout</a>
                            <a href="/new" class="btn btn-default" role="button">New article</a>
                        </xsl:when>
                        <xsl:otherwise>
                            <a href="/login" class="btn btn-default" role="button">Login</a>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
                <div class="col-md-6 col-md-offset-3">
                    <xsl:apply-templates/>
		        </div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="object">

			<h1>
				<a> 
					<xsl:attribute name="href">
						<xsl:value-of select="@pk"/>
					</xsl:attribute>
					<xsl:value-of select="field[@name='article_headline']"/>
                </a>
                <xsl:if test="boolean(/data/logged_in = 'true')">
                    <a class="btn btn-default" role="button">

                        <xsl:attribute name="href">
                            <xsl:value-of select="@pk"/>/edit
                        </xsl:attribute>
                            
                        Edit
                    </a>
                </xsl:if>
			</h1>
			<h4><xsl:value-of select="field[@name='date_published']"/></h4>
			<h3><xsl:value-of select="field[@name='author']"/></h3>
			<p><xsl:value-of select="field[@name='tags']"/></p>
			<i><xsl:value-of select="field[@name='article_ingress']"/></i>
	</xsl:template>

	<xsl:template match="field">
		<p><xsl:value-of select="node()"/></p>
    </xsl:template>

</xsl:stylesheet>
