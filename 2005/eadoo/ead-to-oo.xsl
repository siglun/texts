<?xml version="1.0" encoding="UTF-8"?>
<!--
 #  The Contents of this file are made available subject to the terms of
 # the GNU Lesser General Public License Version 2.1

 # Author: Sigfrid Lundberg sigfrid.lundberg@lub.lu.se
 # Last modified $Date$ by $Author$
 # $Id$

 # This stylesheet is derived from both OpenOffice to Docbook and from 
 # Sebastian Rahtz TEI to OO conversion

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
 #
-->

<!--

General architecture of EAD:
============================

ead may contain
  eadheader, frontmatter, archdesc

eadheader
  eadid, filedesc, profiledesc, revisiondesc

We dont support frontmatter

archdesc may contain
  accessrestrict, accruals, acqinfo, altformavail, appraisal,
  arrangement, bibliography, bioghist, controlaccess, custodhist,
  dao, daogrp, descgrp, did, dsc, fileplan, index, note, odd,
  originalsloc, otherfindaid, phystech, prefercite, processinfo,
  relatedmaterial, runner, scopecontent, separatedmaterial, userestrict

c01 through c10 (well, c12 to be honest) may contain
  accessrestrict, accruals, acqinfo, altformavail, appraisal, arrangement,
  bibliography, bioghist, controlaccess, custodhist,
  dao, daogrp, descgrp, did, dsc, fileplan, head, index, note, odd,
  originalsloc, otherfindaid, phystech, prefercite, processinfo,
  relatedmaterial, scopecontent, separatedmaterial, thead, userestrict

ci may obviously also contain ci+1 (eg c01 may contain c02)

dsc may contain
  address, blockquote, c, c01, chronlist, dsc,
  head, list, note, p, table, thead

did may contain
  abstract, container, dao, daogrp, head, langmaterial, materialspec,
  note, origination, physdesc, physloc, repository, unitdate,
  unitid, unittitle



-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
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
  version="1.0"
  office:class="text" office:version="1.0"> 

  <xsl:output method="xml"
    encoding="utf-8"
    indent="yes"
    omit-xml-declaration="no"
    />  
