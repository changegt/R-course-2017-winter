
## ----echo=F--------------------------------------------------------------
# Modulo Operation
5%%3  #x mod y:reminder
7%/%4 #integer division:floor.
5^2;5**2
sqrt(25)
log(10)  ##str(log)
log(10,exp(1))   # natural logarithm
exp(1)
log(exp(10))
log10(10) # common logarithm
log(100,base = 10)

## ------------------------------------------------------------------------
x<-2
y=3
###
a=5
b<-a
a="k"
a;b #what is a, b?
assign('s',7)

## ------------------------------------------------------------------------
a<-53;b<-5.3;c=5.0
class(c);print(a)
1/0 #Inf 
0/0 #NAN
i<-5L;class(i)
# j<-5+1i;class(j)

## ------------------------------------------------------------------------
attributes(mtcars)

## ------------------------------------------------------------------------
x<-'data' #or with ""
class(x)
factor('data')
nchar(x)

## ------------------------------------------------------------------------
TRUE##T,True
FALSE##F,False
is.logical(FALSE)
TRUE*5
FALSE*5
a<-2;b<-3
a!=b   ###if contional statement
"data"=="sprite"
"data"=="angel"

## ------------------------------------------------------------------------
a<-c(1,2,3) ###no row/column
is.vector(a)

## ------------------------------------------------------------------------
 c(1,2,3,4)#concatenate
 c(1,3,6,7,7)
 c(1:4) ##colon
 seq(1,100,by=2)      
  #calculation
  c(1,2,3,4)+c(2,4,5,6)
  c(1,2,3,4)-c(2,4,5,6)
  c(1,2,3,4)*c(2,4,5,6)
  c(1,2,3,4)/c(2,4,5,6)
  c(1,2,3,4)+1  #vectorization
  c(1,2,3,4)+c(2,4)   #recycle
  c(1,2,3,4) %*% c(2,4,5,6) ##row times column

## ------------------------------------------------------------------------
a<-1:5;b<-2:6
a*b
b*a
a*a
###dot/inner product
a%*%a;a%*%b;b%*%a
sum(a*a);sum(a*b);sum(b*a)
crossprod(a)
matrix(a)%*%b
matrix(b)%*%a

## ------------------------------------------------------------------------
c('1','2','3','4')
c('bj','sh','gz','sz') ##first tier cities
temp<-c('bj','sh','gz','shenzheng')
nchar(temp)  #vectorization


## ---- eval=FALSE---------------------------------------------------------
## c(T,F,T,T)
## age<-c(23,21,20,24,18,15,25) ##legal age of marriage
## age>20
## price<-c(3,6,5,7,4,11,14)
## price>5
## # age[age>20] ## []

## ------------------------------------------------------------------------
#explicit
c('1','2','3','4')
as.numeric(c('1','2','3','4')) ##add 'h'
as.character(c(3,5,6,7,8,11,14))
a<-c('x','y','z')
as.logical(a)


##implicit: represent all objects  in a reasonable fashion.
a<-c(1.2,'a')
a<-c(TRUE,2)
a<-c(FALSE,'a')

## ---- eval=FALSE---------------------------------------------------------
## age<-c(3,51,6,74,58,21,14)
## age[2] ###[] vs. ()
## age[2:3]
## age[-1]
## age[age>20]
## 
## ## age vs. newage
## newage<-age[-3]
## newage
## 
## city<-c('bj','sh','canton','sz')
## nchar(city)
## 
## class(age);length(age);max(age)
## names(age)<-c('a','b','c','d','e','f','g')
## age
## names(age)<-letters[1:7]
## age #names(temp)<-NULL
## 
## ##constants:month.name
## attributes(age)
## age

## ---- eval=FALSE---------------------------------------------------------
## vector<-c(1:12)
## matrix(vector,nrow = 3,ncol = 4)
## matrix(vector,nrow = 3,ncol = 4,byrow = T)
## mt<-matrix(vector,nrow = 3,ncol = 4,T)
## dimnames(mt) = list(c('gain1','gain2','gain3'),
##            c('loss1','loss2','loss3','loss4')) #
## mt
## attributes(mt)
## rownames(mt)
## colnames(mt)
## v<-1:12
## dim(v)<-c(3,4)
## a<-3:6
## b<-15:18
## rbind(a,b)
## cbind(a,b)##no row or column for vector.
## ##bonus
## v
## c(v)
## dim(v)<-c(12,1)
## 

## ---- eval=FALSE---------------------------------------------------------
## mt
## mt[2,3]
## mt[2,]##colon in matlab
## mt[,3]
## mt[,'loss2']
## 

## ------------------------------------------------------------------------
my_mat<-matrix(c(8,3,4,1,5,9,6,7,2),ncol=3)
my_mat[1,1]+my_mat[1,2]+my_mat[1,3]
sum(my_mat[1,])
rowSums(my_mat)
colSums(my_mat)
sum(diag(my_mat))

