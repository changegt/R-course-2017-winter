## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----eval=F--------------------------------------------------------------
## str(sample)
## n1=100;n2=20
## str(sample)
## set.seed(1234)
## x<-sample(1:n1,size=n2,replace=F)## change to T for display purpose.
## y<-round(100*runif(20),2)  ## apply
## x
## sort(x)
## x[order(x)] ## z=c(10,3,8,1);sort(z)

## ----eval=F--------------------------------------------------------------
## set.seed(1234)
## str(sample)
## x<-sample(1:100,replace=F)
## sum(x)/length(x)
## mean(x)
## y<-x
## n=100
## y[sample(1:n,size=20)]<-NA
## y
## mean(y,na.rm=T)

## ----eval=F--------------------------------------------------------------
## grades<-c(95,72,87,66)
## weights<-c(1/2,1/4,1/8,1/8)
## mean(grades)
## weighted.mean(grades,weights) ## same as the expectation of RV.
## sum(grades*weights)
## 

## ----eval=F--------------------------------------------------------------
## x <- c(1, 2, 3, 4, 5, 6, 7, 8)
## var(x)
## sd(x)  ##sample standard deviation.
## 
## n <- length(x)
## meanx <- sum(x)/n
## css <- sum((x - meanx)**2)
## sdx <- sqrt(css / (n-1)) #adjustment of degree of freedom.unbias
## sdx

## ----eval=F--------------------------------------------------------------
## x <- sample(1:100,8,replace=T)
## var(x,na.rm=T)
## sd(x,na.rm=T)
## min(x)
## max(x)
## median(x)
## quantile(x)
## quantile(x,c(0.1,0.9))

## ----eval=F--------------------------------------------------------------
## vars <- c("mpg", "hp", "wt")
## head(mtcars[vars])
## summary(mtcars[vars])
## sapply(mtcars[vars],median)
## sapply(mtcars[vars],function(x) quantile(x,0.5))
## sapply(mtcars[vars],quantile,0.5)
## 

## ----eval=F--------------------------------------------------------------
## mystats <- function(x,na.omit = FALSE) {
##    if (na.omit)
##   x <- x[!is.na(x)]
##   m <- mean(x)
##   n <- length(x)
##   s <- sd(x)
##   skew <- sum((x - m)^3/s^3)/n
##   kurt <- sum((x - m)^4/s^4)/n - 3
##   return(c(n = n, mean = m, stdev = s, skew = skew, kurtosis = kurt))
## }
## vars <- c("mpg", "hp", "wt")
## sapply(mtcars[vars], mystats,na.omit=T)
## # mtcars$mpg[2]<-NA;mtcars$hp[c(3,4)]<-NA;mtcars$wt[c(6:9)]<-NA
## # sapply(mtcars[vars], mystats)
## # sapply(mtcars[vars], mystats,na.omit=T)

## ------------------------------------------------------------------------
a<-c(1,2,3,NA)
mystats <- function(x,na.rm=F) {
  if (na.rm) x <- x[!is.na(x)]
  return(x)
}
mystats(a)
mystats(a,na.rm=T)

## ----eval=F--------------------------------------------------------------
## library(psych)
## vars <- c("mpg", "hp", "wt")
## describe(mtcars[vars])
## sd(mtcars$hp)/sqrt(dim(mtcars)[1])
## 

## ----eval=F--------------------------------------------------------------
## vars <- c("mpg", "hp", "wt")
## aggregate(mtcars[vars], by = list(am = mtcars$am), mean)
## aggregate(mtcars[vars], by = list(am = mtcars$am), sd)

## ----eval=F--------------------------------------------------------------
## library(psych)
## describeBy(mtcars[vars], mtcars$am)

## ----eval=F--------------------------------------------------------------
## library(vcd)
## mytable <- with(Arthritis, table(Improved))
## mytable
## prop.table(mytable)
## prop.table(mytable)*100

## ----eval=F--------------------------------------------------------------
## table(Arthritis$Treatment,Arthritis$Improved)
## mytable<-xtabs(~ Treatment+Improved, data=Arthritis)
## mytable

## ------------------------------------------------------------------------
library(vcd)
mytable<-xtabs(~ Treatment+Improved, data=Arthritis)
prop.table(mytable)

## ----eval=F--------------------------------------------------------------
## library(vcd)
## mytable<-xtabs(~ Treatment+Improved, data=Arthritis)
## ## marginal probability by row
## mytable
## margin.table(mytable, 1)
## prop.table(mytable, 1) # marginal probability
## ## marginal probability by column
## margin.table(mytable, 2)
## prop.table(mytable, 2)
## #joint probability
## prop.table(mytable)
## addmargins(mytable)
## addmargins(prop.table(mytable))
## #conditional probability
## 0.34523810/0.51190476; 0.34523810/0.50000000
## addmargins(prop.table(mytable, 1), 2)
## addmargins(prop.table(mytable, 2), 1)

