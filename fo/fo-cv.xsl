<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrait"
                                       page-height="29.7cm" page-width="21.0cm" margin="2cm">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4-portrait">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block>
                        <xsl:apply-templates select="cv"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <xsl:template match="cv">
        <fo:block font-size="24pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt" margin-bottom="35px">

            Curriculum Vitae van
            <xsl:value-of select="@persoon"/>
        </fo:block>
        <xsl:apply-templates select="personalia"/>

        <fo:block font-size="16pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt" margin-top="15px">
            Opleidingen
        </fo:block>
        <fo:block font-size="12pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            Regulier onderwijs
        </fo:block>
        <fo:block font-size="10pt"
                  font-family="sans-serif"
                  line-height="12pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            <xsl:apply-templates select="regulier-onderwijs"/>

        </fo:block>
        <fo:block font-size="12pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            IT opleidingen
        </fo:block>
        <fo:block font-size="10pt"
                  font-family="sans-serif"
                  line-height="12pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            <xsl:apply-templates select="it-opleidingen"/>
        </fo:block>

        <fo:block font-size="16pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt" margin-top="15px">
            Talen
        </fo:block>
        <fo:block font-size="10pt"
                  font-family="sans-serif"
                  line-height="12pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt" margin="0">
            <xsl:apply-templates select="talen"/>
        </fo:block>

        <fo:block font-size="16pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt" margin-top="0">
            Ervaringen
        </fo:block>
        <fo:block font-size="10pt"
                  font-family="sans-serif"
                  line-height="12pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            <xsl:apply-templates select="ervaringen"/>
        </fo:block>

        <fo:block font-size="16pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt" margin-top="15px">
            Opdrachten
        </fo:block>
        <fo:block font-size="10pt"
                  font-family="sans-serif"
                  line-height="12pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            <xsl:apply-templates select="opdrachten"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="ervaringen">
        <!-- table start -->
        <fo:table table-layout="fixed" width="100%" border-collapse="separate">
            <fo:table-column column-width="40mm"/>
            <fo:table-column column-width="130mm"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Methoden:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="methods/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Tools:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="tools/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Talen</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="talen/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Appservers:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="appservers/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Versiebeheersystemen:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="versiebeheersystemen/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Testing</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="testing/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Technologies:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="technologies/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Besturingssystemen:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:apply-templates select="besturingssystemen/item"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
        <!-- table end -->
    </xsl:template>

    <xsl:template match="item">
        <xsl:value-of select="."/>
        <xsl:choose>
            <!-- een comma tussen de items (dus niet achter de laatste) -->
            <xsl:when test="position() != last()">,</xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="opdrachten">
        <xsl:apply-templates select="opdracht"/>
    </xsl:template>

    <xsl:template match="opdracht">
        <!-- table start -->
        <fo:table table-layout="fixed" width="100%" border-collapse="separate" margin-bottom="20px">
            <fo:table-column column-width="40mm"/>
            <fo:table-column column-width="130mm"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:text>Periode:</xsl:text>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:call-template name="FormatDate">
                                <xsl:with-param name="DateTime">
                                    <xsl:value-of select="periode/van"/>
                                </xsl:with-param>
                            </xsl:call-template>
                            <xsl:text> - </xsl:text>
                            <xsl:call-template name="FormatDate">
                                <xsl:with-param name="DateTime">
                                    <xsl:value-of select="periode/tot"/>
                                </xsl:with-param>
                            </xsl:call-template>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Branche:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:text></xsl:text>
                            <xsl:value-of select="klant/branche"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
