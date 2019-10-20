VANUIT IDE
vul het pad naar FOP home (fop.home) in in build.xml
-run ANT target generate-pdf of generate-rtf

VAN COMMANDLINE
set path=C:\Documents and Settings\dick\My Documents\Downloads\fop-1.0-bin\fop-1.0;%path%


fop -xml cv.xml -xsl fo-cv-website.xsl -rtf cv.rtf

fop -xml cv.xml -xsl fo-cv-website.xsl -pdf cv.pdf
