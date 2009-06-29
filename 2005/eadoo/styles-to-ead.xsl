<xsl:stylesheet xmlns:style="http://openoffice.org/2000/style"
  xmlns:text="http://openoffice.org/2000/text"
  xmlns:office="http://openoffice.org/2000/office"
  xmlns:table="http://openoffice.org/2000/table"
  xmlns:draw="http://openoffice.org/2000/drawing"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:meta="http://openoffice.org/2000/meta"
  xmlns:number="http://openoffice.org/2000/datastyle"
  xmlns:svg="http://www.w3.org/2000/svg"
  xmlns:chart="http://openoffice.org/2000/chart"
  xmlns:dr3d="http://openoffice.org/2000/dr3d"
  xmlns:math="http://www.w3.org/1998/Math/MathML"
  xmlns:form="http://openoffice.org/2000/form"
  xmlns:script="http://openoffice.org/2000/script"
  xmlns:config="http://openoffice.org/2001/config"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:str="http://exslt.org/strings"
  version="1.1"
  office:class="text"
  exclude-result-prefixes="office meta  table number dc fo
  xlink chart math script xsl str draw svg dr3d form config text style"> 

  <xsl:output method="xml"
    encoding="utf-8"
    indent="yes"
    omit-xml-declaration="no"
    />  

  <xsl:template match="/">
    <styles>
      <xsl:for-each select="//xsl:template[text:span or text:p]">
	<xsl:if test="text:span/@text:style-name">
	  <xsl:element name="style">
	    <xsl:attribute name="name"><xsl:value-of
		select="text:span/@text:style-name"/></xsl:attribute>
	    <xsl:attribute name="tag"><xsl:value-of
		select="@match"/></xsl:attribute>
	    <xsl:attribute name="type">phrase-level</xsl:attribute>
	  </xsl:element>
	</xsl:if>
	<xsl:if test="text:p/@text:style-name">
	  <xsl:element name="style">
	    <xsl:attribute name="name"><xsl:value-of
		select="text:span/@text:style-name"/></xsl:attribute>
	    <xsl:attribute name="tag"><xsl:value-of
		select="@match"/></xsl:attribute>
	    <xsl:attribute name="type">paragraph-level</xsl:attribute>
	  </xsl:element>
	</xsl:if>
      </xsl:for-each>
      <xsl:for-each select="//xsl:element[@name='text:span' or
	@name='text:p']">
	<xsl:if test="@text:style-name">
	  <xsl:element name="style">
	    <xsl:attribute name="name"><xsl:value-of
		select="@text:style-name"/></xsl:attribute>
	    <xsl:attribute name="tag"><xsl:value-of
		select="../@match"/></xsl:attribute>
	    <xsl:choose>
	      <xsl:when test="@name='text:span'">
		<xsl:attribute name="type">phrase-level</xsl:attribute>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:attribute name="type">paragraph-level</xsl:attribute>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:element>
	</xsl:if>
      </xsl:for-each>
    </styles>
  </xsl:template>

</xsl:stylesheet>