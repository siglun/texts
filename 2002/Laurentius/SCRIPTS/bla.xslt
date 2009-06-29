
<xsl:template match="row">
&nl;<xsl:apply-templates />&nl;
</xsl:template>

<!-- A table cell seperated from the next cell with a semi-colon -->
<xsl:template match="cell">T{
.na
<xsl:apply-templates />
T};</xsl:template>