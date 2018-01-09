## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----eval=F--------------------------------------------------------------
## if (test_expression) {
##    statement
## }

## ----eval=F--------------------------------------------------------------
## num <- 5    ##change num to 6
## if (num %% 2 ==1) {   ###remove ==!0
##   print("num is even") ##change print to cat
## }
## if (num %% 2 ==1) {print("num is even")} ##omit the {}
## #double Percent sign
## ## %%  reminder x mod y ## %/% mode
## 7 %% 2
## 7 %/%2
## x<-c(1.2,2,4,5,8)
## x%%1==0

## ----eval=F--------------------------------------------------------------
## if (test_expression) {
##    statement1
## } else {
##    statement2
## }

## ----eval=F--------------------------------------------------------------
## num <- 5   ###change num to 6
## if (num %% 2 != 0) {
##   cat(num,"is odd")
## }else{    ###change the position of {}
##   cat(num,"is even")
##   }

## ----eval=F--------------------------------------------------------------
## num <- 6   ###change num to 6
## if(num %% 2 != 0) cat(num, "is odd") else cat(num,"is even")
## y<-if (num %% 2 != 0) 'odd' else 'even'
## y
## 

## ----eval=F--------------------------------------------------------------
## if ( test_expression1) {
##    statement1
## } else if ( test_expression2) {
##    statement2
## } else if ( test_expression3) {
##    statement3
## } else
##    statement4

## ----eval=F--------------------------------------------------------------
## num <- 3
## if (num < 0) {
##    print(paste0(num," is a Negative number"))
## } else if (num > 0) {
##    print(paste0(num, " is a positive number"))
## } else
##    print(paste0(num, " is Zero"))
## 

## ----eval=F--------------------------------------------------------------
## ifelse(test_condition, true_value, false_value)

## ------------------------------------------------------------------------
 a = c(5,7,2,9)
 ifelse(a %% 2 == 0,"even","odd")

## ----eval=F--------------------------------------------------------------
## centre = function(x, type) {
##   switch(type,
##          mean = mean(x),
##          median = median(x),
##          trimmed = mean(x, trim = .1))
## }
## a = rnorm(10)
## centre(x=a, type="mean")
## centre(x=a, type="median")
## centre(x=a, type="trimmed")

## ----eval=F--------------------------------------------------------------
## for (counter in vector) {commands}

## ----echo=F--------------------------------------------------------------
for (i in 1:12){
  cat(i,month.name[i],sep="\t")
  cat('\n') 
#   print(paste(i,month.name[i],sep=":"))
}

## ----eval=F--------------------------------------------------------------
## for (i in 1:12){
##   cat(i,month.name[i],sep="\t")
##   cat('\n')
## #   print(paste(i,month.name[i],sep=":"))
## }

## ------------------------------------------------------------------------
x<-0    ###note the importance of assign an initial value to x
for (i in 1:100){  ## add if (i%%2!=0){}
# if (i%%2!=0)
  x<-x+i  
}
x
# sum(seq(1,100,by=2))

## ----echo=F--------------------------------------------------------------
value0=100 #change 100 to 100000
x = seq(-value0,value0,by=2)  
y=NULL
##possible mistake 1   # value.cubed=NULL
for (i in 1:length(x)){
y[i]<-x[i]^2  
##possible mistake 2  # value.cubed[i]<-value[i]^3  
}
plot(x,y,type='l',col='blue')
##curvature for y=x^2 
# lines(value,value.cubed,col='blue')
# summary(value.squared)

## ----eval=F--------------------------------------------------------------
## value0=100 #change 100 to 100000
## x = seq(-value0,value0,by=2)
## y=NULL
## ##possible mistake 1   # value.cubed=NULL
## for (i in 1:length(x)){
## y[i]<-x[i]^2
## ##possible mistake 2  # value.cubed[i]<-value[i]^3
## }
## plot(x,y,type='l',col='blue')
## ##curvature for y=x^2
## # lines(value,value.cubed,col='blue')
## # summary(value.squared)

## ----eval=F--------------------------------------------------------------
## start=Sys.time()
## value = seq(1,10000000,by=2)   ###the disadvantage of R.
## value.squared=NULL ###value.squared<-rep(NA,length(value))
## length(value)
## for (i in 1:length(value)){
## value.squared[i]<-value[i]^2
## }
## # value.squared<-!is.na(value.squared)
## summary(value.squared)
## end<-Sys.time()
## end-start

