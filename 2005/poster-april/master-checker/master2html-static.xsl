<?xml version='1.0' encoding='iso-8859-1'?>
<!DOCTYPE xsl:transform SYSTEM 'http://www.w3.org/People/cmsmcq/1999/xslt10.dtd'
[
<!ENTITY sp " ">
<!ENTITY nl "

">
<!ENTITY ldquo   "&#8220;">
<!ENTITY rdquo   "&#8221;">
]>
<xsl:transform xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
		version='1.0'>
 
  <xsl:output
    encoding="utf-8"
    method="xml" 
    content-type="text/html"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />

  <xsl:param name="next" />
  <xsl:param name="previous" />

  <xsl:template match="/">
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="base">
	  <xsl:attribute name="href">http://laurentius.lub.lu.se/</xsl:attribute></xsl:element>
	<xsl:element name="title">
	  <xsl:value-of select="/msDescription/msHeading/title" />
	  <xsl:text>;&nl;</xsl:text>
	  <xsl:value-of select="/msDescription/msIdentifier/idno"/>
	  <xsl:text>;&nl;S:t Laurentius digital manuscript library</xsl:text>
	</xsl:element>
	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute name="href">/style/laurentius.css</xsl:attribute>
	</xsl:element>
	 <xsl:element name="meta">
          <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
          <xsl:attribute name="content">text/html; charset=utf-8</xsl:attribute> 
        </xsl:element>

      </xsl:element>
      <xsl:element name="body">
	<xsl:element name="div">
	  <xsl:attribute name="class">body</xsl:attribute>
	  <xsl:text>&#160;</xsl:text>
	  <xsl:element name="img">
	    <xsl:attribute name="border">0</xsl:attribute>
	    <xsl:attribute name="src">/images/vlogoe.gif</xsl:attribute>
	    <xsl:attribute name="alt">Lund University Library</xsl:attribute>
	    <xsl:attribute name="align">top</xsl:attribute>
	  </xsl:element><xsl:text>&#160;</xsl:text>
	  <xsl:element name="img">
	    <xsl:attribute name="border">0</xsl:attribute>
	    <xsl:attribute name="src">/images/st_laurentius.gif</xsl:attribute>
	    <xsl:attribute name="alt">S:t Laurentius Digital Manuscript Library</xsl:attribute>
	    <xsl:attribute name="align">top</xsl:attribute>
	  </xsl:element>
	  <xsl:text>&#160;</xsl:text>
	  <xsl:text>&nl;</xsl:text>
	<xsl:element name="div">
       	  <xsl:attribute name="class">navigation</xsl:attribute>
	    <form action="/search/search.php">
		<a href="/">Home</a> |
		<a href="/search/search_advanced.php">Advanced Search</a> |
	        <a href="/index_by_idno.html">Browse the manuscripts</a><!-- |
                <input type="text" size="10" name="term" />
	        <input type="hidden" name="start" value="1"/>
	        <input type="hidden" name="number" value="10"/>
	        <input type="submit" name="action" value="Search" /> -->
           <br />

                <xsl:element name="a">
        	    <xsl:attribute name="href"><xsl:value-of
		    select="$previous"/>/detailed/</xsl:attribute>&lt;&lt; Previous</xsl:element>

                <xsl:text>&nl;|&nl;</xsl:text>
                <xsl:element name="a">
        	    <xsl:attribute name="href">/volumes/<xsl:value-of
	        	select="msDescription/@id"/></xsl:attribute>Brief
  	    description</xsl:element>
	      <xsl:text> |&nl;</xsl:text>
	      <xsl:element name="a">
		<xsl:attribute
		  name="href">/search/catalogue/<xsl:value-of
		    select="msDescription/@id"/>.pdf</xsl:attribute>PDF version</xsl:element>
	      <xsl:text>&nl;|&nl;</xsl:text>
	      <xsl:element name="a">
		<xsl:attribute
		  name="href">/search/cleaned/<xsl:value-of select="msDescription/@id"/>.xml</xsl:attribute>XML source</xsl:element>
	      <xsl:text>&nl;|&nl;</xsl:text>
	      <xsl:element name="a">
		<xsl:attribute name="href"><xsl:value-of
		    select="$next"/>/detailed/</xsl:attribute>Next &gt;&gt;
	      </xsl:element>
	    </form>
	  </xsl:element>
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="msDescription">
    <xsl:apply-templates />
    <xsl:for-each select="msPart">
      <xsl:element name="h2">
	Part <xsl:value-of select="position()" />
      </xsl:element>
      <xsl:apply-templates/>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="msPart" >
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="msIdentifier">
      <xsl:element name="div">
	<xsl:attribute name="class">identifier</xsl:attribute>
	<xsl:element name="h1">
	  <xsl:apply-templates select="idno"/>
	  <xsl:if test="altName[@type='nickname']">;<xsl:text>
	    </xsl:text>
	    <xsl:apply-templates select="altName[@type='nickname']"/>
	  </xsl:if>
	</xsl:element>
	
	<xsl:choose>
	  <xsl:when test="institution">
	    <xsl:element name="p">
	      <xsl:value-of select="institution" /><xsl:text>
		(in deposition at
	      </xsl:text>
	      <xsl:value-of select="repository"/>)
	    </xsl:element>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:element name="p">
	      <xsl:value-of select="repository"/>
	    </xsl:element>
	  </xsl:otherwise>
	</xsl:choose>

	<xsl:element name="p">
	  <xsl:for-each select="altName[@type='former shelfmark']">
	    <xsl:if test="position()=1">Olim:<xsl:text>
	      </xsl:text></xsl:if>
	    <xsl:apply-templates/>
	    <xsl:if test="position() != last()">;</xsl:if><xsl:text>&nl;</xsl:text>
	  </xsl:for-each>
	</xsl:element>
      </xsl:element>
    </xsl:template>

  <xsl:template match="msHeading">
      <xsl:element name="div">
	<xsl:attribute name="class">heading</xsl:attribute>
	<xsl:element name="p">
	  <xsl:if test="author">
	    <xsl:apply-templates select="author" mode="hdr" />,<xsl:text>

	    </xsl:text>
	  </xsl:if>
	  <xsl:for-each select="title">
	    <xsl:choose>
	      <xsl:when test="position()=last()">
		<xsl:choose>
		  <xsl:when test="@type='uniform'">
		    <xsl:element name="span">
		      <xsl:attribute name="class">uniform-title</xsl:attribute>
		      <xsl:apply-templates/></xsl:element>.&nl;
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:apply-templates/>.&nl;
		  </xsl:otherwise>
		</xsl:choose>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:choose>
		  <xsl:when test="@type='uniform'">
		    <xsl:element name="span">
		      <xsl:attribute name="class">uniform-title</xsl:attribute>
		      <xsl:apply-templates/></xsl:element>;&nl;
		  </xsl:when>
		  <xsl:otherwise>
		    <xsl:apply-templates/>;
		  </xsl:otherwise>
		</xsl:choose>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:for-each>
	  &nl;<xsl:apply-templates select="origPlace" />&nl;&nl;
	  &nl;<xsl:apply-templates select="origDate" />&nl;&nl;
	  &nl;<xsl:apply-templates select="textLang" />&nl;&nl;
	</xsl:element>
	<xsl:element name="p">
	  <xsl:for-each select="note/p">
	    <xsl:choose>
	      <xsl:when test="position()=last()">
		<xsl:apply-templates/>.<xsl:text>&nl;</xsl:text></xsl:when>
	      <xsl:otherwise>
		<xsl:apply-templates/>;<xsl:text>&nl;</xsl:text></xsl:otherwise>
	    </xsl:choose>
	  </xsl:for-each>
	</xsl:element>
      </xsl:element>
    </xsl:template>

    <xsl:template match="author" mode="hdr">
      <xsl:element name="span">
	<xsl:attribute name="class">author</xsl:attribute>
	<xsl:value-of select="."/>
      </xsl:element>
    </xsl:template>

    <xsl:template match="msContents">
      <xsl:element name="div">
	<xsl:attribute name="class">contents</xsl:attribute>
	<xsl:element name="h2">Contents</xsl:element>
	<xsl:for-each select="msItem">
	  <xsl:element name="dl">
	    <xsl:attribute name="class">regular</xsl:attribute>
	    <xsl:apply-templates select="."/>
	  </xsl:element>
	</xsl:for-each>
      </xsl:element>
    </xsl:template>

    <xsl:template match="msItem" >
      <xsl:element name="dt">
	<xsl:element name="strong"><xsl:value-of select="@n" /></xsl:element>
	<xsl:apply-templates select="locus|author|respStmt|title|rubric|summary|incipit|explicit|colophon|textLang|q|decoNote|bibl|listBibl|note" />
      </xsl:element>
      <xsl:if test="msItem">
	<xsl:element name="dd">
	  <xsl:for-each select="msItem">
	    <xsl:element name="dl">
	      <xsl:apply-templates select="."/>
	    </xsl:element>
	  </xsl:for-each>
	</xsl:element>
      </xsl:if>
    </xsl:template>

  <xsl:template match="title" >
    <xsl:text>&nl;</xsl:text>
    <xsl:choose>
      <xsl:when test="(@type='uniform' ) or (@level='j' or @level='m')">
	  <xsl:element name="span">
	    <xsl:attribute name="class">uniform-title</xsl:attribute>
	    <xsl:apply-templates/>
	  </xsl:element>
      </xsl:when>
      <xsl:otherwise>
	  <xsl:element name="span">
	    <xsl:attribute name="class">title</xsl:attribute>
	    <xsl:apply-templates/>
	  </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&nl;</xsl:text>
  </xsl:template>

  <xsl:template match="msItem/locus">
    <xsl:text>&nl;</xsl:text>
    <xsl:choose>
      <xsl:when test='@from'>(<xsl:element name="a">
	  <xsl:attribute
	    name="href">/cgi-bin/image-range-db.cgi?volume=<xsl:value-of
	      select='/msDescription/@id'/>&amp;start=<xsl:value-of
	      select='@from'/>&amp;end=<xsl:value-of
	      select='@to'/></xsl:attribute>
	  <xsl:attribute name="name"><xsl:value-of
	      select='/msDescription/@id'/>-item<xsl:value-of select="../@n"/></xsl:attribute>
	  <xsl:apply-templates/></xsl:element>)</xsl:when>
      <xsl:otherwise>(<xsl:apply-templates/>)</xsl:otherwise>
    </xsl:choose>
    <xsl:text>&nl;</xsl:text>
  </xsl:template>

  <xsl:template match="locus">
    <xsl:choose>
      <xsl:when test="@from">
	<xsl:element name="a">
	  <xsl:attribute name="href">/cgi-bin/image-range-db.cgi?volume=<xsl:value-of select='/msDescription/@id'/>&amp;start=<xsl:value-of select='@from'/>&amp;end=<xsl:value-of select='@to'/>
	  </xsl:attribute>
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:when>
      <xsl:otherwise>
	<xsl:element name="a">
	  <xsl:attribute name="href">/cgi-bin/image-range-db.cgi?volume=<xsl:value-of select='/msDescription/@id'/>&amp;start=<xsl:value-of select='.'/>&amp;end=<xsl:value-of select='.'/>
	  </xsl:attribute>
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&nl;</xsl:text>
  </xsl:template>

  <xsl:template match="incipit">
    <xsl:choose>
      <xsl:when test="@defective='yes'">
	<xsl:text>Begins defectively: </xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Incipit: </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    &ldquo;<xsl:apply-templates/>.&rdquo;&nl;
  </xsl:template>

  <xsl:template match="explicit">
    <xsl:text>&nl;</xsl:text>
    <xsl:choose>
      <xsl:when test="@defective='yes'">
	<xsl:text>Ends defectively: </xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Explicit: </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    &ldquo;<xsl:apply-templates/>.&rdquo;
    <xsl:text>&nl;</xsl:text>
  </xsl:template>

  <xsl:template match="rubric">
    <xsl:text>&nl;</xsl:text>
    <xsl:choose>
      <xsl:when test="@defective='yes'">
	<xsl:text>Defective rubric: </xsl:text>
      </xsl:when>
      <xsl:when test="@type='final'">
	<xsl:text>Final rubric: </xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>Rubric: </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
    &ldquo;<xsl:apply-templates/>.&rdquo;
    <xsl:text>&nl;</xsl:text>
  </xsl:template>

  <xsl:template match="note" >
    <xsl:apply-templates/>
  </xsl:template>

    <xsl:template match="physDesc" >
      <xsl:element name="h2">Physical description</xsl:element>
      <xsl:element name="div">
	<xsl:attribute name="class">physical-description</xsl:attribute>
	<xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

  <xsl:template match="form" >
    <xsl:element name="h3">Form</xsl:element>
    <xsl:apply-templates/>
  </xsl:template>

    <xsl:template match="support" >
      <xsl:element name="p">
	<xsl:element name="strong">Support:
	</xsl:element>
	<xsl:value-of select="p" />
      </xsl:element>
    </xsl:template>

    <xsl:template match="extent" >
      <xsl:element name="p">
	<xsl:element name="strong">Extent:
	</xsl:element>
	<xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <xsl:template match="layout">
      <xsl:element name="p">
	<xsl:element name="strong">Layout:
	</xsl:element>
	<xsl:for-each select="p">
	  <xsl:apply-templates/>
	</xsl:for-each>
      </xsl:element>
    </xsl:template>

    <xsl:template match="collation">
      <xsl:element name="p">
	<xsl:element name="strong">Collation:
	</xsl:element>
	<xsl:for-each select='p'>
	  <xsl:apply-templates/>
	</xsl:for-each>
      </xsl:element>
    </xsl:template>

    <xsl:template match="msWriting">
      <xsl:element name="p">
	<xsl:element name="strong">Script:
	</xsl:element>
	<xsl:for-each select='p|handDesc/p|script/p'>
	  <xsl:apply-templates/>
	  <xsl:element name="br" />
	</xsl:for-each>
      </xsl:element>
    </xsl:template>

    <xsl:template match="foliation">
      <xsl:element name="h3">Foliation</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="additions">
      <xsl:element name="h3">Additions</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="condition">
      <xsl:element name="h3">Condition</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="msHeading/origPlace">
      <xsl:value-of select="."/>,
    </xsl:template>


    <xsl:template match="origPlace">
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="msHeading/origDate">
      <xsl:apply-templates/>, 
    </xsl:template>

    <xsl:template match="origDate">
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="note/textLang">
      <xsl:apply-templates/><xsl:text>;&nl;</xsl:text>
    </xsl:template>

    <xsl:template match="textLang">
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="expan" ><xsl:element name="em"><xsl:apply-templates/></xsl:element></xsl:template>

    <xsl:template match="supplied" >
      <xsl:choose>
	<xsl:when test="contains(@reason,'illegible') or contains(@reason,'damage')">[<xsl:apply-templates/>]</xsl:when>
	<xsl:when test="contains(@reason,'omitted')">&lt;<xsl:apply-templates/>&gt;</xsl:when>
      </xsl:choose>
    </xsl:template>

    <xsl:template match="dimensions" >
      &nl;;
      <xsl:apply-templates select="height"/>
      &nl;x&nl;
      <xsl:apply-templates select="width"/>
    </xsl:template>

    <xsl:template match="height" >
      &nl;
      <xsl:apply-templates/>
      &nl;
    </xsl:template>

    <xsl:template match="width" >
      &nl;
      &nl;<xsl:apply-templates/>
      &nl;
    </xsl:template>

    <xsl:template match="list">
      <xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
      <xsl:element name="ul">
	<xsl:for-each select="item">
	  <xsl:element name="li">
	    <xsl:apply-templates/>
	  </xsl:element>
	</xsl:for-each>
      </xsl:element>
      <xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
    </xsl:template>

    <xsl:template match="history" >
      <xsl:element name="h2">History</xsl:element>
      <xsl:element name="div">
	<xsl:attribute name="class">history</xsl:attribute>
	<xsl:apply-templates/>
      </xsl:element>
    </xsl:template>

    <xsl:template match="origin" >
      <xsl:element name="h3">Origin</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="provenance" >
      <xsl:element name="h3">Provenace</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="acquisition" >
      <xsl:element name="h3">Acquisition</xsl:element>
      <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="additional/adminInfo" />

    <xsl:template match="additional/listBibl" >
      <xsl:element name="h2">Bibliography</xsl:element>
      <xsl:element name="div">
	<xsl:attribute name="class">bibliography</xsl:attribute>
	<xsl:element name="ul">
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:element>
    </xsl:template>

    <xsl:template match="msItem/listBibl" >
      <xsl:text> [cf.:&nl;</xsl:text>
      <xsl:for-each select="bibl">
	<xsl:if test="position()>1">
	  <xsl:text>; </xsl:text>
	</xsl:if><xsl:apply-templates/>
      </xsl:for-each><xsl:text>]&nl;</xsl:text>
    </xsl:template>

    <xsl:template match="listBibl" >
      <xsl:element name="ul">
	<xsl:apply-templates />
      </xsl:element>
    </xsl:template>

    <xsl:template match="listBibl/bibl" >
      <xsl:element name="li">
	<xsl:for-each select="author" >
	  <xsl:choose>
	    <xsl:when test="position()=1 and position()=last()">
	      <xsl:value-of select="."/>:&nl;
	    </xsl:when>
	    <xsl:when test="position()=1 and not(position()=last())">
	      <xsl:value-of select="."/>
	    </xsl:when>
	    <xsl:when test="position()>1 and not(position()=last())">,&nl;
	      <xsl:value-of select="."/>
	    </xsl:when>
	    <xsl:when test="position()>1 and position()=last()">and&nl;
	      <xsl:value-of select="."/>:&nl;
	    </xsl:when>
	  </xsl:choose>
	</xsl:for-each>
	<xsl:apply-templates select="title" />
	<xsl:for-each select="editor" >
	  <xsl:choose>
	    <xsl:when test="position()=1 and position()=last()">&nl;
	      <xsl:apply-templates/>&nl;(ed.)&nl;</xsl:when>
	    <xsl:when test="position()=1 and not(position()=last())">&nl;
	      <xsl:apply-templates/>
	    </xsl:when>
	    <xsl:when test="position()>1 and not(position()=last())">,&nl;
	      <xsl:apply-templates/>
	    </xsl:when>
	    <xsl:when test="position()>1 and position()=last()">and&nl;
	      <xsl:apply-templates/>&nl;(eds.)&nl;</xsl:when>
	  </xsl:choose>
	</xsl:for-each>
	<xsl:apply-templates select="imprint" /><xsl:text>
	</xsl:text><xsl:apply-templates select="biblScope" />.<xsl:text>
	</xsl:text><xsl:apply-templates select="note" />
      </xsl:element>
    </xsl:template>


  <xsl:template match="bibl" >
    <xsl:for-each select="author" >
      <xsl:choose>
	<xsl:when test="position()=1 and position()=last()">
	  <xsl:value-of select="."/>:&nl;
	</xsl:when>
	<xsl:when test="position()=1 and not(position()=last())">
	  <xsl:value-of select="."/>
	</xsl:when>
	<xsl:when test="position()>1 and not(position()=last())">,&nl;
	  <xsl:value-of select="."/>
	</xsl:when>
	<xsl:when test="position()>1 and position()=last()">and&nl;
	  <xsl:value-of select="."/>:&nl;
	</xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:apply-templates select="title" />
    <xsl:for-each select="editor" >
      <xsl:choose>
	<xsl:when test="position()=1 and position()=last()">&nl;
	  <xsl:apply-templates/>&nl;(ed.)&nl;
	</xsl:when>
	<xsl:when test="position()=1 and not(position()=last())">&nl;
	  <xsl:apply-templates/>
	</xsl:when>
	<xsl:when test="position()>1 and not(position()=last())">,&nl;
	  <xsl:apply-templates/>
	</xsl:when>
	<xsl:when test="position()>1 and position()=last()">and&nl;
	  <xsl:apply-templates/>&nl;(eds.)&nl;
	</xsl:when>
      </xsl:choose>
    </xsl:for-each>
    <xsl:apply-templates select="imprint" /><xsl:text>
    </xsl:text><xsl:apply-templates select="biblScope" />.<xsl:text>
    </xsl:text><xsl:apply-templates select="note" />
  </xsl:template>

