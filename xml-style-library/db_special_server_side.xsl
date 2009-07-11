<?xml version='1.0' encoding="UTF-8" ?>
<!--

Makes HTML out of docbook
$Id$

Last modified $Date$ by $Author$

-->
<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:exsl="http://exslt.org/common"
  exclude-result-prefixes="xsl exsl"
  version="1.0" >

  <xsl:output omit-xml-declaration="yes"
    method="xml"
    media-type="text/html"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    encoding="UTF-8" 	
    />
  
  <xsl:param name="filenames" select="'keep'"/>

  <xsl:param name="footnotes">
    <xsl:element name="div">
      <xsl:for-each select="//footnoteref">
	<xsl:element name="p">
	  <xsl:variable name="noteid"><xsl:value-of
	      select="@linkend"/></xsl:variable>
	  <xsl:attribute name="id"><xsl:value-of
	      select="@linkend"/></xsl:attribute> 
	  <strong class="number">
	    <xsl:value-of select="position()"/>
	  </strong>
	  <xsl:text> </xsl:text>
	  <xsl:apply-templates select="/article/bibliography/biblioentry[@id =
	    $noteid]"/>
	</xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:param>
  
  <xsl:template match="/" >
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:apply-templates select="/article/articleinfo/title/node()"/>
	</xsl:element>
	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute
	    name="href">/css-style/html_print.css</xsl:attribute> 
	</xsl:element>
	<xsl:element name="meta">
	  <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
	  <xsl:attribute name="content">text/html; charset=UTF-8</xsl:attribute>
	</xsl:element>
      </xsl:element>
      <xsl:element name="body">
	<xsl:if test="article/articleinfo/indexterm">
	  <xsl:apply-templates select="article/articleinfo/indexterm"/>
	</xsl:if>
	<xsl:element name="div">
	  <xsl:attribute name="class">box</xsl:attribute>
	  <xsl:apply-templates/>	  
	  <xsl:element name="div">
	    <xsl:attribute name="class">level1</xsl:attribute>
	    <h1 id="footnoteshere">Notes</h1>
	    <xsl:copy-of select="exsl:node-set($footnotes)/div/node()"/>
	  </xsl:element>
	</xsl:element>
	<xsl:comment>#include virtual="/js/urchin.js" </xsl:comment>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="article" >
    <xsl:apply-templates select="articleinfo"/>
    <xsl:apply-templates select="abstract"/>
    <xsl:call-template name="toc"/>
    <xsl:apply-templates select="sect1"/>
  </xsl:template>
  
  <xsl:template match="sect1">
    <xsl:element name="div">
      <xsl:attribute name="class">level1</xsl:attribute>
      <xsl:if test="@id">
	<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sect1/title">
    <xsl:element name="h1">
      <xsl:attribute name="class">level1</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
    
  </xsl:template>

  <xsl:template match="sect2">
    <xsl:element name="div">
      <xsl:attribute name="class">level2</xsl:attribute>
      <xsl:if test="@id">
	<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sect3">
    <xsl:element name="div">
      <xsl:attribute name="class">level3</xsl:attribute>
      <xsl:if test="@id">
	<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="sect2/title">
    <xsl:element name="h2">
      <xsl:attribute name="class">level2</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="sect3/title">
    <xsl:element name="h3">
      <xsl:attribute name="class">level3</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="toc">
    <div class="level1">
      <h2>Table of contents</h2>
      <xsl:element name="ul">
	<xsl:for-each select="sect1">
	  <xsl:element name="li">
	    <xsl:element name="a">
	      <xsl:attribute name="href">
		<xsl:value-of select="concat('#',@id)"/>
	      </xsl:attribute>
	      <xsl:value-of select="title"/>
	    </xsl:element>
	    <xsl:if test="sect2">
	      <xsl:element name="ul">
		<xsl:for-each select="sect2">
		  <xsl:element name="li">
		    <xsl:element name="a">
		      <xsl:attribute name="href"><xsl:value-of
			  select="concat('#',@id)"/></xsl:attribute> 
		      <xsl:value-of select="title"/>
		    </xsl:element>
		    <xsl:if test="sect3">
		      <xsl:element name="ul">
			<xsl:for-each select="sect3">
			  <xsl:element name="li">
			    <xsl:element name="a">
			      <xsl:attribute name="href"><xsl:value-of
				  select="concat('#',@id)"/></xsl:attribute> 
			      <xsl:value-of select="title"/>
			    </xsl:element>
			  </xsl:element>
			</xsl:for-each>
		      </xsl:element>
		    </xsl:if>
		  </xsl:element>
		</xsl:for-each>
	      </xsl:element>
	    </xsl:if>
	  </xsl:element>
	</xsl:for-each>
	<xsl:element name="li">
	  <xsl:element name="a">
	    <xsl:attribute name="href">
	      <xsl:value-of select="concat('#','footnoteshere')"/>
	    </xsl:attribute>
	    Footnotes
	  </xsl:element>
	</xsl:element>
      </xsl:element>
    </div>
  </xsl:template>

  <xsl:template match="para">
    <xsl:element name="p"><xsl:apply-templates/></xsl:element>
  </xsl:template>


  <xsl:template match="orderedlist">
    <xsl:element name="ol">
      <xsl:if test="parent::listitem">
	<xsl:attribute name="type">a</xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="itemizedlist">
    <xsl:element name="ul">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="listitem">
    <xsl:element name="li">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="listitem/para">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="emphasis">
    <xsl:element name="em">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="articleinfo">
    <h1 class="title"><xsl:apply-templates select="title"/></h1>
    <p class="author">
      <xsl:apply-templates select="author"/><br/>
      <xsl:apply-templates select="affiliation"/><br/>
      <strong>Revision:</strong>
      <xsl:apply-templates select="revhistory/revision/revnumber" />,
      <strong>Date:</strong>
      <xsl:apply-templates select="revhistory/revision/date" />,
      <strong>Editor:</strong>
      <xsl:apply-templates select="revhistory/revision/authorinitials" />
    </p>
  </xsl:template>

  <xsl:template match="abstract">
    <xsl:element name="div">
      <xsl:attribute name="class">abstract</xsl:attribute>
      <xsl:if test="title">
	<xsl:element name="blockquote">
	  <h3>
	    <xsl:value-of select="title"/>
	  </h3>
	</xsl:element>
      </xsl:if>
      <xsl:apply-templates select="para"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="abstract/para">
    <xsl:element name="blockquote">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>


  <xsl:template match="bibliography"/>

  <xsl:template match="footnoteref">
    <xsl:variable name="thisnote"><xsl:value-of
	select="@linkend"/></xsl:variable>
    <xsl:element name="sup">
      <xsl:element name="a">
	<xsl:attribute name="href">
	  <xsl:value-of select="concat('#',$thisnote)"/>
	</xsl:attribute>
	<xsl:value-of
	  select="exsl:node-set($footnotes)/div/p[@id=$thisnote]/strong"/> 
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match="biblioentry">
    <xsl:for-each select="author|authorblurb">
      <xsl:choose>
	<xsl:when test="position() > 1 and not(position() = last()) ">
	  <xsl:text>, </xsl:text>
	</xsl:when>
	<xsl:when test="position() > 1 and position() = last() ">
	  <xsl:text> and </xsl:text>
	</xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="firstname"/>
      <xsl:apply-templates select="surname"/>
      <xsl:apply-templates select="para"/>
      <xsl:if test="affiliation">
	<xsl:text> </xsl:text>
	(<xsl:apply-templates select="affiliation"/>)
      </xsl:if>
      <xsl:text> </xsl:text>
      <xsl:if test="position() = last() ">.</xsl:if>
    </xsl:for-each>
    <xsl:apply-templates select="title"/>
  </xsl:template>

  <xsl:template match="authorblurb/para">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="orgname">
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="title">
    <xsl:element name="em">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="table">
    <xsl:element name="table">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="table/title">
    <xsl:element name="caption">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="tgroup">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="tbody">
    <xsl:for-each select="row">
      <xsl:element name="tr">
	<xsl:for-each select="entry">
	  <xsl:element name="td">
	    <xsl:apply-templates/>
	  </xsl:element>
	</xsl:for-each>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="programlisting">
    <xsl:element name="pre">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="biblioentry/title">
    <xsl:element name="em">
      <xsl:apply-templates/>
    </xsl:element>
    <xsl:element name="br"/>
  </xsl:template>


  <xsl:template match="ulink">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:choose>
	  <xsl:when test="$filenames = 'keep'">
	    <xsl:value-of select="@url"/>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:choose><xsl:when test="contains(@url,'.xml')">
	    <xsl:value-of
	      select="concat(substring-before(@url,'.xml'),
	              '.html')"/></xsl:when>
	      <xsl:otherwise><xsl:value-of
		  select="@url"/></xsl:otherwise>
	    </xsl:choose>
	  </xsl:otherwise>
	</xsl:choose></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure">
    <xsl:element name="div">
      <xsl:attribute name="class">figure</xsl:attribute>
      <xsl:apply-templates select="mediaobject" />
      <xsl:apply-templates select="title" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="figure/mediaobject">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="imageobject">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template
    match="imagedata[@format = 'PNG' or @format = 'JPG' or @format = 'GIF']"> 
    <xsl:element name="img">
      <xsl:attribute name="src"><xsl:value-of
	  select="@fileref"/></xsl:attribute> 
    </xsl:element>
  </xsl:template>


  <xsl:template match="figure/title">
    <xsl:element name="blockquote">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="articleinfo/indexterm">
    <xsl:element name="p">
      <xsl:attribute name="class">right</xsl:attribute>
      <strong>
	<xsl:text>
	  Back:
	</xsl:text>
      </strong>
      <xsl:apply-templates select="primary" />
      <xsl:if test="secondary">
	<xsl:text>
	  &gt;&gt;
	</xsl:text>
	<xsl:apply-templates select="secondary" />
      </xsl:if>
      <xsl:if test="see">
	<xsl:for-each select="see">
	  <xsl:if test="position() =1">
	    <strong>
	      <xsl:text>
		See:
	      </xsl:text>
	    </strong>
	  </xsl:if>
	  <xsl:apply-templates/>
	  <xsl:if test="not(position() = last())">
	    <xsl:text>,
	    </xsl:text>
	  </xsl:if>
	</xsl:for-each>
      </xsl:if>
      <xsl:if test="seealso">
	<xsl:for-each select="seealso">
	  <xsl:if test="position() =1">
	    <strong>
	      <xsl:text>
		See also:
	      </xsl:text>
	    </strong>
	  </xsl:if>
	  <xsl:apply-templates/>
	  <xsl:if test="not(position() = last())">
	    <xsl:text>,
	    </xsl:text>
	  </xsl:if>
	</xsl:for-each>
      </xsl:if>
    </xsl:element>
  </xsl:template>

<!--

$Log$
Revision 1.1  2009/07/11 17:19:20  sigfrid
no comments

Revision 1.1.1.1  2009/06/29 11:08:30  sigfrid
Initial import of web site

Revision 1.4  2005/06/08 09:42:23  sigge
Added handling of revision history

Revision 1.3  2005/05/26 15:02:36  sigge
Generates table of contents

Revision 1.2  2005/05/26 11:55:35  sigge
Implemented tables and programlistings, abstract and other tags


-->


</xsl:transform>



