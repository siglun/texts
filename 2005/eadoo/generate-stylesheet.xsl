<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:office="http://openoffice.org/2000/office"
  xmlns:style="http://openoffice.org/2000/style"
  xmlns:text="http://openoffice.org/2000/text"
  xmlns:table="http://openoffice.org/2000/table"
  xmlns:draw="http://openoffice.org/2000/drawing"
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
  office:class="text" office:version="1.0"> 

<!--

This style sheet generates another style sheet, based on the content in
table-lables.xml.

Author: Sigfrid Lundberg, Sigfrid.Lundberg@lub.lu.se

Last modified by $Author$ $Date$

$Id$

-->

  <xsl:output method="xml"
    encoding="utf-8"
    indent="yes"
    omit-xml-declaration="no"
    />  

  <xsl:param name="lang" select="'en'"/>

  <xsl:template match="/">
    <xsl:element name="xsl:stylesheet">
      <xsl:attribute name="xmlns:xsl">http://www.w3.org/1999/XSL/Transform</xsl:attribute>
      <xsl:attribute name="xmlns:fo">http://www.w3.org/1999/XSL/Format</xsl:attribute>
      <xsl:attribute name="xmlns:office">http://openoffice.org/2000/office</xsl:attribute>
      <xsl:attribute name="xmlns:style">http://openoffice.org/2000/style</xsl:attribute>
      <xsl:attribute name="xmlns:text">http://openoffice.org/2000/text</xsl:attribute>
      <xsl:attribute name="xmlns:table">http://openoffice.org/2000/table</xsl:attribute>
      <xsl:attribute name="xmlns:draw">http://openoffice.org/2000/drawing</xsl:attribute>
      <xsl:attribute name="xmlns:xlink">http://www.w3.org/1999/xlink</xsl:attribute>
      <xsl:attribute name="xmlns:dc">http://purl.org/dc/elements/1.1/</xsl:attribute>
      <xsl:attribute name="xmlns:meta">http://openoffice.org/2000/meta</xsl:attribute>
      <xsl:attribute name="xmlns:number">http://openoffice.org/2000/datastyle</xsl:attribute>
      <xsl:attribute name="xmlns:svg">http://www.w3.org/2000/svg</xsl:attribute>
      <xsl:attribute name="xmlns:chart">http://openoffice.org/2000/chart</xsl:attribute>
      <xsl:attribute name="xmlns:dr3d">http://openoffice.org/2000/dr3d</xsl:attribute>
      <xsl:attribute name="xmlns:math">http://www.w3.org/1998/Math/MathML</xsl:attribute>
      <xsl:attribute name="xmlns:form">http://openoffice.org/2000/form</xsl:attribute>
      <xsl:attribute name="xmlns:script">http://openoffice.org/2000/script</xsl:attribute>
      <xsl:attribute name="xmlns:config">http://openoffice.org/2001/config</xsl:attribute>
      <xsl:attribute name="version">1.0</xsl:attribute>
      <xsl:apply-templates select="headings-list"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="headings[@table='archdesc']">

    <xsl:for-each select="use/in">
      <xsl:element name="xsl:template">
	<xsl:attribute name="match"><xsl:value-of select="@name"/></xsl:attribute>
	<xsl:element name="xsl:call-template">
	  <xsl:attribute name="name">create-content-header</xsl:attribute>
	  <xsl:element name="xsl:with-param">
	    <xsl:attribute name="name">head</xsl:attribute>
	    <xsl:attribute name="select">&apos;Content <xsl:value-of
		select="@name"/>&apos;</xsl:attribute>  
	  </xsl:element>
	</xsl:element>
	<xsl:for-each select="../../heading">
	  <xsl:element name="xsl:apply-templates">
	    <xsl:attribute name="select"><xsl:value-of
		select="@name"/></xsl:attribute>
	  </xsl:element>
	</xsl:for-each>
	<xsl:element name="xsl:apply-templates">
	  <xsl:attribute name="select"><xsl:value-of
	      select="@followto"/></xsl:attribute>
	</xsl:element>
      </xsl:element>
    </xsl:for-each>

    <xsl:for-each select="heading">
      <xsl:if test="string[@xml:lang=$lang]/text()">
	<xsl:element name="xsl:template">
	  <xsl:attribute name="match"><xsl:value-of select="@name"/></xsl:attribute>
	  <xsl:element name="xsl:call-template">
	    <xsl:attribute name="name">create-header</xsl:attribute>
	    <xsl:element name="xsl:with-param">
	      <xsl:attribute name="name">lvl</xsl:attribute>
	      <xsl:attribute name="select">2</xsl:attribute>
	    </xsl:element>
	    <xsl:element name="xsl:with-param">
	      <xsl:attribute name="name">head</xsl:attribute>
	      <xsl:attribute name="select">&apos;<xsl:value-of
		  select="string[@xml:lang=$lang]"/>&apos;</xsl:attribute> 
	    </xsl:element>
	  </xsl:element>
	  <xsl:element name="xsl:apply-templates"/>
	</xsl:element>
      </xsl:if>
    <xsl:text>

    </xsl:text>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="headings[@table='did']">
    <xsl:element name="xsl:template">
      <xsl:attribute name="match"><xsl:value-of
	  select="@table"/></xsl:attribute>

      <xsl:element name="xsl:call-template">
	<xsl:attribute name="name">create-header</xsl:attribute>
	<xsl:element name="xsl:with-param">
	  <xsl:attribute name="name">lvl</xsl:attribute>
	  <xsl:attribute name="select">2</xsl:attribute>
	</xsl:element>
	<xsl:element name="xsl:with-param">
	  <xsl:attribute name="name">head</xsl:attribute>
	  <xsl:attribute name="select">&apos;<xsl:value-of
	      select="/headings-list/headings[@table='archdesc']/heading[@name='did']/string[@xml:lang=$lang]"/>&apos;</xsl:attribute> 
	</xsl:element>
      </xsl:element>


      <table:table
	table:style-name="Table1"
	table:name="did">

	<table:table-column 
	  table:style-name="Table1.A"
	  table:number-columns-repeated="2"/>
	<table:table-rows>
	  <xsl:for-each select="heading">
	    <table:table-row>
	      <table:table-cell table:style-name="Table1.A1">
		<text:p>
		  <xsl:value-of select="string[@xml:lang = $lang]"/>
		</text:p>
	      </table:table-cell>
	      <table:table-cell table:style-name="Table1.A1">
		<text:p>
		  <xsl:element name="text:bookmark-start">
		    <xsl:element name="xsl:attribute">
		      <xsl:attribute name="name">text:name</xsl:attribute>
		      <xsl:element name="xsl:value-of">
			<xsl:attribute name="select">concat(name(.),'_','<xsl:value-of select="@name"/>','-',generate-id(.))</xsl:attribute> 
		      </xsl:element>
		    </xsl:element>
		  </xsl:element>     
		  <xsl:element name="xsl:apply-templates">
		    <xsl:attribute name="select"><xsl:value-of
			select="@name"/></xsl:attribute>
		  </xsl:element>
		  <xsl:element name="text:bookmark-end">
		    <xsl:element name="xsl:attribute">
		      <xsl:attribute name="name">text:name</xsl:attribute>
		      <xsl:element name="xsl:value-of">
			<xsl:attribute
			  name="select">concat(name(.),'_','<xsl:value-of select="@name"/>','-',generate-id(.))</xsl:attribute> 
		      </xsl:element>
		    </xsl:element>
		  </xsl:element>
		</text:p>
	      </table:table-cell>
	    </table:table-row>
	  </xsl:for-each>
	</table:table-rows>
      </table:table>
    </xsl:element>
  </xsl:template>

  <xsl:template match="headings"/>

<!--

  $Log$
  Revision 1.1  2009/06/29 11:09:09  sigfrid
  Initial revision

  Revision 1.3  2004/12/13 13:38:31  sigge
  Added a heading to did sections all over.

  Revision 1.2  2004/12/13 13:15:37  sigge
  Fixed a number of problems, and added bookmarks to the "did-tables"

  Revision 1.1  2004/12/10 16:44:11  sigge
  Initial revision


-->


</xsl:stylesheet>

