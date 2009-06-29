<?xml version="1.0" encoding="UTF-8"?>
<!-- 
 # The Contents of this file are made available subject to the terms of
 # the GNU Lesser General Public License Version 2.1

 # Author Sigfrid Lundberg.
 # Builds on the OO to TEI transform by Sebastian Rahtz (2003) and
 # contains featurs derived from the OpenOffice to Docbook conversion 
 # by Sun Microsystems Inc., October, 2000

 #  GNU Lesser General Public License Version 2.1
 #  =============================================
 #  Copyright 2000 by Sun Microsystems, Inc.
 #  901 San Antonio Road, Palo Alto, CA 94303, USA
 #
 #  This library is free software; you can redistribute it and/or
 #  modify it under the terms of the GNU Lesser General Public
 #  License version 2.1, as published by the Free Software Foundation.
 #
 #  This library is distributed in the hope that it will be useful,
 #  but WITHOUT ANY WARRANTY; without even the implied warranty of
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 #  Lesser General Public License for more details.
 #
 #  You should have received a copy of the GNU Lesser General Public
 #  License along with this library; if not, write to the Free Software
 #  Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 #  MA  02111-1307  USA
 #
-->

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

  <xsl:param name="table_lables"
    select="document('table-lables.xml')" />

  <xsl:key
    name="containers"
    match="text:p                  |
           text:alphabetical-index |
           table:table             |
           text:span               |
           text:ordered-list       |
           office:annotation       |
           text:unordered-list     |
           text:footnote           |
           text:a                  |
           text:list-item          |
           draw:plugin             |
           draw:text-box           |
           text:footnote-body"

    use="generate-id(
         preceding-sibling::*[
                               @text:style-name='did'               or
                               @text:style-name='bioghist'          or
                               @text:style-name='scopecontent'      or
                               @text:style-name='arrangement'       or
                               @text:style-name='accessrestrict'    or
                               @text:style-name='userrestrict'      or
                               @text:style-name='relatedmaterial'   or  
                               @text:style-name='separatedmaterial' or
                               @text:style-name='controlaccess'     or
                               @text:style-name='odd'               or
                               @text:style-name='originalsloc'      or
                               @text:style-name='altformavail'      or
                               @text:style-name='custodhist'        or
                               @text:style-name='phystech'          or
                               @text:style-name='acqinfo'           or
                               @text:style-name='processinfo'       or
                               @text:style-name='appraisal'         or
                               @text:style-name='accruals'          or
                               @text:style-name='otherfindaid'      or
                               @text:style-name='fileplan'          or
                               @text:style-name='index'             or
                               @text:style-name='dao'               or
                               @text:style-name='daogrp'            or
                               @text:style-name='descgrp'           or
                               @text:style-name='note'              or
                               @text:style-name='prefercite'        or
                               @text:style-name='runner'            or
                               @text:style-name='bibliography'][1])" />

  <xsl:key
    name="contentchildren"
    match="*[@text:style-name = 'did'] |
           *[@text:style-name = 'bioghist'] |
           *[@text:style-name = 'scopecontent'] |
           *[@text:style-name = 'arrangement'] |
           *[@text:style-name = 'accessrestrict'] |
           *[@text:style-name = 'userestrict'] |
           *[@text:style-name = 'relatedmaterial'] |
           *[@text:style-name = 'separatedmaterial'] |
           *[@text:style-name = 'controlaccess'] |
           *[@text:style-name = 'odd'] |
           *[@text:style-name = 'originalsloc'] |
           *[@text:style-name = 'altformavail'] |
           *[@text:style-name = 'custodhist'] |
           *[@text:style-name = 'phystech'] |
           *[@text:style-name = 'acqinfo'] |
           *[@text:style-name = 'processinfo'] |
           *[@text:style-name = 'appraisal'] |
           *[@text:style-name = 'accruals'] |
           *[@text:style-name = 'otherfindaid'] |
           *[@text:style-name = 'fileplan'] |
           *[@text:style-name = 'index'] |
           *[@text:style-name = 'dao'] |
           *[@text:style-name = 'daogrp'] |
           *[@text:style-name = 'descgrp'] |
           *[@text:style-name = 'note'] |
           *[@text:style-name = 'prefercite'] |
           *[@text:style-name = 'runner'] |
           *[@text:style-name = 'bibliography']"

    use="generate-id(preceding-sibling::*[
                     @text:style-name='EAD Archival description' or
                     @text:style-name='EAD Content 1' or
                     @text:style-name='EAD Content 2' or
                     @text:style-name='EAD Content 3' or
                     @text:style-name='EAD Content 4' or
                     @text:style-name='EAD Content 5' or
                     @text:style-name='EAD Content 6' or
                     @text:style-name='EAD Content 7' or
                     @text:style-name='EAD Content 8' or
                     @text:style-name='EAD Content 9'][1])"/> 

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 1']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 2']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 3']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 4']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 3'
                                            or @text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 5']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 4'
                                            or @text:style-name='EAD Content 3'
                                            or @text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 6']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 5'
                                            or @text:style-name='EAD Content 4'
                                            or @text:style-name='EAD Content 3'
                                            or @text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 7']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 6'
                                            or @text:style-name='EAD Content 5'
                                            or @text:style-name='EAD Content 4'
                                            or @text:style-name='EAD Content 3'
                                            or @text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 8']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 7'
                                            or @text:style-name='EAD Content 6'
                                            or @text:style-name='EAD Content 5'
                                            or @text:style-name='EAD Content 4'
                                            or @text:style-name='EAD Content 3'
                                            or @text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key
    name="content"
    match="*[@text:style-name='EAD Content 9']"
    use="generate-id(preceding-sibling::*[@text:style-name='EAD Content 8'
                                            or @text:style-name='EAD Content 7'
                                            or @text:style-name='EAD Content 6'
                                            or @text:style-name='EAD Content 5'
                                            or @text:style-name='EAD Content 4'
                                            or @text:style-name='EAD Content 3'
                                            or @text:style-name='EAD Content 2'
                                            or @text:style-name='EAD Content 1'
                                            or @text:style-name='EAD Archival description'][1])"/>

  <xsl:key name="STYLES" match="style:style" use="@style:name"/>

  <xsl:output indent="yes"/>

  <xsl:strip-space elements="text:span"/>

  <xsl:variable name="document-title">
    <xsl:choose>
      <xsl:when test="/office:document/office:meta/dc:title">
        <xsl:value-of select="/office:document/office:meta/dc:title"/>
      </xsl:when>
      <xsl:when test="/office:document/office:body/text:p[@text:style-name='Title']">
        <xsl:value-of select="/office:document/office:body/text:p[@text:style-name='Title'][1]"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>Untitled Document</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  
  <xsl:template match="/office:document">
    <ead>
      <xsl:call-template name="eadheader"/>
      <xsl:apply-templates select="office:body"/>
    </ead>
  </xsl:template>

  
  <xsl:template match="text:section">
    <xsl:choose>
      <xsl:when test="@text:name='EADfrontmatter'">
        <frontmatter>
          <xsl:apply-templates/>
        </frontmatter>
      </xsl:when>
      <xsl:otherwise>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  
  <xsl:template match="text:variable-set|text:variable-get">
    <xsl:choose>
      <xsl:when test="contains(@text:name,'entitydecl')">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
        <xsl:value-of select="substring-after(@text:name,'entitydecl_')"/>
        <xsl:text disable-output-escaping="yes">;</xsl:text>
      </xsl:when>
    </xsl:choose>
  </xsl:template>

  
  <xsl:template match="text:p[@text:style-name='XMLComment']">
    <xsl:comment>
      <xsl:value-of select="."/>
    </xsl:comment>
  </xsl:template>

  <xsl:template name="contentchildren">
    <xsl:param name="elementname" select="@text:style-name"/>
    <xsl:element name="{$elementname}">
      <head><xsl:value-of select="."/></head>
      <xsl:variable name="this" select="generate-id()"/>
      <xsl:for-each select="key('containers',$this)">
	<xsl:apply-templates select="."/> 
      </xsl:for-each>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Archival description']">
    <archdesc>
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </archdesc>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 1']">
    <xsl:element name="c01">
    <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 2']">
    <xsl:element name="c02">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 3']">
    <xsl:element name="c03">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 4']">
    <xsl:element name="c04">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 5']">
    <xsl:element name="c05">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 6']">
    <xsl:element name="c06">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 7']">
    <xsl:element name="c07">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 8']">
    <xsl:element name="c08">
      <xsl:call-template name="make-content-section"/>
      <dsc>
	<xsl:apply-templates select="key('content', generate-id())"/>
      </dsc>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[@text:style-name ='EAD Content 9']">
    <xsl:element name="c09">
      <xsl:call-template name="make-content-section"/>
    </xsl:element>
  </xsl:template>

  <xsl:template name="make-content-section">
    <xsl:attribute name="level"><xsl:value-of
	select="normalize-space(substring-after(.,':'))"/></xsl:attribute> 
    <xsl:variable name="this" select="generate-id()"/>
    <xsl:variable name="mystyle" select="@text:style-name"/>
    <xsl:for-each select="key('contentchildren',$this)" >
      <xsl:call-template name="contentchildren"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="text:ordered-list">
    <list type="ordered">
      <xsl:apply-templates/>
    </list>
  </xsl:template>
  
  <xsl:template match="office:body">
    <xsl:apply-templates select="text:section"/>
    <xsl:apply-templates
      select="*[@text:style-name='EAD Archival description']"/>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='Document Title']">
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='Author']">
    <author><xsl:apply-templates/></author>
  </xsl:template>

  <xsl:template match="text:p[@text:style-name='lg']">
    <lg><xsl:apply-templates/></lg>
  </xsl:template>

  <xsl:template match="text:p[@text:style-name='Title']">
    <title>
      <xsl:apply-templates/>
    </title>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='Date']">
    <date>
      <xsl:apply-templates/>
    </date>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='signed']">
    <signed>
      <xsl:apply-templates/>
    </signed>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='Section Title']">
    <head>
      <xsl:apply-templates/>
    </head>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='Appendix Title']">
    <head>
      <xsl:apply-templates/>
    </head>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='VarList Item']">
    <xsl:if test="not(preceding-sibling::text:p[@text:style-name='VarList Item'])">
      <xsl:text disable-output-escaping="yes">&lt;item&gt;</xsl:text>
    </xsl:if>
    <xsl:apply-templates/>
    <xsl:if test="not(following-sibling::text:p[@text:style-name='VarList Item'])">
      <xsl:text disable-output-escaping="yes">&lt;/item&gt;</xsl:text>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='VarList Term']">
    <label>
      <xsl:apply-templates/>
    </label>
  </xsl:template>
  
  <xsl:template match="text:p[@text:style-name='Screen']">
    <Screen>
      <xsl:apply-templates/>
    </Screen>
  </xsl:template>

  <xsl:template match="text:p[@text:style-name='List Heading']">
    <label>
      <xsl:apply-templates/>
    </label>
  </xsl:template>

  <xsl:template match="text:p[@text:style-name='List Contents']">
    <item>
      <xsl:apply-templates/>
    </item>
  </xsl:template>

  <xsl:template match="text:p[@text:style-name='Output']">
    <Output>
      <xsl:apply-templates/>
    </Output>
  </xsl:template>
  
 
  <xsl:template match="office:annotation/text:p">
    <note>
      <remark>
        <xsl:apply-templates/>
      </remark>
    </note>
  </xsl:template>

  
  <xsl:template match="table:table">
    <xsl:if test="not(parent::office:body)">
      <table rend="frame" id="{@table:name}">
	<xsl:if test="following-sibling::text:p[@text:style-name='Table']">
	  <head>
	    <xsl:value-of select="following-sibling::text:p[@text:style-name='Table']"/>
	  </head>
	</xsl:if>
	<xsl:call-template name="generictable"/>
      </table>
    </xsl:if>
  </xsl:template>

  <xsl:template match="table:table[contains(table:table-rows/table:table-row/table:table-cell/text:p/text:bookmark-start/@text:name,'did')]">
    <xsl:for-each
      select="table:table-rows/table:table-row/table:table-cell[text:p/text:bookmark-start]">
      <xsl:apply-templates/>
    </xsl:for-each>
  </xsl:template>


  
  <xsl:template name="generictable">
    <xsl:variable name="cells" select="count(descendant::table:table-cell)"/>
    <xsl:variable name="rows">
      <xsl:value-of select="count(descendant::table:table-row) "/>
    </xsl:variable>
    <xsl:variable name="cols">
      <xsl:value-of select="$cells div $rows"/>
    </xsl:variable>
    <xsl:variable name="numcols">
      <xsl:choose>
        <xsl:when test="child::table:table-column/@table:number-columns-repeated">
          <xsl:value-of select="number(table:table-column/@table:number-columns-repeated+1)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$cols"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template name="colspec">
    <xsl:param name="left"/>
    <xsl:if test="number($left &lt; ( table:table-column/@table:number-columns-repeated +2)  )">
      <xsl:element name="colspec">
        <xsl:attribute name="colnum">
          <xsl:value-of select="$left"/>
        </xsl:attribute>
        <xsl:attribute name="colname">c
                    <xsl:value-of select="$left"/>
                </xsl:attribute>
      </xsl:element>
      <xsl:call-template name="colspec">
        <xsl:with-param name="left" select="$left+1"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="table:table-column">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="table:table-header-rows">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="table:table-header-rows/table:table-row">
    <row role="label">
      <xsl:apply-templates/>
    </row>
  </xsl:template>
  
  <xsl:template match="table:table/table:table-row">
    <row>
      <xsl:apply-templates/>
    </row>
  </xsl:template>
  
  <xsl:template match="table:table-cell">
    <cell>
      <xsl:if test="@table:number-columns-spanned &gt;'1'">
        <xsl:attribute name="cols">
          <xsl:value-of select="@table:number-columns-spanned"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates/>
    </cell>
  </xsl:template>

  <xsl:template
    match="text:p[contains(text:bookmark-start/@text:name,'did')]">
    <xsl:variable
      name="thiselem"
      select="substring-before(substring-after(text:bookmark-start/@text:name,'_'),'-')"/>
    <xsl:element name="{$thiselem}">
      <xsl:apply-templates mode="ignorebookmarks"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:bookmark-start|text:bookmark-end"
    mode="ignorebookmarks" />

  
  <xsl:template match="text:p">
    <xsl:choose>
      <xsl:when test="parent::text:list-item">
        <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="@text:style-name='Table'"/>
      <xsl:when test="normalize-space(.)=''"/>
      <xsl:when test="text:span[@text:style-name = 'XrefLabel']"/>
      <xsl:otherwise>
	<p>
	  <xsl:call-template name="id.attribute"/>
	  <xsl:apply-templates/>
	</p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="text:unordered-list">
    <xsl:choose>
      <xsl:when test="@text:style-name='Var List'">
        <list>
          <xsl:apply-templates/>
        </list>
      </xsl:when>
      <xsl:when test="@text:style-name='UnOrdered List'">
        <list type="unordered">
          <xsl:apply-templates/>
        </list>
      </xsl:when>
      <xsl:otherwise>
        <list type="unordered">
          <xsl:apply-templates/>
        </list>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="text:list-item">
    <xsl:choose>
      <xsl:when test="parent::text:unordered-list/@text:style-name='Var List'">
	<item>
	  <xsl:for-each select="text:p[@text:style-name='VarList Term']">
	    <xsl:apply-templates select="."/>
	  </xsl:for-each>
	</item>
      </xsl:when>
      <xsl:otherwise>
	<item>
	  <xsl:apply-templates/>
	</item>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="draw:plugin">
    <xptr url="{@xlink:href}"/>
  </xsl:template>
  
  <xsl:template match="text:footnote-citation"/>
  
  <xsl:template match="text:footnote">
    <note place="foot">
      <xsl:apply-templates/>
    </note>
  </xsl:template>
  
  <xsl:template match="text:footnote-body">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="text:endnote-citation"/>
  
  
  <xsl:template match="text:endnote">
    <note place="end">
      <xsl:apply-templates/>
    </note>
  </xsl:template>
  
  <xsl:template match="text:endnote-body">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="draw:text-box"/>
  
  <xsl:template match="draw:image">
    <xsl:choose>
      <xsl:when test="parent::text:p[@text:style-name='Mediaobject']">
        <figure rend="display" url="{@xlink:href}">
          <head>
            <xsl:value-of select="."/>
          </head>
        </figure>
      </xsl:when>
      <xsl:otherwise>
        <figure rend="inline" url="{@xlink:href}"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="text:p[@text:style-name='Bibliography entry']">
    <xsl:element name="bibref">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Bibliography title']">
    <xsl:element name="title">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Genre or form']">
    <xsl:element name="genreform">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Geographical name']">
    <xsl:element name="geogname">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Occupation']">
    <xsl:element name="occupation">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Personal name']">
    <xsl:element name="persname">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Corporate name']">
    <xsl:element name="corpname">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="text:span[@text:style-name='Subject heading']">
    <xsl:element name="subject">
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="text:span">
    <xsl:variable name="Style">
      <xsl:value-of select="@text:style-name"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$Style='Emphasis'">
        <emph>
          <xsl:apply-templates/>
        </emph>
      </xsl:when>
      <xsl:when test="$Style='Underline'">
        <hi rend="ul">
          <xsl:apply-templates/>
        </hi>
      </xsl:when>
      <xsl:when test="$Style='SmallCaps'">
        <hi rend="sc">
          <xsl:apply-templates/>
        </hi>
      </xsl:when>
      <xsl:when test="$Style='Emphasis Bold'">
        <hi>
          <xsl:apply-templates/>
        </hi>
      </xsl:when>
      <xsl:when test="$Style='Highlight'">
        <hi>
          <xsl:apply-templates/>
        </hi>
      </xsl:when>
      <xsl:when test="$Style='q'">
        <q>
          <xsl:choose>
            <xsl:when test="starts-with(.,'&#x2018;')">
               <xsl:value-of 
		select="substring-before(substring-after(.,'&#x2018;'),'&#x2019;')"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:apply-templates/>
            </xsl:otherwise>
          </xsl:choose>
        </q>
      </xsl:when>
      <xsl:when test="$Style='date'">
        <date>
          <xsl:apply-templates/>
        </date>
      </xsl:when>
      <xsl:when test="$Style='l'">
        <l>
          <xsl:apply-templates/>
        </l>
      </xsl:when>
      <xsl:when test="$Style='Filespec'">
        <Filespec>
          <xsl:apply-templates/>
        </Filespec>
      </xsl:when>
      <xsl:when test="$Style='gi'">
        <gi>
          <xsl:apply-templates/>
        </gi>
      </xsl:when>
      <xsl:when test="$Style='Code'">
        <Code>
          <xsl:apply-templates/>
        </Code>
      </xsl:when>
      <xsl:when test="$Style='Input'">
        <Input>
          <xsl:apply-templates/>
        </Input>
      </xsl:when>
      <xsl:when test="$Style='Internet Link'">
          <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="$Style='SubScript'">
        <hi rend="sub">
          <xsl:apply-templates/>
        </hi>
      </xsl:when>
      <xsl:when test="$Style='SuperScript'">
        <hi rend="sup">
          <xsl:apply-templates/>
        </hi>
      </xsl:when>
      <xsl:when test="../text:h">
         <xsl:apply-templates/>
      </xsl:when>
      <xsl:when test="normalize-space(.)=''"/>
      <xsl:otherwise>
        <xsl:call-template name="styleLookup"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="styleLookup">
    <xsl:variable name="name">
      <xsl:value-of select="@text:style-name"/>
    </xsl:variable>
    <xsl:variable name="contents">
      <xsl:apply-templates/>
    </xsl:variable>
    <xsl:for-each select="key('STYLES',$name)">
      <xsl:choose>
	<xsl:when test="style:properties[@fo:font-weight='bold']">
	  <hi><xsl:copy-of select="$contents"/></hi>
	</xsl:when>
	<xsl:when test="style:properties[@fo:font-style='italic']">
	  <emph><xsl:copy-of select="$contents"/></emph>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:copy-of select="$contents"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="text:a">
    <xsl:choose>
      <xsl:when test="contains(@xlink:href,'://')">
        <xsl:choose>
          <xsl:when test=".=@xlink:href">
            <xptr url="{@xlink:href}"/>
          </xsl:when>
          <xsl:otherwise>
            <xref url="{@xlink:href}">
             <xsl:apply-templates/>
            </xref>        
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="not(contains(@xlink:href,'#'))">
        <xref url="{@xlink:href}">
          <xsl:apply-templates/>
        </xref>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="linkvar" 
          select="substring-after(@xlink:href,'#')"/>
        <xsl:choose>
          <xsl:when test=".=$linkvar">
            <ptr target="{$linkvar}"/>
          </xsl:when>
          <xsl:otherwise>
            <ref target="{$linkvar}">
              <xsl:apply-templates/>
            </ref>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template match="text:line-break">
    <xsl:if test="not(parent::text:span[@text:style-name='l'])">
      <lb/>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="text:tab-stop">
    <xsl:text disable-output-escaping="yes">	</xsl:text>
  </xsl:template>
  
  <xsl:template match="text:reference-ref">
    <ptr target="{@text:ref-name}"/>
  </xsl:template>
  
  <xsl:template name="id.attribute">
    <xsl:if test="child::text:reference-mark-start">
      <xsl:attribute name="id">
        <xsl:value-of select="child::text:reference-mark-start/@text:name"/>
      </xsl:attribute>
    </xsl:if>
