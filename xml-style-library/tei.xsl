<?xml version='1.0' encoding="ISO-8859-1" ?>
<!DOCTYPE xsl:transform SYSTEM 'http://www.w3.org/People/cmsmcq/1999/xslt10.dtd' 
 [
<!ENTITY ndash   "&#8211;">
<!ENTITY mdash   "&#8211;">
<!ENTITY lsquo   "&#8216;">
<!ENTITY rsquo   "&#8217;">
<!ENTITY sbquo   "&#8218;">
<!ENTITY ldquo   "&#8220;">
<!ENTITY rdquo   "&#8221;">
<!ENTITY bdquo   "&#8222;">
<!ENTITY lsaquo  "&#8249;">
<!ENTITY approx  "&#8773;">
<!ENTITY sp " ">
<!ENTITY nl "

">

]>
<xsl:transform
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
 >
  
<!--
	Reformats a TEI.2 document to xhtml
	$Id$
-->
  
  <xsl:output omit-xml-declaration="no"
    method="xml"
    media-type="text/html"
    encoding="UTF-8" 	
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />

  <xsl:strip-space elements = "*" /> 

  <xsl:template match="/" >
    <xsl:element name="html">
      <xsl:element name="head">
	<xsl:element name="title">
	  <xsl:apply-templates select="/TEI.2/text/front/titlePage/docTitle/titlePart"/>
	</xsl:element>
	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute name="href">/css-style/html.css</xsl:attribute>
	</xsl:element>
        <xsl:element name="meta">
          <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
          <xsl:attribute name="content">text/html; charset=UTF-8</xsl:attribute>
        </xsl:element>
	<xsl:text>&nl;</xsl:text>
      </xsl:element>
      <xsl:element name="body">
	<xsl:text>&nl;</xsl:text>
	<xsl:element name="div">
	  <xsl:attribute name="class">box</xsl:attribute>
	  <xsl:apply-templates />
          <xsl:element name="h2">Noter</xsl:element>
          <xsl:element name="p">
	    <xsl:for-each select='//note'>
               [<xsl:value-of select="@n"/>]
               <xsl:element name="a">
		<xsl:attribute name="id">
		  <xsl:value-of select="@n"/>
		</xsl:attribute>
		<xsl:attribute name="href">
		  <xsl:value-of select="xref/@to"/>
		</xsl:attribute>
		<xsl:value-of select="xref/@to"/>
               </xsl:element>
               <xsl:apply-templates/>
             <xsl:element name="br"/>
            </xsl:for-each>
          </xsl:element>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="TEI.2" >
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="teiHeader" />

  <xsl:template match="text" >
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="front" >
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="back" >
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="titlePage" >
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="docTitle">
    <xsl:element name="h1">
      <xsl:for-each select="titlePart">
        <xsl:apply-templates/>
        <xsl:if test='position() != last()'>
          <xsl:element name="br"/>
        </xsl:if>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template match="byline">
    <xsl:element name="p">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="docAuthor">
     <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="div[@type='abstract']">
     <xsl:for-each select="p">
      <xsl:element name="blockquote">
        <xsl:attribute name="class">abstract</xsl:attribute>
	  <xsl:apply-templates />
        </xsl:element>
     </xsl:for-each>
  </xsl:template>

  <xsl:template match="body" >
    <xsl:apply-templates />
  </xsl:template>

  <!--xsl:template match='div/head'>
    <xsl:element name="h2">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template-->

  <xsl:template match='div1[@type="acknowledgements"]'>
    <xsl:element name="p">
      <xsl:element name="strong">
	<xsl:element name="em">
	  <xsl:text>Acknowledgments: </xsl:text>
	</xsl:element>
      </xsl:element>
      <xsl:value-of select='p' />
    </xsl:element>
  </xsl:template>


  <xsl:template match='div[@type="display"]'>
    <xsl:text>&nl;</xsl:text>
    <xsl:element name="div">
      <xsl:element name="blockquote">
	<xsl:value-of select="head"/>
      </xsl:element>
      <xsl:element name="blockquote">
	<xsl:apply-templates select="div" />
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <xsl:template match='div1|div2|div3|div4|div5|div6|div7'>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match='div1/head'>
    <xsl:element name="h2">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match='div2/head'>
    <xsl:element name="h3">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match='div3/head'>
    <xsl:element name="h4">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match='div4/head'>
    <xsl:element name="h5">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


  <xsl:template match='div5/head'>
    <xsl:element name="h6">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>


  <xsl:template match='head'>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match='seg'>
    <xsl:choose>
      <xsl:when test="@rend='dropcap'">
	<xsl:apply-templates />
      </xsl:when>
      <xsl:when test="@rend='capitals'">
	<xsl:apply-templates />
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='p'>
    <xsl:choose>
      <xsl:when test="@rend='noindent'">
	<xsl:element name="p">
	  <xsl:apply-templates /> 
	</xsl:element>
      </xsl:when>
      <xsl:when test="@rend='box'">
	<xsl:element name="div">
	  <xsl:attribute name="class">box</xsl:attribute>
	  <xsl:apply-templates /> 
	</xsl:element>
      </xsl:when>
      <xsl:when test="name(..)='quote'">
	<xsl:element name="blockquote">
	  <xsl:element name="em">
	    <xsl:apply-templates />
	  </xsl:element>
	</xsl:element>
      </xsl:when>
      <xsl:otherwise>
	<xsl:element name="p">
	  <xsl:apply-templates /> 
	</xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='q'>
    &ldquo;<xsl:apply-templates />&rdquo;
  </xsl:template>

  <xsl:template match='soCalled'>
    &ldquo;<xsl:apply-templates />&rdquo;
  </xsl:template>

   <xsl:template match='lg'>
     <xsl:element name="p">
       <xsl:attribute name="class">verse</xsl:attribute>
       <xsl:apply-templates />
     </xsl:element>
   </xsl:template>

   <xsl:template match='lg/l'>
     <xsl:element name="em">
       <xsl:apply-templates />
     </xsl:element>
     <xsl:element name="br" />
   </xsl:template>

   <xsl:template match='sp'>
     <xsl:element name="p">
       <xsl:attribute name="class">speech</xsl:attribute>
       <xsl:for-each select="speaker|stage" >
          <xsl:apply-templates select="." />
            <xsl:if test="position()=last()">:</xsl:if>
       </xsl:for-each>
       <xsl:apply-templates select="p" />
     </xsl:element>
   </xsl:template>

   <xsl:template match='sp/speaker'>
     <xsl:element name="span">
       <xsl:attribute name="class">speaker</xsl:attribute>
       <xsl:apply-templates />
     </xsl:element>
   </xsl:template>

   <xsl:template match='sp/stage'><xsl:text>&nl;</xsl:text>
      [<xsl:element name="em"><xsl:apply-templates /></xsl:element>]</xsl:template>

   <xsl:template match='sp/p'>
     <xsl:text>&nl;</xsl:text>
       <xsl:apply-templates />
   </xsl:template>

  <xsl:template match="xref">
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="@to"/></xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>


  <xsl:template match='list'>
    <xsl:element name="ul">
      <xsl:apply-templates /> 
    </xsl:element>
  </xsl:template>

  <xsl:template match='item'>
    <xsl:element name="li">
      <xsl:apply-templates /> 
    </xsl:element>
  </xsl:template>

  <xsl:template match="exemplum">
      <xsl:apply-templates select='p' />
      <xsl:apply-templates select='eg' />
  </xsl:template>


  <xsl:template match="eg">
    <xsl:element name="pre">
      <xsl:attribute name="class">display</xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match='emph'>
    <xsl:element name="em">
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <xsl:template match='opener'>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match='closer'>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match='address'>
    <xsl:element name="div">
      <xsl:attribute name="class">indented</xsl:attribute>
      <xsl:for-each select="addrLine|name">
	<xsl:apply-templates/>&nl;
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template match='dateline'>
    <xsl:element name="div">
      <xsl:attribute name="class">indented</xsl:attribute>
      <xsl:for-each select="addrLine|name|date">
	<xsl:apply-templates/>&nl;
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template match="salute|signed">
    <xsl:element name="p">
	<xsl:apply-templates/>&nl;
    </xsl:element>
  </xsl:template>

  <xsl:template match='hi'>
    <xsl:choose>
      <xsl:when test="@rend='kbd'">
	<xsl:element name="kbd">
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:when>
      <xsl:when test="@rend='bold'">
	<xsl:element name="strong">
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:when>
      <xsl:when test="@rend='italics'">
	<xsl:element name="em">
	  <xsl:apply-templates />
	</xsl:element>
      </xsl:when>
      <xsl:when test="@rend='bold-italics'">
	<xsl:element name="strong">
	  <xsl:element name="em">
	    <xsl:apply-templates />
	  </xsl:element>
	</xsl:element>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template match='note'>
    <xsl:text>
