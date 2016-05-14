<!-- README.md is generated from README.Rmd. Please edit that file -->
last change 2016-05-14

Buildstatus: [![Build Status](https://travis-ci.org/RMHogervorst/heisertransform.svg?branch=develop)](https://travis-ci.org/RMHogervorst/heisertransform)

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

Introduction - Quick start
==========================

An implementation of heiser (2004) that helps to visually display relative probabilities to categorical assignment. Vertices, representing the relative frequency of the categories, form the corners of a triangle. Individual points in the triangle have a relative position based on strength of association towards the vertices (category). Thus points closer to a vertice have a larger probability towards that category.

This triangle approach is distinct from other triangle plots known as terniary plots, trilinear diagrams or triplots where every side of the triangle displays a dimension, effectively creating a triangular coordinate system. In our approach the relative probabilities are transformed to an euclidian 2-dimensional space, making direct distance comparisons possible.

This package creates the vertices and coordinates for three categorical probabilities that can be plotted with the plotting system of your choice. For background information, the method and higher dimensional generalizations: Geometric representation of association between categories, 2004 , Psychometrika VOL. 69, NO. 4, 513-545.

This package helps in visualizing probability information for 3 predicted classes. For instance with multinomial regression. It visualizes probability information from 3 classes into a 2 dimensional space.

Use case:
=========

You have created probabilties for three groups and would like to visualize this information into one display. example:

    #>         prob1      prob2       prob3
    #> 2  0.39143032 0.15034331 0.458226367
    #> 3  0.80908791 0.13547412 0.055437969
    #> 6  0.65617109 0.04604095 0.297787966
    #> 7  0.71839035 0.27416037 0.007449279
    #> 8  0.68172149 0.15086560 0.167412909
    #> 9  0.55277652 0.33034146 0.116882023
    #> 10 0.53704427 0.26969720 0.193258526
    #> 11 0.69304521 0.09712462 0.209830174
    #> 13 0.67209311 0.23902619 0.088880704
    #> 14 0.57037413 0.13383810 0.295787768
    #> 15 0.44165274 0.06258873 0.495758535
    #> 18 0.77516814 0.04106644 0.183765418
    #> 19 0.61447078 0.09886438 0.286664845
    #> 20 0.48066073 0.34819379 0.171145477
    #> 21 0.57307137 0.02728408 0.399644554
    #> 22 0.77941870 0.04618313 0.174398167
    #> 24 0.44312494 0.43429426 0.122580801
    #> 26 0.45822637 0.15034331 0.391430323
    #> 27 0.05543797 0.80908791 0.135474121
    #> 30 0.04604095 0.29778797 0.656171088
    #> 31 0.27416037 0.71839035 0.007449279
    #> 32 0.16741291 0.68172149 0.150865600
    #> 33 0.33034146 0.11688202 0.552776518
    #> 34 0.26969720 0.53704427 0.193258526
    #> 35 0.09712462 0.69304521 0.209830174
    #> 37 0.08888070 0.67209311 0.239026189
    #> 38 0.29578777 0.13383810 0.570374134
    #> 39 0.49575854 0.44165274 0.062588729
    #> 42 0.04106644 0.77516814 0.183765418
    #> 43 0.28666484 0.61447078 0.098864379
    #> 44 0.34819379 0.48066073 0.171145477
    #> 45 0.39964455 0.57307137 0.027284079
    #> 46 0.04618313 0.77941870 0.174398167
    #> 48 0.43429426 0.44312494 0.122580801

example in one plot

``` r
library(heisertransform)
coordinates <- Prob2Coord(example_data, "prob1", "prob2", "prob3")
library(ggplot2)
ggplot(data = coordinates, aes(x,y)) + geom_point() + 
        geom_point(data = CreateVertices(example_data, "prob1", "prob2", "prob3"), 
                   aes(x, y) , color = "red", pch = 17, size = 5)
```

![](README-display%20of%20variables-1.png)<!-- -->

![](README-example%20lines%20points%20texts-1.png)

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

<img src="NOTINPACKAGE/files/triangle_movement.gif" height="400px" width="400px" />

Visual display in base plot
---------------------------

``` r
library(heisertransform)
temp<-CreateVertices(testdata, "test1", "test2","test3",verticeName = FALSE)
plot(temp, main = "Endresult of heisertransform", pch = 17, col = "red")
points(Prob2Coord(testdata, "test1", "test2","test3"), col= "darkgreen", pch = 19)
segments(x0 = temp[1,1], y0 = temp[1,2], x1 =temp[2,1], y1 = temp[2,2])
segments(x0 = temp[2,1], y0 = temp[2,2], x1 =temp[3,1], y1 = temp[3,2])
segments(x0 = temp[3,1], y0 = temp[3,2], x1 =temp[1,1], y1 = temp[1,2])
```

![](README-unnamed-chunk-2-1.png)<!-- -->

Advanced visual display in ggplot2
----------------------------------

We've added a theme that you can use in ggplot (it empties the entire area) And we've made some examples of lines, points and text. This can be useful when you rebuild your plots with several predictors.

ggplot elements are lists. So you can create lists that will be applied to your plot.

``` r
# plot with ggplot
library(ggplot2)
lines<- function(vert, x, y, line_colour){
        return(list(geom_segment(data = vert, aes(x = x[1], xend = x[3], y= y[1], yend= y[3]), colour = line_colour ),
     geom_segment(data = vert, aes(x = x[1], xend = x[2], y= y[1], yend= y[2]), colour = line_colour ), #left to up
     geom_segment(data = vert, aes(x = x[2], xend = x[3], y= y[2], yend= y[3]), colour = line_colour )) )#right to up
}

corners<-function(vert, x, y, colour_left = "#cc0000", colour_top = "#ffca00", colour_right = "#00b300", shape = 17, size = 5, stroke = 2){
        return(list(
                geom_point(data = vert[1,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_left),
             geom_point(data = vert[2,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_top),
             geom_point(data = vert[3,], aes(x, y),  shape = shape,  size = size, stroke = stroke, colour = colour_right)
))}


points<-Prob2Coord(testdata, "test1", "test2","test3", append = T)
g<-ggplot() +lines(temp, x, y,"blue" )+ corners(temp, x, y, size = 5) + geom_point(data =points, aes(x,y, colour = cat)) + theme_minimal()
#makes blue lines, standard colours of the vertices.
print(g)
```

![](README-example%20lines%20points%20texts-1.png)<!-- -->
