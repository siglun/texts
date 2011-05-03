<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       xmlns:dc="http://purl.org/dc/elements/1.1/" 
	       xmlns:flickr="urn:flickr:" 
	       xmlns:media="http://search.yahoo.com/mrss/"
	       xmlns:f="http://www.w3.org/2005/Atom"
	       xmlns:exsl="http://exslt.org/common"
	       xmlns="http://www.w3.org/2005/Atom"
	       exclude-result-prefixes="xsl f dc exsl flickr"
	       extension-element-prefixes="exsl"
	       version="1.0">

  <!--
    Builds galleries as xhtml embedded as atom content
    Author Sigfrid Lundberg (siggelundberg@gmail.com)
    $Revision$ last modified $Date$
    $Id$
  -->

  <xsl:param name="year"      select="'2011'"/>
  <xsl:param name="month"     select="'January'"/>
  <xsl:param name="month_num" select="'01'"/>
  <xsl:param name="date"      select="'01'"/>

  <xsl:param name="unwanted" select="'&lt;/a&gt;&lt;/p&gt;'"/>
  
  <xsl:output method="xml"
	      indent="yes"
	      encoding="UTF-8"/>

  <xsl:template match="/">
    <entry xmlns="http://www.w3.org/2005/Atom"
	   xmlns:dc="http://purl.org/dc/elements/1.1/">
      <author>
	<name>Sigfrid Lundberg</name>
      </author>
      <title>
	Images taken 
	<xsl:value-of select="$month"/> 
	<xsl:value-of select="$year"/> 
      </title>
      <xsl:element name="link">
	<xsl:attribute name="href">
	  <xsl:value-of 
	      select="concat('/entries/',
		      $year,'/',$month_num,'/','images')"/>
	</xsl:attribute>
      </xsl:element>
      
      <summary>
	Gallery of photos taken in 
	<xsl:value-of select="$month"/> 
	<xsl:text> 
	</xsl:text>
	<xsl:value-of select="$year"/> 
	and published in my Flickr photostream.
      </summary>

      <content type="xhtml">
	<div xmlns="http://www.w3.org/1999/xhtml" style="width:100%;text-align:center;">
	  <p>
	    Gallery of photos taken in 
	    <xsl:value-of select="$month"/> 
	    <xsl:text> 
	    </xsl:text>
	    <xsl:value-of select="$year"/> 
	    and published in my Flickr photostream.
	  </p>
	  <xsl:apply-templates/>
	  <div style="clear:both;"><xsl:text> </xsl:text></div>
	</div>
      </content>
      <dc:date><xsl:value-of select="$year"/></dc:date>
      <category label="images" term="Images" />
      <updated><xsl:value-of select="$date"/></updated>
      <id>
	<xsl:value-of 
	    select="concat('http://www.sigfrid-lundberg.se/entries/',
		    $year,'/',$month_num,'/','images/')"/>
      </id>
    </entry>
  </xsl:template>

  <xsl:template match="f:feed">
    <xsl:for-each select="f:entry" xmlns="http://www.w3.org/1999/xhtml">

      <div style="float:left;width:30%;text-align:center;margin-bottom:1em;">
	<xsl:element name="a">
	  <xsl:attribute name="rel">viewer</xsl:attribute>
	  <xsl:attribute name="href">
	    <xsl:value-of select="f:link[@rel='enclosure']/@href"/>
	  </xsl:attribute>
	  <xsl:element name="img">
	    <xsl:attribute name="id">
	      <xsl:value-of select="concat('flickrimage',generate-id(.))"/>
	    </xsl:attribute>
	    <xsl:attribute name="style">
	      <xsl:text>width:80%;</xsl:text>
	    </xsl:attribute>
	    <xsl:attribute name="src">
	      <xsl:value-of 
		  select="concat(
			  substring-before(
			  substring-after(f:content[@type='html'],
			  'src=&quot;'),'m.jpg'),
			  'm.jpg')"/>
	    </xsl:attribute>
	  </xsl:element>
	</xsl:element>
	<xsl:element name="br"/>
	<small>
	  <xsl:value-of disable-output-escaping="yes" 
			select="substring-before(substring-after(substring-after(f:content[@type='html'],$unwanted),'&lt;p&gt;'),'&lt;/p&gt;')"/>
	  (<xsl:element name="a">
	    <xsl:attribute name="href">
	      <xsl:value-of select="f:link[@rel='alternate']/@href"/>
	    </xsl:attribute>
	    See in Flickr
	  </xsl:element>)
	</small>
      </div>
      <xsl:if test="position() mod 3 = 0">
	<div style="clear:both;"><xsl:text> </xsl:text></div>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>


</xsl:transform>