## ------------------------------------------------------------------------
library(datasets)
UCB.df<-as.data.frame(UCBAdmissions)
UCB.df
## useful if the data have already been tabulated).
xtabs(Freq ~ Admit+Gender, UCB.df)  ##weight in SPSS

## ----eval=F--------------------------------------------------------------
## mytable <- xtabs(~ Treatment+Sex+Improved, data=Arthritis)
## mytable
## ftable(mytable)
## # margin.table(mytable, 1)
## # margin.table(mytable, 2)
## # margin.table(mytable, 3)
## # margin.table(mytable, c(1,3))
## # ftable(prop.table(mytable, c(1, 2)))
## # ftable(addmargins(prop.table(mytable, c(1, 2)), 3))
## # ftable(addmargins(prop.table(mytable, c(1, 2)), 3)) * 100

## ----eval=F--------------------------------------------------------------
## table2flat <- function(mytable) {
##   df <- as.data.frame(mytable)
##   rows <- dim(df)[1]
##   cols <- dim(df)[2]
##   x <- NULL
##   for (i in 1:rows) {
##     for (j in 1:df$Freq[i]) {
##       row <- df[i, c(1:(cols - 1))]
##       x <- rbind(x, row)
##     }
##   }
##   row.names(x) <- c(1:dim(x)[1])
##   return(x)
## }

## ------------------------------------------------------------------------
treatment <- rep(c("Placebo", "Treated"), 3)
improved <- rep(c("None", "Some", "Marked"), each = 2)
Freq <- c(29, 13, 7, 7, 7, 21)
mytable <- as.data.frame(cbind(treatment, improved, Freq))
mytable
mydata <- table2flat(mytable)

## ----echo=F--------------------------------------------------------------
x<-c(2,3,5,8,9,11,5,3,12,7)
y<-c(7,4,10,17,13,14,2,7,15,12)
plot(x,y,lwd=2,col = 'red')

## ----echo=F--------------------------------------------------------------
library(dplyr)
library(nycflights13)
by_tailnum <- group_by(flights, tailnum)
delay <- summarise(by_tailnum,
  count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dist < 2000)
with(delay,plot(dist,delay))
abline(with(delay,lm(delay~dist)))

## ----eval=F--------------------------------------------------------------
## a<-c(2,3,5,8,9,11,5,3,12,7)
## b<-c(7,4,10,17,13,14,2,7,15,12)
## n<-length(a)
## mean_a<-mean(a);mean_b<-mean(b)
## sum((a-mean_a)*(b-mean_b))/(n-1)/sqrt(var(a)*var(b))
## ## covariance vs. correlation
## sum((a-mean_a)*(b-mean_b))/(n-1);cov(a,b)
## cov(a,b)/(sd(a)*sd(b))
## cor(a,b)

## ------------------------------------------------------------------------
a<-c(2,3,5,8,9,11,5,3,12,7)
b<-c(7,4,10,17,13,14,2,7,15,12)
cor.test(a,b,method = 'spearman')

## ------------------------------------------------------------------------
x<-c(2,3,5,8,9,11,5,3,12,7)
y<-c(7,4,10,17,13,14,2,7,15,12)
summary(lm(y~x))$coe
cor(x,y)*sd(y)/sd(x)

## ----eval=F--------------------------------------------------------------
## str(cor)
## a<-c(2,3,5,8,9,11,5,3,12,7)
## b<-c(7,4,10,17,13,14,2,7,15,12)
## cor(a,b,method='pearson')
## cor(a,b,method='spearman')
## cor(a,b,method='kendall')

## ----eval=F--------------------------------------------------------------
## require(ggplot2)
## head(economics)
## ?economics
## # pce:personal consumption expenditures
## # pop:total population, in thousands
## # psavert:personal savings rate
## # unemploy:number of unemployed in thousands
## # median duration of unemployment, in week

## ------------------------------------------------------------------------
library(ggplot2)
with(economics,cor(pce,psavert)) #significance


## ------------------------------------------------------------------------
library(ggplot2)
cor(economics[,c(2,4:6)])


## ----echo=F--------------------------------------------------------------
library(ggplot2)
pairs(economics[,c(2,4:6)], pch = 21) ##base


## ----eval=F--------------------------------------------------------------
## library(ggplot2)
## pairs(economics[,c(2,4:6)], pch = 21) ##base
## 

