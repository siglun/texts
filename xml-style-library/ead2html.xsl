<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

<!-- $Id$ -->


  <xsl:output omit-xml-declaration="no"
    method="xml"
    media-type="text/html"
    encoding="utf-8"
    indent = "yes"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />

  <xsl:template match="/">
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:apply-templates
	    select="ead/eadheader/filedesc/titlestmt/titleproper"/> 
	</xsl:element>
	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute name="href">/css-style/html.css</xsl:attribute>
	</xsl:element>
	<xsl:element name="meta">
	  <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
	  <xsl:attribute name="content">text/html; charset=utf-8</xsl:attribute>
	</xsl:element>
      </xsl:element>
      <xsl:element name="body">
	<xsl:element name="div">
	  <xsl:attribute name="class">box</xsl:attribute>
	  <xsl:element name="img">
	    <xsl:attribute
	      name="src">/2004/ediffah/ediffah.jpg</xsl:attribute> 
	      <xsl:attribute name="alt">En digital infrastruktur för forskningsbibliotekens arkiv- och handskriftssamlingar</xsl:attribute>
	      <xsl:attribute name="height">109</xsl:attribute>
	      <xsl:attribute name="width">178</xsl:attribute>
	      <xsl:attribute name="border">0</xsl:attribute>
	      <xsl:attribute name="class">right</xsl:attribute>
	    </xsl:element>
	  <xsl:element name="h1">
	    <xsl:apply-templates select="ead/archdesc/did/unittitle"/>
	  </xsl:element>
	  <xsl:element name="table">
	    <xsl:attribute name="class">navigation</xsl:attribute>
	    <xsl:apply-templates select="ead/archdesc"/>
	  </xsl:element>
	</xsl:element>
	<xsl:apply-templates select="ead/dsc"/>
	<xsl:element name="p">
	  <xsl:attribute name="class">right</xsl:attribute>
	  <xsl:element name="a">
	    <xsl:attribute name="href">http://validator.w3.org/check?uri=referer</xsl:attribute> 
	    <xsl:element name="img">
	      <xsl:attribute
		name="src">http://www.w3.org/Icons/valid-xhtml10</xsl:attribute> 
	      <xsl:attribute name="alt">Valid XHTML 1.0!</xsl:attribute>
	      <xsl:attribute name="height">31</xsl:attribute>
	      <xsl:attribute name="width">88</xsl:attribute>
	      <xsl:attribute name="border">0</xsl:attribute>
	      <xsl:attribute name="class">right</xsl:attribute>
	    </xsl:element>
	  </xsl:element>
	  <xsl:apply-templates
	    select="ead/eadheader/filedesc/titlestmt/author"/>
	  <xsl:element name="br"/>
	  <xsl:element name="a">
	    <xsl:attribute
	      name="href"><xsl:text>?passthru=1</xsl:text></xsl:attribute> 
	    View EAD XML source
	  </xsl:element>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dsc">
    <xsl:element name="table">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="c01|c02|c03|c04|c05|c06|c07">
    <xsl:element name="table">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="did">
    <xsl:if test="origination">
      <xsl:element name="tr">
	<xsl:attribute name="align">left</xsl:attribute>
	<xsl:apply-templates select="origination"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="unitdate">
      <xsl:element name="tr">
	<xsl:attribute name="align">left</xsl:attribute>
	<xsl:apply-templates select="unitdate"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="physdesc">
      <xsl:element name="tr">
	<xsl:attribute name="align">left</xsl:attribute>
	<xsl:apply-templates select="physdesc"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="acqinfo">
      <xsl:element name="tr">
	<xsl:attribute name="align">left</xsl:attribute>
	<xsl:apply-templates select="acqinfo"/>
      </xsl:element>
    </xsl:if>
    <xsl:if test="repository">
      <xsl:element name="tr">
	<xsl:attribute name="align">left</xsl:attribute>
	<xsl:apply-templates select="repository"/>
      </xsl:element>
    </xsl:if>
  </xsl:template>

  <xsl:template match="origination/persname">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Arkivbildare (person):
    </xsl:element>
    <xsl:element name="td">
	<xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/></xsl:element>
  </xsl:template>

  <xsl:template match="origination/corpname">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Arkivbildare (organisation)
    </xsl:element>
    <xsl:element name="td">
      <xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="origination/famname">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Arkivbildare (familj)
    </xsl:element>
    <xsl:element name="td">
      <xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
    
  <xsl:template match="physdesc">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Fysisk beskrivning
    </xsl:element>
    <xsl:element name="td">
      <xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="unitdate">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Tid för bildande
    </xsl:element>
    <xsl:element name="td">
      <xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="dimensions">
    <xsl:element name="dl">
      <xsl:element name="dt">
	<xsl:element name="strong">
	  Omfattning
	</xsl:element>
      </xsl:element>
      <xsl:element name="dd">
	<xsl:value-of select="."/>
	<xsl:if test="@unit">
	  <xsl:text> </xsl:text><xsl:value-of select="@unit"/>
	</xsl:if>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="acqinfo">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Förvärv
    </xsl:element>
    <xsl:element name="td">
      <xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
	  
  <xsl:template match="repository">
    <xsl:element name="th">
      <xsl:attribute name="class">left-property</xsl:attribute>
      Arkivinstitution
    </xsl:element>
    <xsl:element name="td">
      <xsl:attribute name="class">left</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="controlaccess">
    <xsl:element name="tr">
      <xsl:element name="th">
	<xsl:attribute name="class">left-property</xsl:attribute>
	Ämnesord/Sökbegrepp
      </xsl:element>
      <xsl:element name="td">
	<xsl:attribute name="class">left</xsl:attribute>
	<xsl:element name="dl">
	  <xsl:if test="subject">
	    <xsl:element name="dt">
	      <xsl:element name="strong">Ämnesord</xsl:element>
	    </xsl:element>
	    <xsl:for-each select="subject">
	      <xsl:element name="dd">
		<xsl:value-of select="."/>
	      </xsl:element>
	    </xsl:for-each>
	  </xsl:if>
	  <xsl:if test="genreform">
	    <xsl:element name="dt">
	      <xsl:element name="strong">Genre/innehåll</xsl:element>
	    </xsl:element>
	    <xsl:for-each select="genreform">
	      <xsl:element name="dd">
		<xsl:value-of select="."/>
	      </xsl:element>
	    </xsl:for-each>
	  </xsl:if>
	  <xsl:if test="occupation">
	    <xsl:element name="dt">
	      <xsl:element name="strong">Inriktning</xsl:element>
	    </xsl:element>
	    <xsl:for-each select="occupation">
	      <xsl:element name="dd">
		<xsl:value-of select="."/>
	      </xsl:element>
	    </xsl:for-each>
	  </xsl:if>
	  <xsl:if test="persname">
	    <xsl:element name="dt">
	      <xsl:element name="strong">Person</xsl:element>
	    </xsl:element>
	    <xsl:for-each select="persname">
	      <dd><xsl:value-of select="."/></dd>
	    </xsl:for-each>
	  </xsl:if>
	  <xsl:if test="corpname">
	    <xsl:element name="dt">
	      <xsl:element name="strong">Organisation</xsl:element>
	    </xsl:element>
	    <xsl:for-each select="corpname">
	      <dd><xsl:value-of select="."/></dd>
	    </xsl:for-each>
	  </xsl:if>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template name="p">
    <xsl:apply-templates/>
  </xsl:template>

<!--

$Log$
Revision 1.1  2009/06/29 11:11:51  sigfrid
Initial revision

Revision 1.2  2004/10/12 12:22:49  sigge
Ändrat yrkesinriktning till Inriktning


-->



</xsl:transform>