<!-- Constraints imposed by OOo method of displaying 
reference-ref text means that xreflabel and endterm are lost -->
  </xsl:template>
  
  <xsl:template match="text:reference-mark-start"/>
  
  <xsl:template match="text:reference-mark-end"/>
  
  <xsl:template match="comment">
    <xsl:comment>
      <xsl:value-of select="."/>
    </xsl:comment>
  </xsl:template>
  
  <xsl:template match="text:alphabetical-index-mark-start">
    <xsl:element name="indexterm">
      <xsl:attribute name="class">
        <xsl:text disable-output-escaping="yes">startofrange</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="id">
        <xsl:value-of select="@text:id"/>
      </xsl:attribute>
<!--<xsl:if test="@text:key1">-->
      <xsl:element name="primary">
        <xsl:value-of select="@text:key1"/>
      </xsl:element>
<!--</xsl:if>-->
      <xsl:if test="@text:key2">
        <xsl:element name="secondary">
          <xsl:value-of select="@text:key2"/>
        </xsl:element>
      </xsl:if>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="text:alphabetical-index-mark-end">
    <xsl:element name="indexterm">
      <xsl:attribute name="startref">
        <xsl:value-of select="@text:id"/>
      </xsl:attribute>
      <xsl:attribute name="class">
        <xsl:text disable-output-escaping="yes">endofrange</xsl:text>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="text:alphabetical-index">
    <xsl:element name="index">
      <xsl:element name="title">
        <xsl:value-of select="text:index-body/text:index-title/text:p"/>
      </xsl:element>
      <xsl:apply-templates select="text:index-body"/>
    </xsl:element>
  </xsl:template>
  
  <xsl:template match="text:index-body">
    <xsl:for-each select="text:p[@text:style-name = 'Index 1']">
      <xsl:element name="indexentry">
        <xsl:element name="primaryie">
          <xsl:value-of select="."/>
        </xsl:element>
        <xsl:if test="key('secondary_children', generate-id())">
          <xsl:element name="secondaryie">
            <xsl:value-of select="key('secondary_children', generate-id())"/>
          </xsl:element>
        </xsl:if>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>

