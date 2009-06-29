<?xml version="1.0" encoding="ISO-8859-1"?>
<!--

   $Id$

-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

 <xsl:output omit-xml-declaration="yes"
    method="xml"
    media-type="text/xml"
    encoding="utf-8"
    />

  <xsl:param name="lang" select="'sv'"/>

  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:choose>
	<xsl:when test="@xml:lang">
	  <xsl:if test="@xml:lang = $lang">
	    <xsl:apply-templates select="@*|node()"/>
	  </xsl:if>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates select="@*|node()"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>