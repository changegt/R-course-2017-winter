## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----eval=F--------------------------------------------------------------
## func = function (optional_arguments){
##    interesting statement(s)
## }
## 

## ------------------------------------------------------------------------
f<-function(){
  }
class(f)
f()

## ---- eval=F-------------------------------------------------------------
## func <- function (x) {
##    x^2 + 5*x + 2
## }
## func(3)

## ------------------------------------------------------------------------
f<-function(num){
  hello<-'Hello World!\n'
  for (i in 1:num){
    value<-cat(hello)
  }
}
data<-f(3)

## ----eval=F--------------------------------------------------------------
## f<-function(num=3){
##   hello<-'Hello World!\n'
##   for (i in 1:num)){
##     value<-cat(hello)
##   }
## }
## f(num=2)

## ----fig.height=2.8------------------------------------------------------
histnormal = function(n) {
  set.seed(1234)
  values = rnorm(n);hist(values)
   max(values)
   # return(values)
    invisible(max(values))
            }# max(values)

a<-histnormal(1000)
# max = histnormal(1000);max

## ---- echo=TRUE, results='markup', fig.cap=""----------------------------
func = function(num, benchmark=0, multiplier=3) {
  if (num < benchmark) {
    return(num / multiplier)
  } else {
    return(num * multiplier)
  }
}
func(7)

## ------------------------------------------------------------------------
func(7, 3)
func(7, 3, 4)

## ----eval=F--------------------------------------------------------------
## func(7, multiplier=3,benchmark=4)

## ----echo=F--------------------------------------------------------------
par(mfrow=c(2,2))
func<-function(x){
demo<-rnorm(x,mean=0,sd=1) 
hist(demo, freq=FALSE,col="cornflowerblue",main=paste("histogram with",x,'sample'),xlim=c(-4,4),ylim=c(0,0.4))
curve(dnorm(x), add=TRUE, col="red", lwd=2)
}
sapply(c(50,100,1000,10000),func)

## ----eval=F--------------------------------------------------------------
## par(mfrow=c(2,2))
## func<-function(x){
## demo<-rnorm(x,mean=0,sd=1)
## hist(demo,freq=FALSE,col="cornflowerblue",
##      main=paste("histogram with",x,'sample'),xlim=c(-4,4),ylim=c(0,0.5))
## curve(dnorm(x), add=TRUE, col="red", lwd=2)
## }
## # func(50)
## sapply(c(50,100,1000,1000000),func)
## 

## ------------------------------------------------------------------------
sapply(iris[,1:4],
 function(x) {sd(x,na.rm=T)/mean(x,na.rm=T)})

## ------------------------------------------------------------------------
x <- 1:4
lapply(x, runif, min = 0, max = 10)

## ------------------------------------------------------------------------
f<- function(x,y){
              x^2
}
f(3)
f(3,4)

## ----eval=F--------------------------------------------------------------
## f<- function(x,y){
##               print(x^2)
##               print(y^3)
## }
## f(3)
## f(3,4)

## ---- eval=F-------------------------------------------------------------
## with(mtcars,plot(mpg,hp))
## myplot<-function(x,y, col='red',pch=1,...){
##   plot(x,y,col=col,pch=pch,...)
## }
## with(mtcars,myplot(mpg,hp))

## ---- eval=F-------------------------------------------------------------
## args(paste)
## args(cat)
## paste('3','4 = 7',sep=" + ")
## paste('3','4 = 7',se=" + ")

## ----eval=F--------------------------------------------------------------
## myFun <- function (x) {
## 	u=2
##    cat ("u=", u, "\n")   # this variable is local !
##    u=u+1      # local
##    cat ("u=", u, "\n")
## }
## 
## # u = 2
## myFun(5)
## u
## cat ("u=", u, "\n")
## 
## myFun <- function (x) {
##     cat ("u=", u, "\n")      # this variable is local !
##     u <<- u+1     # this WILL affect the value of variable outside f()
##     cat ("u=", u, "\n")
## }
## u = 2
## myFun(u)
## u
## cat ("u=", u, "\n")

## ----eval=F--------------------------------------------------------------
## lm
## methods("summary")
## summary.data.frame
## 

## ----eval=F--------------------------------------------------------------
## # load foo.r source file
## source ("SS.r")
## SS

