<?xml version="1.0" encoding="iso-8859-1" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.1"
  xmlns:m="urn:match"
  xmlns:msg="urn:message"
  xmlns:str="http://exslt.org/strings"
  xmlns:exsl="http://exslt.org/common"
>

<!--

  Based on EAD Cookbook Style 5   Version 0.9   19 January 2004

  This stylesheet generates a Table of Contents inline at the top
  of document.  It is an update to eadcbs1.xsl designed to work
  with EAD 2002.

  This stylesheet does not format the dsc portion of a finding aid.   Users
  need to select another stylesheet for the dsc and reference that file
  in the xsl:inlcude-statement that appears at the end of this file.

-->


  <xsl:strip-space elements="*"/>

  <xsl:output omit-xml-declaration="yes"
    method="xml"
    media-type="text/html"
    encoding="utf-8"
    indent = "yes"
    doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
    />

  <xsl:param name="lang" select="'sv'" />
  <xsl:param name="remoteuser" />
  <xsl:param name="file" />
  <xsl:param name="hit1" />
  <xsl:param name="hit2" />
  <xsl:param name="hit3" />
  <xsl:param name="hit4" />
  <xsl:param name="hit5" />
  <xsl:param name="strings"
    select="document('/home/sigge/WWW/xml-style-library/strings.xml')" />


  <!--Insert the address for the dsc stylesheet of your choice here.-->
  <xsl:include href="/home/sigge/WWW/xml-style-library/dsc4.xsl"/>

  <!-- Creates the body of the finding aid.-->
  <xsl:template match="/ead">
    <html>
      <head>

	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute name="href">/css-style/html.css</xsl:attribute>
	</xsl:element>

	<xsl:if test="string-length($remoteuser) &gt; 0">
	  <xsl:element name="style">
	    <xsl:text>
body {
color: black;
background-color: #f8c1ce;
font-size: 100%;
font-weight: normal;
margin-top: 5%;
margin-left: 5%;
margin-right:5%;
}
</xsl:text>
	  </xsl:element>
	</xsl:if>
	<xsl:element name="link">
	  <xsl:attribute name="rel">stylesheet</xsl:attribute>
	  <xsl:attribute
	    name="href">/2004/ediffah/style/ediffah.css</xsl:attribute>
	</xsl:element>

	<xsl:element name="meta">
	  <xsl:attribute name="http-equiv">Content-Type</xsl:attribute>
	  <xsl:attribute
	    name="content">text/html; charset=utf-8</xsl:attribute> 
	</xsl:element>

	<!--xsl:call-template name="metadata"/-->

	<title>
	  <xsl:value-of select="eadheader/filedesc/titlestmt/titleproper"/>
	  <xsl:text>  </xsl:text>
	  <xsl:value-of select="eadheader/filedesc/titlestmt/subtitle"/>
	</title>
		
      </head>
	
      <!--This part of the template creates a table for the finding aid with
      two columns. -->
      <body>
	<!--p><xsl:value-of select="$hit1"/><br />
	  <xsl:value-of select="$hit2"/><br />
	  <xsl:value-of select="$hit3"/><br />
	  <xsl:value-of select="$hit4"/><br />
	  <xsl:value-of select="$hit5"/></p-->

	<xsl:variable name="message" select="msg:message()" />
	<xsl:copy-of select="$message" />
	
	<xsl:element name="div">
	  <xsl:attribute name="class">box</xsl:attribute>
	  <xsl:element name="img">
	    <xsl:attribute
	      name="src">/2004/ediffah/ediffah.jpg</xsl:attribute>
	    <xsl:attribute name="height">109</xsl:attribute>
	    <xsl:attribute name="width">178</xsl:attribute>
	    <xsl:attribute name="border">0</xsl:attribute>
	    <xsl:attribute name="class">right</xsl:attribute>
	  </xsl:element> 
	
	  <xsl:apply-templates select="eadheader"/>		
																
	  <xsl:call-template name="toc"/>
				
	  <hr></hr>
				
	  <!--

	  To change the order of display, adjust the sequence of
	  the following apply-template statements which invoke the various
	  templates that populate the finding aid.  Multiple statements
	  are included to handle the possibility that descgrp has been used
	  as a wrapper to replace add and admininfo.  In several cases where
	  multiple elemnents are displayed together in the output, a
	  call-template statement is used

	  -->	
					
	  <xsl:apply-templates select="archdesc/did"/>
	  <xsl:apply-templates select="archdesc/bioghist"/>
	  <xsl:apply-templates select="archdesc/scopecontent"/>
	  <xsl:apply-templates select="archdesc/arrangement"/>
	  <xsl:call-template name="archdesc-restrict"/>
	  <xsl:call-template name="archdesc-relatedmaterial"/>
	  <xsl:apply-templates select="archdesc/controlaccess"/>
	  <xsl:apply-templates select="archdesc/odd"/>
	  <xsl:apply-templates select="archdesc/originalsloc"/>
	  <xsl:apply-templates select="archdesc/phystech"/>
	  <xsl:call-template name="archdesc-admininfo"/>
	  <xsl:apply-templates select="archdesc/otherfindaid |
	    archdesc/*/otherfindaid"/> 
	  <xsl:apply-templates select="archdesc/fileplan |
	    archdesc/*/fileplan"/> 
	  <xsl:apply-templates select="archdesc/bibliography |
	    archdesc/*/bibliography"/> 
	  <xsl:apply-templates select="archdesc/index | archdesc/*/index"/>
	  <xsl:apply-templates select="archdesc/dsc"/>

	  <br/>
	</xsl:element>
	<xsl:apply-templates
	  select="ead/eadheader/filedesc/titlestmt/author"/>
	<xsl:element name="br"/>
	<xsl:if test="/ead/eadheader/eadid/@identifier">
	  <xsl:element name="a">
	    <xsl:attribute
	      name="href"><xsl:value-of
		select="concat('./show-source.cgi?id=',/ead/eadheader/eadid/@identifier)"/></xsl:attribute>

	    <xsl:value-of
	    select="$strings/terms/term[@id='source']/string[@xml:lang=$lang]"
	    /> 
	  </xsl:element>
	</xsl:if>
      </body>
    </html>
  </xsl:template>
	
  <!--

  This template creates HTML meta tags that are inserted into the HTML ouput
  for use by web search engines indexing this file.   The content of each
  resulting META tag uses Dublin Core semantics and is drawn from the text of
  the finding aid.

  -->

  <xsl:template name="metadata">

    <xsl:for-each select="//controlaccess/subject">
      <xsl:choose>
	<xsl:when test="@encodinganalog='600'">
	  <meta name="dc.subject" content="{.}"/>
	</xsl:when>
	
	<xsl:when test="//@encodinganalog='610'">
	  <meta name="dc.subject" content="{.}"/>
	</xsl:when>
	
	<xsl:when test="//@encodinganalog='611'">
	  <meta name="dc.subject" content="{.}"/>
	</xsl:when>

	<xsl:when test="//@encodinganalog='700'">
	  <meta name="dc.contributor" content="{.}"/>
	</xsl:when>

	<xsl:when test="//@encodinganalog='710'">
	  <meta name="dc.contributor" content="{.}"/>
	</xsl:when>

	<xsl:otherwise>
	  <meta name="dc.contributor" content="{.}"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>

    <xsl:for-each select="//controlaccess/subject">
      <meta name="dc.subject" content="{.}"/>
    </xsl:for-each>
    <xsl:for-each select="//controlaccess/geogname">
      <meta name="dc.subject" content="{.}"/>
    </xsl:for-each>
		
    <xsl:element name="meta">
      <xsl:attribute name="name">dc.title</xsl:attribute>
      <xsl:attribute name="content">
	<xsl:value-of select="eadheader/filedesc/titlestmt/titleproper"/>
	<xsl:text>  </xsl:text>
	<xsl:value-of select="eadheader/filedesc/titlestmt/subtitle"/>
      </xsl:attribute>
    </xsl:element>

    <meta name="dc.type" content="text"/>
    <meta name="dc.format" content="finding aids"/>
		
  </xsl:template>

  <!--This template creates the Table of Contents column for the finding -->
