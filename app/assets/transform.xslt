<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
  <h2>Results</h2>
  <h3><xsl:value-of select="root/error" /></h3>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>x</th>
        <th>x^2</th>
      </tr>
      <xsl:for-each select="root/results/result">
      <tr>
        <td>
          <xsl:value-of select='value' />
        </td>
        <td>
          <xsl:value-of select='square' />
        </td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>