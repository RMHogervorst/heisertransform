context("general functioning of errors and warnings")
##  creation of errorsdataset
n <-15
var1 <- rnorm(n, mean = .40, sd = .04)
var2<- rnorm(n, .30, 0.02)
delete<-var1+var2 >1
var1<-var1[!delete]
var2<-var2[!delete]
var3<- 1-(var1+var2)
varfactor<-as.factor(var3)
varcharacter<-as.character(var3)
vartoomuch<-var2*2  # will be more than 1.
vartoolittle<-var1*.5 # will be less than 1
varNA<-var3
varNA[which(varNA %in% sample(varNA, 3, replace = T))]<-NA
errorset<-data.frame(var1, var2, var3, varfactor, varcharacter, vartoomuch, vartoolittle, varNA)
rm(n,delete, var1, var2, var3, varfactor, varcharacter, vartoomuch,vartoolittle, varNA)

test_that("errors column means are correct", {
        expect_error(Prob2Coord(errorset, "var1", "var2", "vartoomuch"),regexp = "column means are not equal")
})
test_that("check and fix num gives error with unconvertible characters", {
        expect_warning(check_and_fix_num(sample(letters, 8)), regexp = "NAs")
})
test_that("verticeName error works", {
        expect_error(CreateVertices(errorset,"var1", "var2", "var3", verticeName = "name"), regexp = "verticeName needs to be TRUE or FALSE")
})
test_that("rowsums larger or smaller than 1 are failing", {
        expect_error(CreateVertices(errorset,"var1", "var2", "vartoomuch", verticeName = T),regexp = "column means are not equal to 1" )
        expect_error(CreateVertices(errorset,"var1", "var2", "vartoolittle", verticeName = T),regexp = "column means are not equal to 1" )
})
test_that("invalid input gives error",{
        expect_error(CreateVertices(testdata, test1, "test2", "test3" ))
        expect_error(CreateVertices(testdata, "test1", "Test2", "test3" ), regexp = "undefined columns selected")
        expect_error(Prob2Coord(errorset, "var1", "var2", "var_na" ), regexp = "undefined columns selected")
        expect_error(Prob2Coord(errorset$var1, "var1", "var2", "var3" ), regexp = "should be of type data.frame")
        expect_error(Prob2Coord(iris, "Sepal.Length", "Sepal.Width",  "Petal.Length"), regexp = "column means are not equal to 1")
})