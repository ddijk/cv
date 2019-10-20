<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : uitgebreid.xsl
    Created on : August 29, 2010, 7:11 PM
    Author     : dick
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
	<xsl:template match="cv">
				
				<div id="voorblad-gegevens">
					<xsl:text>Naam: </xsl:text>
					<xsl:value-of select="personalia/titel"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/cv/@persoon"/>
					<xsl:text> ( </xsl:text>
				<!-- include alleen het eerste (hoofd) emailadres en tel. nr -->
					<xsl:value-of select="personalia/emailadres"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="personalia/telefoonnr"/>
					<xsl:text> ) </xsl:text>
				</div>

				<div id="functies">
					<xsl:text>Functie:</xsl:text>
					<xsl:text> </xsl:text>
					<xsl:apply-templates select="personalia/functie"/>
				</div>
				<xsl:apply-templates select="personalia"/>
				<div id="Opleidingen">
					<div class="kop2">Opleidingen</div>
					<xsl:apply-templates select="regulier-onderwijs"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="personalia">
		<div id="personalia">
			<div class="kop2">Personalia</div>
			<div id="naam">
				<xsl:text>Naam: </xsl:text>
				<xsl:value-of select="/cv/@persoon"/>
			</div>
			<div id="geboortedatum">
				<xsl:text>Geboortedatum:</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:value-of select="geboortedatum"/>
			</div>
			<div id="woonplaats">
				<xsl:text>Woonplaats:</xsl:text>
				<xsl:text> </xsl:text>
				<xsl:value-of select="adres/woonplaats"/>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="school">
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="regulier-onderwijs">
		<xsl:apply-templates select="opleiding"/>
	</xsl:template>

	<xsl:template match="opleiding">
		<div>
			<xsl:text>Ik heb op de </xsl:text>
			<xsl:value-of select="school"/>
			<xsl:text> gezeten.</xsl:text>
		</div>
	</xsl:template>

	<xsl:template match="functie">
		<xsl:text> </xsl:text>
		<xsl:value-of select="."/>
		<xsl:text> / </xsl:text>
	</xsl:template>

</xsl:stylesheet>
