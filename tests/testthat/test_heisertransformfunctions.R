context("general functioning of functions")
source("R/heisertransformfunctions.R")
data("testdata")
a<-CreateVertices(testdata, "test1", "test2","test3",verticeName = F)
b<-CreateVertices(testdata, "test1", "test2","test3",verticeName = T)
test_that("output verticeName = T or F are identical"){
        expect_equal(a, b)
}
# library(testthat)
# #expectation - test
# #creer datasets die niet voldoen en kijk of de ze de juiste error geven.
#
# ### errortests
# #tests of errors inderdaad kloppen. Dus bij niet nummeriek, niet gemiddelde optellen tot 1.
#
# #check assumption that column means are equal to 1
# if(!sum(C1,C2,C3)==1){stop("column means are not equal to 1")}

testdata
View(testdata)
CreateVertices(F_testdata, "test1", "test2","test3",verticeName = F)
