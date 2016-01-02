#' heisertransform: Transforms 3 Categorical Probabilities Into X,Y Coordinates.
#'
#' Based on Heiser 2004, this package transforms 3 categories
#' of f.i. multinomial regression into points in a 2d space.
#' Probabilities of every row are than transformed
#' into xy coordinates so that points are arranged in proportion to probability.
#' There are 2 functions: Prob2coord and CreateVertices.
#' See also:
#'         Geometric representation of association between categories, 2004 ,
#'         Psychometrika  VOL. 69,  NO. 4, 513-545
#'
#' @section CreateVertices function:
#' The CreateVertices function returns 3 points of a triangle that represent the
#' three categories.
#'
#'  @section Prob2Coord function:
#'  The Prob2Coord function transforms every row into x and y coordinates.
#'  It uses the CreateVertices function to create the vertices and these vertices
#'  are then used to transform the x and y coordinates.
#'
#' @docType package
#' @name heisertransform
NULL
#> NULL