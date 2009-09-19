<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	       version="1.0">

  <xsl:template name="php_include_html_file">
    <xsl:param name="file"/>
    <xsl:processing-instruction name="php">
      <![CDATA[
      $file1 = "/home/s/sigfrid/www/]]><xsl:value-of select="$file"/><![CDATA[";
      $file2 = "/home/sigge/fsdata/]]><xsl:value-of select="$file"/><![CDATA[";
      if (file_exists($file1)) {
         readfile($file1);
      } elseif (file_exists($file2)) {
         readfile($file2);
      }
      ]]>
    </xsl:processing-instruction>
  </xsl:template>

</xsl:transform>
