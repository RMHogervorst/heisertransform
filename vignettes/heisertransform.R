## ------------------------------------------------------------------------
library(heisertransform)
testdata

## ------------------------------------------------------------------------
library(heisertransform)
temp<-CreateVertices(testdata, "test1", "test2","test3",verticeName = F)
plot(temp, main = "Endresult of heisertransform", pch = 17, col = "red")
points(Prob2Coord(testdata, "test1", "test2","test3"), col= "darkgreen", pch = 19)
segments(x0 = temp[1,1], y0 = temp[1,2], x1 =temp[2,1], y1 = temp[2,2])
segments(x0 = temp[2,1], y0 = temp[2,2], x1 =temp[3,1], y1 = temp[3,2])
segments(x0 = temp[3,1], y0 = temp[3,2], x1 =temp[1,1], y1 = temp[1,2])

## ------------------------------------------------------------------------
library(ggplot2)
vert<- CreateVertices(testdata, "test1", "test2","test3",verticeName = T)
points<-Prob2Coord(testdata, "test1", "test2","test3", append = T)
ggplot(data = vert, aes(x,y))+geom_point( color = "red") + 
        geom_point(data = points, aes(x,y), colour = "darkgreen")

## ------------------------------------------------------------------------
ggplot(data = vert, aes(x,y))+geom_point( color = "red") + 
        geom_point(data =Prob2Coord(testdata, "test1", "test2","test3", append = T), aes(x,y, colour = cat))+
        geom_line(data = vert, aes(x,y))+
        geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]))

## ----list----------------------------------------------------------------
lines<-list(geom_line(data = vert, aes(x,y), colour = "#122b3e"),
              geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]), colour = "#122b3e" ))
 points<-list(geom_point(data = vert[1,], aes(x, y),  shape = 17,  size = 5, colour = "#cc0000"),
              geom_point(data = vert[2,], aes(x, y),  shape = 17,  size = 5, stroke = 2, colour = "#ffca00"),
              geom_point(data = vert[3,], aes(x, y),  shape = 17,  size = 5, stroke = 2, colour = "#00b300")
 )
 
  text<- list(geom_text(data = vert[1,], aes(x,y, label = "left"), vjust =1.5, hjust = 0, colour = "#cc0000") ,
               geom_text(data = vert[2,], aes(x,y, label = "top"), vjust =0, hjust = 1.5, colour = "#ffca00") ,
               geom_text(data = vert[3,], aes(x,y, label = "right"), vjust =1.5, hjust = 1, colour = "#00b300")
  )
  g<-ggplot() +lines +points + text
  g
  g+geom_point(data =Prob2Coord(testdata, "test1", "test2","test3", append = T), aes(x,y, colour = cat))

## ------------------------------------------------------------------------
g+  theme_minimal()
 #creating a new theme
 theme_heiser<-theme_grey() + theme(axis.line=element_blank(),
                                    axis.text.x=element_blank(),
                                    axis.text.y=element_blank(),
                                    axis.ticks=element_blank(),
                                    axis.title.x=element_blank(),
                                    axis.title.y=element_blank(),
                                    legend.position="bottom",
                                    panel.background=element_blank(),
                                    panel.border=element_blank(),
                                    panel.grid.major=element_blank(),
                                    panel.grid.minor=element_blank(),
                                    plot.background=element_blank())
g+geom_point(data =Prob2Coord(testdata, "test1", "test2","test3", append = T), aes(x,y, colour = cat)) +
          theme_heiser

