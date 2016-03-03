context("general functioning of functions")
#source("R/heisertransformfunctions.R")
#

test_that("output verticeName = T or F are identical",{
        data("testdata")
        a<-CreateVertices(testdata, "test1", "test2","test3",verticeName = FALSE)
        b<-CreateVertices(testdata, "test1", "test2","test3",verticeName = TRUE)
        expect_equal(a, b[,-3])
})
test_that("vertices_create returns dataframe",{
        expect_true(class(vertices_create(0.5,0.25,0.25))=="data.frame")
        expect_true(vertices_create(0.5,0.25,0.25)[2,1] == 0)
        expect_true(vertices_create(1,1,1)[1,2] == -Inf)
        })
test_that("check_and_fix_num works",{

        class(check_and_fix_num(rnorm(7)))=="numeric"
        class(check_and_fix_num(as.character(rnorm(7))))=="numeric"

})
test_that("CreateVertices creates a dataframe of 3 by 3", {
        #CreateVertices(var_left =  errorset$var1, var_top= errorset$var2, var_right= errorset$var3)[4,]
        expect_equal(dim(CreateVertices(testdata, "test1", "test2","test3",verticeName = FALSE))[1], 3)
        expect_equal(dim(CreateVertices(testdata, "test1", "test2","test3",verticeName = TRUE))[1], 3)
})

test_that("valid types ARE accepted by inputchecks", {
        expect_silent(inputchecks(iris, "Sepal.Length", "Sepal.Width",  "Petal.Length"))
})