<!--    doctype-public="-//OpenOffice.org//DTD OfficeDocument1.0//EN"
    doctype-system="file:/usr/local/OpenOffice.org1.1.4/share/dtd/officedocument/1_0/office.dtd" -->

  
  <xsl:key name='IDS' match="*[@id]" use="@id"/>

  <xsl:param name="table_lables"
    select="document('table-lables.xml')" />

  <xsl:include href="did_and_c_and_archdesc.xsl"/>
  
  <xsl:template match="/">
    <xsl:element name="office:document">
      <xsl:attribute name="office:class">text</xsl:attribute>
      <office:meta>
        <meta:generator>Open Office EAD to OO XSLT $Revision$</meta:generator>
        <dc:title>
          <xsl:value-of
	    select="/ead/eadheader/filedesc/titlestmt/titleproper"/>
	  <xsl:if test="eadheader/filedesc/titlestmt/subtitle"><xsl:text>:
	    </xsl:text><xsl:value-of
	      select="/ead/eadheader/filedesc/titlestmt/subtitle"/>
	  </xsl:if>
        </dc:title>
        <dc:description/>
        <dc:subject/>
        <meta:creation-date>
	  <xsl:value-of
	    select="/ead/eadheader/profiledesc/creation/date/@normal"/>
        </meta:creation-date>
        <dc:date>
          <xsl:value-of
	    select="/ead/eadheader/filedesc/publicationstmt/date"/>
        </dc:date>
        <dc:language><xsl:value-of
	    select="/ead/eadheader/profiledesc/langusage/language/@langcode"/>
	</dc:language>
        <meta:editing-cycles>21</meta:editing-cycles>
        <meta:editing-duration>P1DT0H11M54S</meta:editing-duration>
        <meta:user-defined meta:name="Info 1"/>
        <meta:user-defined meta:name="Info 2"/>
        <meta:user-defined meta:name="Info 3"/>
        <meta:user-defined meta:name="Info 4"/>
        <meta:document-statistic meta:table-count="1" meta:image-count="0"
	  meta:object-count="0" meta:page-count="1" meta:paragraph-count="42"
	  meta:word-count="144" meta:character-count="820"/>
      </office:meta>

      <office:automatic-styles>
	<style:style style:name="fr1" style:family="graphics"
	  style:parent-style-name="Graphics"> 
	  <style:properties
	    style:horizontal-pos="center"
	    style:horizontal-rel="paragraph"
	    style:mirror="none"
	    fo:clip="rect(0cm 0cm 0cm 0cm)"
	    draw:luminance="0%"
	    draw:contrast="0%"
	    draw:red="0%"
	    draw:green="0%"
	    draw:blue="0%"
	    draw:gamma="1"
	    draw:color-inversion="false"
	    draw:transparency="-100%"
	    draw:color-mode="standard"/> 
	</style:style>
	<style:style style:name="Table1" style:family="table">
	  <style:properties style:width="14.649cm" table:align="margins"/>
	</style:style>
	<style:style style:name="Table1.A" style:family="table-column">
	  <style:properties style:column-width="2.93cm"
	    style:rel-column-width="13107*"/> 
	</style:style>
	<style:style style:name="Table1.A1" style:family="table-cell">
	  <style:properties
	    fo:padding="0.097cm"
	    fo:border-left="0.002cm solid #000000"
	    fo:border-right="none"
	    fo:border-top="0.002cm solid #000000"
	    fo:border-bottom="0.002cm solid #000000"/> 
	</style:style>
	<style:style
	  style:name="Table1.E1"
	  style:family="table-cell">
	  <style:properties fo:padding="0.097cm"
	    fo:border="0.002cm solid #000000"/>
	</style:style>
	<style:style style:name="Table1.A2" style:family="table-cell">
	  <style:properties fo:padding="0.097cm" fo:border-left="0.002cm solid
	    #000000" fo:border-right="none" fo:border-top="none"
	    fo:border-bottom="0.002cm solid #000000"/> 
	</style:style>
	<style:style style:name="Table1.E2" style:family="table-cell">
	  <style:properties fo:padding="0.097cm" fo:border-left="0.002cm solid
	    #000000" fo:border-right="0.002cm solid #000000"
	    fo:border-top="none" fo:border-bottom="0.002cm solid #000000"/> 
	</style:style>
	<style:style style:name="P1" style:family="paragraph"
	  style:parent-style-name="Text body"
	  style:list-style-name="Ordered List"/> 
	<style:style style:name="T1" style:family="text"
	  style:parent-style-name="Source Text"> 
	  <style:properties fo:font-style="normal"/>
	</style:style>
	<style:page-master style:name="pm1">
	  <style:properties fo:page-width="20.999cm" fo:page-height="29.699cm"
	    style:num-format="1" style:print-orientation="portrait"
	    fo:margin-top="2.54cm" fo:margin-bottom="2.54cm"
	    fo:margin-left="3.175cm" fo:margin-right="3.175cm"
	    style:writing-mode="lr-tb" style:footnote-max-height="0cm"> 
	    <style:footnote-sep style:width="0.018cm"
	      style:distance-before-sep="0.101cm"
	      style:distance-after-sep="0.101cm" style:adjustment="left"
	      style:rel-width="25%" style:color="#000000"/> 
	  </style:properties>
	  <style:header-style/>
	  <style:footer-style/>
	</style:page-master>
      </office:automatic-styles>

      <office:body>
	<xsl:call-template name="entities"/>
        <xsl:apply-templates select="/ead"/>
      </office:body>

    </xsl:element>
  </xsl:template>
  


  <xsl:template name="entities">
    <text:variable-decls>
      <xsl:for-each select="/descendant::entity">
        <xsl:variable name="entname">
          <xsl:value-of select="@name"/>
        </xsl:variable>
        <xsl:if test="not(preceding::entity[@name = $entname])">
          <text:variable-decl>
            <xsl:attribute name="text:value-type">
              <xsl:text>string</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="text:name">
              <xsl:text>entitydecl_</xsl:text>
              <xsl:value-of select="@name"/>
            </xsl:attribute>
          </text:variable-decl>
        </xsl:if>
      </xsl:for-each>
    </text:variable-decls>
  </xsl:template>

  <xsl:template match="entity">
    <xsl:variable name="entname">
      <xsl:value-of select="@name"/>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="not(preceding::entity[@name = $entname])">
        <text:variable-set>
          <xsl:attribute name="text:value-type">
            <xsl:text>string</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="text:name">
            <xsl:text>entitydecl_</xsl:text>
            <xsl:value-of select="@name"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </text:variable-set>
      </xsl:when>
      <xsl:otherwise>
        <text:variable-get>
          <xsl:attribute name="text:value-type">
            <xsl:text>string</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="text:name">
            <xsl:text>entitydecl_</xsl:text>
            <xsl:value-of select="@name"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </text:variable-get>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

