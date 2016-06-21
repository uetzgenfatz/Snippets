# R-Skript zur Visualisierung raumbezogener Daten als einfache Punktkarten
# Oliver Schallert, 2016


rm(list=ls(all=TRUE)) # clear memory


library(maptools)
library(raster)
library(ggplot2)

de <- getData("GADM", country="DE", level=1)
plot(de)


daten <- read.csv("~/Desktop/dfc.csv", sep=";", row.names=,1)


warum <- daten[(daten$Typ=='warum dass'),]
wieviel <- daten[(daten$Typ=='wieviel dass') | (daten$Typ=='wieviel X dass'),]
wie <- daten[(daten$Typ=='wie dass') | (daten$Typ=='wie X dass'),]

welch <- daten[(daten$Typ=='welch dass') | (daten$Typ=='welch X dass') ,]
PPwelch <- daten[(daten$Typ=='PPw dass') | (daten$Typ=='PPwelch dass'),]
wasfür <- daten[(daten$Typ=='was für X dass'),]


# Die einzelnen Typen sind farblich zusammengefasst.


points(warum[,6:7], cex=1, col='#2E9AFE', pch=15) #blau
points(wieviel[,6:7], cex=1, col='#FE9A2E', pch=15) #orange
points(wie[,6:7], cex=1, col='#FE9A2E', pch=15) #orange
points(welch[,6:7], cex=1, col='#FA58F4', pch=15) #pink
points(PPwelch[,6:7], cex=1, col='#FA58F4', pch=15) #pink
points(wasfür[,6:7], cex=1, col='#FF0040', pch=15) #rot

title(main="Doubly-filled COMPs in German Dialects (Zwirner corpus)", col.main="black", font.main=2)

bp <-legend('bottomleft',inset=c(0.1,0.0),legend = c("warum “why”", "wieviel/wie “how (many)”","(PP) welch “which”","was für “what (kind of)”"), cex=0.8, col = c('#2E9AFE','#FE9A2E','#FA58F4','#FF0040'), pch = 15, bty = 'n')


setwd("/Users/uetzgenfatz/Desktop")
quartz.save("dfckarte.png","png", width=12, height=10, dpi = 150) 

dev.off()

