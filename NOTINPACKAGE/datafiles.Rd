\name{testdata}
\alias{testdata}
\docType{data}
\title{
Probabilities in a simple dataset.
}
\description{
Dataset with the only property that
all the rows from test1 to test3 sum up to 1
}
\usage{data("testdata")}
\format{
  A data frame with 11 observations on the following 4 variables.
  \describe{
    \item{\code{test1}}{numeric vector under 1}
    \item{\code{test2}}{numeric vector under 1}
    \item{\code{test3}}{numeric vector under 1}
    \item{\code{cat}}{a character vector describing the location of the point}
  }
}

\examples{
data(testdata)
plot(CreateVertices(testdata, "test1", "test2","test3",verticeName = FALSE),col = "red")
points(Prob2Coord(testdata, "test1", "test2","test3"), col= "darkgreen", pch = 19)
}
\keyword{datasets}