<!-- table start -->
  

  <xsl:template match="table">
    <xsl:call-template name="startHook"/>
    <xsl:variable name="tablenum">
      <xsl:choose>
        <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
        <xsl:otherwise>table<xsl:number level="any"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <table:table 
      table:name="{$tablenum}"
      table:style-name="Table1">
      <table:table-column 
	table:style-name="Table1.col1">
	<xsl:attribute name="table:number-columns-repeated">
	  <xsl:value-of select="count(row[1]/cell)"/>
	</xsl:attribute>
      </table:table-column>
      <xsl:apply-templates/>
    </table:table>
    <xsl:if test="head">
      <text:p text:style-name="Table">
         <xsl:apply-templates select="head" mode="show"/>
      </text:p>
    </xsl:if>
  <xsl:call-template name="endHook"/>
</xsl:template>
  

  <xsl:template match="row[@role='label']">
    <table:table-header-rows>
      <table:table-row>
	<xsl:apply-templates/>
      </table:table-row>
    </table:table-header-rows>
  </xsl:template>
  

  <xsl:template match="row">
    <table:table-row>
      <xsl:apply-templates/>
    </table:table-row>
  </xsl:template>
  

  <xsl:template match="cell">
    <table:table-cell>
      <xsl:choose>
	<xsl:when test="parent::row[@role='label']">
	  <xsl:attribute
	    name="text:style-name">Table1.cellheading</xsl:attribute> 
	</xsl:when>
	<xsl:when test="@role='label'">
	  <xsl:attribute
	    name="text:style-name">Table1.cellheading</xsl:attribute> 
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute
	    name="text:style-name">Table1.cellcontents</xsl:attribute> 
           </xsl:otherwise>
         </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(child::p)">
       <text:p>
         <xsl:choose>
           <xsl:when test="parent::row[@role='label']">
            <xsl:attribute name="text:style-name">Table Heading</xsl:attribute>
           </xsl:when>
           <xsl:when test="@role='label'">
            <xsl:attribute name="text:style-name">Table Heading</xsl:attribute>
           </xsl:when>
           <xsl:otherwise>
            <xsl:attribute
		  name="text:style-name">Table Contents</xsl:attribute> 
	      </xsl:otherwise>
	    </xsl:choose>
	    <xsl:apply-templates/>
	  </text:p>
	</xsl:when>
	<xsl:otherwise>
         <xsl:apply-templates/>
	</xsl:otherwise>
      </xsl:choose>
    </table:table-cell>
  </xsl:template>

  <xsl:template match="eadheader">
    <xsl:element name="text:section">
      <xsl:attribute name="text:style-name">EADheader</xsl:attribute>
      <xsl:attribute name="text:name">EADheader</xsl:attribute>

      <xsl:variable name="toptitle">
	<xsl:apply-templates select="filedesc/titlestmt/titleproper"/><xsl:text>
	</xsl:text><xsl:apply-templates
	  select="filedesc/titlestmt/subtitle"/></xsl:variable>

      <xsl:call-template name="create-oostyle-header">
	<xsl:with-param name="lvl" select="1"/>
	<xsl:with-param name="head" select="$toptitle"/>
      </xsl:call-template>

      <xsl:call-template name="create-oostyle-header">
	<xsl:with-param name="lvl" select="2"/>
	<xsl:with-param name="head" select="'Header information'"/>
      </xsl:call-template>

      <table:table 
	table:name="EadHeader"
	table:style-name="Table 1">
	<table:table-column 
	  table:style-name="Table1.col1"
	  table:number-columns-repeated="2"/>

	<table:table-rows>
	<table:table-row>
	  <table:table-cell>
	    <text:p>
	      <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='titleproper']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates select="filedesc/titlestmt/titleproper"/>
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='subtitle']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates select="filedesc/titlestmt/subtitle"/>
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='author']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	      <xsl:apply-templates select="filedesc/titlestmt/author"/>
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='publisher']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates select="filedesc/publicationstmt/publisher"/>
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='address']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates
	      select="filedesc/publicationstmt/address/addressline"/> 
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='date-published']/string"/>
	    </text:p>
	    </table:table-cell>
	    <table:table-cell>
	      <text:p>
		<xsl:apply-templates select="filedesc/publicationstmt/date"/>
	      </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='identifier']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates select="eadid" />
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='indentifier-code']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates select="eadid/@identifier"/>
	    </text:p>
	  </table:table-cell>
	</table:table-row>

	<table:table-row>
	  <table:table-cell>
	    <text:p>
	    <xsl:value-of
	      select="$table_lables/headings-list/headings[@table='eadheader']/heading[@name='langcode']/string"/>
	    </text:p>
	  </table:table-cell>
	  <table:table-cell>
	    <text:p>
	    <xsl:apply-templates
	      select="profiledesc/langusage/language/@langcode"/>
	    </text:p>
	  </table:table-cell>
	</table:table-row>
	</table:table-rows>
      </table:table>
    </xsl:element>
  </xsl:template>

  <xsl:template match="frontmatter">
    <xsl:element name="text:section">
      <xsl:attribute name="text:style-name">EADfrontmatter</xsl:attribute>
      <xsl:attribute name="text:name">EADfrontmatter</xsl:attribute>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="archdesc">
    <xsl:element name="text:h">
      <xsl:attribute
	name="text:style-name">EAD Archival description</xsl:attribute>
      <xsl:attribute name="text:level">1</xsl:attribute>
      <xsl:text>archdesc: </xsl:text><xsl:value-of select="@level"/>
    </xsl:element>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="head">
    <xsl:choose>
      <xsl:when test="parent::accessrestrict" />
      <xsl:when test="parent::accruals" />
      <xsl:when test="parent::acqinfo" />
      <xsl:when test="parent::altformavailable" />
      <xsl:when test="parent::appraisal" />
      <xsl:when test="parent::arrangement" />
      <xsl:when test="parent::bibliography" />
      <xsl:when test="parent::bioghist" />
      <xsl:when test="parent::controlaccess" />
      <xsl:when test="parent::custodhist" />
      <xsl:when test="parent::did" />
      <xsl:when test="parent::dsc" />
      <xsl:when test="parent::fileplan" />
      <xsl:when test="parent::index" />
      <xsl:when test="parent::odd" />
      <xsl:when test="parent::originalsloc" />
      <xsl:when test="parent::otherfindaid" />
      <xsl:when test="parent::phystech" />
      <xsl:when test="parent::prefercite" />
      <xsl:when test="parent::processinfo" />
      <xsl:when test="parent::scopecontent" />
      <xsl:when test="parent::list" />
      <xsl:when test="parent::userestrict" />
    </xsl:choose>
  </xsl:template>

  <xsl:template match="author">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="p">
    <text:p>
      <xsl:choose>
	<xsl:when test="ancestor::varlistentry">
          <xsl:attribute name="text:style-name">VarList Term</xsl:attribute>
	</xsl:when>
	<xsl:when test="ancestor::footnote">
          <xsl:attribute name="text:style-name">
	    <xsl:text>Footnote</xsl:text>
          </xsl:attribute>
	</xsl:when>
	<xsl:when test="ancestor::row[@role='label']">
	  <xsl:attribute name="text:style-name">Table Heading</xsl:attribute>
	</xsl:when>
	<xsl:when test="ancestor::row">
	  <xsl:attribute name="text:style-name">Table Contents</xsl:attribute>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:attribute name="text:style-name">Text body</xsl:attribute>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="test.id"/>
      <xsl:apply-templates/>
    </text:p>
  </xsl:template>
  
  <xsl:template match="controlaccess">
    <xsl:for-each select="famname |
      genreform |
      geogname |
      occupation |
      persname |
      subject |
      table |
      title">
      <xsl:element name="text:p">
	<xsl:value-of select="name(.)"/><xsl:text>: </xsl:text>
	<xsl:element name="text:bookmark">
	  <xsl:attribute name="text:name">
	    <xsl:value-of select="concat(name(.),'_',generate-id())"/>
	  </xsl:attribute>
	</xsl:element>
	<xsl:apply-templates/>
      </xsl:element>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="create-header">
    <xsl:param name="lvl"/>
    <xsl:param name="head"/>
    <xsl:variable name="level">
      <xsl:choose>
	<xsl:when test="name(..) = 'archdesc'">2</xsl:when>
	<xsl:when test="contains(name(..),'c0')"><xsl:value-of
	    select="number(substring-after(name(..),'c0'))+1"/></xsl:when> 
	<xsl:otherwise><xsl:value-of select="$lvl"></xsl:value-of></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <text:h>
      <xsl:attribute name="text:style-name">
        <xsl:value-of select="name(.)"/>
      </xsl:attribute>
      <xsl:attribute name="text:level">
        <xsl:value-of select="$level"/>
      </xsl:attribute>
      <xsl:call-template name="test.id"/>
      <xsl:choose>
	<xsl:when test="head">
	  <xsl:apply-templates select="head" mode="show"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$head"/>
	</xsl:otherwise>
      </xsl:choose>
    </text:h>
  </xsl:template>

  <xsl:template name="create-content-header">
    <xsl:param name="lvl"/>
    <xsl:param name="head"/>
    <text:h>
      <xsl:attribute name="text:style-name">
        <xsl:value-of select="concat('EAD Content ',substring-after(name(.),'c0'))"/>
      </xsl:attribute>
      <xsl:attribute name="text:level">
        <xsl:value-of select="substring-after(name(.),'c0')"/>
      </xsl:attribute>
      <xsl:call-template name="test.id"/>
      <xsl:value-of select="name(.)"/><xsl:text>: </xsl:text>
      <xsl:choose>
	<xsl:when test="@level"><xsl:value-of select="@level"/></xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$head"/>
	</xsl:otherwise>
      </xsl:choose>
    </text:h>
  </xsl:template>


