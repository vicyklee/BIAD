#-----------------------------------------------------------------------------------------
# Graphviz
#-----------------------------------------------------------------------------------------
library(DiagrammeR)
library(rsvg)
library(DiagrammeRsvg)
#-----------------------------------------------------------------------------------------
# overview
#-----------------------------------------------------------------------------------------
overview <- '
digraph cluster {
node[ shape = none, fontname = "Arial" ]
rankdir=LR;

sites[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td port="1"><font color="Steelblue">Sites</font></td></tr>
</table>>];

phases[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td port="1"><font color="Steelblue">Phases</font></td></tr>
</table>>];

graves[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td port="1"><font color="Steelblue">Graves</font></td></tr>
</table>>];

c14samples[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td port="1"><font color="Steelblue">C14Samples</font></td></tr>
</table>>];

graveindividuals[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td port="1"><font color="Steelblue">GraveIndividuals</font></td></tr>
</table>>];

strontium[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td port="1"><font color="Steelblue">Strontium</font></td></tr>
</table>>];

sites:1 -> phases:1 [dir="both"]
phases:1 -> graves:1 [dir="both"]
phases:1 -> c14samples:1 [dir="both"]
graves:1 -> graveindividuals:1 [dir="both"]
graveindividuals:1 -> strontium:1 [dir="both"]
}'

#-----------------------------------------------------------------------------------------
# example 1 venn diagram
#-----------------------------------------------------------------------------------------
png('../tools/plots/items.example.1.venn.png',width=700,height=200)
par(mar=c(0,0,0,0))
plot(NULL, xlim=c(0,1),ylim=c(0,1),xlab='',ylab='',xaxt='n',yaxt='n',bty='n')
rect(0,0,1,1,border='steelblue',lwd=3)
rect(0.2,0.3,0.4,0.7,border='steelblue',lwd=3)
rect(0.6,0.3,0.8,0.7,border='steelblue',lwd=3)
text(x=0.3,y=0.55,'c01',cex=1.3)
text(x=0.3,y=0.45,'sr01',cex=1.3)
text(x=0.7,y=0.5,'c02',cex=1.3)
text(x=0.3,y=0.35,'upper right M1',cex=1,col='steelblue')
text(x=0.7,y=0.35,'lower left M2',cex=1,col='steelblue')
text(x=0.5,y=0.05,'individual ind01',cex=1,col='steelblue')
dev.off()
#-----------------------------------------------------------------------------------------
# example 2 venn diagram
#-----------------------------------------------------------------------------------------
png('../tools/plots/items.example.2.venn.png',width=700,height=200)
par(mar=c(0,0,0,0))
plot(NULL, xlim=c(0,1),ylim=c(0,1),xlab='',ylab='',xaxt='n',yaxt='n',bty='n')
rect(0,0,1,1,border='steelblue',lwd=3)
rect(0.05,0.2,0.5,0.9,border='steelblue',lwd=3)
rect(0.1,0.4,0.25,0.8,border='steelblue',lwd=3)
rect(0.3,0.4,0.45,0.8,border='steelblue',lwd=3)
rect(0.6,0.4,0.75,0.8,border='steelblue',lwd=3)
rect(0.8,0.4,0.95,0.8,border='steelblue',lwd=3)

text(x=0.175,y=0.7,'c01',cex=1.3)
text(x=0.175,y=0.6,'n01',cex=1.3)
text(x=0.375,y=0.65,'c02',cex=1.3)
text(x=0.675,y=0.65,'sr01',cex=1.3)
text(x=0.875,y=0.65,'c03',cex=1.3)

text(x=0.175,y=0.45,'M1 tooth',cex=1,col='steelblue')
text(x=0.375,y=0.45,'Femur',cex=1,col='steelblue')
text(x=0.675,y=0.525,'M2 tooth',cex=1,col='steelblue')
text(x=0.675,y=0.45,'(invididual ind02)',cex=1,col='steelblue')
text(x=0.875,y=0.45,'dog',cex=1,col='steelblue')
text(x=0.275,y=0.25,'individual ind01',cex=1,col='steelblue')
text(x=0.5,y=0.05,'grave gr01',cex=1,col='steelblue')
dev.off()
#-----------------------------------------------------------------------------------------
# example.1
#-----------------------------------------------------------------------------------------
example.1 <- '
digraph cluster {
node[ shape = none, fontname = "Arial" ]
rankdir=LR;

strontium[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td colspan="5"><font color="Steelblue"><b>Strontium</b></font></td></tr>
<tr><td>StrontiumID</td><td>IndividualID</td><td>ItemID</td><td>Element</td><td>87Sr/86Sr</td></tr>
<tr><td port="1">sr01</td><td>ind01</td><td>it01</td><td>upper right M1</td><td>0.70789</td></tr>
</table>>];

c14samples[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td colspan="4"><font color="Steelblue"><b>C14Samples</b></font></td></tr>
<tr><td>C14ID</td><td>ItemID</td><td>LabID</td><td>Element</td></tr>
<tr><td port="1">c01</td><td>it01</td><td>OxA-1234</td><td>upper right M1</td></tr>
<tr><td port="2">c02</td><td>it02</td><td>OxA-5678</td><td>lower left M2</td></tr>
 </table>>];

graveindividuals[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td colspan="3"><font color="Steelblue"><b>GraveIndividuals</b></font></td></tr>
<tr><td>IndividualID</td><td>GraveID</td><td>ItemID</td></tr>
<tr><td port="1">ind01</td><td>grave01</td><td>it02</td></tr>
</table>>];

items[ label=<
<table border="0" cellborder="1" cellspacing="0" cellpadding="4">
<tr><td><font color="Steelblue"><b>Items</b></font></td></tr>
<tr><td>ItemID</td></tr>
<tr><td port="1">it01</td></tr>
<tr><td port="2">it02</td></tr>
</table>>];

items:1 -> c14samples:1 [dir="both"]
items:1 -> strontium:1 [dir="both"]
items:2 -> c14samples:2 [dir="both"]
items:2 -> graveindividuals:1 [dir="both"]

}'
#-----------------------------------------------------------------------------------------
export_svg(grViz(diagram=overview)) %>% charToRaw %>% rsvg_png("../tools/plots/items.overview.png")
export_svg(grViz(diagram=example.1)) %>% charToRaw %>% rsvg_png("../tools/plots/items.example.1.png")
#-----------------------------------------------------------------------------------------