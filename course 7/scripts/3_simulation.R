## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----echo=F--------------------------------------------------------------
par(mfrow=c(1,1))
n = 50000
set.seed(123) 
flipsequence = sample(x=c(0,1),prob=c(.5,.5), size=n,replace=TRUE )
r = cumsum(flipsequence)                   
runprop = r/1:n           

plot(1:n , runprop, type="o" ,log="x",
	  xlim=c(1,n) , ylim=c(0.0,1.0) , cex.axis=1.5,
	  xlab="Flip Number" , ylab="Proportion Heads" , cex.lab=1.5 ,
	  main="Running Proportion of Heads" , cex.main=1.5 )

lines(c(1,n) , c(.5,.5) , lty=3)
flipletters = paste(c("T","H")[flipsequence[1:10]+1] , collapse="" )##here define the 0 for T in 
displaystring = paste( "Flip Sequence = " , flipletters , "..." , sep="" )
text( 5 , .97 , displaystring , adj=c(0,1) , cex=1.3 )
text(n, .3 , paste("End Proportion =",runprop[n]) , adj=c(1,0) , cex=1.3 )

## ----echo=F--------------------------------------------------------------
source('scripts/montyhall.R')
table(montyhall(1000))
switches<-rep(NA,100);nonswitches<-rep(NA,100)
for (j in (1:100)){
switches[j]<-table(montyhall(1000))[2]
nonswitches[j]<-table(montyhall(1000))[1]
# switches[j]<-length(which(montyhall=="switchwin"))
# nonswitches[j]<-length(which(montyhall=="noswitchwin"))
}

par(mfrow=c(1,2))
plot(nonswitches/1000,ylim=c(0,1), pch=16, cex=1,
     col='red',ylab="Probability",
     main="Probability of Winning\nKeeping the Same Door")
plot(switches/1000,ylim=c(0,1),pch=16, cex=1,
     col='blue',ylab="Probability",
     main="Probability of Winning\nChanging the Door")