<xsl:template name="create-oostyle-header">
    <xsl:param name="lvl"/>
    <xsl:param name="head"/>
    <text:h>
      <xsl:attribute name="text:style-name">Heading</xsl:attribute>
      <xsl:call-template name="test.id"/>
      <xsl:choose>
	<xsl:when test="head">
	  <xsl:apply-templates select="head" mode="show"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="$head"/>
	</xsl:otherwise>
      </xsl:choose>
    </text:h>
  </xsl:template>

  <xsl:template match="dsc">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="bibref">
    <text:p text:style-name="Bibliography entry">
      <xsl:apply-templates/>
    </text:p>
  </xsl:template>

  <xsl:template match="bibref/title">
    <text:span text:style-name="Bibliography title">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="bibref/imprint">
    <xsl:for-each select="date|geogname|publisher|node()">
      <xsl:variable name="mystyle">
	<xsl:choose>
	  <xsl:when test="name(.)='date'">Date</xsl:when>
	  <xsl:when test="name(.)='geogname'">Geographical name</xsl:when>
	  <xsl:when test="name(.)='publisher'">Publisher</xsl:when>
	  <xsl:otherwise></xsl:otherwise>
	</xsl:choose>
      </xsl:variable>
      <xsl:choose>
	<xsl:when test="$mystyle != ''">
	  <xsl:element name="text:span">
	    <xsl:attribute name="text:style-name"><xsl:value-of
		select="$mystyle"/></xsl:attribute>
	    <xsl:apply-templates/>
	  </xsl:element>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:apply-templates/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </xsl:template>

  <!--
  <bibliography>
        <head>Bibliography</head>
        <p>Sources consulted by John Kobler.</p>
        <bibref><title render="italic">Affiches americaines</title>. San Domingo:
        Imprimerie royale du Cap, 1782. Nos. 30, 35.</bibref>
        <bibref>Ardouin, Charles Nicholas Celigny. <title render="italic">Essais sur
        l'histoire d'Haiti</title>. Port-au-Prince, 1865.</bibref>
        <bibref>Bastien, Remy. <title render="italic">Anthologie du folklore haitien</title>,
        <title render="doublequote"> Proverbes</title>. Mexico, 1946. pp.83-91.</bibref>
        <bibref>Bellegarde, Dantes. <title render="italic">Dessalines a parle</title>.
        Port-au-Prince, 1948. Chap. IV: pp. 47-54.</bibref> . . .
    </bibliography>
  -->

  <xsl:template match="list">
    <xsl:call-template name="startHook"/>
    <xsl:if test="head">
      <text:p><xsl:apply-templates select="head" mode="show"/></text:p>
    </xsl:if>
    <text:unordered-list text:style-name="Unordered List">
      <xsl:apply-templates/>
    </text:unordered-list>
  <xsl:call-template name="endHook"/>
  </xsl:template>
  

  <xsl:template match="list[@type='unordered']">
    <xsl:call-template name="startHook"/>
    <text:unordered-list text:style-name="Unordered List">
      <xsl:apply-templates/>
    </text:unordered-list>
    <xsl:call-template name="endHook"/>
  </xsl:template>
  

  <xsl:template match="list[@type='ordered']">
    <xsl:call-template name="startHook"/>
    <text:ordered-list text:style-name="Ordered List">
      <xsl:apply-templates/>
    </text:ordered-list>
    <xsl:call-template name="endHook"/>
  </xsl:template>
  
  <xsl:template match="list[@type='gloss']">
    <xsl:call-template name="startHook"/>
    <xsl:apply-templates/>
    <xsl:call-template name="endHook"/>
  </xsl:template>
  
  <xsl:template match="list[@type='gloss']/item">
    <text:p text:style-name="List Contents">
      <xsl:apply-templates/>
    </text:p>
  </xsl:template>

  <xsl:template match="list[@type='gloss']/label">
    <text:p text:style-name="List Heading">
      <xsl:apply-templates/>
    </text:p>
  </xsl:template>

  <xsl:template name="startHook">
    <xsl:if test="parent::p">
      <xsl:text disable-output-escaping="yes">&lt;/text:p&gt;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template name="endHook">
    <xsl:if test="parent::p">
      <xsl:text disable-output-escaping="yes">&lt;text:p&gt;</xsl:text>
    </xsl:if>
  </xsl:template>

  <xsl:template match="item/p">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="item">
    <text:list-item>
      <xsl:choose>
	<xsl:when test="list">
	  <xsl:apply-templates/>              
	</xsl:when>
	<xsl:otherwise>
          <text:p>
            <xsl:apply-templates/>
          </text:p>
	</xsl:otherwise>
      </xsl:choose>
    </text:list-item>
  </xsl:template>
  
  <xsl:template match="emph">
    <text:span text:style-name="Emphasis">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="q">
    <text:span text:style-name="q">
      <xsl:text>&#x2018;</xsl:text>
      <xsl:apply-templates/>
      <xsl:text>&#x2019;</xsl:text>
    </text:span>
  </xsl:template>

  <xsl:template match="note[@place='foot']">
    <text:footnote-citation>
      <xsl:number level="any" count="note[@place='foot']"/>
    </text:footnote-citation>
    <text:footnote>
      <text:footnote-body>
        <text:p text:style-name="Footnote">
          <xsl:apply-templates/>
        </text:p>
      </text:footnote-body>
   </text:footnote>
  </xsl:template>
  
  <xsl:template match="note[@place='end']">
    <text:endnote-citation>
      <xsl:number format="i" level="any" count="note[@place='end']"/>
    </text:endnote-citation>
    <text:endnote>
      <text:endnote-body>
        <text:p text:style-name="Endnote">
          <xsl:apply-templates/>
        </text:p>
      </text:endnote-body>
   </text:endnote>
  </xsl:template>
  

  <xsl:template match="xref">
    <text:a>
      <xsl:attribute name="xlink:type">
        <xsl:text>simple</xsl:text>
      </xsl:attribute>
      <xsl:attribute name="xlink:href">
        <xsl:value-of select="@url"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </text:a>
  </xsl:template>
  

  <xsl:template match="ref">
    <text:a xlink:type="simple" xlink:href="#{@target}">
      <xsl:apply-templates/>
    </text:a>
  </xsl:template>
  
  <xsl:template match="ptr">
    <text:a xlink:type="simple" xlink:href="#{@target}">
      <xsl:for-each select="key('IDS',@target)">
	<xsl:apply-templates select="." mode="crossref"/>
      </xsl:for-each>
    </text:a>
  </xsl:template>
  
  <xsl:template match="table|figure|item" mode="crossref">
    <xsl:number level="any"/>
  </xsl:template>

  <xsl:template match="xref">
    <text:a xlink:type="simple" xlink:href="{@url}">
      <xsl:apply-templates/>
    </text:a>
  </xsl:template>
  
  <xsl:template match="xptr">
    <text:a xlink:type="simple" xlink:href="{@url}">
      <xsl:value-of select="@url"/>
    </text:a>
  </xsl:template>
  

  <xsl:template name="test.id">
    <xsl:if test="@id">
      <text:bookmark text:name="{@id}"/>
    </xsl:if>
  </xsl:template>

  <xsl:template match="did/note">
    <xsl:apply-templates mode="ignore-p" />
  </xsl:template>

  <xsl:template mode="ignore-p" match="p">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="note">
    <text:p>
      <xsl:attribute name="text:style-name">note</xsl:attribute>
      <xsl:apply-templates mode="ignore-p"/>
    </text:p>
  </xsl:template>
 
  <xsl:template match="hi">
    <text:span>
      <xsl:attribute name="text:style-name">
	<xsl:choose>
    <xsl:when test="@rend='sup'">
        <xsl:text>SuperScript</xsl:text>
    </xsl:when>
    <xsl:when test="@rend='sub'">
        <xsl:text>SubScript</xsl:text>
    </xsl:when>
    <xsl:when test="@rend='bold'">
        <xsl:text>Highlight</xsl:text>
    </xsl:when>
    <xsl:when test="@rend='it'">
        <xsl:text>Emphasis</xsl:text>
    </xsl:when>
    <xsl:when test="@rend='i'">
        <xsl:text>Emphasis</xsl:text>
    </xsl:when>
    <xsl:when test="@rend='ul'">
        <xsl:text>Underline</xsl:text>
    </xsl:when>
    <xsl:when test="@rend='sc'">
        <xsl:text>SmallCaps</xsl:text>
    </xsl:when>
    <xsl:otherwise>
        <xsl:text>Highlight</xsl:text>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:attribute>
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>
  
  <xsl:template match="date">
    <text:span text:style-name="Date">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="genreform">
    <text:span text:style-name="Genre or form">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="geogname">
    <text:span text:style-name="Geographical name">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>
  
  <xsl:template match="occupation">
    <text:span text:style-name="Occupation">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="persname">
    <text:span text:style-name="Personal Name">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="corpname">
    <text:span text:style-name="Corporate Name">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="subject">
    <text:span text:style-name="Subject heading">
      <xsl:apply-templates/>
    </text:span>
  </xsl:template>

  <xsl:template match="eg">
    <xsl:call-template name="startHook"/>
    <xsl:call-template name="Literal">
      <xsl:with-param name="Text">
	<xsl:value-of select="."/>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="endHook"/>