[</xsl:text><xsl:element name="a">
      <xsl:attribute name="href">#<xsl:value-of select="@n"/></xsl:attribute>
     <xsl:value-of select="@n"/>
   </xsl:element><xsl:text>]</xsl:text>
 </xsl:template>


  <xsl:template match='figure'>
    <!--xsl:element name="p">
      <xsl:attribute name="class">center</xsl:attribute-->
      <xsl:element name="img">
        <xsl:attribute name="src">
          <xsl:choose><xsl:when test="contains(unparsed-entity-uri(@entity),'eps')"><xsl:value-of select="substring-before(unparsed-entity-uri(@entity),'.')" />.png</xsl:when><xsl:when test="contains(unparsed-entity-uri(@entity),'ms')"><xsl:value-of select="substring-before(unparsed-entity-uri(@entity),'.')" />.png</xsl:when></xsl:choose></xsl:attribute>
      <!--/xsl:element-->
   </xsl:element>
   <xsl:element name="br" />
     <!--xsl:attribute name="class">abstract</xsl:attribute-->
     <xsl:choose>
       <xsl:when test="/TEI.2/teiHeader/profileDesc/langUsage/language = 'swe'">Figur</xsl:when>
      <xsl:otherwise>Figure</xsl:otherwise>
      </xsl:choose><xsl:text>