<!--
These seem to have no obvious translation
-->
  
<xsl:template match="text:bookmark-start"/>

<xsl:template match="text:bookmark-end"/>
  
<xsl:template match="text:bookmark"/>
  
<xsl:template match="text:endnotes-configuration"/>
  
<xsl:template match="text:file-name"/>
  
<xsl:template match="text:footnotes-configuration"/>
  
<xsl:template match="text:linenumbering-configuration"/>
  
<xsl:template match="text:list-level-style-bullet"/>
  
<xsl:template match="text:list-level-style-number"/>
  
<xsl:template match="text:list-style"/>
  
<xsl:template match="text:outline-level-style"/>
  
<xsl:template match="text:outline-style"/>
  
<xsl:template match="text:s"/>

  
<xsl:template match="text:*">
      [[[UNTRANSLATED <xsl:value-of select="name(.)"/>
    <xsl:apply-templates/>]]]
</xsl:template>

<xsl:template name="eadheader">

<!--          <xsl:apply-templates -->
<!--          select="text:section[@text:name='EADheader']"/> -->

    <eadheader
      langencoding="iso639-2b"
      findaidstatus="edited"
      audience="external"
      dateencoding="iso8601"
      scriptencoding="iso15924"
      countryencoding="iso3166-1"
      repositoryencoding="iso15511">

      <eadid
	identifier="SLA-0009"
	countrycode="ch"
	mainagencycode="CH-000015-0">hesseb2</eadid>

      <filedesc>
         <titlestmt>
            <titleproper>...:</titleproper>
            <subtitle>...</subtitle>

            <author>...</author>
         </titlestmt>
         <publicationstmt>
            <publisher>...</publisher>
            <address>
               <addressline>...</addressline>
               <addressline>...</addressline>

            </address>
            <p>...: 
		  <ref href="mailto:..." linktype="simple">...</ref>
            </p>
            <date calendar="gregorian" era="ce">...</date>
         </publicationstmt>
      </filedesc>
      <profiledesc>

         <creation>... 
		<date normal="..." calendar="gregorian" era="ce">...</date>
         </creation>
         <langusage>
            <language>...</language>
         </langusage>
      </profiledesc>
   </eadheader>
