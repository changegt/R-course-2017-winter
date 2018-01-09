## ----echo=F--------------------------------------------------------------
par(mfrow=c(2,2))
data(LMdata,package='rinds')
model<-lm(y~x,data=LMdata$NonL)
plot(model)

## ----echo=F--------------------------------------------------------------
##devtools::install_github('lijian13/rinds')
par(mfrow=c(2,2))
data(LMdata,package='rinds')
plot(y~x,LMdata$NonL,col='skyblue')
model<-lm(y~x,data=LMdata$NonL)
abline(model,col='red',lwd=2)
plot(LMdata$NonL$x,model$residuals,pch=16)

## model 2
model2<-lm(y~x+I(x^2),data=LMdata$NonL)
# summary(model2)$r.squared
# summary(model2)$coefficients

## model 3
model3<-update(model2,y~.-x)
# summary(model3)$coefficients
AIC(model,model2,model3)

plot(LMdata$NonL$x,model3$residuals,pch=16)


## ----eval=F--------------------------------------------------------------
## data(LMdata,package='rinds')
## model <-lm(y~x1+x2+x3,data=LMdata$Mult)
## summary(model)$coefficients
## library(car);vif(model)#variance inflation factor
## model1<-step(model)
## model1
## summary(model1)$coe

## ----fig.height=5--------------------------------------------------------
par(mfrow=c(1,2))
model<-lm(y~x,data=LMdata$Hetero)
plot(y~x,data=LMdata$Hetero,pch=16)
abline(model,col='red',lwd=3)
with(LMdata$Hetero,plot(x,model$residuals,pch=16))
abline(h=0,,col='red',lwd=3)

## ----eval=F--------------------------------------------------------------
## library(foreign)
## children<- read.dta("fertil2.dta")
## r1 <- lm(form <- ceb ~ age + agefbrth + usemeth,
##          data=children)
## summary(r1)
## 

## ------------------------------------------------------------------------
library(foreign)
children<- read.dta("fertil2.dta")
r1 <- lm(ceb ~ age + agefbrth + usemeth,
         data=children)
X <- model.matrix(r1)
n <- dim(X)[1]
k <- dim(X)[2]
se <- sqrt(diag(solve(crossprod(X)) * 
as.numeric(crossprod(resid(r1))/(n-k))))
se


## ----eval=F--------------------------------------------------------------
## library(foreign)
## children<- read.dta("data/fertil2.dta")
## r1 <- lm(ceb ~ age + agefbrth + usemeth,
##          data=children)
## u <- matrix(resid(r1))
## meat1 <- t(X) %*% diag(diag(crossprod(t(u)))) %*% X
## dfc <- n/(n-k)
## se <- sqrt(dfc*diag(solve(crossprod(X)) %*%
##         meat1 %*% solve(crossprod(X))))
## se

## ----eval=F--------------------------------------------------------------
## library(foreign)
## library(sandwich)
## library(lmtest)
## children<- read.dta("data/fertil2.dta")
## model = lm( ceb ~ age + agefbrth + usemeth,data=children)
## summary(model)
## coeftest(model, vcov = vcovHC(model, "HC1"))#vs. Stata. ##lmtest package
## ##https://cran.r-project.org/web/packages/sandwich/vignettes/sandwich.pdf

## ----echo=F,fig.height=7-------------------------------------------------
par(mfrow=c(1,2))
data(LMdata,package='rinds')
model<-lm(y~x,data=LMdata$NonL)
res1<-residuals(model)
result<-shapiro.test(res1)
result
qqnorm(rnorm(1000), main='norm simulation')
abline(0,1)
qqnorm(rstudent(model), main='data')
abline(0,1)

## ------------------------------------------------------------------------
data(LMdata,package='rinds')
model<-lm(y~x,data=LMdata$AC)
suppressMessages(library(lmtest))
dwtest(model)##Durbin-Watson test

## ----eval=F--------------------------------------------------------------
## source('ols.r')
## ols(ceb ~ age + agefbrth + usemeth,children)
## ols(ceb ~ age + agefbrth + usemeth,children,robust=T)
## ols(ceb ~ age + agefbrth + usemeth,children,
##     cluster="children")

