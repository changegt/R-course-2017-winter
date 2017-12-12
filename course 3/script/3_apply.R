## ----setup, include=FALSE------------------------------------------------
options(digits=2)

## ------------------------------------------------------------------------
str(apply)

## ----echo=F--------------------------------------------------------------
# matrix(rnorm(30),6,5)

## ----eval=F--------------------------------------------------------------
## y<-matrix(rnorm(6),2,3)
## y
## cbind(mean(y[1,]),mean(y[2,]))
## apply(y,1,mean)
## 
## 
## x <- matrix(rnorm(30), 5, 6)
## sumx<-NULL
## for (i in 1:6){
## temp<-sum(x[,i])
## sumx[i]<-temp
## }
## sumx
## apply(x,2,sum)

## ----eval=F--------------------------------------------------------------
## x <- matrix(rnorm(10^8), nrow=10^6)
## dim(x)
## system.time(y1 <- apply(x, 2, sum))
## length(y1)
## system.time(y2 <- colSums(x))
## identical(y1, y2)

## ----eval=F--------------------------------------------------------------
## x <- matrix(rnorm(200), 20, 10)
## dim(x)
## apply(x, 2, quantile)
## apply(x, 2, quantile, probs = c(0.25, 0.75))

## ----eval=F--------------------------------------------------------------
## ##user-defined function.
##   func<-function(x){
##     if (x%%2 == 0) {
##       ret<-'even'
##     }else{
##       ret<-'odd'}
##     return(ret)
##   }
## 
## func(101)
## vec<-round(runif(4)*100)
## vec
## vec;func(vec)
## lapply(vec,func)

## ----eval=F--------------------------------------------------------------
## func<-Vectorize(func)
## func(vec)
## # ifelse(vec%%2,'even','odd')

## ------------------------------------------------------------------------
str(lapply)

## ----eval=F--------------------------------------------------------------
## lapply(iris[,1:4],mean)

## ----eval=F--------------------------------------------------------------
## x <- list(a = 1:5, b = rnorm(10))
## x;lapply(x, mean)

## ----eval=F--------------------------------------------------------------
## x <- 1:4
## lapply(x, runif)

## ------------------------------------------------------------------------
x <- 1:4
lapply(x, runif, min = 0, max = 10)

## ----eval=F--------------------------------------------------------------
## data(iris)
## iris
## iris[3,c(2,4)]<-NA
## lapply(iris[,1:4],mean,na.rm=T)

## ----eval=F--------------------------------------------------------------
## data <- list(a = matrix(1:6, 2, 3), b = matrix(1:6, 3, 2), c =matrix(10:15,3,2))
## data
## lapply(data, function(x) x[1,])

## ----eval=F--------------------------------------------------------------
## lapply(iris[,1:4],function(x) sd(x,na.rm=T)/mean(x,na.rm=T))
## myfunc<-function(x){
##   rec<-c(mean(x,na.rm=T),sd(x,na.rm=T))
##   return(rec)
## }
## result<-lapply(iris[,1:4],myfunc)
## result

## ----eval=F--------------------------------------------------------------
## t(as.data.frame(result))
## # t(sapply(result,'['))
## do.call('rbind',result)

## ------------------------------------------------------------------------
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)
sapply(x, mean) 
# mean(x)

## ------------------------------------------------------------------------
str(tapply)

## ------------------------------------------------------------------------
set.seed(123)
 x <- c(rnorm(5), runif(5), rnorm(5, 1))
 f <- gl(3, 5)
 data<-cbind(x,f)
 tapply(x, f, mean)
 tapply(x, f, mean, simplify = FALSE)

## ------------------------------------------------------------------------
tapply(x, f, range)

## ------------------------------------------------------------------------
str(iris)
head(iris)

## ------------------------------------------------------------------------
tapply(iris[,1], iris$Species, mean)
t(sapply(iris[,1:4],function(x) tapply(x, iris$Species, mean,na.rm=T)))
# myfun<-function(x) {
#   tapply(x, iris$Species, mean,na.rm=T)
# }
# sapply(iris[,1:3],myfun)

## ------------------------------------------------------------------------
str(split)
# function (x, f, drop = FALSE, ...)

## ------------------------------------------------------------------------
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
split(x, f)

## ------------------------------------------------------------------------
lapply(split(x, f), mean)

## ------------------------------------------------------------------------
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1;f2
interaction(f1, f2)
data<-cbind(x,f1,f2)
data

## ------------------------------------------------------------------------
split(x, list(f1, f2))

## ------------------------------------------------------------------------
str(split(x, list(f1, f2), drop = TRUE))

## ------------------------------------------------------------------------
s <- split(iris, iris$Species)
# str(s)
sapply(s, function(x) colMeans(x[, 1:4],na.rm=T))
# sapply(s, function(x) sapply((x[, 1:4]), mean,na.rm=T))

## ------------------------------------------------------------------------
str(lapply)
str(mapply)

## ------------------------------------------------------------------------
## list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep,1:4,4:1)

## ------------------------------------------------------------------------
## list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep,1:4,4:1)

## ----eval=F--------------------------------------------------------------
## noise <- function(n, mean, sd) {
##  rnorm(n, mean, sd)
##  }
## noise(5,1,2)
## s<-noise(1:100, 1:20, 2)
## s
## mean(s)
## sd(s)
## ##revisit this when we talk about Sprintf function later.
## simulation<-mapply(noise,100000,1:20,5:1)
## dim(simulation)
## apply(simulation,2,mean)
## apply(simulation,2,sd)

## ----eval=F--------------------------------------------------------------
## ##1. generate dataset called data
## data<-data.frame(a<-c(1:5),b<-c(2:6),d<-c(3:7),
##                  e<-c('1','2','a','x','y'),
##                  f<-c('2','3','5','d','c'),
##                  g<-c('3','k','5','6',NA),
##                  stringsAsFactors = F)
## data[,1:3]<-sapply(data[,1:3],as.character)
## names(data)<-letters[1:6]
## ##2. do mapply
## myfunc<-function(x, y) {
##   ifelse(grepl('[a-z]',y), y, x)
## }
## data2<-data
## data2[1:3] = mapply(myfunc, data[1:3], data[4:6])
## data2

