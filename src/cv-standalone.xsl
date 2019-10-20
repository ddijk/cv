<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : cv-website.xsl
    Created on : September 2, 2010, 1:26 PM
    Author     : dick
    Description: Stylesheet om HTML pagina te genereren.

-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>

	<xsl:template match="cv">
		<html>
			<head>
				<title>CV van
					<xsl:value-of select="@persoon"/>
				</title>
				<!--
				<style type="text/css" rel="stylesheet" href="cv.css"/>
				-->
				<style type="text/css" >
					div {
	font-family: Arial;
}

#titel {
	font: 24pt Arial;
	text-align:	center;
}

#voorblad-gegevens {
	font-color: #f00;
	font-size: 12pt;
}

.kop2 {
	font: 16pt Arial;
	font-color: #efefef;
	margin: 20px 0px ;
	margin-bottom: 5px;
}

.kop3 {
	font: 12pt Arial;
	font-style: italic;
	margin: 10px 0 ;
}

.key {
	width: 150px;
	float: left;
}

.value {
	clear: right;
	margin-left: 155px;
	padding: 2px;
}

#personalia, #opleidingen, #talen, #opdrachten, #ervaringen {
	margin-left: 5px;
}

#opleidingen {
	margin-top: 20px;
}

.opdracht {
	margin: 10px 0;
	margin-bottom: 18px;
	padding: 8px;
	clear: both;
}

#ervaringen {
	clear: right;
}

.odd {
	background-color: #eee;
}

.even {
	background-color: #fff;
}

.container {
	padding: 3px 8px;
}

