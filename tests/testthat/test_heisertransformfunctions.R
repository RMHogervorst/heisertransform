context("general functioning of functions")
#source("R/heisertransformfunctions.R")
#


test_that("output verticeName = T or F are identical",{
        data("testdata")
        a<-CreateVertices(testdata, "test1", "test2","test3",verticeName = F)
        b<-CreateVertices(testdata, "test1", "test2","test3",verticeName = T)
        expect_equal(a, b[,-3])
})
# test that all the seperate functions create output they should have
# test that vertices_create works
# test that  check_and_fix_num works
test_that("vertices_create returns dataframe",{
        expect_true(class(vertices_create(0.5,0.25,0.25))=="data.frame")
        expect_true(vertices_create(0.5,0.25,0.25)[2,1] == 0)
        expect_true(vertices_create(1,1,1)[1,2] == -Inf)
        })
test_that("check_and_fix_num works",{

        class(check_and_fix_num(rnorm(7)))=="numeric"
        class(check_and_fix_num(as.character(rnorm(7))))=="numeric"

})