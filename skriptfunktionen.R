rm(list=ls(all=TRUE)) # clear memory


library(maptools)
library(raster)
library(ggplot2)
library(Hmisc)

de <- getData("GADM", country="DE", level=1)
plot(de)


daten <- read.csv("~/Desktop/dfc_nachannotiert.csv", sep=";", row.names=,1)

# Annotation und Kartierung nach syntaktischen Funktionen


obl <- daten[(daten$Funktion=='Obliquus'),]
adv <- daten[(daten$Funktion=='Adverbial'),]
praed <- daten[(daten$Funktion=='Prädikativ'),]
subj <- daten[(daten$Funktion=='Subjekt'),]
obj <- daten[(daten$Funktion=='Objekt'),]


#describe(daten[,2:3])


oli <- daten[,2:3]
oli[oli==""] <- NA

describe(oli, exclude.missing=TRUE, digits=2)


points(obl[,8:9], cex=1, col='violetred', pch=15) 
points(adv[,8:9], cex=1, col='orange', pch=15)
points(praed[,8:9], cex=1, col='seagreen', pch=15)
points(subj[,8:9], cex=1, col='tomato', pch=15) 
points(obj[,8:9], cex=1, col='slateblue', pch=15) 



title(main="Doubly-filled COMPs in German Dialects\n (Functions)", col.main="black", font.main=2)

bp <-legend('bottomleft',inset=c(0.1,0.0),legend = c("Subject","Object","Oblique","Predicative","Adverbial"), cex=0.8, col = c('tomato','slateblue','violetred','seagreen','orange'), pch = 15, bty = 'n')
  
 

setwd("/Users/uetzgenfatz/Desktop")
quartz.save("dfcs_funktionen.png","png", width=12, height=10, dpi = 150) 

dev.off()