<!-- This is what may occur in bibl
author
biblScope
date
editor
imprint
publisher
pubPlace
series
title
-->

  <xsl:template match="imprint" >
    <xsl:for-each select="pubPlace|publisher|date|biblScope">
      <xsl:apply-templates/><xsl:text>, </xsl:text>
    </xsl:for-each>&nl;
  </xsl:template>

<!--
This may occur in imprint

pubPlace | publisher | date | biblScope | index | cb | lb |
milestone | pb | addSpan | delSpan | gap
-->

  <xsl:template match="decoration">
    <xsl:element name="h3">Decoration</xsl:element>
    <xsl:apply-templates/>
  </xsl:template>


  <xsl:template match="decoNote" >
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="bindingDesc">
    <xsl:element name="h3">Binding</xsl:element>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="binding" >
      <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="figure" />

  <xsl:template match="msItem/note" >
    <xsl:for-each select="p" >
      <xsl:apply-templates/><xsl:if test="position()>1 and not(position()=last())">;<xsl:text>;&nl;</xsl:text></xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="p" >
    <xsl:text>&nl;</xsl:text>
    <xsl:element name="p">
      <xsl:apply-templates/>
    </xsl:element>
    <xsl:text>&nl;</xsl:text>
  </xsl:template>

  <xsl:template match="*" >
    &nl;<xsl:apply-templates/>&nl;
  </xsl:template>

</xsl:transform>
