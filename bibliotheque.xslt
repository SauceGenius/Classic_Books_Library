<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/*">
        <html>
            <head>
                <xsl:element name="link">
                    <xsl:attribute name="rel">stylesheet</xsl:attribute>
                    <xsl:attribute name="href">bibliotheque.css</xsl:attribute>
                </xsl:element>
                <title>The Great Books of Western Civilization</title>
            </head>
            <body>
                <div id="top-bar">
                    <div id="logo"><h1>The Great Books of Western Civilization</h1></div>
                    <div id="wiki">
                        <h1><a class="wiki" href="https://en.wikipedia.org/wiki/Great_Books_of_the_Western_World">Wiki</a></h1>
                    </div>
                </div>
                <div id="page-wrap"><xsl:apply-templates select="./*"/></div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="epoque">
        <div id="epoque">
            <h2><xsl:value-of select="@nom"/></h2>
            <div id="content"><xsl:apply-templates select="./*"/></div>
            <hr/>
        </div>

        
    </xsl:template>

    <xsl:template match="auteur">  
        <div id="auteur">
            <div id="auteur-detail">    
                <h3><xsl:value-of select="@nom"/> (<xsl:value-of select="@date"/>)</h3>
                <h4><xsl:value-of select="@nat"/> - <xsl:value-of select="@style"/></h4>
            </div>
            <ul class="a"><xsl:apply-templates select="livre"/></ul>
        </div>
    </xsl:template>

    <xsl:template match="livre">  
        <li class="space">
            <xsl:value-of select="@nom"/> 
            <ul><xsl:apply-templates select="./*"/></ul>
        </li>
    </xsl:template>

    <xsl:template match="edition">  
        <li>
        <xsl:if test="@p='oui'">◊ </xsl:if>
        <xsl:choose>
            <xsl:when test="@q='1'">
                <xsl:element name="a">
                    <xsl:attribute name="class">q</xsl:attribute>
                    <xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
                    √ <xsl:value-of select="@nom"/>
                </xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:element name="a">
                    <xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
                    <xsl:value-of select="@nom"/>
                </xsl:element>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="@p='oui'"> ◊ </xsl:if>
        (<xsl:value-of select="@langue"/>)
        </li>
    </xsl:template>

</xsl:stylesheet>