</xsl:template>

<!-- safest to drop comments entirely, I think -->
  <xsl:template match="comment()"/>

  <xsl:template match="head" mode="show">
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="lb">
    <text:line-break/>
  </xsl:template>

  <xsl:template name="checkunit">
    <xsl:param name="dim"/>
    <xsl:if test="contains($dim,'in')">
      <xsl:text>ch</xsl:text>
    </xsl:if>
  </xsl:template>

<!-- curiously, no apparent markup for a page break -->
  <xsl:template match="pb"/>

  <xsl:template match="lg|bibl|signed">
    <text:p text:style-name="{name(.)}">
      <xsl:apply-templates/>
    </text:p>
  </xsl:template>

  <xsl:template match="l">
    <text:span text:style-name="l">
      <xsl:apply-templates/>  
      <text:line-break/>
    </text:span>
  </xsl:template>

  <xsl:template name="Literal">
    <xsl:param name="Text"/>
    <xsl:choose>
      <xsl:when test="contains($Text,'&#10;')">
	<text:p text:style-name="Preformatted Text">      
	  <xsl:value-of select="substring-before($Text,'&#10;')"/>
	</text:p>
	<xsl:call-template name="Literal">
	  <xsl:with-param name="Text">
	    <xsl:value-of select="substring-after($Text,'&#10;')"/>
	  </xsl:with-param>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<text:p text:style-name="Preformatted Text">      
	  <xsl:value-of select="$Text"/>
	</text:p>
      </xsl:otherwise>
    </xsl:choose>
     <!-- text:s c="6" to ident 6 spaces -->
  </xsl:template>

<!--

  $Log$
  Revision 1.1  2009/06/29 11:09:05  sigfrid
  Initial revision

  Revision 1.4  2004/12/28 10:33:35  sigge
  Added support for bibliography. Added quite a few
  text:span/@style:name's for more detailed markup

  Revision 1.3  2004/12/10 16:41:40  sigge
  It starts to work, thanks to the external did_and_c_and_archdesc.xsl
  style sheet. That style sheet is created using
  generate-stylesheet.xsl, which reads table-lables.xml

  Revision 1.2  2004/12/07 12:07:28  sigge
  An awful lot of this is just plain rubbish.


-->

</xsl:stylesheet>