.opleiding {
	margin: 4px 0;
}
				</style>

			</head>
			<body>
				<div id="titel">Curriculum Vitae</div>

				<div id="personalia">
					<xsl:apply-templates select="personalia"/>
				</div>

				<div id="opleidingen">
					<div class="kop2">Opleidingen</div>
					<div class="container">
						<div class="kop3">Regulier onderwijs</div>
						<xsl:apply-templates select="regulier-onderwijs"/>
						<div class="kop3">IT opleidingen</div>
						<xsl:apply-templates select="it-opleidingen"/>
					</div>
				</div>

				<div id="talen">
					<div class="kop2">Talen</div>
					<xsl:apply-templates select="talen"/>
				</div>

				<div id="ervaringen">
					<div class="kop2">Ervaringen</div>
					<xsl:apply-templates select="ervaringen"/>
				</div>

				<div id="opdrachten">
					<div class="kop2">Opdrachten</div>
					<xsl:apply-templates select="opdrachten"/>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="ervaringen">
		<div class="container">
			<div class="key" id="methods">Methoden</div>
			<div class="value">
				<xsl:apply-templates select="methods/item"/>
			</div>
			<div class="key" id="tools">Tools</div>
			<div class="value">
				<xsl:apply-templates select="tools/item"/>
			</div>
			<div class="key" id="programmeertalen">Talen</div>
			<div class="value">
				<xsl:apply-templates select="talen/item"/>
			</div>
			<div class="key" id="appservers">Appservers</div>
			<div class="value">
				<xsl:apply-templates select="appservers/item"/>
			</div>
			<div class="key" id="versiebeheersystemen">Versiebeheer</div>
			<div class="value">
				<xsl:apply-templates select="versiebeheersystemen/item"/>
			</div>
			<div class="key" id="testing">Testing</div>
			<div class="value">
				<xsl:apply-templates select="testing/item"/>
			</div>
			<div class="key" id="technologies">Technologies</div>
			<div class="value">
				<xsl:apply-templates select="technologies/item"/>
			</div>
			<div class="key" id="besturingssystemen">Besturingssystemen</div>
			<div class="value">
				<xsl:apply-templates select="besturingssystemen/item"/>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="item">
		<xsl:value-of select="."/>
		<xsl:choose>
			<!-- een comma tussen de items (dus niet achter de laatste) -->
			<xsl:when test="position() != last()">, </xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="opdrachten">
		<xsl:apply-templates select="opdracht"/>
	</xsl:template>

	<xsl:template match="opdracht">
		<div>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 1">
						<xsl:text>opdracht odd</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>opdracht even</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<div class="key">
				<xsl:text>Periode:</xsl:text>
			</div>
			<div class="value">
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
			</div>
			<div class="key">
				<xsl:text>Branche:</xsl:text>
			</div>
			<div class="value">
				<xsl:value-of select="klant/branche"/>
			</div>
			<div class="key">Rol</div>
			<div class="value">
				<xsl:value-of select="rol"/>
			</div>
			<div class="key">Werkgebied</div>
			<div class="value">
				<xsl:value-of select="werkgebied"/>
			</div>
			<div class="key">Technologies</div>
			<div class="value">
				<xsl:value-of select="technologie"/>
			</div>
			<div class="key">Bijdrage</div>
			<div class="value">
				<xsl:value-of select="bijdrage"/>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="talen">
		<div class="container">
			<xsl:apply-templates select="item"/>
		</div>
	</xsl:template>

	<xsl:template match="personalia">
		<div class="kop2">Personalia</div>
		<div class="container">
			<div id="naam">
				<div class="key">
					<xsl:text>Naam:</xsl:text>
				</div>
				<div class="value">
					<xsl:value-of select="/cv/@persoon"/>
				</div>
			</div>
			<div id="functies">
				<div class="key">
					<xsl:text>Functie:</xsl:text>
				</div>
				<div class="value">
					<xsl:apply-templates select="functie"/>
				</div>
			</div>
			<div id="geboortedatum" >
				<div class="key">
					<xsl:text>Geboortedatum:</xsl:text>
				</div>
				<div class="value">
					<xsl:call-template name="FormatDate">
						<xsl:with-param name="DateTime">
							<xsl:value-of select="geboortedatum"/>
						</xsl:with-param>
					</xsl:call-template>
				</div>
			</div>
			<div id="woonplaats" >
				<div class="key">
					<xsl:text>Woonplaats:</xsl:text>
				</div>
				<div class="value">
					<xsl:value-of select="adres/woonplaats"/>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="school">
		<xsl:value-of select="."/>
	</xsl:template>

	<xsl:template match="regulier-onderwijs">
		<xsl:apply-templates select="opleiding"/>
	</xsl:template>

	<xsl:template match="it-opleidingen">
		<xsl:apply-templates select="opleiding"/>
	</xsl:template>

	<xsl:template match="opleiding">
		<div class="opleiding">
			<xsl:value-of select="cursus"/>
			<xsl:text> (</xsl:text>
			<xsl:value-of select="school"/>
			<xsl:text>, </xsl:text>
			<!--
			<xsl:call-template name="alleen-jaar">
				<xsl:with-param name="DateTime">
					<xsl:value-of select="periode/van"/>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:text> </xsl:text>
			-->
			<xsl:call-template name="alleen-jaar">
				<xsl:with-param name="DateTime">
					<xsl:value-of select="periode/tot"/>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:text>) </xsl:text>
		</div>
	</xsl:template>

	<xsl:template match="functie">
		<xsl:value-of select="."/>
		<xsl:choose>
			<!-- een slash tussen de funties (dus niet achter de laatste) -->
			<xsl:when test="position() != last()"> / </xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="alleen-jaar">
		<xsl:param name="DateTime" />
		<xsl:value-of select="substring($DateTime,1,4)" />
	</xsl:template>

	<xsl:template name="FormatDate">
		<xsl:param name="DateTime" />
		<xsl:variable name="jaar">
			<xsl:value-of select="substring($DateTime,1,4)" />
		</xsl:variable>
		<xsl:variable name="mo">
			<xsl:value-of select="substring($DateTime,6,2)" />
		</xsl:variable>
		<xsl:variable name="dag">
			<xsl:value-of select="substring($DateTime,9,2)" />
		</xsl:variable>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="$dag &lt; 10">
				<!-- remove leading 0 if day of month < 10 -->
				<xsl:value-of select="substring($dag,2,1)" />
			</xsl:when>
			<xsl:when test="$dag &gt; 9">
				<xsl:value-of select="$dag" />
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
