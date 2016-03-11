<!-- README.md is generated from README.Rmd. Please edit that file -->
last change 2016-03-11

Buildstatus: [![Build Status](https://travis-ci.org/RMHogervorst/heisertransform.svg?branch=develop)](https://travis-ci.org/RMHogervorst/heisertransform)

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)

Introduction - Quick start
==========================

This package helps in visualizing probability information for 3 predicted classes. For instance with multinomial regression. It visualizes probability information from 3 classes into a 2 dimensional space.

Use case:
=========

You have created probabilties for three groups from your multinomial, but visualizing this information is often difficult.

``` r
library(heisertransform)
testdata
#>    test1 test2 test3    cat
#> 1   0.80  0.19  0.01  test1
#> 2   0.85  0.12  0.03  test1
#> 3   0.56  0.22  0.22 middel
#> 4   0.52  0.23  0.25 middel
#> 5   0.52  0.24  0.24 middel
#> 6   0.50  0.25  0.25 middel
#> 7   0.48  0.26  0.26 middel
#> 8   0.48  0.27  0.25 middel
#> 9   0.44  0.28  0.28 middel
#> 10  0.15  0.63  0.22  test2
#> 11  0.20  0.06  0.74  test3
```

example in one plot

![](README-example%20lines%20points%20texts-1.PNG)

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

![](README-unnamed-chunk-3-1.png)<!-- -->

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