## ----echo=F,warning=F----------------------------------------------------
library(ggplot2)
library(GGally,quietly=T)
# GGally::ggpairs(economics[,c(2,4:6)],params=list(labelSize=8))
ggpairs(economics[,c(2,4:6)])
with(economics,plot(pce,psavert)) 

## ----eval=F--------------------------------------------------------------
## library(ggplot2)
## library(GGally,quietly=T)
## # GGally::ggpairs(economics[,c(2,4:6)],params=list(labelSize=8))
## ggpairs(economics[,c(2,4:6)])
## with(economics,plot(pce,psavert))
## # data(tips,package='reshape2')
## # head(tips)
## # GGally::ggpairs(tips)

## ----echo=F--------------------------------------------------------------
library('corrplot') 
econCor<-cor(economics[,c(2,4:6)])
corrplot(econCor, method = "circle") #plot matrix

## ----eval=F--------------------------------------------------------------
## library('corrplot')
## econCor<-cor(economics[,c(2,4:6)])
## corrplot(econCor, method = "circle") #plot matrix

## ----eval=F--------------------------------------------------------------
## str(cor)
## m<-c(9,9,NA,3,NA,5,8,1,10,4)
## n<-c(2,NA,1,6,6,4,1,1,6,7)
## p<-c(8,4,3,9,10,NA,3,NA,9,9)
## q<-c(10,10,7,8,4,2,8,5,5,2)
## r<-c(1,9,7,6,5,6,2,7,9,10)
## theMat<-cbind(m,n,p,q,r)
## theMat
## cor(theMat)
## cor(theMat,use='everything')
## cor(theMat,use='all.obs')
## cor(theMat,use='complete.obs')
## cor(theMat,use='na.or.complete')
## data<-na.omit(theMat)
## data
## cor(data)
## class(data)
## identical(cor(theMat,use='na.or.complete'),cor(data))
## 

## ----eval=F--------------------------------------------------------------
## m<-c(9,9,NA,3,NA,5,8,1,10,4)
## n<-c(2,NA,1,6,6,4,1,1,6,7)
## p<-c(8,4,3,9,10,NA,3,NA,9,9)
## q<-c(10,10,7,8,4,2,8,5,5,2)
## r<-c(1,9,7,6,5,6,2,7,9,10)
## theMat<-cbind(m,n,p,q,r)
## cor(theMat,use="pairwise.complete.obs")
## cor(theMat[,c('m','n')],use='complete.obs')
## cor(theMat[,c('m','p')],use='complete.obs')

## ----echo=F--------------------------------------------------------------
# cor.test(iris[,1:4])
library(psych)
corr.test(iris[,1:4], use = "complete")

## ----eval=F--------------------------------------------------------------
## # cor.test(iris[,1:4])
## library(psych)
## corr.test(iris[,1:4], use = "complete")

## ------------------------------------------------------------------------
source("corstartl.R")
corstarsl(economics[,c(2,4:6)])
kable(corstarsl(swiss[,1:4]))

## ----eval=F--------------------------------------------------------------
## source("corstartl.R");corstarsl(economics[,c(2,4:6)])
## xtable(corstarsl(swiss[,1:4]))

## ----echo=F--------------------------------------------------------------
head(sleep)
str(sleep)
library(tidyr);sleep_wide<-spread(sleep,group,extra)

## ------------------------------------------------------------------------
head(sleep)
t.test(sleep$extra,mu=0)

## ----eval=F--------------------------------------------------------------
## library(tidyr);sleep_wide<-spread(sleep,group,extra)
## names(sleep_wide)<-c('ID','group1','group2')
## ## Welch t-test
##  #long format
## t.test(extra ~ group, sleep) # tilde
##  #wide format
## t.test(sleep_wide$group1, sleep_wide$group2)
## 
## # Student t-test
## t.test(extra ~ group, sleep, var.equal=TRUE)

## ----eval=F--------------------------------------------------------------
## # wide format
## library(tidyr);sleep_wide<-spread(sleep,group,extra)
## names(sleep_wide)<-c('ID','group1','group2')
## t.test(sleep_wide$group1, sleep_wide$group2, paired=TRUE)
## 
## # long format
## # Sort by group then ID
## sleep <- sleep[order(sleep$group, sleep$ID), ]
## sleep
## # Paired t-test
## t.test(extra ~ group, sleep, paired=TRUE)
## 
## ## equivalent to testing whether difference between
## ## each pair of observations has a population mean of 0.
## t.test(sleep_wide$group1 - sleep_wide$group2, mu=0,
##        var.equal=TRUE)
## 

