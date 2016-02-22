# creatie datasets
# 1. verschillende scheefheden
# 2. met fouten erin die error moeten geven (letters), meer dan 1,
# 50, 25, 25 ##################
n <-30
var1 <- rnorm(n, mean = .50, sd = .05)
var2<- rnorm(n, .25, 0.05)
delete<-var1+var2 >1
var1<-var1[!delete]
var2<-var2[!delete]
var3<- 1-(var1+var2)
vijftig25<-data.frame(var1, var2,var3)
rm(var1, var2, var3, n, delete)
# 80, 15, 5  #############3
n <-40
var1 <- rnorm(n, mean = .80, sd = .04)
var2<- rnorm(n, .15, 0.02)
delete<-var1+var2 >1
var1<-var1[!delete]
var2<-var2[!delete]
var3<- 1-(var1+var2)
tachtig15<-data.frame(var1, var2, var3)
rm(var1, var2, var3, n, delete)
#
# verschillende vormen plotten #################
# tachtig 15
left<-Prob2Coord(tachtig15, "var1", "var2", "var3",append = F)
top<-Prob2Coord(tachtig15,  "var2","var1", "var3",append = F)
right<-Prob2Coord(tachtig15,  "var2", "var3","var1",append = F)
plot(left$x, left$y)
plot(top$x, top$y)
plot(right$x, right$y)
leftV<-CreateVertices(tachtig15, "var1", "var2", "var3")
topV<- CreateVertices(tachtig15,  "var2","var1", "var3")
rightV<- CreateVertices(tachtig15,  "var2", "var3","var1")
plot(leftV$x, leftV$y)
plot(topV$x, topV$y)
plot(rightV$x, rightV$y)
#
# vijftig 25
left<-Prob2Coord(vijftig25, "var1", "var2", "var3",append = F)
top<-Prob2Coord(vijftig25,  "var2","var1", "var3",append = F)
right<-Prob2Coord(vijftig25,  "var1", "var3","var2",append = F)
plot(left$x, left$y)
plot(top$x, top$y)
plot(right$x, right$y)
leftV<-CreateVertices(vijftig25, "var1", "var2", "var3")
topV<- CreateVertices(vijftig25,  "var2","var1", "var3")
rightV<- CreateVertices(vijftig25,  "var2", "var3","var1")
plot(leftV$x, leftV$y)
plot(topV$x, topV$y)
plot(rightV$x, rightV$y)
#
#
#
# errors ############################
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

correct<-Prob2Coord(errorset, "var1", "var2", "var3")
errorfactor<-Prob2Coord(errorset, "var1", "var2", "varfactor") # geeft error column means are not equal
errorcharacter<-Prob2Coord(errorset, "var1", "varcharacter", "var3") # geeft error column means are not equal
errortoomuch<- Prob2Coord(errorset, "var1", "var2", "vartoomuch")# geeft error column means are not equal
errorNA<-Prob2Coord(errorset, "var1", "var2", "varNA") # error missing value where true false needed.
vert_correct<-CreateVertices(errorset, "var1", "var2", "var3")