## ------------------------------------------------------------------------
rm(list=ls())
start=Sys.time() 
value.squared<-sapply(seq(1,10000000,by=2),function(x) x^2)
end<-Sys.time()
end-start

## ----eval=T--------------------------------------------------------------
load('data/mydata.rdata')
head(mydata)
dim(mydata)

## ------------------------------------------------------------------------
load('data/mydata.rdata')
mydata$agegroup<-1
if (mydata$age>=20)
  mydata$agegroup<-3

## ----eval=F--------------------------------------------------------------
## load('data/mydata.rdata')
## # head(mydata)
## mydata$agegroup<-0
## for (i in 1:10){
##   if (mydata$age[i]<=10) {
##       mydata$agegroup[i]<-1
##   }else if (mydata$age[i]>10 & mydata$age[i]<20){
##       mydata$agegroup[i]<-2
##   }else if (mydata$age[i]>=20) {
##     mydata$agegroup[i]<-3
## }
## }
## head(mydata)

## ----eval=F--------------------------------------------------------------
## load('data/mydata.rdata')
## head(mydata)
## mydata$agegroup<-ifelse(mydata$age>10,1,0)
## head(mydata)

## ------------------------------------------------------------------------
load('data/mydata.rdata')
mydata$agegroup<-ifelse(mydata$age<=10,1,
ifelse(mydata$age>10&mydata$age<20,2,3))
head(mydata)

## ------------------------------------------------------------------------
load('data/mydata.rdata')
     mydata$agegroup[mydata$age<=10]<-1
     mydata$agegroup[mydata$age>10&mydata$age<20]<-2
     mydata$agegroup[mydata$age>20]<-3
head(mydata)

## ---- eval=FALSE---------------------------------------------------------
## while (condition) {
##   statements
## }

## ------------------------------------------------------------------------
i = 0
while (i <10) {
  i = i + 1
  print(i)
}

## ------------------------------------------------------------------------
data<-data.frame(ID=paste0('a',1:10),
           num=c(0.1,0.2,0.3,0.4,0.3,0.5,0.6,0.7,0.8,0.5))
for (i in 1:9) {
  cat(paste0(i,":",data[i,'num']<data[i+1,'num']))
  cat("\n")
}

## ------------------------------------------------------------------------
i=0
while (i<9) {
  i=i+1
  cat(paste0(i,":",data[i,'num']<data[i+1,'num']))
  cat("\n")
  # print(i)
}

## ------------------------------------------------------------------------
myseq<-NULL
myseq[1] = 0
myseq[2] = 1
for (i in 3:12) {
  myseq[i] = myseq[i-2] + myseq[i-1]
}
myseq

## ------------------------------------------------------------------------
myseq[1] = 0
myseq[2] = 1
i = 2
currentVal = 1
while (currentVal < 500) {
  myseq[i+1] = currentVal
  currentVal = myseq[i] + myseq[i+1]
  i = i+1
}

myseq

## ------------------------------------------------------------------------
for (i in seq(1,10)) {
  if (i == 5) {
    next
  }
  print(i)
}

## ------------------------------------------------------------------------
val = 0
i = 0
while(TRUE) {
  i = i + 1
  val = val + rnorm(1)
  if (abs(val) > 3) {
    break
  }
}
val
i

## ----echo=F,warning=F----------------------------------------------------
###random walk
for (s in 1:3){
z<-15;i=1;data<-NULL
while(z>=0&&z<=30){
                    data=rbind(data,cbind(i,z))
                    coin <- rbinom(1, 1, 0.5)
                    if(coin == 1) { ## random walk
                      z<-z+1
                    }else{ z<-z-1
                    } 
                    i=i+1
}
data<-as.data.frame(data)
 par(new=TRUE)
plot(data$i,data$z,type="l",col='red',xlim=c(0,500),ylim=c(-20,40),xlab="times",ylab="threshold")
}

abline(h=30)
abline(h=0)

## ----eval=F--------------------------------------------------------------
## ###random walk
## for (s in 1:3){
## z<-15;i=1;data<-NULL
## while(z>=0&&z<=30){
##                     data=rbind(data,cbind(i,z))
##                     coin <- rbinom(1, 1, 0.5)
##                     if(coin == 1) { ## random walk
##                       z<-z+1
##                     }else{
##                       z<-z-1
##                     }
##                     i=i+1
## }
## data<-as.data.frame(data)
## par(new=TRUE)
## plot(data$i,data$z,type="l",col='red',xlim=c(0,500),ylim=c(-20,40),xlab="times",ylab="threshold")
## }
## 
## abline(h=30)
## abline(h=0)

