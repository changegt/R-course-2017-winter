## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----fig.height=4,fig.width=6--------------------------------------------
x=seq(-4,4,length=200)
y=1/sqrt(2*pi)*exp(-x^2/2)
plot(x,y,type="l",lwd=2,col="red")

## ----fig.height=4,fig.width=6--------------------------------------------
x=seq(-4,4,length=200)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")

## ----fig.height=4,fig.width=6--------------------------------------------
mean=20;sd=10
x=seq(mean-4*sd,mean+4*sd,length=200)
y=dnorm(x,mean,sd)
plot(x,y,type="l",lwd=2,col="red")

## ----fig.height=3,fig.width=3.75-----------------------------------------
x=seq(-4,4,length=200)
hist(rnorm(1000),freq=F,col="cornflowerblue",ylim=c(0,0.4),xlab="",main="")
curve(dnorm(x), add=TRUE, col="red")

## ----fig.height=3,fig.width=3.75-----------------------------------------
x=seq(-4,4,length=200)
hist(rnorm(1000,mean=20,sd=10),freq=F,col="cornflowerblue",ylim=c(0,0.04),main="",xlab="")
curve(dnorm(x,20,10), add=TRUE, col="red")

## ----echo=F--------------------------------------------------------------
par(mfrow=c(2,2))
func<-function(x){
demo<-rnorm(x,mean=0,sd=1) 
hist(demo, freq=FALSE,col="cornflowerblue",main=paste("histogram with",x,'sample'))
curve(dnorm(x), add=TRUE, col="red", lwd=2)
}
sapply(c(50,100,1000,10000),func)


## ----eval=F--------------------------------------------------------------
## par(mfrow=c(2,2))
## func<-function(x){
## demo<-rnorm(x,mean=0,sd=1)
## hist(demo, freq=FALSE,breaks=70,col="cornflowerblue",
##      main=paste("histogram with",x,'sample'))
## curve(dnorm(x), add=TRUE, col="red", lwd=2)
## }
## sapply(c(50,100,1000,10000),func)
## 

## ----echo=FALSE----------------------------------------------------------
par(mfrow=c(2,2))
mu=100; sigma=10
clt<-function(n){
xbar_5=rep(0,500)
for (i in 1:500) {
  xbar_5[i]=mean(rnorm(n,mean=mu,sd=sigma))
  }
hist(xbar_5,prob=TRUE,breaks=12,xlim=c(70,130),ylim=c(0,0.25),col='cornflowerblue',main=paste("sample size:",n))
}
sapply(c(5,10,15,30),clt)

## ----echo=FALSE----------------------------------------------------------
par(mfrow=c(2,2))
mu=100; sigma=10
clt<-function(n){
xbar_5=rep(0,500)
for (i in 1:500) {
  xbar_5[i]=mean(rnorm(n,mean=mu,sd=sigma))
  }
hist(xbar_5,prob=TRUE,breaks=12,xlim=c(70,130),ylim=c(0,0.25),col='cornflowerblue',main=paste("sample size:",n))
curve(dnorm(x,mu,sigma/sqrt(n)), add=TRUE, col="red", lwd=2)
}
sapply(c(5,10,15,30),clt)

## ----echo=eval-----------------------------------------------------------
par(mfrow=c(2,2))
mu=100; sigma=10
clt<-function(n){
xbar=rep(NA,500)
for (i in 1:500) {
  xbar[i]=mean(rnorm(n,mean=mu,sd=sigma))
  }
hist(xbar,prob=TRUE,breaks=12,xlim=c(70,130),
     ylim=c(0,0.25),col='cornflowerblue',main=paste(
       "sample size:",n))
curve(dnorm(x,mu,sigma/sqrt(n)), add=TRUE, 
      col="red", lwd=2)
return(xbar)
}
result<-sapply(c(5,10,15,30),clt)
write.csv(result,'result.csv')

## ----fig.height=3,fig.width=3.75-----------------------------------------
par(mfrow=c(1,1));results<-read.csv('result.csv');ssizes=c(5,10,15,30)
plot(ssizes,apply(result,2,sd),col='blue',
xlab="sample size",ylab="standard deviation",
xlim=c(3,35),ylim=c(1,6));x=seq(2,32,length=200)
curve(10/sqrt(x),add=TRUE,type="l",lwd=2,col="red")

## ----echo=FALSE----------------------------------------------------------
par(mfrow=c(1,1))
curve(dexp(x,rate=1),0,4,lwd=2,col="red",ylab="p")

## ----eval=FALSE----------------------------------------------------------
## par(mfrow=c(1,1))
## curve(dexp(x,rate=1),0,4,lwd=2,col="red",ylab="p")

## ----echo=FALSE----------------------------------------------------------
par(mfrow=c(2,3))
clt_e<-function(n,lambda=1){
xbar=rep(0,500)
for (i in 1:500) {
  xbar[i]=mean(rexp(n,rate=1))
  }
hist(xbar,prob=TRUE,breaks=12,xlim=c(0,2),main=paste("sample size:",n),col='cornflowerblue')
return(xbar)
}
result<-sapply(c(5,10,15,30,50,100),clt_e)

