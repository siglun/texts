<?xml version='1.0' encoding='iso-8859-1'?>
<!DOCTYPE xsl:stylesheet [] >

<!--

  $Id$

  Hit presentation in Ediffah Last modified $Date$
  by $Author$

-->

<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:z="http://www.indexdata.dk/zebra/"
  exclude-result-prefixes="z"
  version='1.0'
>


  <xsl:param name="present" />
  <xsl:param name="termlist" />


  <xsl:variable
    name="uri"
    select="'./search.php?start=1&amp;number=10&amp;'"/>

  <xsl:output
    method="xml" 
    omit-xml-declaration = "yes"
    media-type="text/html"
    encoding="UTF-8" 	
    standalone = "no"
    />

  <xsl:template match='/'>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match='ead'>
    <xsl:element name="p">

      <xsl:if test="./archdesc/did/unittitle">
	<strong>Titel:</strong><xsl:text> </xsl:text>
	<xsl:element name="a">
	  <xsl:attribute name="href">
	    <xsl:value-of
	      select="concat('./present.cgi?id=',
	      eadheader/eadid/@identifier,
	      '&amp;termlist=',$termlist)"/>
	  </xsl:attribute>
	  <xsl:attribute name="target">hitwindow</xsl:attribute>
	  <xsl:for-each select="./archdesc/did/unittitle">
	    <xsl:apply-templates select="."/>
	  </xsl:for-each>
	</xsl:element>
      </xsl:if>


      <xsl:if test="./archdesc/did/origination">
	<br />
	<strong>Arkivbildare:</strong><xsl:text> </xsl:text>
	<xsl:for-each select="./archdesc/did/origination/persname">
	  <!--xsl:element name="span">
	    <xsl:attribute name="style">font-variant:
	      small-caps</xsl:attribute>
	  </xsl:element-->
	  <xsl:apply-templates/>

	</xsl:for-each>
	<xsl:for-each select="./archdesc/did/origination/corpname">
	  <xsl:apply-templates/>
	</xsl:for-each>
	<xsl:for-each select="./archdesc/did/origination/famname">
	  <xsl:apply-templates/>
	</xsl:for-each>

      </xsl:if>

      <xsl:if test="./archdesc/did/repository">
	<br />
	<strong>Arkivinstitution:</strong><xsl:text> </xsl:text>
	<xsl:choose>
	  <xsl:when test="./archdesc/did/repository/corpname" >
	    <xsl:apply-templates select="./archdesc/did/repository/corpname"
	      /><xsl:if test="./archdesc/did/repository/address" >,
	      <xsl:apply-templates select="./archdesc/did/repository/address"
		/>
	    </xsl:if>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:apply-templates select="./archdesc/did/repository" />
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:if>

      <xsl:if test="./archdesc/did/abstract">
	<br />
	<strong>Beskrivning:</strong><xsl:text> </xsl:text>
	<xsl:for-each select="./archdesc/did/abstract">
	  <xsl:apply-templates/>
	</xsl:for-each>
      </xsl:if>

      <xsl:if test="./archdesc/did/physdesc">
	<br />
	<strong>Fysisk beskrivning och omfattning:</strong><xsl:text> </xsl:text>
	<xsl:for-each select="./archdesc/did/physdesc">
	  <xsl:apply-templates/>
	  <xsl:if test="dimensions/@unit">
	    <xsl:value-of select="dimensions/@unit"/>
	  </xsl:if>
	</xsl:for-each>
      </xsl:if>


      <xsl:if test="./archdesc/controlaccess">
	<br />
	<xsl:for-each select="archdesc/controlaccess/genreform">
	  <xsl:if test="position() = 1">
	    <strong>Typer av handlingar:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/occupation">
	  <xsl:if test="position() = 1">
	    <strong>Yrkesbeteckningar:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/persname">
	  <xsl:if test="position() = 1">
	    <strong>Personnamn:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/corpname">
	  <xsl:if test="position() = 1">
	    <strong>Organisationer:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/famname">
	  <xsl:if test="position() = 1">
	    <strong>Familjer:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/function">
	  <xsl:if test="position() = 1">
	    <strong>Funktioner:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/geogname">
	  <xsl:if test="position() = 1">
	    <strong>Geografiska namn:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/subject">
	  <xsl:if test="position() = 1">
	    <strong>Ämnesord:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>

	<xsl:for-each select="archdesc/controlaccess/title">
	  <xsl:if test="position() = 1">
	    <strong>Verk:</strong><xsl:text> </xsl:text>
	  </xsl:if>
	  <xsl:apply-templates select="."/>
	  <xsl:choose>
	    <xsl:when test="not(position() = last())">
	      <xsl:text>, </xsl:text>
	    </xsl:when>
	    <xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise>
	  </xsl:choose>
	  <xsl:text> </xsl:text>
	</xsl:for-each>


      </xsl:if>
    </xsl:element>
  </xsl:template>

  <xsl:template match="address">
    <xsl:choose>
      <xsl:when test="addressline">
	<xsl:for-each select="addressline">
	  <xsl:apply-templates/>
	  <xsl:choose>
	    <xsl:when test="position() = last()"><xsl:text>.
	      </xsl:text></xsl:when>
	    <xsl:otherwise><xsl:text>,
	      </xsl:text>
	    </xsl:otherwise>
	  </xsl:choose>
	</xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="controlaccess/genreform |
                       controlaccess/occupation|
                       controlaccess/persname  |
                       controlaccess/corpname  |
                       controlaccess/famname   |
                       controlaccess/function  |	
                       controlaccess/geogname  |
                       controlaccess/subject   |
                       controlaccess/title">


    <xsl:call-template name="heading-search">
      <xsl:with-param name="attr" select="name(.)"/>
    </xsl:call-template>

  </xsl:template>

  <xsl:template name="heading-search">
    <xsl:param name="attr" />
    <xsl:element name="a">
      <xsl:attribute name="href"><xsl:value-of select="concat($uri,'&amp;',
	  'searchfield%5B1%5D=',$attr,'&amp;',
	  'searchterm%5B1%5D=',
	  .)"/></xsl:attribute>
      <xsl:apply-templates select="./node()"/>
    </xsl:element>
  </xsl:template>



<!--

  $Log$
  Revision 1.1  2009/06/29 11:08:39  sigfrid
  Initial revision

  Revision 1.2  2005/03/15 15:21:02  sigge
  Fixat länkning till ett cgi-script i perl (för att vara säker på att
  teckenkodning blir korrekt och för att det skall vara möjligt att måla
  ord som träffar)

  Revision 1.1  2005/03/11 12:00:23  sigge
  Initial revision


-->



</xsl:stylesheet>