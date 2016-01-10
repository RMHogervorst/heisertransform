#tests
# om te zien waar het misgaat
#
# ISSUE 1.
#Differences in output between:
# CreateVertices(testdata, "test1", "test2","test3",verticeName = T)
# vs
# CreateVertices(testdata, "test1", "test2","test3",verticeName = F).
# Verticename true creates a data frame. False creates a matrix.
# COMMENT ON ISSUE 1
#
#
# For reasons I do not yet understand the endresult of CreateVertices with VerticeName = TRUE
# results in a data frame with x and y and names factors
#
# getting back to numeric with this step.
#
# vert$x<-as.numeric(levels(vert$x))[vert$x]
# vert$y<-as.numeric(levels(vert$y))[vert$y]
#

test1 <-CreateVertices(test, "test2", "test1", "test3")
test2<-CreateVertices(test, "test2", "test1", "test3", verticeName = F)
test3<-CreateVertices(test, "test2", "test1", "test3", verticeName = FALSE)
identical(test2, test3) #true


class(test1) #data.frame
class(test2) # matrix



