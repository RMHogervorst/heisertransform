### Helperfuncties
## create vertices
vertices_create<-function(C1,C2,C3){
#V1
        v1a<- -sqrt(C3/(C1*(C1+C3)))
        v1b<- -sqrt(C2/(1-C2))
        V1<- c( v1a, v1b)
#V2
        v2a<-0
        v2b<-sqrt((1-C2)/C2)
        V2<- c( v2a, v2b)
#V3
        v3a<-sqrt(C1/(C3*(C1+C3)))
        v3b<- -sqrt(C2/(1-C2))
        V3<- c(v3a, v3b)
rm(v1a, v1b,v2a,v2b, v3a,v3b)
vertices<-as.data.frame(rbind(V1,V2,V3)) #matrix into dataframe
vertices
}
## check and fix variables.
check_and_fix_num<-function(variablename){
        if(!class(variablename)== "numeric"){variablename<-as.numeric(variablename)}
        return(variablename)
}