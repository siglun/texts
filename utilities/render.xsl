<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY rdquor   "&#x201D;" ><!--rising dbl quote, right (high)-->
<!ENTITY rsquor   "&#x2019;" ><!--rising single quote, right (high)-->
<!ENTITY ldquo    "&#x201C;"  ><!--=double quotation mark, left-->
<!ENTITY rdquo    "&#x201D;"  ><!--=double quotation mark, right-->
]>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xi="http://www.w3.org/2001/XInclude"
    exclude-result-prefixes="t xi"
    version="1.0">

  <xsl:param name="base_href">https://github.com/siglun/danish-sonnets/blob/main/</xsl:param>
  
  <xsl:output method="xml"
	      encoding="UTF-8"
	      indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="t:TEI">
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:apply-templates select="t:teiHeader/t:fileDesc/t:titleStmt/t:title"/>
	</xsl:element>
	<xsl:copy-of
	    select="document('https://raw.githubusercontent.com/siglun/danish-sonnets/main/html_print_css.xml')"/>
      </xsl:element>
      <xsl:element name="body">
	<xsl:apply-templates select="t:text"/>
	<pre>
	  <xsl:for-each select="/t:TEI/t:text/t:back/t:div/t:listBibl/t:bibl">
	    <xsl:text>

	    </xsl:text>
	  </xsl:for-each>
	</pre>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="t:text">
    <xsl:apply-templates select="t:front"/>
    <xsl:apply-templates select="t:body"/>
    <!-- h2>Notes</h2>
    <xsl:for-each select="//t:note">
      <xsl:element name="p">
	<xsl:attribute name="id"><xsl:value-of select="concat('note',position())"/></xsl:attribute>
	<sup><xsl:value-of select="position()"/></sup>
	<xsl:apply-templates  mode="generatetext" select="."/>
      </xsl:element>
    </xsl:for-each -->
    <xsl:apply-templates select="t:back"/>
  </xsl:template>

  <xsl:template match="t:front">
    <h1 class="title">
      <xsl:for-each select="t:docTitle/t:titlePart/t:title" >
        <xsl:apply-templates/>
        <xsl:if test="position() &lt; last()"><br/></xsl:if>
      </xsl:for-each>
    </h1>
    <p class="author">
      <xsl:apply-templates select="t:docAuthor/t:name" />
      <xsl:apply-templates select="t:docAuthor/t:address"/>
    </p>
    <blockquote class="abstract">
      <h3>Abstract</h3>
    <xsl:apply-templates select="t:div[@type='abstract']"/>
    </blockquote>
  </xsl:template>

  <xsl:template match="t:body">
    <xsl:apply-templates/>
  </xsl:template>

 <xsl:template match="t:back">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="t:div">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="t:table">
    <table>
      <xsl:apply-templates/>
    </table>
  </xsl:template>

  <xsl:template match="t:row">
    <tr><xsl:apply-templates/></tr>
  </xsl:template>

  <xsl:template match="t:cell[@role='label']">
    <th><xsl:apply-templates/></th>
  </xsl:template>

  <xsl:template match="t:cell[@role='data']">
    <td><xsl:apply-templates/></td>
  </xsl:template>
  
  <xsl:template match="t:cell">
    <td><xsl:apply-templates/></td>
  </xsl:template>
  
  <xsl:template match="t:eg[@xml:space='preserve']"> 
    <pre>
      <xsl:value-of   select="."/>
    </pre>
  </xsl:template>

  <xsl:template match="t:eg">
    <kbd><xsl:value-of   select="."/></kbd>
  </xsl:template>
  
  <xsl:template match="t:listBibl">
    <xsl:apply-templates select="t:head"/>
    <xsl:apply-templates select="t:bibl">
      <xsl:sort select="t:author[1]|t:title[1]"/>
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="t:bibl">
    <xsl:element name="p">
      <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
      <xsl:for-each select="t:author|t:editor"> <!-- perhaps not bibliographically correct -->
	<xsl:if test="position() > 1 and position()=last()"><xsl:text> and </xsl:text></xsl:if>
	<xsl:element name="span">
	  <xsl:attribute name="class"><xsl:text>biblAuthor</xsl:text></xsl:attribute>
	  <xsl:apply-templates/>
	</xsl:element>
	<xsl:if test="position() >= 1 and not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
      </xsl:for-each>
      <xsl:choose><xsl:when test="t:date"><xsl:text>,
      </xsl:text><xsl:apply-templates select="t:date"/><xsl:text>.
      </xsl:text></xsl:when><xsl:otherwise><xsl:if test="t:author">.</xsl:if><xsl:text> </xsl:text></xsl:otherwise></xsl:choose>
      
      <xsl:if test="t:title[@level = 'a']">
        <xsl:apply-templates select="t:title[@level = 'a']"/><xsl:text>. </xsl:text>
        <xsl:if test="t:title[@level = 'j']|t:title[@level = 'm']">
          <xsl:text>In: </xsl:text>
        </xsl:if>
      </xsl:if>
      <xsl:for-each select="t:title[@level = 'j']|t:title[@level = 'm']">
	<em><xsl:apply-templates/></em>
        <xsl:if test="position() = last()"><xsl:text>. </xsl:text></xsl:if>
      </xsl:for-each>

      <xsl:if test="t:biblScope[@type='volume']">
	<xsl:text>Vol. </xsl:text><xsl:apply-templates select="t:biblScope[@type='volume']"/>
	<xsl:if test="t:biblScope[@type='number']">
	  (<xsl:apply-templates select="t:biblScope[@type='number']"/>)
	  <xsl:choose>
	    <xsl:when test="t:biblScope[@type='pp']"><xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>. </xsl:text></xsl:otherwise>
	  </xsl:choose>
	</xsl:if>
      </xsl:if>
      <xsl:if test="t:biblScope[@type='pp']">
	<xsl:text>
	  pp. </xsl:text><xsl:apply-templates select="t:biblScope[@type='pp']"/><xsl:text>.
	</xsl:text>
      </xsl:if>
      <xsl:if test="t:note">
	<br/>
	<small>
	  <xsl:apply-templates select="t:note/node()"/>
	</small>
	<br/>
      </xsl:if>
      <xsl:if test="t:ref">
	<xsl:apply-templates select="t:ref"/>
      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="t:note">
    <xsl:variable name="mid"><xsl:value-of select="generate-id(.)"/></xsl:variable>
    <xsl:for-each select="//t:note">
      <xsl:if test="generate-id(.) = $mid">
	<sup>
	  <xsl:element name="a">
	    <xsl:attribute name="href"><xsl:value-of select="concat('#note',position())"/></xsl:attribute>
	    <xsl:value-of select="position()"/>
	  </xsl:element>
	</sup>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template mode="generatetext" match="t:note">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="t:quote">
    &ldquo;<xsl:apply-templates/>&rdquo;
  </xsl:template>

  <xsl:template match="t:head">
    <h2><xsl:apply-templates/></h2>
  </xsl:template>

  <xsl:template match="t:p">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="t:ref">
    <xsl:element name="a">
      <xsl:if test="@target">
	<xsl:attribute name="href">
          <xsl:choose>
            <xsl:when test="contains(@target,'#') or contains(@target,'http')">
              <xsl:value-of select="@target"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="concat($base_href,@target)"/>
            </xsl:otherwise>
          </xsl:choose>
	</xsl:attribute>
      </xsl:if>
      <xsl:variable name="anchor_text">
        <xsl:value-of select="."/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="string-length($anchor_text) &gt; 0">
          <xsl:value-of select="$anchor_text"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@target"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template match="t:list[@type='ordered']">
    <ol><xsl:apply-templates/></ol>
  </xsl:template>

  <xsl:template match="t:list">
    <ul><xsl:apply-templates/></ul>
  </xsl:template>

  <xsl:template match="t:emph[@rend='bold']|t:hi[@rend='bold']">
    <strong><xsl:apply-templates/></strong>
  </xsl:template>

  <xsl:template match="t:hi[@rend='italics']|t:emph[@rend='italics']">
    <em><xsl:apply-templates/></em>
  </xsl:template>

  <xsl:template match="t:hi[@rend='monospaced']|t:emph[@rend='monospaced']">
    <kbd><xsl:apply-templates/></kbd>
  </xsl:template>

  <xsl:template match="t:lg">
    <p><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="t:l">
    <xsl:apply-templates/><br/>
  </xsl:template>

  <xsl:template match="t:p/t:title">
    <em><xsl:apply-templates/></em>
  </xsl:template>

  <xsl:template match="t:item">
    <li><xsl:apply-templates/></li>
  </xsl:template>

  <xsl:template match="t:figure">
    <xsl:element name="div">
      <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="t:figure/t:head">
    <p>
      <small>
	<xsl:apply-templates/>
      </small>
    </p>
  </xsl:template>

  <xsl:template match="t:graphic">
    <xsl:element name="img">
      <xsl:attribute name="src">
	<xsl:apply-templates select="@url"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="t:address">
    <xsl:element name="br"/>
    <xsl:for-each select="t:addrLine">
      <xsl:apply-templates/><xsl:element name="br"/>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>
