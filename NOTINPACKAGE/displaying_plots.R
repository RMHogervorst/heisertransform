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


# creatie van string van 3 getallen
# loopje, geef increment in functie. function(start, stop, increment)

a<-.50
b <- (1 -a )/2
plot_triangles<-function(a) {
        b <- (0.8-a)
        stopifnot(a+b+.2==1)
do_pretty2(vertices_create(b, a, .2)) + theme_heiser +
        geom_label(aes(0,0), label = paste("top=",a,"\n left=",b, "\nright=0.2"))
}

plot_triangles2<-function(a) {
        b <- (0.8-a)
        stopifnot(a+b+.2==1)
        do_pretty2(vertices_create(b, a, .2))  +
                geom_label(aes(0,0), label = paste("top=",a,"\n left=",b, "\nright=0.2"))
}
plot_triangles3<-function(a) {
        b <- (1 -a )/2
        stopifnot(a+2*b==1)
        do_pretty2(vertices_create(b, a, b))  +
                geom_label(aes(0,0), label = paste("top=",a,"\n left=",b, "\nright=0.2"))
}
plot_triangles(.7)
ggsave("NOTINPACKAGE/files/tri7.png")
plot_triangles(.6)
plot_triangles(.5)
plot_triangles(.4) +theme_gray()
ggsave(filename = paste("NOTINPACKAGE/files/tri",4,".png",sep = ""))
plot_triangles(.3)
plot_triangles(.2)
plot_triangles(.1)
i<-7
for (i in 1:7) {
        plot_triangles(i/10)
        ggsave(filename = paste("NOTINPACKAGE/files/tri",i,".png",sep = ""))
}

for (i in 1:7) {
        plot_triangles2(i/10)
        ggsave(filename = paste("NOTINPACKAGE/files/triangles",i,".jpg",sep = ""))
}
for (i in 1:7) {
        plot_triangles3(i/10)
        ggsave(filename = paste("NOTINPACKAGE/files/triangles_top",i,".jpg",sep = ""))
}
system("C:/Program Files/ImageMagick-6.9.3-Q16/convert -delay 0.7 NOTINPACKAGE/files/tri*.png NOTINPACKAGE/files/tri.gif")

jpg("NOTINPACKAGE/files/foo%02d.png")
for (i in 1:7) {
        plot_triangles(i/10)
}
dev.off()

make.gif <- function(){
        unlink("plot.gif")
        system("convert -delay 0.5 plot*.jpg plot.gif")
}
i<-1
saveGIF({
        for (i in 1:7) {
                plot_triangles(3/10)
        },
})
saveGIF({
        for (i in 1:10) plot(runif(10), ylim = 0:1)
})

## dit werkt niet, ik weet nog niet waarom
# des = c("testing things",
#          "Oh, really?!")
# saveHTML({
#         ani.options(interval = 0.5)
        # for (i in 0.1:0.2) {
        #         plot_triangles(i)
#                 ani.pause()
#         }
# }, img.name = "rplot", single.opts = "utf8: false", autoplay = FALSE,
# interval = 0.5, imgdir = "norm_dir", htmlfile = "test.html",
# ani.height = 400, ani.width = 600, title = "several triangles",
# description = des)


### checking options to animate triangles ####
## animation package or gganimate seem to work
## need to find a nice example.
## we can create an interactive html or a looping gif.
#devtools::install_github("dgrtwo/gganimate")
library(gganimate)


library(gapminder)
library(ggplot2)
theme_set(theme_bw())
library(gganimate)
p <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, color = continent, frame = year)) +
        geom_point() +
        scale_x_log10()
gg_animate(p)
gg_animate(p, "output2.gif")
gg_animate_save(p, "output.gif")

ggplot