</xsl:text><xsl:value-of select="@n" />.<xsl:text>
</xsl:text><xsl:apply-templates select="./head" />

   </xsl:template>

  <xsl:template match='exemplum/p'>
    <xsl:element name="blockquote">
      <xsl:element name="small">
	<xsl:apply-templates />
      </xsl:element>
    </xsl:element>
  </xsl:template>


  <!-- xsl:template match='note/bibl'>\**
.FS&nl;
.na&nl;
 <xsl:for-each select="author" >
   <xsl:choose>
     <xsl:when test="position()=1 and position()=last()">
       <xsl:value-of select="."/>:&nl;
     </xsl:when>
     <xsl:when test="position()=1 and not(position()=last())">
       <xsl:value-of select="."/>
     </xsl:when>
     <xsl:when test="position()>1 and not(position()=last())">;&nl;
       <xsl:value-of select="."/>
     </xsl:when>
     <xsl:when test="position()>1 and position()=last()">
       and&nl;<xsl:value-of select="."/>:&nl;
     </xsl:when>
  </xsl:choose>
 </xsl:for-each>    
  <xsl:apply-templates select="title" /> 
 <xsl:apply-templates select="edition" />
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
  <xsl:apply-templates select="publisher" />
  <xsl:apply-templates select="imprint" />
 <xsl:apply-templates select="biblScope" />
 <xsl:apply-templates select="date" />
 <xsl:apply-templates select="title/xref/@to" mode="url" />.
.ad
.FE&nl;
</xsl:template -->

<!-- xsl:template match="p/title">
\fI<xsl:apply-templates/>\fR
<xsl:text>
</xsl:text>
<xsl:if test="xref/@to">
(cf., \f(CR&lt;<xsl:value-of select="xref/@to"/>&gt;\fR)
</xsl:if>
<xsl:text>
</xsl:text>
</xsl:template -->

<!-- xsl:template match="title">
\fI<xsl:apply-templates/>\fR,&sp;
</xsl:template -->

<!-- xsl:template match="date">
<xsl:apply-templates/>.
</xsl:template -->

<!-- xsl:template match="edition">
<xsl:apply-templates/>
</xsl:template -->

<!-- xsl:template match="title/xref/@to" mode="url" >
.hy 0
\f(CR&lt;<xsl:value-of select="."/>&gt;\fR.
.hy 1
</xsl:template -->


  <xsl:template match="p/table">
    <xsl:text disable-output-escaping="yes">&lt;/p&gt;</xsl:text>
    <xsl:element name="table">
	<xsl:element name="tr">
          <xsl:element name="td">
            <xsl:attribute name="colspan">
               <xsl:value-of select="./@cols"/>
            </xsl:attribute>
            <xsl:element name="strong">
              <xsl:text>Table </xsl:text><xsl:value-of select="@n" />.
            </xsl:element>
            <xsl:apply-templates select="head" />
         </xsl:element>
        </xsl:element>
      <xsl:for-each select="row">
	<xsl:element name="tr">
	  <xsl:text>&nl;</xsl:text>
	  <xsl:for-each select="cell">
	    <xsl:choose>
	      <xsl:when test="./@rend='bold'">
		<xsl:element name="td">
		  <xsl:element name="strong">
		    <xsl:apply-templates select="."/>
		  </xsl:element>
		</xsl:element>
	      </xsl:when>
	      <xsl:otherwise>
		<xsl:element name="td">
		  <xsl:apply-templates select="."/>
		</xsl:element>
	      </xsl:otherwise>
	    </xsl:choose>
	    <xsl:text>&nl;</xsl:text>
	  </xsl:for-each>
	</xsl:element>
      </xsl:for-each>
    </xsl:element>
    <xsl:text disable-output-escaping="yes">&lt;p&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="table/head">
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="greater-than">&gt;</xsl:template>
  <xsl:template match="less-than">&lt;</xsl:template>
  <xsl:template match="mdash">&mdash;</xsl:template>
  <xsl:template match="ndash">&ndash;</xsl:template>
  <xsl:template match="approx">&approx;</xsl:template>

  <xsl:template match="rsquo">&rsquo;</xsl:template>
  <xsl:template match="lsquo">&lsquo;</xsl:template>
  <xsl:template match="rdquo">&rdquo;</xsl:template>
  <xsl:template match="ldquo">&ldquo;</xsl:template>

<!--

	$Log$
	Revision 1.1  2009/06/29 11:11:49  sigfrid
	Initial revision

	Revision 1.6  2003/09/08 10:54:10  sigge
	Fixed problem with the mdash entity

	Revision 1.5  2003/09/01 14:34:51  sigge
	Corrected xsl:output and the meta http-equiv content types

	Revision 1.4  2003/08/28 08:17:24  sigge
	Lagt till C. M. Sperberg-McQueen's DTD i doc-type-deklarationen

	Revision 1.3  2003/08/27 12:12:55  sigge
	Fixed two bugs.


-->

</xsl:transform>


