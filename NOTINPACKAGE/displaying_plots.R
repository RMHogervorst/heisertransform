library(dplyr)
library(ggplot2)
library(cowplot)
source('~/docs/actief/Projecten/heisertransform/R/heisertransformfunctions.R')
source('~/docs/actief/Projecten/heisertransform/R/helperfunctions.R')
n <-40
var1 <- rnorm(n, mean = .80, sd = .04)
var2<- rnorm(n, .15, 0.02)
delete<-var1+var2 >1
var1<-var1[!delete]
var2<-var2[!delete]
var3<- 1-(var1+var2)
tachtig15<-data.frame(var1, var2, var3)
rm(var1, var2, var3, n, delete)

vert<-CreateVertices(tachtig15,"var1", "var2", "var3")
ggplot(data = vert, aes(x,y))+geom_point()

lijnen<-list(geom_line(data = vert, aes(x,y), colour = "#122b3e"),
             geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]), colour = "#122b3e" ))
punten<-list(geom_point(data = vert[1,], aes(x, y),  shape = 17,  size = 5, colour = "#cc0000"),
             geom_point(data = vert[2,], aes(x, y),  shape = 17,  size = 5, stroke = 2, colour = "#ffca00"),
             geom_point(data = vert[3,], aes(x, y),  shape = 17,  size = 5, stroke = 2, colour = "#00b300")
)
tekst<- list(geom_text(data = vert[1,], aes(x,y, label = "left"), vjust =1.5, hjust = 0, colour = "#cc0000") ,
             geom_text(data = vert[2,], aes(x,y, label = "top"), vjust =0, hjust = 1.5, colour = "#ffca00") ,
             geom_text(data = vert[3,], aes(x,y, label = "right"), vjust =1.5, hjust = 1, colour = "#00b300")
)
ggplot(data = vert, aes(x,y))+geom_point() +lijnen
ggplot(data = vert, aes(x,y))+geom_point() +lijnen +punten
ggplot(data = vert, aes(x,y))+geom_point() +lijnen
ggplot(data = vert, aes(x,y))+geom_point() +lijnen +punten +tekst

vert<-CreateVertices(tachtig15,"var2", "var1", "var3")
ggplot(data = vert, aes(x,y))+geom_point() +lijnen +punten +tekst # dit levert de oude plekken op.

do_pretty<- function(vert){
        lijnen<-list(geom_line(data = vert, aes(x,y), colour = "#122b3e"),
                     geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]), colour = "#122b3e" ))
        punten<-list(geom_point(data = vert[1,], aes(x, y),  shape = 17,  size = 5, colour = "#cc0000"),
                     geom_point(data = vert[2,], aes(x, y),  shape = 17,  size = 5, stroke = 2, colour = "#ffca00"),
                     geom_point(data = vert[3,], aes(x, y),  shape = 17,  size = 5, stroke = 2, colour = "#00b300")
        )
        tekst<- list(geom_text(data = vert[1,], aes(x,y, label = "left"), vjust =1.5, hjust = 0, colour = "#cc0000") ,
                     geom_text(data = vert[2,], aes(x,y, label = "top"), vjust =0, hjust = 1.5, colour = "#ffca00") ,
                     geom_text(data = vert[3,], aes(x,y, label = "right"), vjust =1.5, hjust = 1, colour = "#00b300")
        )
        ggplot(data = vert, aes(x,y))+geom_point() +lijnen +punten +tekst
}
do_pretty(vert) # test seems to work

no1<-do_pretty(CreateVertices(tachtig15,"var1", "var2", "var3"))
no2<-do_pretty(CreateVertices(tachtig15, "var2","var1", "var3"))
no3<-do_pretty(CreateVertices(tachtig15, "var3", "var2","var1"))

plot_grid(no1, no2, no3, labels = c("left","top","right"), hjust = -4.5)

