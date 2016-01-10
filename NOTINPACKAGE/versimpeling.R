#versimpeling
#dit kan simpeler.
#Prob2Coord<-function(df, var_left, var_top, var_right, append=FALSE) {
#assigning variables
varLeft <-df[,var_left]
varTop <- df[,var_top]
varRight<-df[,var_right]
#checks for numeric data
if(!class(varLeft)== "numeric"){varLeft<-as.numeric(varLeft)}
if(!class(varTop)== "numeric"){as.numeric(varTop)}
if(!class(varRight)== "numeric"){varRight<-as.numeric(varRight)}
#
check_and_fix_num<-function(variablename){
        if(!class(variablename)== "numeric"){variablename<-as.numeric(variablename)}
        return(variablename)
        }
for (lijst in names(lijst)) {lijst<-check_and_fix_num(lijst) }
class(varLeft) == "numeric"
varLeft<-as.numeric(varLeft)



lapply(names(c(varRight, varTop, varLeft)), check_and_fix_num)
varLeft<-check_and_fix_num(varLeft)

#check_and_fix_num(c(varLeft, varTop, varRight)) dit werkt niet
lijst<-list(varLeft, varTop,varLeft) #werkt ook niet.
#lapply(lijst, check_and_fix_num) dit en sapply werkt niet.
varLeft<-as.character(varLeft)
varRight<-as.character(varRight)
class(varLeft)
class(varRight)
#sapply(c(varLeft, varTop, varRight), class)#
sapply(varLeft, class)
class(varLeft)
names()
check_and_fix_num(varLeft)
