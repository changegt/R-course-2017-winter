## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----echo=F,fig.width=6, fig.height=4------------------------------------
with(mtcars,plot(wt,mpg,xlim=c(0,8),ylim=c(0,40),col='red'))
abline(with(mtcars,lm(mpg~wt))) 

## ------------------------------------------------------------------------
dat<-mtcars[,c('wt','mpg')]
min.RSS<-function(data, par) {
  with(data, sum((mpg-(par[1] + par[2]*wt))^2))
}
result<-optim(par = c(0, 0), min.RSS, data = dat)
result$par

## ------------------------------------------------------------------------
library(maxLik)
dat<-mtcars[,c('wt','mpg')]
wt<-dat$wt;mpg<-dat$mpg
loglik=function (para){
  N=length(wt)
  e=mpg-para[1]-para[2]*wt
  ll=-0.5*N*log(2*pi)-0.5*N*log(para[3]^2)-0.5*sum(e^2/para[3]^2)
  return(ll)
}
mle1=maxLik(loglik,start=c(0.1,1,1))
coef(mle1)

## ------------------------------------------------------------------------
rm(list=ls())
library(maxLik)
dat<-mtcars[,c('wt','mpg')]
wt<-dat$wt;mpg<-dat$mpg
loglik=function (pars){
  avg = pars[1]+pars[2]*wt
  ll=sum(dnorm(mpg-avg,0,pars[3],log=T))
  return(ll)
}
mle1=maxLik(loglik,start=c(0.1,1,1))
coef(mle1)

## ------------------------------------------------------------------------
x=mtcars$wt;y=mtcars$mpg
meanx=mean(x)
meany=mean(y)
beta1<-sum((x-meanx)*(y-meany))/sum((x-meanx)^2)
beta0<-meany-beta1*meanx
c(beta0,beta1)

## ------------------------------------------------------------------------
x=mtcars$wt;y=mtcars$mpg
sy<-sqrt(sum((y-meany)^2))
sx<-sqrt(sum((x-meanx)^2))
cor(x,y)*sy/sx

## ----eval=F--------------------------------------------------------------
## library(car)
## library(rgl)
## with(mtcars,scatter3d(x = wt, y = mpg , z = hp))

## ------------------------------------------------------------------------
x=mtcars$wt;y=mtcars$mpg
xmat<-cbind(1,x)
solve(t(xmat)%*%xmat) %*% t(xmat) %*% y
solve(crossprod(xmat)) %*% t(xmat) %*% y

## ------------------------------------------------------------------------
x=mtcars[,c('wt','hp')];y=mtcars$mpg
xmat<-as.matrix(cbind(1,x))
solve(t(xmat)%*%xmat) %*% t(xmat) %*% y
solve(crossprod(xmat)) %*% t(xmat) %*% y

## ------------------------------------------------------------------------
with(mtcars,lm(mpg~wt+hp))

## ----eval=F--------------------------------------------------------------
## equation<-mpg ~ wt + hp
## class(equation)
## lm(equation,mtcars)
## 
## equation<-'mpg ~ wt + hp' ## character
## as.formula(equation)
## PCs<-paste('PC',1:10,sep="",collapse=" +")
## as.formula(paste('y ~ x +',PCs))

## ----eval=F--------------------------------------------------------------
## data<-'mtcars'
## equation<-'mpg ~ wt + hp' ## character
## # lm(equation,data)
## lm(as.formula(equation),get(data))
## 
## do.call("lm", list(as.formula(equation),as.name(data)))
## # coef(summary(models))["wt","Pr(>|t|)"]

