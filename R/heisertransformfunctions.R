# a set of functions to transform your probability to 3 categories into x.y coordinates.
#
# Roel M. Hogervorst, Vincent J. Buurman
# created december 2015, Leiden University
# based on the work of Willem J Heiser (2004)
# Geometric representation of association between categories, 2004 ,Psychometrika  VOL. 69,  NO. 4, 513-545
#
#
## Description of functions ##
#  Heisertransform2Coordinates transforms the probabilies into x,y coordinates
#  CreateVertices creates a separate dataframe for the vertices
#CreateVertices, a function to create vertices.
#

#' CreateVertices Transforms categorical probabilities into vertices with x.y coordinates.
#'
#' Select your data frame and the three variables with probabilities.
#' The returning dataframe will have the x and y coordinates of the 3 points
#' that represent the vertices.
#' Plot the vertices and use Prob2coord() to create the xy coordinates for all the rows.
#'
#' @param df The data frame where variables can be found.
#' @param var_left,var_top,var_right Columns in df that contain
#' probabilities per row, use "columnnames", names (left, top, right)
#' refer to place in final triangle.
#' @param verticeName Do you want to return the names of the columns in the
#' final data frame?.
#' @examples
#' \dontrun {CreateVertices(testdata, "test1", "test2","test3",verticeName = F)}
#' @family Heiser transform functions
#' @export
CreateVertices <- function(df, var_left, var_top, var_right, verticeName = T) {
        #assigning variables
        varLeft <- df[, var_left]
        varTop <- df[, var_top]
        varRight<- df[, var_right]
        #checks for numeric data
        varLeft<-check_and_fix_num(varLeft)
        varTop<-check_and_fix_num(varTop)
        varRight<-check_and_fix_num(varRight)
        #create vertices
        C1<-mean(varLeft)
        C2<-mean(varTop)
        C3<-mean(varRight)
        #check assumption that column means are equal to 1
        if(!sum(C1,C2,C3)==1){stop("column means are not equal to 1")}
        vertices<-vertices_create(C1,C2,C3)
        if(verticeName == TRUE) {
           vertices<-cbind(vertices, c(var_left,var_top,var_right))
        colnames(vertices)<-c("x", "y", "names")
        return(vertices)
        } else if(verticeName == FALSE){
        colnames(vertices)<- c("x","y")
                return(vertices)
        }else stop("verticeName needs to be TRUE or FALSE")
}

#' Transforms categorical probabilities of every row into x.y coordinates.
#'
#' Select your data frame and the three variables with probabilities.
#' The returning dataframe will have the x and y coordinates for every row.
#' When used in conjuction with CreateVertices() plot the vertices
#' and add the points.
#'
#' @param df The data frame where variables can be found.
#' @param var_left,var_top,var_right Columns in df that contain
#' probabilities per row, use "columnnames", names (left, top, right)
#' refer to place in final triangle.
#' @param append Return with or without original data frame?.
#' @examples
#' \dontrun {Prob2Coord(testdata, "test1", "test2","test3",append = TRUE)}
#' @family Heiser transform functions
#' @export
Prob2Coord<-function(df, var_left, var_top, var_right, append=FALSE) {
        #assigning variables
        varLeft <-df[,var_left]
        varTop <- df[,var_top]
        varRight<-df[,var_right]
        #checks for numeric data
        varLeft<-check_and_fix_num(varLeft)
        varTop<-check_and_fix_num(varTop)
        varRight<-check_and_fix_num(varRight)
        vertices<-CreateVertices(df, var_left, var_top, var_right, verticeName = FALSE)
        #create dataframe
        M<-data.frame(varLeft, varTop, varRight)
        m.pp <- sum(M)
        m.ip <- rowSums(M)
        #m.jp <- colSums(M)
        #check row sums assumption
        if(!all.equal(m.ip, rep(m.ip[1], length(m.ip))) ) stop("row sums are not identical")
        P <- M/m.pp
        r.i <- m.ip[1]/m.pp
        X <- 1/r.i * as.matrix(P) %*% as.matrix(vertices)
        colnames(X)<-c("x", "y")
        X<-data.frame(X)
        ifelse(append == TRUE, return(cbind(df, X)), return(X))
}

