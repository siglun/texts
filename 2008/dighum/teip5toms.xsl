<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:t="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml" 
    exclude-result-prefixes="t"
    version="1.0">

<xsl:output method="text"
	    encoding="UTF-8"
	    indent="no"/>

<!--xsl:strip-space elements="t:div t:p t:list t:item" />
<xsl:preserve-space elements="t:emph t:author t:title t:ref"/-->

<xsl:template match="/">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="t:TEI">
<xsl:apply-templates select="t:text"/>
</xsl:template>

<xsl:template match="t:text">
<xsl:apply-templates select="t:front"/>
<xsl:apply-templates select="t:body"/>
<!--.SH
Notes
<xsl:for-each select="//t:note">
.IP <xsl:value-of select="position()"/><xsl:text>
</xsl:text><xsl:apply-templates  mode="generatetext" select="."/>
</xsl:for-each -->
<xsl:apply-templates select="t:back"/>
</xsl:template>

<xsl:template match="t:front">
.TL
<xsl:apply-templates select="t:docTitle/t:titlePart" />
.AU
<xsl:apply-templates select="t:docAuthor/t:name" />
.AI
<xsl:apply-templates select="t:docAuthor/t:address"/>
.AB
<xsl:apply-templates select="t:div[@type='abstract']"/>
.AE
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

<xsl:template match="t:listBibl">
<xsl:apply-templates select="t:head"/>
<xsl:apply-templates select="t:bibl">
<xsl:sort select="t:author[1]|t:title[1]" data-type="text"/>
</xsl:apply-templates>
</xsl:template>

<xsl:template match="t:bibl">
.XP
<xsl:for-each select="t:author|t:editor"><xsl:if test="position() > 1 and position()=last()"><xsl:text> and </xsl:text></xsl:if><xsl:apply-templates/><xsl:if test="position() >= 1 and not(position() = last())"><xsl:text>, </xsl:text></xsl:if></xsl:for-each><xsl:if test="t:date"><xsl:text>,
</xsl:text><xsl:apply-templates select="t:date"/><xsl:text>. </xsl:text></xsl:if><xsl:if test="t:title">
<xsl:choose>
<xsl:when test="t:title[@level = 'a']">
<xsl:apply-templates select="t:title[@level = 'a']"/><xsl:text>
</xsl:text>
<xsl:if test="t:title[@level = 'j']">\fI<xsl:apply-templates select="t:title[@level = 'j']"/>\fP</xsl:if><xsl:text>.
</xsl:text>
</xsl:when>
<xsl:when test="t:title[@level = 'm']">
\fI<xsl:apply-templates select="t:title[@level = 'm']"/>\fP<xsl:text>
</xsl:text>
</xsl:when>
</xsl:choose>
</xsl:if>
<xsl:if test="t:biblScope[@type='volume']">
<xsl:text>Vol. </xsl:text><xsl:apply-templates select="t:biblScope[@type='volume']"/><xsl:if test="t:biblScope[@type='number']">(<xsl:apply-templates select="t:biblScope[@type='number']"/>)<xsl:choose><xsl:when test="t:biblScope[@type='pp']"><xsl:text>, </xsl:text></xsl:when><xsl:otherwise><xsl:text>. </xsl:text></xsl:otherwise></xsl:choose></xsl:if></xsl:if> <xsl:if test="t:biblScope[@type='pp']"> <xsl:text>pp. </xsl:text><xsl:apply-templates select="t:biblScope[@type='pp']"/><xsl:text>. </xsl:text></xsl:if>
<xsl:if test="t:note">
<xsl:apply-templates select="t:note/node()"/>
</xsl:if>
<xsl:if test="t:ref">
.na
\s-2\f(CR<xsl:apply-templates select="t:ref"/>\fP\s+2
.ad
</xsl:if>
</xsl:template>

<xsl:template match="t:note"><xsl:text>\**
.FS
</xsl:text><xsl:apply-templates/><xsl:text>
.FE
</xsl:text></xsl:template>

<xsl:template mode="generatetext" match="t:note">
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="t:quote"><xsl:text> \(lq</xsl:text><xsl:apply-templates/><xsl:text>\(rq</xsl:text><xsl:if test="@rend = 'space'"><xsl:text> </xsl:text></xsl:if></xsl:template>

<xsl:template match="t:head">
.SH
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="t:p">
.LP
<xsl:apply-templates/>
</xsl:template>

<xsl:template match="t:ref">
<xsl:apply-templates mode="preserve"/>
</xsl:template>

<xsl:template match="t:bibl/t:ref">
&lt;URL: <xsl:apply-templates select="@target"/>&gt;
</xsl:template>

<xsl:template match="t:list[@type='ordered']">
<xsl:for-each select="t:item">
.IP <xsl:value-of select="position()"/><xsl:text>
</xsl:text><xsl:apply-templates/>
</xsl:for-each>
</xsl:template>

<xsl:template match="t:list">
<xsl:for-each select="t:item">
<xsl:text>
.IP \s+1\(bu\s-1
</xsl:text><xsl:apply-templates/>
</xsl:for-each>
</xsl:template>

<xsl:template match="t:item">
<xsl:apply-templates/>
</xsl:template>
  
<xsl:template match="t:address">
<xsl:for-each select="t:addrLine">
<xsl:apply-templates/><xsl:text>
</xsl:text></xsl:for-each>
</xsl:template>

<xsl:template match="t:figure"><xsl:text>
.KF
</xsl:text><xsl:apply-templates/><xsl:text>
.KE
.sp
</xsl:text></xsl:template>

<xsl:template match="t:figure/t:head"><xsl:text>
.sp
.QP
</xsl:text>\s-2<xsl:apply-templates/><xsl:text>\s+2
</xsl:text></xsl:template>

<xsl:template match="t:graphic"><xsl:text>
.PSPIC </xsl:text><xsl:value-of select="concat(substring-before(@url,'.'),'.eps')"/><xsl:text> </xsl:text><xsl:value-of select="substring-before(@width,'m')"/><xsl:text>
</xsl:text></xsl:template>
  

<xsl:template match="t:emph[@rend='bold']">\fB<xsl:apply-templates  mode="preserve"/>\fP</xsl:template>

<xsl:template match="t:emph|t:p/t:title">\fI<xsl:apply-templates  mode="preserve"/>\fP</xsl:template>

<xsl:template mode="preserve"  match="text()">
<xsl:value-of select="."/>
</xsl:template>

<xsl:template match="text()">
<xsl:value-of select="normalize-space(.)"/>
</xsl:template>

</xsl:stylesheet>
