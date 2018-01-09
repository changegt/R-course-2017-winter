## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----eval=F--------------------------------------------------------------
## library(dplyr)
## detach("package:dplyr")
## suppressMessages(library(dplyr))
## 
## log(-5)  #warning
## myfunc=function(x) {
##   if(x>0) print(x)
## 	else print(-x)
## }
## myfunc(3);myfunc(-3)
## x=log(-2);myfunc(x) #error

## ----eval=FALSE----------------------------------------------------------
## f <- function(x, y){
##   z <- x + y
##   g(z)
## }
## g <- function(x){
##   z <- round(x)
##   h(z)
## }
## 
## h <- function(x){
##   set.seed(1234)
##   z <- rnorm(x)
##   print(z)
## }
## f(2,3)
## f(2, -3)
## traceback()
## # options(error=recover)
## # f(2, -3)
## # options(error=NULL)
## 
## # traceback()
## # options(error=recover)
## # myfunc(x) #error

## ----eval=F--------------------------------------------------------------
## std<-function(x){
## n <- length(x)
## meanx <- sum(x)/n
## css <- sum((x-meanx)**2)
## df=n
## sdx <- sqrt(css/df)
## return(sdx)
## }
## x=1:10
## sd(x)
## std(1:10)
## debug(std) #n(next),where,Q(quit)
## options(error = browser())
## undebug(std)
## ##debugonce()
## ##debugSource():Rstudio

## ----eval=F--------------------------------------------------------------
## std<-function(x){
## n <- length(x)
## meanx <- sum(x)/n
## css <- sum((x-meanx)**2)
## df=n
## browser()
## sdx <- sqrt(css/df)
## return(sdx)
## }
## source('std.r')
## x=1:10
## std(x)

## ----eval=F--------------------------------------------------------------
## f <- function(x, y){
##   z <- x + y
##   g(z)
## }
## g <- function(x){
##   z <- round(x)
##   h(z)
## }
## 
## h <- function(x){
##   set.seed(1234)
##   z <- rnorm(x)
##   print(z)
## }
## 
## f(2,3)
## f(2, -3)
## options(error=recover)
## f(2, -3)
## options(error=NULL)