## ---- eval=FALSE---------------------------------------------------------
## dim1<-c("A1","A2")
## dim2<-c("B1","B2","B3","B4")
## dim3<-c("C1","C2","C3")
## a<-array(c(1:24),c(2,4,3),
##          dimnames=list(dim1,dim2,dim3))
## a
## a[1,2,3]

## ---- eval=FALSE---------------------------------------------------------
## city<-c('bj','sh','gz','sz')
## age<-c(22,34,34,24)
## sex<-c('M','F','M','F')
## people<-data.frame(city,age,sex)
## people
## people[2,3]
## people[,3]
## people$age
## people$age>30
## people[people$age>30,]
## 
## 
## dim(iris)
## ncol(iris);nrow(iris)
## rownames(people)<-letters[1:4]
## rownames(people)<-c(1,4,5,8)
## people
## rownames(people)<-NULL ##set back to generic index
## colnames(people)[3]
## 
## head(iris);tail(iris)
## str(iris)
## iris[c(50:100),c(1:2),]
## iris[,c(1:2)]
## iris[,c('Sepal.Length','Sepal.Width')]
## 
## iris$Sepal.Width
## iris[,'Sepal.Length']
## class(iris[,'Sepal.Length'])###reduced
## class(iris['Sepal.Length'])
## class(iris[,'Sepal.Length',drop=F])
## class(iris[['Sepal.Length']])###reduced
## 
## ###comparison with stata
## # plot(Sepal.Length,Petal.Length)
## plot(iris$Sepal.Length,iris$Petal.Length)
## 
## attach(iris)
## plot(Sepal.Length,Petal.Length)
## detach(iris)
## 
## with(iris,plot(Sepal.Length,Petal.Length))
## 

## ---- eval=FALSE---------------------------------------------------------
## mylist<-list(city=city,age=age,age=sex)
## str(mylist)
## mylist[1]
## mylist$city
## mylist[[1]]

## ---- eval=FALSE---------------------------------------------------------
## g<-"my list"
## h<-c(25,26,18,39)
## j<-matrix(1:10,nrow=5)
## k<-c("one","five","eight")
## mylist<-list(titile=g,age=h,j,k)
## mylist

## ----fig.align = "center",echo=F-----------------------------------------
figure<-hist(Nile)
figure
figure$counts
# attributes(plot1)

## ----fig.align = "center",echo=F-----------------------------------------
with(mtcars,plot(wt,mpg,col='red',type='p',lwd=3))
lmfit<-lm(mpg~wt,data=mtcars)
abline(lmfit,lwd=2)
summary(lmfit)
results<-summary(lmfit)
results$coefficients[2,1]*10

## ------------------------------------------------------------------------
with(mtcars,plot(wt,mpg,col='red',type='p',lwd=3,main="WT",cex=2))
lmfit1<-lm(mpg~wt,data=mtcars)
abline(lmfit1,lwd=2)

## ------------------------------------------------------------------------
with(mtcars,plot(hp,mpg,col='red',type='p',lwd=3,main='HP',cex=2))
lmfit2<-lm(mpg~hp,data=mtcars)
abline(lmfit2,lwd=2)
summary(lmfit1)
summary(lmfit2)
cat(paste('wt coeffient:',round(summary(lmfit1)$coe[2,1],2)),paste('hp coeffient:', round(summary(lmfit2)$coe[2,1],2)),sep='\n')


## ---- eval=FALSE---------------------------------------------------------
## http://taobaoshopping.org/how-to-view-taobao-seller-rating/
## ##nominal
## sex<-c('male','female','male','female','male')
## sex_new<-factor(sex)#levels=c('male','female')
## str(sex_new)
## ##ordinal
## rating<-c('heart','crown','diamond','heart','diamond')
## factor(rating,ordered=T,levels=c('heart','diamond',
##                              'crown'))

## ------------------------------------------------------------------------
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
gender<-c(1,1,2,1)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
diabetes <- factor(diabetes)
gender <- factor(gender)
status <- factor(status, order = TRUE,levels=c('Poor','Improved',
                                               'Excellent'))
patientdata <- data.frame(patientID,gender,age,diabetes,
status)
patientdata
patientdata$gender<-with(patientdata,factor(gender,
          levels=c(1,2),labels=c('male','female')))
str(patientdata)
summary(patientdata)


## ------------------------------------------------------------------------
v1 <-  c(1, NA, NULL,NaN)
v1
v2 <-  c("1", NA, NULL,NaN)
v2  ##coercion
l <-  list("1", NA, NULL,NaN)
length(l[4])

## ------------------------------------------------------------------------
head(iris)[1:3,]
iris_L<-sapply(iris,list)
length(iris_L)
iris_L$Sepal_Width<-NULL
length(iris_L)

## ------------------------------------------------------------------------
vy <- c(1, 2, 3, NA, 5)
mean(vy)
mean(vy,na.rm = T)

## ------------------------------------------------------------------------
a<-c(1,2,NA,NA)
b<-c(1,3,4,NA)
a==b

vy <- c(1, 2, 3, NA, 5)
vy[!is.na(vy)]


