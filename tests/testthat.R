library(testthat)
library(heisertransform)

test_check("heisertransform")
context("general functioning of functions")
#tests
# set van gegevens maken
#
# test<-data.frame(
#         c(.80,.85,.56,.52,.52,.50,.48,.48,.44,.15,.20),
#         c(.19,.12,.22,.23,.24,.25,.26,.27,.28,.63,.06),
#         c(.01,.03,.22,.25,.24,.25,.26,.25,.28,.22,.74)
# )
# names(test)<- c("test1", "test2","test3")
# #tests voor dataset
# test$cat<-c("test1","test1","middel","middel","middel","middel","middel","middel","middel","test2","test3")
#
# mean(test$test1) #.50
# mean(test$test2) #.25
# mean(test$test3) #.25
# all.equal(m.ip, rep(m.ip[1], length(m.ip))) #TRUE
#
# coord<- Heisertransform2Coordinates(test, 1,2,3)
# coord2<- Heisertransform2Coordinates(test, 1,2,3, T )
# coord2$cat<-as.factor(coord2$cat)
# vert<- CreateVertices(test, 1,2,3, F)
# plot(vert)
# points(coord)
# #uitbreiding met ggplot
# library(ggplot2)
# plot1<-ggplot(data = data.frame(vert), aes(x,y))+geom_point()
# plot1 + geom_point(data= coord2, aes(x,y, colour = cat))
#
#
# library(testthat)
# #expectation - test
# #creer datasets die niet voldoen en kijk of de ze de juiste error geven.
#
# ### errortests
# #tests of errors inderdaad kloppen. Dus bij niet nummeriek, niet gemiddelde optellen tot 1.
#
# #check assumption that column means are equal to 1
# if(!sum(C1,C2,C3)==1){stop("column means are not equal to 1")}
