#Instruction: First, run line 8 to the end). To create a table, use the function cor.csv(dataframe,"tablename.csv") where "dataframe" is replaced with your dataframe, and "tablename" is replaced with the name of your csv file. After you run it, a new csv file will created at your working directory.

#Example
library(car)
cor.csv(mtcars,"table1.csv")

cor.csv<-function(x,y){
meanna<-function(a){x<-mean(a,na.rm =T)
print(x)}
sdna<-function(a){x<-sd(a,na.rm =T)
print(x)}

#the corstars.bai.edited function is a Bai edited version of the code from here that someone else wrote http://www.sthda.com/english/wiki/elegant-correlation-table-using-xtable-r-package
corstars.bai.edited<-function(x, method=c("pearson", "spearman"), removeTriangle=c("upper", "lower"),
result=c("none", "html", "latex")){
#Compute correlation matrix
require(Hmisc)
x <- as.matrix(x)
correlation_matrix<-rcorr(x, type=method[1])
R <- correlation_matrix$r # Matrix of correlation coeficients
p <- correlation_matrix$P # Matrix of p-value

## Define notions for significance levels; spacing is important.
mystars <- ifelse(p < .001, "***", ifelse(p < .01, "** ", ifelse(p < .05, "* ", ifelse(p < .10, "+ ", " "))))

## trunctuate the correlation matrix to two decimal
R <- format(round(cbind(rep(-1.11, ncol(x)), R), 2))[,-1]

## build a new matrix that includes the correlations with their apropriate stars
Rnew <- matrix(paste(R, mystars, sep=""), ncol=ncol(x))
diag(Rnew) <- paste(diag(R), " ", sep="")
rownames(Rnew) <- colnames(x)
colnames(Rnew) <- paste(colnames(x), "", sep="")

## remove upper triangle of correlation matrix
if(removeTriangle[1]=="upper"){
Rnew <- as.matrix(Rnew)
Rnew[upper.tri(Rnew, diag = TRUE)] <- ""
Rnew <- as.data.frame(Rnew)
}

## remove lower triangle of correlation matrix
else if(removeTriangle[1]=="lower"){
Rnew <- as.matrix(Rnew)
Rnew[lower.tri(Rnew, diag = TRUE)] <- ""
Rnew <- as.data.frame(Rnew)
}

## remove last column and return the correlation matrix
Rnew <- cbind(Rnew[1:length(Rnew)-1])
if (result[1]=="none") return(Rnew)
else{
if(result[1]=="html") print(xtable(Rnew), type="html")
else print(xtable(Rnew), type="latex")
}
}

a<-as.data.frame(cbind(data.frame("Mean"=round(apply(x,2,meanna),2),
"SD"=round(apply(x,2,sdna),2)),
corstars.bai.edited(x)))
print(a)
write.csv(a,y)

}
