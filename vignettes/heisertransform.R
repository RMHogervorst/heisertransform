## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))

## ----example file with plot----------------------------------------------
# library(heisertransform)
# test<-data.frame(
#         c(.80,.85,.56,.52,.52,.50,.48,.48,.44,.15,.20),
#         c(.19,.12,.22,.23,.24,.25,.26,.27,.28,.63,.06),
#         c(.01,.03,.22,.25,.24,.25,.26,.25,.28,.22,.74)
# )
# names(test)<- c("test1", "test2","test3")
# #tests voor dataset
# test$cat<-c("test1","test1","middel","middel","middel","middel","middel","middel","middel","test2","test3")
# 
# coord<- Heisertransform2Coordinates(test, 1,2,3)
# # coord2<- Heisertransform2Coordinates(test, 1,2,3, T )
# # coord2$cat<-as.factor(coord2$cat)
# vert<- CreateVertices(test, 1,2,3, F)
# plot(vert)
# points(coord)

