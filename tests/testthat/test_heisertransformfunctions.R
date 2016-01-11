context("general functioning of functions")
source("R/heisertransformfunctions.R")
data("testdata")

# errors
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
varNA<-var3
varNA[which(varNA %in% sample(varNA, 3, replace = T))]<-NA
errorset<-data.frame(var1, var2, var3, varfactor, varcharacter, vartoomuch, varNA)
rm(n,delete, var1, var2, var3, varfactor, varcharacter, vartoomuch, varNA)
a<-CreateVertices(testdata, "test1", "test2","test3",verticeName = F)
b<-CreateVertices(testdata, "test1", "test2","test3",verticeName = T)
test_that("output verticeName = T or F are identical",{
        expect_equal(a, b[,-3])
}
)
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
?test