<!-- README.md is generated from README.Rmd. Please edit that file -->
last change 2016- 02-08

Introduction - Quick start
==========================

This package helps in visualizing probability information for 3 predicted classes. For instance with multinomial regression. It visualizes probability information from 3 classes into a 2 dimensional space. \[example\]

Use case:
=========

You have created probabilties for three groups from your multinomial, but visualizing this information is often difficult.

\[table view of three probabilties\]

\[example in one plot\]

\[animation\]{animation.gif}

To install
----------

In the future this package will be on CRAN. To install this r-package make sure you have installed devtools, and install using github

See example:

``` r
#example
library(devtools)
install_github("rmhogervorst/heisertransform")
```

Usage
-----

Make sure your dataset has both the predictors and predicted classes. The probabilities for every case need to add up to 1.

``` r
library(heisertransform)
#create vertices (corners of the triangle)
vert<-CreateVertices(df = Dataframe, var_left = "Var1", var_top = "Var2",var_right = "Var3", verticeName = T)
#Add transformed X,Y coordinates to existing dataframe
NewDataframe<-Prob2Coord(df = Dataframe, var_left = "Var1", var_top = "Var2",var_right = "Var3", append = T)
```

Background
==========

Theory

\[this needs to display how shapes change with different probabilities\]

visual display in base plot
---------------------------

visual display in ggplot2
-------------------------

We've added a theme that you can use in ggplot (it empties the entire area) And we've made some examples of lines, points and text. This can be useful when you rebuild your plots with several predictors.

ggplot elements are lists. So you can create lists that will be applied to your plot.

``` r
# plot with ggplot
lines<- function(vert, x, y, line_colour){
return(list(geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]), colour = line_colour ), #left 2 right
     geom_segment(data = vert, aes(x = x[1], xend = x[2], y= y[1], yend= y[2]), colour = line_colour ), #left to up
     geom_segment(data = vert, aes(x = x[2], xend = x[3], y= y[2], yend= y[3]), colour = line_colour )) )#right to up
}

corners<-function(vert, x, y, colour_left = "#cc0000", colour_top = "#ffca00", colour_right = "#00b300", shape = 17, size = 5, stroke = 2){
        return(list(
                geom_point(data = vert[1,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_left),
             geom_point(data = vert[2,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_top),
             geom_point(data = vert[3,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_right)
))}

text<- list(geom_text(data = vert[1,], aes(x,y, label = "left"), vjust =1.5, hjust = 0, colour = "#cc0000") ,
                     geom_text(data = vert[2,], aes(x,y, label = "top"), vjust =0, hjust = 1.5, colour = "#ffca00") ,
                     geom_text(data = vert[3,], aes(x,y, label = "right"), vjust =1.5, hjust = 1, colour = "#00b300")
        )


g<-ggplot() +lines(vert_correct, x, y,"#ffca00" )+ corners(vert_correct, x, y, size = 10)
#makes blue lines, standard colours of the vertices.
g+ text   # displays plot with texts as well.
```