<!--
    <eadheader>
      <fileDesc>
        <titleStmt>
          <title>
            <xsl:value-of select="$document-title"/>
          </title>
          <author>
<xsl:value-of select="/office:document/office:meta/meta:initial-creator"/>
          </author>
        </titleStmt>
        <editionStmt>
          <edition>
            <date>
<xsl:value-of select="/office:document/office:meta/meta:creation-date"/>
            </date>
          </edition>
        </editionStmt>
        <publicationStmt>
          <authority></authority>
          <address>
            <email></email>
          </address>
        </publicationStmt>
        <sourceDesc>
          <p><xsl:apply-templates select="/office:document/office:meta/meta:generator"/>Written by OpenOffice</p>
        </sourceDesc>
      </fileDesc>
      <profileDesc>
         <langUsage default="NO">
            <language id="{/office:document/office:meta/dc:language}">ISO <xsl:value-of select="/office:document/office:meta/dc:language"/></language>
         </langUsage>
      <xsl:if test="/office:document/office:meta/meta:keywords">
        <textClass>
          <keywords>
            <list>
              <xsl:for-each select="/office:document/office:meta/meta:keywords/meta:keyword">
                <item>
                  <xsl:value-of select="."/>
                </item>
              </xsl:for-each>
            </list>
          </keywords>
        </textClass>
    </xsl:if>
      </profileDesc>
      <revisionDesc>
        <change>
          <date> <xsl:apply-templates select="/office:document/office:meta/dc:date"/></date>
          <respStmt>
            <name> <xsl:apply-templates select="/office:document/office:meta/dc:creator"/></name>
          </respStmt>
          <item>revision</item>
        </change>
      </revisionDesc>
    </eadheader>
    -->

  </xsl:template>


  <!-- sections of the OO format we don't need at present -->
  
  <xsl:template match="office:automatic-styles"/>
  
  <xsl:template match="office:font-decls"/>
  
  <xsl:template match="office:meta"/>
  
  <xsl:template match="office:script"/>
  
  <xsl:template match="office:settings"/>
  
  <xsl:template match="office:styles"/>
  
  <xsl:template match="style:*"/>

  
  <xsl:template match="dc:*">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="meta:creation-date">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="meta:editing-cycles"/>
  
  <xsl:template match="meta:editing-duration"/>
  
  <xsl:template match="meta:generator"/>
  
  <xsl:template match="meta:user-defined"/>

  <!--
  <xsl:template match="text()">
     <xsl:apply-templates select="normalize-space(.)"/>
  </xsl:template>
  -->


  <xsl:template match="text:bibliography-mark">
    <citation>
      <biblioref linkend="{@text:identifier}"/>
    </citation>
  </xsl:template>

  <xsl:template match="text:bibliography-mark" mode="bibliography">
    <!-- fix code as necessary; idea is you run the template in a mode
    specific to each attribute you want to transform -->
    <biblioentry id="{@text:identifier}">
      <xsl:apply-templates select="." mode="title"/>
      <xsl:apply-templates select="." mode="authors"/>
    </biblioentry>
  </xsl:template>

  <xsl:template match="text:bibliography-mark" mode="title">
    <title>
      <xsl:value-of select="@text:title"/>
    </title>
  </xsl:template>

  <xsl:template match="text:bibliography-mark" mode="authors">
    <!-- tokenize the author list on the semi-colon, then split the name on
    the comma -->
    <xsl:for-each select="str:tokenize(string(@text:author), ';')">
      <author>
	<firstname>
	  <xsl:value-of select="normalize-space(substring-after(., ','))"/>
	</firstname>
	<surname>
	  <xsl:value-of select="normalize-space(substring-before(., ','))"/>
	</surname>
      </author>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>