<!--                <fo:table-row>-->
<!--                    <fo:table-cell>-->
<!--                        <fo:block>Klant:</fo:block>-->
<!--                    </fo:table-cell>-->
<!--                    <fo:table-cell>-->
<!--                        <fo:block>-->
<!--                            <xsl:text></xsl:text>-->
<!--                            <xsl:value-of select="klant/bedrijfsnaam"/>-->
<!--                        </fo:block>-->
<!--                    </fo:table-cell>-->
<!--                </fo:table-row>-->
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Rol:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:value-of select="rol"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Aantal uren per week:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>32</fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Werkgebied:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:value-of select="werkgebied"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Technologies:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:value-of select="technologie"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block>Bijdrage:</fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block>
                            <xsl:value-of select="bijdrage"/>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block></fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block></fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block></fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block></fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
        <!--
        <fo:block font-size="10pt"
                font-family="sans-serif"
                line-height="12pt"
                space-before.optimum="10pt"
                space-after.optimum="10pt"
                text-align="start"
                padding-top="3pt" height="20px">
            <xsl:text> </xsl:text>
          </fo:block>
          -->
        <!-- table end -->
    </xsl:template>

    <xsl:template match="talen">
        <xsl:apply-templates select="item"/>
    </xsl:template>

    <xsl:template match="personalia">
        <!-- defines text title level 2-->
        <fo:block font-size="16pt"
                  font-family="sans-serif"
                  line-height="20pt"
                  space-before.optimum="10pt"
                  space-after.optimum="10pt"
                  text-align="start"
                  padding-top="3pt">
            Personalia
        </fo:block>
        <!-- Normal text -->
        <fo:block font-size="10pt"
                  font-family="sans-serif"
                  line-height="12pt"
                  space-after.optimum="3pt"
                  text-align="start">
            <!-- table start -->
            <fo:table table-layout="fixed" width="100%" border-collapse="separate">
                <fo:table-column column-width="40mm"/>
                <fo:table-column column-width="100mm"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                <xsl:text>Naam:</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                <xsl:value-of select="titel"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="/cv/@persoon"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                                <xsl:text>Functie:</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block>
                                <xsl:apply-templates select="functie"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <!-- <fo:table-row>
                        <fo:table-cell >
                            <fo:block>
                                <xsl:text>Geboortedatum:</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell >
                            <fo:block>
                                <xsl:call-template name="FormatDate">
                                    <xsl:with-param name="DateTime">
                                        <xsl:value-of select="geboortedatum"/>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell >
                            <fo:block>
                                <xsl:text>Woonplaats:</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell >
                            <fo:block>
                                <xsl:value-of select="adres/woonplaats"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row> -->
                </fo:table-body>
            </fo:table>
            <!-- table end -->

        </fo:block>
    </xsl:template>

    <xsl:template match="school">
        <xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="regulier-onderwijs">
        <!-- table start -->
        <fo:table table-layout="fixed" width="100%" border-collapse="separate">
            <fo:table-column column-width="150mm"/>
            <fo:table-body>
                <xsl:apply-templates select="opleiding"/>
            </fo:table-body>
        </fo:table>
        <!-- table end -->
    </xsl:template>

    <xsl:template match="it-opleidingen">
        <fo:table table-layout="fixed" width="100%" border-collapse="separate">
            <fo:table-column column-width="170mm"/>
            <fo:table-body>
                <xsl:apply-templates select="opleiding"/>
            </fo:table-body>
        </fo:table>
        <!-- table end -->
    </xsl:template>

    <xsl:template match="opleiding">
        <fo:table-row>
            <fo:table-cell>
                <fo:block>
                    <xsl:value-of select="cursus"/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="school"/>
                    <xsl:text>, </xsl:text>
                    <xsl:call-template name="alleen-jaar">
                        <xsl:with-param name="DateTime">
                            <xsl:value-of select="periode/tot"/>
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>) </xsl:text>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="functie">
        <xsl:value-of select="."/>
        <xsl:choose>
            <!-- een slash tussen de funties (dus niet achter de laatste) -->
            <xsl:when test="position() != last()">/</xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="alleen-jaar">
        <xsl:param name="DateTime"/>
        <xsl:value-of select="substring($DateTime,1,4)"/>
    </xsl:template>

    <xsl:template name="FormatDate">
        <xsl:param name="DateTime"/>
        <xsl:variable name="jaar">
            <xsl:value-of select="substring($DateTime,1,4)"/>
        </xsl:variable>
        <xsl:variable name="mo">
            <xsl:value-of select="substring($DateTime,6,2)"/>
        </xsl:variable>
        <xsl:variable name="dag">
            <xsl:value-of select="substring($DateTime,9,2)"/>
        </xsl:variable>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="$dag &lt; 10">
                <!-- remove leading 0 if day of month < 10 -->
                <xsl:value-of select="substring($dag,2,1)"/>
            </xsl:when>
            <xsl:when test="$dag &gt; 9">
                <xsl:value-of select="$dag"/>
            </xsl:when>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="$mo = 01">januari</xsl:when>
            <xsl:when test="$mo = 02">februari</xsl:when>
            <xsl:when test="$mo = 03">maart</xsl:when>
            <xsl:when test="$mo = 04">april</xsl:when>
            <xsl:when test="$mo = 05">mei</xsl:when>
            <xsl:when test="$mo = 06">juni</xsl:when>
            <xsl:when test="$mo = 07">juli</xsl:when>
            <xsl:when test="$mo = 08">augustus</xsl:when>
            <xsl:when test="$mo = 09">september</xsl:when>
            <xsl:when test="$mo = 10">oktober</xsl:when>
            <xsl:when test="$mo = 11">november</xsl:when>
            <xsl:when test="$mo = 12">december</xsl:when>
        </xsl:choose>
        <xsl:text> </xsl:text>
        <xsl:value-of select="$jaar"/>
    </xsl:template>
</xsl:stylesheet>