n <-30
var1 <- rnorm(n, mean = .50, sd = .05)
var2<- rnorm(n, .25, 0.05)
delete<-var1+var2 >1
var1<-var1[!delete]
var2<-var2[!delete]
var3<- 1-(var1+var2)
vijftig25<-data.frame(var1, var2,var3)
rm(var1, var2, var3, n, delete)
no4<-do_pretty(CreateVertices(vijftig25,"var1", "var2", "var3"))
plot_grid(no1, no2, no3, no4, labels = c("left","top","right", "other distr"), align = "vh")
no5<-do_pretty(CreateVertices(vijftig25, "var2", "var3","var1"))
no6<-do_pretty(CreateVertices(vijftig25,"var1", "var3", "var2"))
no7<-do_pretty(CreateVertices(vijftig25, "var3", "var2","var1"))
plot_grid(no4,no5, align = "v", nrow = 2)
plot_grid(no6,no7, align = "v", nrow = 2)

#nieuwe versie, makkelijker.
do_pretty2<- function(vert){
        lijnen<-list(geom_line(data = vert, aes(V1,V2), colour = "#122b3e"),
                     geom_segment(data = vert, aes(x = V1[1], xend = V1[3], y= V2[1], yend= V2[3]), colour = "#122b3e" ))
        punten<-list(geom_point(data = vert[1,], aes(V1, V2),  shape = 17,  size = 5, colour = "#cc0000"),
                     geom_point(data = vert[2,], aes(V1, V2),  shape = 17,  size = 5, stroke = 2, colour = "#ffca00"),
                     geom_point(data = vert[3,], aes(V1, V2),  shape = 17,  size = 5, stroke = 2, colour = "#00b300")
        )
        tekst<- list(geom_text(data = vert[1,], aes(V1, V2, label = "left"), vjust =1.5, hjust = 0, colour = "#cc0000") ,
                     geom_text(data = vert[2,], aes(V1, V2, label = "top"), vjust =0, hjust = 1.5, colour = "#ffca00") ,
                     geom_text(data = vert[3,], aes(V1, V2, label = "right"), vjust =1.5, hjust = 1, colour = "#00b300")
        )
        ggplot(data = vert, aes(V1, V2))+geom_point() +lijnen +punten +tekst
}

do_pretty2(vertices_create(.50,.40,.10))
do_pretty2(vertices_create(.50,.35,.15))
do_pretty2(vertices_create(.50,.30,.20))
do_pretty2(vertices_create(.50,.25,.25))
do_pretty2(vertices_create(.50,.20,.3))
do_pretty2(vertices_create(.50,.15,.35))
do_pretty2(vertices_create(.50,.10,.40))

do_pretty3<- function(vert, line_colour = "#122b3e"){
        lijnen<-list(geom_line(data = vert, aes(V1,V2), colour = line_colour),
                     geom_segment(data = vert, aes(x = V1[1], xend = V1[3], y= V2[1], yend= V2[3]), colour = line_colour ))
        punten<-list(geom_point(data = vert[1,], aes(V1, V2),  shape = 17,  size = 5, colour = "#cc0000"),
                     geom_point(data = vert[2,], aes(V1, V2),  shape = 17,  size = 5, stroke = 2, colour = "#ffca00"),
                     geom_point(data = vert[3,], aes(V1, V2),  shape = 17,  size = 5, stroke = 2, colour = "#00b300")
        )
        tekst<- list(geom_text(data = vert[1,], aes(V1, V2, label = "left"), vjust =1.5, hjust = 0, colour = "#cc0000") ,
                     geom_text(data = vert[2,], aes(V1, V2, label = "top"), vjust =0, hjust = 1.5, colour = "#ffca00") ,
                     geom_text(data = vert[3,], aes(V1, V2, label = "right"), vjust =1.5, hjust = 1, colour = "#00b300")
        )
        list(lijnen,punten)
}
#effect van
do_pretty2(vertices_create(.50,.40,.10)) + do_pretty3(vertices_create(.50,.35,.15))+
        do_pretty3(vertices_create(.50,.30,.20))+ do_pretty3(vertices_create(.50,.25,.25))+
        do_pretty3(vertices_create(.50,.20,.3)) + do_pretty3(vertices_create(.50,.15,.35)) +
        do_pretty3(vertices_create(.50,.10,.40)) + ggtitle("from .50,.40,.10 to .50,.10,.40 \n in steps of .05")
#drie versies
do_pretty2(vertices_create(.50,.40,.10)) + do_pretty3(vertices_create(.50,.10,.40), "red")+
        do_pretty3(vertices_create(.10,.50,.40), "grey")+do_pretty3(vertices_create(.10,.40,.50), "orange")