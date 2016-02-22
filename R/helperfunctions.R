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
inputchecks<-function(df, var_left, var_top, var_right) {
        #checks if df is given, than tests if type is right.
        if(!missing(df)){
                if(!is.data.frame(df)){stop("first argument (df) should be of type data.frame")}
                namevector<-names(df)
                df.name <- deparse(substitute(df))
                if(!all(c(var_left, var_top, var_right) %in% namevector)){stop(paste("some or all vars are not part of ",df.name))}
                if(!is.vector(df[, var_left])){stop("var_left should be a vector")}
                if(!is.vector(df[, var_top])){stop("var_top should be a vector")}
                if(!is.vector(df[, var_right])){stop("var_right should be a vector")}
        }else {
                if(!is.vector(var_left)){stop("var_left should be a vector")}
                if(!is.vector(var_top)){stop("var_top should be a vector")}
                if(!is.vector(var_right)){stop("var_right should be a vector")}

        }
       }