## ----echo=FALSE----------------------------------------------------------
par(mfrow=c(2,3))
clt_e<-function(n,lambda=1){
xbar=rep(0,500);rate=1
for (i in 1:500) {
  xbar[i]=mean(rexp(n,rate=1))
  }
hist(xbar,prob=TRUE,breaks=12,xlim=c(0,2),main=paste("sample size:",n),col='cornflowerblue')
curve(dnorm(x,rate,rate/sqrt(n)), add=TRUE, col="red", lwd=2)
lines(density(xbar), col = "green", lwd = 2)
return(xbar)
}
result<-sapply(c(5,10,15,30,50,100),clt_e)

## ----eval=FALSE----------------------------------------------------------
## par(mfrow=c(2,3))
## clt_e<-function(n,lambda=1){
## xbar=rep(0,500);rate=1
## for (i in 1:500) {
##   xbar[i]=mean(rexp(n,rate=1))
##   }
## hist(xbar,prob=TRUE,breaks=12,xlim=c(0,2),
##      main=paste("sample size:",n),col='cornflowerblue')
## curve(dnorm(x,rate,rate/sqrt(n)), add=TRUE,
##       col="red", lwd=2)
## return(xbar)
## }
## result<-sapply(c(5,10,15,30,50,100),clt_e)

## ----echo=F--------------------------------------------------------------
lambda=1
n=100
xbar=rep(0,500)
for (i in 1:500) { xbar[i]=mean(rexp(n,rate=1))}
hist(xbar,prob=TRUE,breaks=12,xlim=c(0,2),main="sample size:100",col='cornflowerblue')
curve(dnorm(x,lambda,lambda/sqrt(n)), add=TRUE, 
      col="red", lwd=2)

## ----fig.height=3.5,fig.width=5------------------------------------------
# with dnorm
x=seq(-4,4,length=200)
y=dnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")

## ----fig.height=3.5,fig.width=5------------------------------------------
x=seq(-4,4,length=200)
y=pnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")
# abline(v=0, col="blue")
# abline(v=1.96,col='blue')
#pnorm(1.96)

## ----fig.height=3.5,fig.width=5------------------------------------------
x=seq(-4,4,length=200)
y=pnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")
axis(2, at=0.5);abline(v=0, col="blue")
abline(h=0.5,col='blue')

## ----fig.height=3.5,fig.width=5------------------------------------------
x=seq(-4,4,length=200)
y=pnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")
abline(v=1.96, col="blue");abline(h=0.975,col='blue')

## ----echo=F--------------------------------------------------------------
x=seq(-4,4,length=200)
y=dnorm(x)
plot(x,y,type="l", lwd=2, col="blue")
x=seq(-4,0,length=200)
y=dnorm(x)
polygon(c(-4,x,0),c(0,y,0),col="cornflowerblue")

## ------------------------------------------------------------------------
pnorm(0)

## ----echo=F--------------------------------------------------------------
x=seq(-4,4,length=200)
y=dnorm(x)
plot(x,y,type="l", lwd=2, col="blue")
x=seq(-4,1.96,length=200)
y=dnorm(x)
polygon(c(-4,x,1.96),c(0,y,0),col="cornflowerblue")



## ------------------------------------------------------------------------
pnorm(1.96)

## ----echo=F--------------------------------------------------------------
x=seq(-4,4,length=200)
y=dnorm(x)
plot(x,y,type="l", lwd=2, col="blue")
x=seq(-1,1,length=100)
y=dnorm(x)
polygon(c(-1,x,1),c(0,y,0),col="cornflowerblue")


## ------------------------------------------------------------------------
pnorm(1)-pnorm(-1)

## ----echo=F--------------------------------------------------------------
x=seq(-4,4,length=200)
y=dnorm(x)
plot(x,y,type="l", lwd=2, col="blue")
x=seq(1.96,4,length=200)
y=dnorm(x)
polygon(c(1.96,x,4),c(0,y,0),col="cornflowerblue")

## ------------------------------------------------------------------------
pnorm(-1.96)
1-pnorm(1.96)

## ----echo=F--------------------------------------------------------------
mu=51800;s=30;sigma=4000/sqrt(s)
x=seq(mu-4*sigma,mu+4*sigma,length=200)
y=dnorm(x,mean=mu,sd=sigma)
plot(x,y,type="l", lwd=2, col="blue")

x=seq(mu-sigma,mu+sigma,length=200)
y=dnorm(x,mean=mu,sd=sigma)
polygon(c(mu-sigma,x,mu+sigma),c(0,y,0),col="cornflowerblue")
polygon(c(mu-sigma,x,mu+sigma),c(0,y,0),col="cornflowerblue")
axis(2, at=c(51300,52300))

## ------------------------------------------------------------------------
mu=51800;variance<-4000;s=30
sigma=variance/sqrt(s)# sd of sample mean
z1<-(52300-mu)/sigma
z2<-(51300-mu)/sigma
pnorm(z1)-pnorm(z2)

## ------------------------------------------------------------------------
pnorm(mu+500,mu,sigma)-pnorm(mu-500,mu,sigma)

## ----echo=F--------------------------------------------------------------
x=seq(-4,4,length=200)
y=pnorm(x,mean=0,sd=1)
plot(x,y,type="l",lwd=2,col="red")

## ------------------------------------------------------------------------
#95%
qnorm(0.975)

#pvalue2sided
2*pnorm(-1.96)

#99%
qnorm(0.995)

#90%
qnorm(0.95)

qt(0.975,100)

qt(0.975,30)

