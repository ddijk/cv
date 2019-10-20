<?xml version="1.0" encoding="windows-1252"?>

<!--
    Document   : google-site.xsl
    Created on : September 8, 2010, 11:42 AM
    Author     : dick
    Description: Stylesheet voor genereren van HTML voor Google Sites ( CSS is niet toegestaan door Google)
    	         <HTML> en <body> tag worden door Google Sites geleverd, zie ook https://sites.google.com/site/dijkrosoftbooks/cv-dijkrosoft
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>

	<xsl:template match="cv">
				<xsl:apply-templates select="personalia"/>

				<h2 class="kop2">Opleidingen</h2>
				<h3 class="kop3">Regulier onderwijs</h3>
				<xsl:apply-templates select="regulier-onderwijs"/>
				<h3 class="kop3">IT opleidingen</h3>
				<xsl:apply-templates select="it-opleidingen"/>

				<h2 class="kop2">Talen</h2>
				<xsl:apply-templates select="talen"/>

				<h2 class="kop2">Ervaringen</h2>
				<xsl:apply-templates select="ervaringen"/>

				<h2 class="kop2">Opdrachten</h2>
				<xsl:apply-templates select="opdrachten"/>
	</xsl:template>

	<xsl:template match="ervaringen">
		<table class="container">
			<tr>
				<td class="key" id="methods">Methoden</td>
				<td class="value">
					<xsl:apply-templates select="methods/item"/>
				</td>
			</tr>
			<tr>
				<td class="key" id="tools">Tools</td>
				<td class="value">
					<xsl:apply-templates select="tools/item"/>
				</td>
			</tr>
			<tr>
				<td class="key" id="programmeertalen">Talen</td>
				<td class="value">
					<xsl:apply-templates select="talen/item"/>
				</td>
			</tr>
			<tr>
				<td class="key" id="appservers">Appservers</td>
				<td class="value">
					<xsl:apply-templates select="appservers/item"/>
				</td>
			</tr>
			<tr>
				<td class="key" id="technologies">Technologies</td>
				<td class="value">
					<xsl:apply-templates select="technologies/item"/>
				</td>
			</tr>
			<tr>
				<td class="key" id="besturingssystemen">Besturingssystemen</td>
				<td class="value">
					<xsl:apply-templates select="besturingssystemen/item"/>
				</td>
			</tr>
		</table>
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
		<table>
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
			<tr>
			<td  class="key">
				<xsl:text>Periode:</xsl:text>
			</td>
			<td class="value">
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
			</td>
			</tr>
			<tr>
			<td  class="key">
				<xsl:text>Branche:</xsl:text>
			</td>
			<td class="value">
				<xsl:value-of select="klant/branche"/>
			</td>
			</tr>
			<tr>
			<td  class="key">Rol</td>
			<td class="value">
				<xsl:value-of select="rol"/>
			</td>
			</tr>
			<tr>
			<td  class="key">Werkgebied</td>
			<td class="value">
				<xsl:value-of select="werkgebied"/>
			</td>
			</tr>
			<tr>
			<td  class="key">Technologies</td>
			<td class="value">
				<xsl:value-of select="technologie"/>
			</td>
			</tr>
			<tr>
			<td  class="key">Bijdrage</td>
			<td class="value">
				<xsl:value-of select="bijdrage"/>
			</td>
			</tr>
		</table>
		<br />
	</xsl:template>

	<xsl:template match="talen">
		<div class="container">
			<xsl:apply-templates select="item"/>
		</div>
	</xsl:template>

	<xsl:template match="personalia">
		<h2 class="kop2">Personalia</h2>
		<table class="container">
			<tr id="naam">
				<td  class="key">
					<xsl:text>Naam:</xsl:text>
				</td>
				<td  class="value">
					<xsl:value-of select="titel"/><xsl:text> </xsl:text><xsl:value-of select="/cv/@persoon"/>
				</td>
			</tr>
			<tr id="functies">
				<td  class="key">
					<xsl:text>Functie:</xsl:text>
				</td>
				<td  class="value">
					<xsl:apply-templates select="functie"/>
				</td>
			</tr>
			<tr id="geboortedatum" >
				<td  class="key">
					<xsl:text>Geboortedatum:</xsl:text>
				</td>
				<td  class="value">
					<xsl:call-template name="FormatDate">
						<xsl:with-param name="DateTime">
							<xsl:value-of select="geboortedatum"/>
						</xsl:with-param>
					</xsl:call-template>
				</td>
			</tr>
			<tr id="woonplaats" >
				<td  class="key">
					<xsl:text>Woonplaats:</xsl:text>
				</td>
				<td  class="value">
					<xsl:value-of select="adres/woonplaats"/>
				</td>
			</tr>
		</table>
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