<!--aid.-->

  <xsl:template name="toc"/>

  <xsl:template name="xxxtoc">

    <h2>
      <xsl:value-of
	select="$strings/terms/term[@id='toc']/string[@xml:lang=$lang]"
	/> 
    </h2>

    <!-- The Table of Contents template performs a series of tests to
    determine which elements will be included in the table
    of contents.  Each if statement tests to see if there is
    a matching element with content in the finding aid.-->
    <xsl:if test="string(archdesc/did/head)">
      <h4 style="text-indent:25pt">
	<a href="#{generate-id(archdesc/did/head)}">
	  <xsl:value-of select="archdesc/did/head"/>
	</a>
      </h4>
    </xsl:if>
    <xsl:if test="string(archdesc/bioghist/head)">
      <h4 style="text-indent:25pt">
	<b>
	  <a href="#{generate-id(archdesc/bioghist/head)}">
	    <xsl:value-of select="archdesc/bioghist/head"/>
	  </a>
	</b>
      </h4>
    </xsl:if>
    <xsl:if test="string(archdesc/scopecontent/head)">
      <h4 style="text-indent:25pt">
	<a href="#{generate-id(archdesc/scopecontent/head)}">
	    <xsl:value-of select="archdesc/scopecontent/head"/>
	</a>
      </h4>
    </xsl:if>
    <xsl:if test="string(archdesc/arrangement/head)">
      <h4 style="text-indent:25pt">
	<a href="#{generate-id(archdesc/arrangement/head)}">
	  <xsl:value-of select="archdesc/arrangement/head"/>
	</a>
      </h4>
    </xsl:if>
		
    <xsl:if test="string(archdesc/userestrict/head)
      or string(archdesc/accessrestrict/head)
      or string(archdesc/*/userestrict/head)
      or string(archdesc/*/accessrestrict/head)">
      <h4 style="text-indent:25pt">
	<a href="#restrictlink">
	  <xsl:value-of
	    select="$strings/terms/term[@id='userestrict']/string[@xml:lang=$lang]"
	    /> 
	</a>
      </h4>
    </xsl:if>
    <h4 style="text-indent:25pt">
      <a href="#{generate-id(archdesc/controlaccess)}">
	<xsl:choose>
	  <xsl:when test="string(archdesc/controlaccess/head)">
	    <xsl:value-of select="archdesc/controlaccess/head"/>
      	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:value-of
	      select="$strings/terms/term[@id='controlaccess']/string[@xml:lang=$lang]" /> 
	  </xsl:otherwise>
	</xsl:choose>
      </a>
    </h4>
    <xsl:if test="string(archdesc/relatedmaterial)
      or string(archdesc/separatedmaterial)
      or string(archdesc/*/relatedmaterial)
      or string(archdesc/*/separatedmaterial)">
      <h4 style="text-indent:25pt">
	<a href="#relatedmatlink">
	  <xsl:value-of
	    select="$strings/terms/term[@id='related']/string[@xml:lang=$lang]"
	    /> 
	</a>
      </h4>
    </xsl:if>
    <xsl:if test="string(archdesc/acqinfo/*)
      or string(archdesc/processinfo/*)
      or string(archdesc/prefercite/*)
      or string(archdesc/custodialhist/*)
      or string(archdesc/processinfo/*)
      or string(archdesc/appraisal/*)
      or string(archdesc/accruals/*)
      or string(archdesc/*/acqinfo/*)
      or string(archdesc/*/processinfo/*)
      or string(archdesc/*/prefercite/*)
      or string(archdesc/*/custodialhist/*)
      or string(archdesc/*/processinfo/*)
      or string(archdesc/*/appraisal/*)
      or string(archdesc/*/accruals/*)">
      <h4 style="text-indent:25pt">
	<xsl:value-of
	  select="$strings/terms/term[@id='admin']/string[@xml:lang=$lang]"
	  /> 
      </h4>
    </xsl:if>
    
    <xsl:if test="string(archdesc/otherfindaid/head)
      or string(archdesc/*/otherfindaid/head)">
      <h4 style="text-indent:25pt">
	<xsl:choose>
	  <xsl:when test="archdesc/otherfindaid/head">
	    <a href="#{generate-id(archdesc/otherfindaid/head)}">
	      <xsl:value-of select="archdesc/otherfindaid/head"/>
	    </a>
	  </xsl:when>
	  <xsl:when test="archdesc/*/otherfindaid/head">
	    <a href="#{generate-id(archdesc/*/otherfindaid/head)}">
	      <xsl:value-of select="archdesc/*/otherfindaid/head"/>
	    </a>
	  </xsl:when>
	</xsl:choose>
      </h4>
    </xsl:if>
		
    <!--The next test covers the situation where there is more than one odd
    element in the document.-->
    <xsl:if test="string(archdesc/odd/head)">
      <xsl:for-each select="archdesc/odd">
	<h4 style="text-indent:25pt">
	  <a href="#{generate-id(head)}">
	    <xsl:value-of select="head"/>
	  </a>
	</h4>
      </xsl:for-each>
    </xsl:if>
    
    <xsl:if test="string(archdesc/bibliography/head)
      or string(archdesc/*/bibliography/head)">
      <h4 style="text-indent:25pt">
	<xsl:choose>
	  <xsl:when test="archdesc/bibliography/head">
	    <a href="#{generate-id(archdesc/bibliography/head)}">
	      <xsl:value-of select="archdesc/bibliography/head"/>
	    </a>
	  </xsl:when>
	  <xsl:when test="archdesc/*/bibliography/head">
	    <a href="#{generate-id(archdesc/*/bibliography/head)}">
	      <xsl:value-of select="archdesc/*/bibliography/head"/>
	    </a>
	  </xsl:when>
	</xsl:choose>
      </h4>
    </xsl:if>
		
    <xsl:if test="string(archdesc/index/head)
      or string(archdesc/*/index/head)">
      <h4 style="text-indent:25pt">
	<xsl:choose>
	  <xsl:when test="archdesc/index/head">
	    <a href="#{generate-id(archdesc/index/head)}">
	      <xsl:value-of select="archdesc/index/head"/>
	    </a>
	  </xsl:when>
	  <xsl:when test="archdesc/*/index/head">
	    <a href="#{generate-id(archdesc/*/index/head)}">
	      <xsl:value-of select="archdesc/*/index/head"/>
	    </a>
	  </xsl:when>
	</xsl:choose>
      </h4>
    </xsl:if>
		
    <xsl:if test="string(archdesc/dsc/head)">
      <h4 style="text-indent:25pt">
	<a href="#{generate-id(archdesc/dsc/head)}">
	  <xsl:value-of select="archdesc/dsc/head"/>
	</a>
      </h4>
      <!--

      Displays the unittitle and unitdates for a c01 if it is a
      subgrp, subcollection,series or subseries (as
      evidenced by the value of @level) and numbers them
      to form a hyperlink to each.   Delete this section if you do not
      wish the c01 titles that are so identified
      to appear in the table of contents.

      -->

      <xsl:for-each select="archdesc/dsc/c01[@level='series' or
	@level='subseries' or @level='subgrp' or @level='subcollection']">

	<h4 style="margin-left:40pt; font-size:10pt">
	  <a>
	    <xsl:attribute name="href">
	      <xsl:text>#series</xsl:text>
	      <xsl:number count="c01" from="dsc"/>
	    </xsl:attribute>
	      
	    <xsl:choose>
	      <xsl:when test="did/unittitle/unitdate">
		<xsl:for-each select="did/unittitle">
		  <xsl:value-of select="text()"/>
		  <xsl:text> </xsl:text>
		  <xsl:apply-templates select="./unitdate"/>
		</xsl:for-each>
	      </xsl:when>
	      
	      <xsl:otherwise>
		<xsl:apply-templates select="did/unittitle"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="did/unitdate"/>
	      </xsl:otherwise>
	    </xsl:choose>
	  </a>
	</h4>
      </xsl:for-each>

      <!--This ends the section that causes the c01 titles to appear in the
       table of contents.-->

    </xsl:if>
    <!--End of the table of contents. -->
  </xsl:template>
	
  <!-- The following general templates format the display of various RENDER
  attributes.-->
  <xsl:template match="emph[@render='bold']">
    <b>
      <xsl:apply-templates/>
    </b>
  </xsl:template>
  <xsl:template match="emph[@render='italic']">
    <i>
      <xsl:apply-templates/>
    </i>
  </xsl:template>
  <xsl:template match="emph[@render='underline']">
    <u>
      <xsl:apply-templates/>
    </u>
  </xsl:template>
  <xsl:template match="emph[@render='sub']">
    <sub>
      <xsl:apply-templates/>
    </sub>
  </xsl:template>
  <xsl:template match="emph[@render='super']">
    <super>
      <xsl:apply-templates/>
    </super>
  </xsl:template>
  
  <xsl:template match="emph[@render='quoted']">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>
  
  <xsl:template match="emph[@render='doublequote']">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>
  <xsl:template match="emph[@render='singlequote']">
    <xsl:text>'</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>'</xsl:text>
  </xsl:template>
  <xsl:template match="emph[@render='bolddoublequote']">
    <b>
      <xsl:text>"</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>"</xsl:text>
    </b>
  </xsl:template>
  <xsl:template match="emph[@render='boldsinglequote']">
    <b>
      <xsl:text>'</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>'</xsl:text>
    </b>
  </xsl:template>
  <xsl:template match="emph[@render='boldunderline']">
    <b>
      <u>
	<xsl:apply-templates/>
      </u>
    </b>
  </xsl:template>
  <xsl:template match="emph[@render='bolditalic']">
    <b>
      <i>
	<xsl:apply-templates/>
      </i>
    </b>
  </xsl:template>
  <xsl:template match="emph[@render='boldsmcaps']">
    <font style="font-variant: small-caps">
      <b>
	<xsl:apply-templates/>
      </b>
    </font>
  </xsl:template>
  <xsl:template match="emph[@render='smcaps']">
    <font style="font-variant: small-caps">
      <xsl:apply-templates/>
    </font>
  </xsl:template>
  <xsl:template match="title[@render='bold']">
    <b>
      <xsl:apply-templates/>
    </b>
  </xsl:template>
  <xsl:template match="title[@render='italic']">
    <i>
      <xsl:apply-templates/>
    </i>
  </xsl:template>
  <xsl:template match="title[@render='underline']">
    <u>
      <xsl:apply-templates/>
    </u>
  </xsl:template>
  <xsl:template match="title[@render='sub']">
    <sub>
      <xsl:apply-templates/>
    </sub>
  </xsl:template>
  <xsl:template match="title[@render='super']">
    <super>
      <xsl:apply-templates/>
    </super>
  </xsl:template>
  
  <xsl:template match="title[@render='quoted']">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>

  <xsl:template match="title[@render='doublequote']">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>"</xsl:text>
  </xsl:template>
  
  <xsl:template match="title[@render='singlequote']">
    <xsl:text>'</xsl:text>
    <xsl:apply-templates/>
    <xsl:text>'</xsl:text>
  </xsl:template>
  <xsl:template match="title[@render='bolddoublequote']">
    <b>
      <xsl:text>"</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>"</xsl:text>
    </b>
  </xsl:template>
  <xsl:template match="title[@render='boldsinglequote']">
    <b>
      <xsl:text>'</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>'</xsl:text>
    </b>
  </xsl:template>

  <xsl:template match="title[@render='boldunderline']">
    <b>
      <u>
	<xsl:apply-templates/>
      </u>
    </b>
  </xsl:template>
  <xsl:template match="title[@render='bolditalic']">
    <b>
      <i>
	<xsl:apply-templates/>
      </i>
    </b>
  </xsl:template>
  <xsl:template match="title[@render='boldsmcaps']">
    <font style="font-variant: small-caps">
      <b>
	<xsl:apply-templates/>
      </b>
    </font>
  </xsl:template>
  <xsl:template match="title[@render='smcaps']">
    <font style="font-variant: small-caps">
      <xsl:apply-templates/>
    </font>
  </xsl:template>
  <!-- This template converts a Ref element into an HTML anchor.-->
  <xsl:template match="ref">
    <a href="#{@target}">
      <xsl:apply-templates/>
    </a>
  </xsl:template>
	
  <!--This template rule formats a list element anywhere
  except in arrangement.-->
  <xsl:template match="list[parent::*[not(self::arrangement)]]/head">
    <div style="margin-left: 25pt">
      <b>
	<xsl:apply-templates/>
      </b>
    </div>
  </xsl:template>
		
  <xsl:template match="list[parent::*[not(self::arrangement)]]/item">
    <div style="margin-left: 40pt">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
	
  <!--Formats a simple table. The width of each column is defined by the
  colwidth attribute in a colspec element.-->
  <xsl:template match="table">
    <table width="75%" style="margin-left: 25pt">
      <tr>
	<td colspan="3">
	  <h4>
	    <xsl:apply-templates select="head"/>
	  </h4>
	</td>
      </tr>
      <xsl:for-each select="tgroup">
	<tr>
	  <xsl:for-each select="colspec">
	    <td width="{@colwidth}"></td>
	  </xsl:for-each>
	</tr>
	<xsl:for-each select="thead">
	  <xsl:for-each select="row">
	    <tr>
	      <xsl:for-each select="entry">
		<td valign="top">
		  <b>
		    <xsl:apply-templates/>
		  </b>
		</td>
	      </xsl:for-each>
	    </tr>
	  </xsl:for-each>
	</xsl:for-each>
	
	<xsl:for-each select="tbody">
	  <xsl:for-each select="row">
	    <tr>
	      <xsl:for-each select="entry">
		<td valign="top">
		  <xsl:apply-templates/>
		</td>
	      </xsl:for-each>
	    </tr>
	  </xsl:for-each>
	</xsl:for-each>
      </xsl:for-each>
    </table>
  </xsl:template>
  <!--This template rule formats a chronlist element.-->
  <xsl:template match="chronlist">
    <table width="100%" style="margin-left:25pt">
      <tr>
	<td width="5%"> </td>
	<td width="15%"> </td>
	<td width="80%"> </td>
      </tr>
      <xsl:apply-templates/>
    </table>
  </xsl:template>
  
  <xsl:template match="chronlist/head">
    <tr>
      <td colspan="3">
	<h4>
	  <xsl:apply-templates/>
	</h4>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="chronlist/listhead">
    <tr>
      <td> </td>
      <td>
	<b>
	  <xsl:apply-templates select="head01"/>
	</b>
      </td>
      <td>
	<b>
	  <xsl:apply-templates select="head02"/>
	</b>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template match="chronitem">
    <!--Determine if there are event groups.-->
    <xsl:choose>
      <xsl:when test="eventgrp">
	<!--Put the date and first event on the first line.-->
	<tr>
	  <td> </td>
	  <td valign="top">
	    <xsl:apply-templates select="date"/>
	  </td>
	  <td valign="top">
	    <xsl:apply-templates select="eventgrp/event[position()=1]"/>
	  </td>
	</tr>
	<!--Put each successive event on another line.-->
	<xsl:for-each select="eventgrp/event[not(position()=1)]">
	  <tr>
	    <td> </td>
	    <td> </td>
	    <td valign="top">
	      <xsl:apply-templates select="."/>
	    </td>
	  </tr>
	</xsl:for-each>
      </xsl:when>
      <!--Put the date and event on a single line.-->
      <xsl:otherwise>
	<tr>
	  <td> </td>
	  <td valign="top">
	    <xsl:apply-templates select="date"/>
	  </td>
	  <td valign="top">
	    <xsl:apply-templates select="event"/>
	  </td>
	</tr>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <!--Suppreses all other elements of eadheader.-->
  <xsl:template match="eadheader">
    <h1 class="title">
      <a name="{generate-id(titlestmt/titleproper)}">
	<xsl:value-of select="filedesc/titlestmt/titleproper"/>
      </a>
    </h1>
    <h2 style="text-align:center">
      <xsl:value-of select="filedesc/titlestmt/subtitle"/>
    </h2>
    <br/>
  </xsl:template>
  
  <!-- This template creates a table for the did, inserts the head and then
  each of the other did elements.  To change the order of appearance of these
  elements, change the sequence of the apply-templates statements. -->

  <xsl:template match="archdesc/did">
    <table width="100%">
      <tr>
	<td width="25%"> </td>
	<td width="75%"> </td>
      </tr>
      <tr>
	<td colspan="2">
	  <h3>
	    <a name="{generate-id(head)}">
	      <xsl:apply-templates select="head"/>
	    </a>
	  </h3>
	</td>
      </tr>	
      
      <!--One can change the order of appearance for the children of did
      by changing the order of the following statements.-->	
      <xsl:apply-templates select="repository"/>			
      <xsl:apply-templates select="origination"/>	
      <xsl:apply-templates select="unittitle"/>	
      <xsl:apply-templates select="unitdate"/>		
      <xsl:apply-templates select="physdesc"/>	
      <xsl:apply-templates select="abstract"/>	
      <xsl:apply-templates select="unitid"/>	
      <xsl:apply-templates select="physloc"/>
      <xsl:apply-templates select="langmaterial"/>
      <xsl:apply-templates select="materialspec"/>
      <xsl:apply-templates select="note"/>
    </table>
    <hr></hr>
  </xsl:template>
  


  <!--This template formats the repostory, origination, physdesc, abstract,
  unitid, physloc and materialspec elements of archdesc/did which share a 
  common presentation. The sequence of their appearance is governed by the
  previous template. --> 

  <xsl:template match="archdesc/did/repository
    | archdesc/did/origination
    | archdesc/did/physdesc
    | archdesc/did/unitid
    | archdesc/did/physloc
    | archdesc/did/abstract
    | archdesc/did/langmaterial
    | archdesc/did/materialspec">
    <!--The template tests to see if there is a label attribute,
    inserting the contents if there is or adding display textif there isn't.
    The content of the supplied label depends on the element.  To change the
    supplied label, simply alter the template below.-->

    <xsl:choose>
      <xsl:when test="@label">
	<tr>
	  <td valign="top">
	    <b>
	      <xsl:value-of select="@label"/>
	    </b>
	  </td>
	  <td>
	    <xsl:apply-templates/>
	  </td>
	</tr>
      </xsl:when>
      <xsl:otherwise>
	<tr>
	  <td valign="top">
	    <strong>
	      <xsl:choose>
		<xsl:when test="self::repository">
		  <xsl:value-of
		    select="$strings/terms/term[@id='repository']/string[@xml:lang=$lang]" />
		</xsl:when>
		<xsl:when test="self::origination">
		  <xsl:value-of
		    select="$strings/terms/term[@id='origination']/string[@xml:lang=$lang]"
		    /> 
		</xsl:when>
		<xsl:when test="self::physdesc">
		  <xsl:value-of
		    select="$strings/terms/term[@id='physdesc']/string[@xml:lang=$lang]"/> 
		</xsl:when>
		<xsl:when test="self::physloc">
		  <xsl:value-of
		    select="$strings/terms/term[@id='physloc']/string[@xml:lang=$lang]"
		    /> 
		</xsl:when>
		<xsl:when test="self::unitid">
		  <xsl:value-of
		    select="$strings/terms/term[@id='unitid']/string[@xml:lang=$lang]"
		    /> 
		</xsl:when>
		<xsl:when test="self::abstract">
		  <xsl:value-of
		    select="$strings/terms/term[@id='abstract']/string[@xml:lang=$lang]"
		    /> 
		</xsl:when>
		<xsl:when test="self::langmaterial">
		  <xsl:value-of
		    select="$strings/terms/term[@id='langmaterial']/string[@xml:lang=$lang]"
		    /> 
		</xsl:when>
		<xsl:when test="self::materialspec">
		  <xsl:value-of
		    select="$strings/terms/term[@id='materialspec']/string[@xml:lang=$lang]"
		    /> 
		</xsl:when>
	      </xsl:choose><xsl:text>: </xsl:text>
	    </strong>
	  </td>
	  <td>
	    <xsl:apply-templates/>
	  </td>
	</tr>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  

  <!-- The following two templates test for and processes various permutations
  of unittitle and unitdate.-->
	
  <xsl:template match="archdesc/did/unittitle">
    <!--The template tests to see if there is a label attribute for unittitle,
    inserting the contents if there is or adding one if there isn't. -->

    <xsl:choose>
      <xsl:when test="@label">
	<tr>
	  
	  <td valign="top">
	    <b>
	      <xsl:value-of select="@label"/>
	    </b>
	  </td>
	  <td>
	    <!--Inserts the text of unittitle and any children other that
	    unitdate.-->	
	    <xsl:apply-templates select="text() |* [not(self::unitdate)]"/>
	  </td>
	</tr>
      </xsl:when>
      
      <xsl:otherwise>
	<tr>
	  
	  <td valign="top">
	    <b>
	      <xsl:value-of
		select="$strings/terms/term[@id='title']/string[@xml:lang=$lang]"
		/><xsl:text>: </xsl:text>
	    </b>
	  </td>
	  <td>
	    <xsl:apply-templates select="text() |* [not(self::unitdate)]"/>
	  </td>
	</tr>
      </xsl:otherwise>
    </xsl:choose>
    <!--If unitdate is a child of unittitle, it inserts unitdate on a new
    line.  -->
    <xsl:if test="child::unitdate">
      <!--The template tests to see if there is a label attribute for
      unittitle, inserting the contents if there is or adding one if there
      isn't. --> 

      <xsl:choose>
	<xsl:when test="unitdate/@label">
	  <tr>
	    
	    <td valign="top">
	      <b>
		<xsl:value-of select="unitdate/@label"/>
	      </b>
	    </td>
	    <td>
	      <xsl:apply-templates select="unitdate"/>
	    </td>
	  </tr>
	</xsl:when>
	
	<xsl:otherwise>
	  <tr>
	    
	    <td valign="top">
	      <b>
		<xsl:value-of
		  select="$strings/terms/term[@id='dates']/string[@xml:lang=$lang]"
		  />:
	      </b>
	    </td>
	    <td>
	      <xsl:apply-templates select="unitdate"/>
	    </td>
	  </tr>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>
  <!-- Processes the unit date if it is not a child of unit title but a
    child of did, the current context.-->

  <xsl:template match="archdesc/did/unitdate">

    <!--The template tests to see if there is a label attribute for a
      unittitle that is the child of did and not unittitle, inserting the
      contents if there is or adding one if there isn't.-->

    <xsl:choose>
      <xsl:when test="@label">
	<tr>
					
	  <td valign="top">
	    <b>
	      <xsl:value-of select="@label"/>
	    </b>
	  </td>
	  <td>
	    <xsl:apply-templates/>
	  </td>
	</tr>
      </xsl:when>
		
      <xsl:otherwise>
	<tr>
				
	  <td valign="top">
	    <b>
	      <xsl:value-of
		select="$strings/terms/term[@id='dates']/string[@xml:lang=$lang]"
		/>:
	    </b>
	  </td>
	  <td>
	    <xsl:apply-templates/>
	  </td>
	</tr>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
	
  <xsl:template match="physdesc/dimensions">
    <xsl:apply-templates/>
    <xsl:if test="@unit">
      <xsl:text> </xsl:text>
      <xsl:value-of select="@unit" />
    </xsl:if>
  </xsl:template>

  <!--This template processes the note element.-->
  <xsl:template match="archdesc/did/note">
    <xsl:for-each select="p">
      <!--The template tests to see if there is a label attribute,
       inserting the contents if there is or adding one if there isn't. -->
      <xsl:choose>
	<xsl:when test="parent::note[@label]">
	  <!--This nested choose tests for and processes the first paragraph.
           Additional paragraphs do not get a label.-->

	  <xsl:choose>
	    <xsl:when test="position()=1">
	      <tr>
		
		<td valign="top">
		  <b>
		    <xsl:value-of select="@label"/>
		  </b>
		</td>
		<td valign="top">
		  <xsl:apply-templates/>
		</td>
	      </tr>
	    </xsl:when>

	    <xsl:otherwise>
	      <tr>
								
		<td valign="top"></td>
		<td valign="top">
		  <xsl:apply-templates/>
		</td>
	      </tr>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:when>
	<!--Processes situations where there is no
	label attribute by supplying default text.-->
	
	<xsl:otherwise>
	  <!--This nested choose tests for and processes the first paragraph.
           Additional paragraphs do not get a label.-->
	  <xsl:choose>
	    <xsl:when test="position()=1">
	      <tr>
		
		<td valign="top">
		  <b>
		    <xsl:text>Note: </xsl:text>
		  </b>
		</td>
		<td>
		  <xsl:apply-templates/>
		</td>
	      </tr>
	    </xsl:when>
	    
	    <xsl:otherwise>
	      <tr>
		<td valign="top"></td>
		<td>
		  <xsl:apply-templates/>
		</td>
	      </tr>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:otherwise>
      </xsl:choose>
      <!--Closes each paragraph-->
    </xsl:for-each>
  </xsl:template>

  <!--This template rule formats the top-level bioghist element and
  creates a link back to the top of the page after the display
  of the element.-->

  <xsl:template match="archdesc/bioghist |
    archdesc/scopecontent |
    archdesc/phystech |
    archdesc/odd   |
    archdesc/arrangement">
    
    <xsl:if test="string(child::*)">
      <xsl:apply-templates/>
      <p>
	<a href="#">
	  <xsl:value-of
	    select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	    /> 
  	</a>
      </p>
      <hr></hr>
    </xsl:if>
  </xsl:template>

  <!--This template formats various head elements and makes them targets for
  links from the Table of Contents.-->
  
  <xsl:template match="archdesc/bioghist/head  |
    archdesc/scopecontent/head |
    archdesc/phystech/head |
    archdesc/controlaccess/head |
    archdesc/odd/head |
    archdesc/arrangement/head">
    <h3>
      <a name="{generate-id()}">
	<xsl:apply-templates/>
      </a>
    </h3>
  </xsl:template>
  
  <xsl:template match="archdesc/bioghist/p |
    archdesc/arrangement/p |
    archdesc/scopecontent/p |
    archdesc/phystech/p |
    archdesc/controlaccess/p |
    archdesc/odd/p |
    archdesc/bioghist/note/p |
    archdesc/scopecontent/note/p |
    archdesc/phystech/note/p |
    archdesc/controlaccess/note/p |
    archdesc/odd/note/p">
    <p style="margin-left:25pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <xsl:template match="archdesc/bioghist/bioghist/head |
    archdesc/scopecontent/scopecontent/head">
    <h3 style="margin-left:25pt">
      <xsl:apply-templates/>
    </h3>
  </xsl:template>
  
  <xsl:template match="archdesc/bioghist/bioghist/p |
    archdesc/scopecontent/scopecontent/p |
    archdesc/bioghist/bioghist/note/p |
    archdesc/scopecontent/scopecontent/note/p">
    <p style="margin-left: 50pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!-- The next two templates format an arrangement
  statement embedded in <scopecontent>.-->
  
  <xsl:template match="archdesc/scopecontent/arrangement/head">
    <h4 style="margin-left:25pt">
      <a name="{generate-id()}">
	<xsl:apply-templates/>
      </a>
    </h4>
  </xsl:template>
  
  <xsl:template match="archdesc/scopecontent/arrangement/p
    | archdesc/scopecontent/arrangement/note/p">
    <p style="margin-left:50pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!-- The next three templates format a list within an arrangement
  statement whether it is directly within <archdesc> or embedded in
  <scopecontent>.-->

  <xsl:template match="archdesc/scopecontent/arrangement/list/head">
    <div style="margin-left:25pt">
      <a name="{generate-id()}">
	<xsl:apply-templates/>
      </a>
    </div>
  </xsl:template>

  <xsl:template match="archdesc/arrangement/list/head">
    <div style="margin-left:25pt">
      <a name="{generate-id()}">
	<xsl:apply-templates/>
      </a>
    </div>
  </xsl:template>

  <xsl:template match="archdesc/scopecontent/arrangement/list/item
    | archdesc/arrangement/list/item">
    <div style="margin-left:50pt">
      <a>
	<xsl:attribute name="href">#series<xsl:number/>
	</xsl:attribute>
	<xsl:apply-templates/>
      </a>
    </div>
  </xsl:template>
  

  <!--This template rule formats the top-level related material
	elements by combining any related or separated materials
	elements. It begins by testing to see if there related or separated
	materials elements with content.-->

  <xsl:template name="archdesc-relatedmaterial">
    <xsl:if test="string(archdesc/relatedmaterial) or
      string(archdesc/*/relatedmaterial) or
      string(archdesc/separatedmaterial) or
      string(archdesc/*/separatedmaterial)">
      <h3>
	<a name="relatedmatlink">
	  <b>
	    <xsl:value-of
	      select="$strings/terms/term[@id='related']/string[@xml:lang=$lang]"
	    /> 
	  </b>
	</a>
      </h3>
      <xsl:apply-templates select="archdesc/relatedmaterial/p
	| archdesc/*/relatedmaterial/p
	| archdesc/relatedmaterial/note/p
	| archdesc/*/relatedmaterial/note/p"/>
      <xsl:apply-templates select="archdesc/separatedmaterial/p
	| archdesc/*/separatedmaterial/p
	| archdesc/separatedmaterial/note/p
	| archdesc/*/separatedmaterial/note/p"/>
      <p>
	<a href="#">
	  <xsl:value-of
	    select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	    /> 
	</a>
      </p>
      <hr></hr>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="archdesc/relatedmaterial/p
    | archdesc/*/relatedmaterial/p
    | archdesc/separatedmaterial/p
    | archdesc/*/separatedmaterial/p
    | archdesc/relatedmaterial/note/p
    | archdesc/*/relatedmaterial/note/p
    | archdesc/separatedmaterial/note/p
    | archdesc/*/separatedmaterial/note/p">
    <p style="margin-left: 25pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!--This template formats the top-level controlaccess element.
  It begins by testing to see if there is any controlled
  access element with content. It then invokes one of two templates
  for the children of controlaccess.  -->
	
  <xsl:template match="archdesc/controlaccess">
    <xsl:if test="string(child::*)">
      <h3>
	<xsl:choose>
	  <xsl:when test="head/text()">
	    <a name="{generate-id(head)}">
	      <xsl:apply-templates select="head"/>
	    </a>
	  </xsl:when>
	  <xsl:otherwise>
	    <a name="{generate-id(head)}">
	      <xsl:value-of
		select="$strings/terms/term[@id='controlaccess']/string[@xml:lang=$lang]"
		/> 
	    </a>
	  </xsl:otherwise>
	</xsl:choose>
      </h3>
      <p style="text-indent:25pt">
	<xsl:apply-templates select="p | note/p"/>
      </p>
      <xsl:choose>
	<!--Apply this template when there are recursive controlaccess
	elements.-->
	<xsl:when test="controlaccess">
	  <xsl:apply-templates mode="recursive" select="."/>
	</xsl:when>
	<!--Apply this template when the controlled terms are entered
	directly under the controlaccess element.-->
	<xsl:otherwise>
	  <xsl:apply-templates mode="direct" select="."/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <!--This template formats controlled terms that are entered
  directly under the controlaccess element.  Elements are alphabetized.-->
  <xsl:template mode="direct" match="archdesc/controlaccess">
    <xsl:for-each select="subject |corpname | famname | persname | genreform |
      title | geogname | occupation"> 
      <xsl:sort select="." data-type="text" order="ascending"/>
      <div style="margin-left:50pt">
	<xsl:apply-templates/>
      </div>
    </xsl:for-each>
    <p>
      <a href="#">
	<xsl:value-of
	  select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	  /> 
      </a>
    </p>
    <!--hr> </hr-->
  </xsl:template>

  <!--When controlled terms are nested within recursive
  controlaccess elements, the template for controlaccess/controlaccess
  is applied.-->
  <xsl:template mode="recursive" match="archdesc/controlaccess">
    <xsl:apply-templates select="controlaccess"/>
    <p>
      <a href="#">
	<xsl:value-of
	  select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	  /> 
      </a>
    </p>
    <hr> </hr>
  </xsl:template>
  
  <!--This template formats controlled terms that are nested within recursive
  controlaccess elements.   Terms are alphabetized within each grouping.-->

  <xsl:template match="archdesc/controlaccess/controlaccess">
    <h4 style="margin-left:25pt">
      <xsl:apply-templates select="head"/>
    </h4>
    <xsl:for-each select="subject 
      |corpname 
      | famname 
      | persname 
      | genreform 
      | title 
      | geogname 
      | occupation">

      <xsl:sort select="." data-type="text" order="ascending"/>
      <div style="margin-left:50pt">
	<xsl:apply-templates/>
      </div>
    </xsl:for-each>
  </xsl:template>

  <!--This template rule formats a top-level access and use retriction
   elements. They are displayed under a common heading.
   It begins by testing to see if there are any restriction elements with
   content.-->

  <xsl:template name="archdesc-restrict">

    <!--or string(archdesc/accessrestrict/*)
      or string(archdesc/*/accessrestrict/*)"-->

    <xsl:if test="string(archdesc/userestrict/*)
      or string(archdesc/*/userestrict/*)
      ">
      <h3>
	<a name="restrictlink">
	  <b>
	    <xsl:value-of
	      select="$strings/terms/term[@id='userestrict']/string[@xml:lang=$lang]"
	    /> 
	  </b>
	</a>
      </h3>
      <xsl:apply-templates select="archdesc/accessrestrict
	| archdesc/*/accessrestrict"/> 
      
      <xsl:apply-templates select="archdesc/userestrict
	| archdesc/*/userestrict"/>
      <p>
	<a href="#">
	  <xsl:value-of
	    select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	    /> 
	</a>
      </p>
      <hr></hr>
    </xsl:if>
  </xsl:template>

  <xsl:template match="archdesc/accessrestrict/head
    | archdesc/userestrict/head
    | archdesc/*/accessrestrict/head
    | archdesc/*/userestrict/head">
    <h4 style="margin-left: 25pt">
      <xsl:apply-templates/>
    </h4>
  </xsl:template>

  <xsl:template match="archdesc/accessrestrict/legalstatus |
    archdesc/*/accessrestrict/legalstatus"/>

  <!--archdesc/accessrestrict/legalstatus
  archdesc/*/accessrestrict/legalstatus-->
  <xsl:template match="archdesc/accessrestrict/p
    | archdesc/userestrict/p
    | archdesc/*/accessrestrict/p
    | archdesc/*/userestrict/p
    | archdesc/accessrestrict/note/p
    | archdesc/userestrict/note/p
    | archdesc/*/accessrestrict/note/p
    | archdesc/*/userestrict/note/p
    | archdesc/*/userestrict/legalstatus">
    <p style="margin-left:50pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <!--This templates consolidates all the other administrative information
  elements into one block under a common heading.  It formats these elements
  regardless of which of three encodings has been utilized.  They may be
  children of archdesc, admininfo, or descgrp.
  It begins by testing to see if there are any elements of this type
  with content.-->

  <xsl:template name="archdesc-admininfo">
    <xsl:if test="string(archdesc/admininfo/custodhist/*)
      or string(archdesc/altformavailable/*)
      or string(archdesc/prefercite/*)
      or string(archdesc/acqinfo/*)
      or string(archdesc/processinfo/*)
      or string(archdesc/appraisal/*)
      or string(archdesc/accruals/*)
      or string(archdesc/*/custodhist/*)
      or string(archdesc/*/altformavailable/*)
      or string(archdesc/*/prefercite/*)
      or string(archdesc/*/acqinfo/*)
      or string(archdesc/*/processinfo/*)
      or string(archdesc/*/appraisal/*)
      or string(archdesc/*/accruals/*)">
      <h3>
	<a name="adminlink">
	  <xsl:text>Administrative Information</xsl:text>
	</a>
      </h3>
      <xsl:apply-templates select="archdesc/custodhist
	| archdesc/*/custodhist"/>
      <xsl:apply-templates select="archdesc/altformavailable
	| archdesc/*/altformavailable"/>
      <xsl:apply-templates select="archdesc/prefercite
	| archdesc/*/prefercite"/>
      <xsl:apply-templates select="archdesc/acqinfo
	| archdesc/*/acqinfo"/>
      <xsl:apply-templates select="archdesc/processinfo
	| archdesc/*/processinfo"/>
      <xsl:apply-templates select="archdesc/appraisal
	| archdesc/*/appraisal"/>
      <xsl:apply-templates select="archdesc/accruals
	| archdesc/*/accruals"/>
      <p>
	<a href="#">
	  <xsl:value-of
	    select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	    /> 
	</a>
      </p>
      <hr></hr>
    </xsl:if>
  </xsl:template>


  <!--This template rule formats the head element of top-level elements of
  administrative information.-->
  <xsl:template match="custodhist/head
    | archdesc/altformavailable/head
    | archdesc/prefercite/head
    | archdesc/acqinfo/head
    | archdesc/processinfo/head
    | archdesc/appraisal/head
    | archdesc/accruals/head
    | archdesc/*/custodhist/head
    | archdesc/*/altformavailable/head
    | archdesc/*/prefercite/head
    | archdesc/*/acqinfo/head
    | archdesc/*/processinfo/head
    | archdesc/*/appraisal/head
    | archdesc/*/accruals/head">
    <h4 style="margin-left:50pt">
      <a name="{generate-id()}">
	<xsl:apply-templates/>
      </a>
    </h4>
  </xsl:template>
  
  <xsl:template match="custodhist/p
    | archdesc/altformavailable/p
    | archdesc/prefercite/p
    | archdesc/acqinfo/p
    | archdesc/processinfo/p
    | archdesc/appraisal/p
    | archdesc/accruals/p
    | archdesc/*/custodhist/p
    | archdesc/*/altformavailable/p
    | archdesc/*/prefercite/p
    | archdesc/*/acqinfo/p
    | archdesc/*/processinfo/p
    | archdesc/*/appraisal/p
    | archdesc/*/accruals/p
    | archdesc/custodhist/note/p
    | archdesc/altformavailable/note/p
    | archdesc/prefercite/note/p
    | archdesc/acqinfo/note/p
    | archdesc/processinfo/note/p
    | archdesc/appraisal/note/p
    | archdesc/accruals/note/p
    | archdesc/*/custodhist/note/p
    | archdesc/*/altformavailable/note/p
    | archdesc/*/prefercite/note/p
    | archdesc/*/acqinfo/note/p
    | archdesc/*/processinfo/note/p
    | archdesc/*/appraisal/note/p
    | archdesc/*/accruals/note/p">
    
    <p style="margin-left:25pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>

  <xsl:template match="archdesc/otherfindaid
    | archdesc/*/otherfindaid
    | archdesc/bibliography
    | archdesc/*/bibliography
    | archdesc/originalsloc
    | archdesc/phystech">
    <xsl:apply-templates/>
    <p>
      <a href="#"><xsl:value-of
	    select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	    /> 
      </a>
    </p>
    <hr></hr>
  </xsl:template>
  
  <xsl:template match="archdesc/otherfindaid/head
    | archdesc/*/otherfindaid/head
    | archdesc/bibliography/head
    | archdesc/*/bibliography/head
    | archdesc/fileplan/head
    | archdesc/originalsloc/head
    | archdesc/*/fileplan/head
    | archdesc/phystech/head">
    <h3>
      <a name="{generate-id()}">
	<b>
	  <xsl:apply-templates/>
	</b>
      </a>
    </h3>
  </xsl:template>
  
  <xsl:template match="archdesc/otherfindaid/p
    | archdesc/*/otherfindaid/p
    | archdesc/bibliography/p
    | archdesc/*/bibliography/p
    | archdesc/otherfindaid/note/p
    | archdesc/*/otherfindaid/note/p
    | archdesc/bibliography/note/p
    | archdesc/*/bibliography/note/p
    | archdesc/originalsloc/p
    | archdesc/originalsloc/note/p
    | archdesc/fileplan/p
    | archdesc/*/fileplan/p
    | archdesc/fileplan/note/p
    | archdesc/*/fileplan/note/p
    | archdesc/phystech/p
    | archdesc/phystech/note/p">
    <p style="margin-left:25pt">
      <xsl:apply-templates/>
    </p>
  </xsl:template>
  
  <!--This template rule tests for and formats the top-level index element.
  It begins by testing to see if there is an index element with content.-->

  <xsl:template match="archdesc/index
    | archdesc/*/index">
    <table width="100%">
      <tr>
	<td width="5%"> </td>
	<td width="45%"> </td>
	<td width="50%"> </td>
      </tr>
      <tr>
	<td colspan="3">
	  <h3>
	    <a name="{generate-id(head)}">
	      <b>
		<xsl:apply-templates select="head"/>
	      </b>
	    </a>
	  </h3>
	</td>
      </tr>
      <xsl:for-each select="p | note/p">
	<tr>
	  <td></td>
	  <td colspan="2">
	    <xsl:apply-templates/>
	  </td>
	</tr>
      </xsl:for-each>

      <!--Processes each index entry.-->
      <xsl:for-each select="indexentry">
	
	<!--Sorts each entry term.-->
	<xsl:sort select="corpname | famname | function | genreform | geogname | name | occupation | persname | subject"/>
	<tr>
	  <td></td>
	  <td>
	    <xsl:apply-templates select="corpname | famname | function | genreform | geogname | name | occupation | persname | subject"/>
	  </td>
	  <!--Supplies whitespace and punctuation if there is a pointer
	  group with multiple entries.-->

	  <xsl:choose>
	    <xsl:when test="ptrgrp">
	      <td>
		<xsl:for-each select="ptrgrp">
		  <xsl:for-each select="ref | ptr">
		    <xsl:apply-templates/>
		    <xsl:if test="preceding-sibling::ref or preceding-sibling::ptr">
		      <xsl:text>, </xsl:text>
		    </xsl:if>
		  </xsl:for-each>
		</xsl:for-each>
	      </td>
	    </xsl:when>
	    <!--If there is no pointer group, process each reference or pointer.-->
	    <xsl:otherwise>
	      <td>
		<xsl:for-each select="ref | ptr">
		  <xsl:apply-templates/>
		</xsl:for-each>
	      </td>
	    </xsl:otherwise>
	  </xsl:choose>
	</tr>
	<!--Closes the indexentry.-->
      </xsl:for-each>
    </table>
    <p>
      <a href="#">
	<xsl:value-of
	    select="$strings/terms/term[@id='totoc']/string[@xml:lang=$lang]"
	    /> 
      </a>
    </p>
    <hr></hr>
  </xsl:template>

  <!-- xsl:template match="text()">
    <xsl:param name="tokens">
      <div>
	<xsl:copy-of select="str:tokenize(.,' .,')"/>
      </div>
    </xsl:param>
    <xsl:for-each select="exsl:node-set($tokens)/div/token">
      <xsl:choose>
	<xsl:when test="m:match(.,$hit1) = 'yes'">
	  <xsl:element name="span">
	    <xsl:attribute name="class">hit1</xsl:attribute>
	    <xsl:value-of select="."/>
	  </xsl:element>
	</xsl:when>
	<xsl:when test="m:match(.,$hit2) = 'yes'">
	  <xsl:element name="span">
	    <xsl:attribute name="class">hit2</xsl:attribute>
	    <xsl:value-of select="."/>
	  </xsl:element>
	</xsl:when>
	<xsl:when test="m:match(.,$hit3) = 'yes'">
	  <xsl:element name="span">
	    <xsl:attribute name="class">hit3</xsl:attribute>
	    <xsl:value-of select="."/>
	  </xsl:element>
	</xsl:when>
	<xsl:when test="m:match(.,$hit4) = 'yes'">
	  <xsl:element name="span">
	    <xsl:attribute name="class">hit1</xsl:attribute>
	    <xsl:value-of select="."/>
	  </xsl:element>
	</xsl:when>
	<xsl:when test="m:match(.,$hit5) = 'yes'">
	  <xsl:element name="span">
	    <xsl:attribute name="class">hit5</xsl:attribute>
	    <xsl:value-of select="."/>
	  </xsl:element>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="."/>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:text> </xsl:text>
    </xsl:for-each>
  </xsl:template -->

</xsl:stylesheet>
