<?xml version="1.0"?>
<xsl:stylesheet version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 

 <xsl:output method="xml"
  doctype-public="-//WAPFORUM//DTD WML 1.1//EN"
  media-type="text/vnd.wap.wml"
  doctype-system="http://www.wapforum.org/DTD/wml_1.1.xml"
  indent="yes"/>

  <xsl:template match="django-objects">
    <wml>
      <xsl:apply-templates/>
    </wml>
  </xsl:template>

  <xsl:template match="object">
    <card>
      <p class="title">
        <anchor>
          <go> 
            <xsl:attribute name="href">
              <xsl:value-of select="@pk"/>
            </xsl:attribute>
          </go>
          <xsl:value-of select="field[@name='article_headline']"/>
        </anchor>
      </p>

      <p>
        <xsl:value-of select="field[@name='date_published']"/><br/>
        <xsl:value-of select="field[@name='author']"/>
        <xsl:value-of select="field[@name='tags']"/>
        <i><xsl:value-of select="field[@name='article_ingress']"/></i>
        <xsl:value-of select="field[@name='html_article_content']"/>
      </p>
    </card>
  </xsl:template>

      <xsl:template match="field">
        <p><xsl:value-of select="node()"/></p>
      </xsl:template>

    </xsl:stylesheet>


