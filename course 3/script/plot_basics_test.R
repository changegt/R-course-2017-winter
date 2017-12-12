## ------------------------------------------------------------------------
demo(graphics)

## ------------------------------------------------------------------------
# pause after each graph
par(ask = FALSE)
with(mtcars,plot(wt,mpg))

## ------------------------------------------------------------------------
with(mtcars,plot(wt,mpg))
abline(lm(mpg~wt,data=mtcars))
title("Regression of MPG on Weight")

## ------------------------------------------------------------------------
pdf("mtcars_demo.pdf")
with(mtcars,plot(wt,mpg))
abline(lm(mpg~wt,data=mtcars))
title("Regression of MPG on Weight")
dev.off()

## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA) #default type:point (type='p')


## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA,type='p')

## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type = "l")
plot(dose, drugA, type = "p")
plot(dose, drugA, type = "b")



## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type = "b")

## ------------------------------------------------------------------------

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)## get the default parameter
plot(dose, drugA, type = "l", lty = 2, pch = 17)
par(opar)  ##set back to default.

## ------------------------------------------------------------------------
par(mfrow = c(2,3),oma=c(0,0,0,0))#par(oma=c(0,0,5,0))
x=1:10
y=c(1:5,5:1)
ltype=1:6
fig<-lapply(ltype,function(m) plot(x,y,type='l',lty=m,main=paste0("Line type:\"",m,"\"")))

## ------------------------------------------------------------------------
n=21
value<-1:n
symbol<-1:n
plot(value,symbol,pch=1:n,cex=2,col='red')

## ------------------------------------------------------------------------
plot(dose, drugA, type = "b", lty = 2, pch = 17)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
plot(dose, drugA, type = "b", lty = 1,col='red')
par(opar)  ##set back to default.

## ------------------------------------------------------------------------
length(colors())
colors()[1:5]

## ------------------------------------------------------------------------
n<-10
mygrays <- gray(0:n/n)
pie(rep(1, n), labels = mygrays, col = mygrays)
# rainbow(n)
# gray(0:10/10)

## ------------------------------------------------------------------------
# colors()
n <- 10
mycolors <- rainbow(n)
pie(rep(1, n), labels = mycolors, col = mycolors)

## ------------------------------------------------------------------------
library(colorspace)
pie(rep(1, n), labels = rainbow_hcl(10), 
    col = rainbow_hcl(10))
# pie(rep(1, n), labels =  terrain_hcl(10), 
# col =  terrain_hcl(10))

## ------------------------------------------------------------------------
library(colorspace)
plot(Sepal.Length ~ Sepal.Width, col=
  rainbow_hcl(3)[c(Species)], data=iris, pch=16) 
legend("topleft", pch=16, col=rainbow_hcl(3), 
  legend=unique(iris$Species)) 

## ------------------------------------------------------------------------
library(colorspace)
plot(Sepal.Length ~ Sepal.Width, col=
  rainbow_hcl(3)[c(Species)], data=iris, pch=16) 
legend("topleft", pch=16, col=
  rainbow_hcl(3), legend=unique(iris$Species)) 

## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
par(ann=F)
plot(dose, drugA, type = "b",col.axis='blue')
title(main='main title',col.main='red',cex.main=2,
sub='sub-title',col.sub='black',cex.sub=1.2,
xlab='x-axis label',
ylab='y-axis label',col.lab='green',
                     col.axis='blue')
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
plot(dose, drugA)
par(ann=F)
plot(dose, drugA, type = "b",
     col = "red",col.axis='blue')
title(main='main title',col.main='red',
sub='sub-title',col.sub='blue',
xlab='x-axis label',
ylab='y-axis label',col.lab='green',
                     col.axis='blue')
par(opar)

## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
par(ann=F) ##inhibit x y axis labels but not text.
plot(dose, drugA, type = "b", 
     col = "red",col.axis='blue')
# plot(dose, drugA, type = "b", 
#col = "red",col.axis='blue',xaxt='n',yaxt='n')
##inhibit axis tick and text
title(main='main title',col.main='red',cex.main=2,
sub='sub-title',col.sub='blue',
xlab='x-axis label',
ylab='y-axis label',col.lab='green',cex.lab=1)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
par(font.lab=3, cex.lab=1, font.main=4,
    cex.main=2)
par(pin = c(3, 2))  
##The current plot dimensions
par(lwd = 2, cex = 1)
## magnified index of plotted text and symbols 
par(cex.axis = 0.75, font.axis = 1)  
plot(dose, drugA, type = "b", pch = 19,
     lty = 2, col = "red") ##pch plot symbols
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
par(font.lab=3, cex.lab=1, 
    font.main=4, cex.main=2)
par(pin = c(3, 2)) 
##The current plot dimensions, 
par(lwd = 2, cex = 1) 
##magnified index of plotted text and symbols 
par(cex.axis = 0.75, font.axis = 1)  
plot(dose, drugA, type = "b", pch = 19, 
     lty = 2, col = "red") ##pch plot symbols

## ------------------------------------------------------------------------
par(bg='black',fg='white')
with(mtcars,plot(wt,mpg,col='green',pch=13))

## ------------------------------------------------------------------------
par(opar)
source('mar-oma.R') ##put the mar-oma.R in your current directory
Figure2A() 

## ------------------------------------------------------------------------
par(opar)
par('pin')
par('mar')
par('oma')


## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
x <- c(1:10);y <- x;z <- 10/x
par(mar = c(5, 4, 4, 8) + 0.1)
plot(x, y, type = "b", lty = 3, pch = 21, col = "red", 
     yaxt = "n",ann = FALSE)
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)
axis(side=2, at = x, labels = x, col.axis = "red", las = 1)##tck=-0.03
axis(side=4, at = z, labels = round(z, digits = 2), 
     col.axis = "blue",
las = 2, cex.axis = 0.7, tck = -0.01)
mtext("y=1/x", side = 4, line = 3, cex.lab = 1, las = 2,
col = "blue")
title("An Example of Creative Axes", xlab = "X values",
ylab = "Y=X")
abline(h=sqrt(10),lty=1,col='blue')
abline(v=sqrt(10),lty=1,col='blue')
par(opar)

## ------------------------------------------------------------------------
x <- c(1:10);y <- x;z <- 10/x
par(mar = c(5, 4, 4, 8) + 0.1)
plot(x, y, type = "b", lty = 3, pch = 21, col = "red",
     yaxt = "n",ann = FALSE)
lines(x, z, type = "b", pch = 22, col = "blue", lty = 2)
axis(side=2, at = x, labels = x, col.axis = "red", 
     las = 1)
axis(side=4, at = z, labels = round(z, digits = 2),
     col.axis = "blue",las = 2, cex.axis = 0.7,tck = -0.01)
mtext("y=1/x", side = 4, line = 3, cex.lab = 1, las = 2,
col = "blue")
title("An Example of Creative Axes", xlab = "X values",
ylab = "Y=X")
abline(h=sqrt(10),lty=1,col='blue')
abline(v=sqrt(10),lty=1,col='blue')

## ------------------------------------------------------------------------
with(mtcars,plot(wt, mpg,main = "Milage vs. Car Weight",
                 xlab = "Weight",
ylab = "Mileage", pch = 18, col = "blue"))
text(mtcars$wt, mtcars$mpg, row.names(mtcars), 
     cex = 0.6, pos = 2,
col = "red")

## ------------------------------------------------------------------------
with(mtcars,plot(wt, mpg,main = "Milage vs. Car Weight",
                 xlab = "Weight",
ylab = "Mileage", pch = 18, col = "blue"))
text(mtcars$wt, mtcars$mpg, row.names(mtcars),
     cex = 0.6, pos = 2,
col = "red")

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
par(cex = 1.5)
plot(1:7, 1:7, type = "n")
text(3, 3, "Example of default text")
text(4, 4, family = "mono", "Example of 
     mono-spaced text")
text(5, 5, family = "serif", "Example of
     serif text")
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
par(cex = 1.5)
plot(1:7, 1:7, type = "n")
text(3, 3, "Example of default text")
text(4, 4, family = "mono", "Example of 
     mono-spaced text")
text(5, 5, family = "serif", "Example of
     serif text")
par(opar)

## ------------------------------------------------------------------------
# Generate some data
x<-1:10; y1=x*x; y2=2*y1

plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# Add a line
lines(x, y2, pch=18, col="blue", type="b", lty=2)
# Add a legend
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=2)

## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar <- par(no.readonly = TRUE)
par(lwd = 2, cex = 1, font.lab = 2)
plot(dose, drugA, type = "b", pch = 15, lty = 1, col = "red",
ylim = c(0, 60), main = "Drug A vs. Drug B", xlab = "Drug Dosage",
ylab = "Drug Response")
lines(dose, drugB, type = "b", pch = 17, lty = 2,
col = "blue")
# abline(h = c(30), lwd = 3, lty = 2, col = "green")
legend("topleft", inset = 0.05, title = "Drug Type",
c("A", "B"), lty = c(1, 2), pch = c(15, 17), col = c("red",
"blue"),cex=1.4)
par(opar)

## ------------------------------------------------------------------------
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar <- par(no.readonly = TRUE)
par(lwd = 2, cex = 1, font.lab = 2)
plot(dose, drugA, type = "b", pch = 15, lty = 1,
     col = "red",
ylim = c(0, 60), main = "Drug A vs. Drug B",
xlab = "Drug Dosage",
ylab = "Drug Response")
lines(dose, drugB, type = "b", pch = 17, lty = 2,
col = "blue")
# abline(h = c(30), lwd = 3, lty = 2, col = "green")
legend("topleft", inset = 0.05, title = "Drug Type",
c("A", "B"), lty = c(1, 2), pch = c(15, 17), 
col = c("red","blue"),cex=1)
par(opar)

## ------------------------------------------------------------------------
plot(mtcars$wt, mtcars$mpg)
abline(lm(mpg~wt,data=mtcars))
result<-summary(lm(mpg~wt,data=mtcars))
text(4, 30, expression(y[i] == beta[0] + beta[1]*x[i]),cex=2)

text(4,25,
substitute(
    paste(Y[i], "=", beta0, beta1,X[i]),
    list(beta0 = round(result$coe[1,1],2), beta1 =
           round(result$coe[2,1],2),2)),cex=2)

## ------------------------------------------------------------------------
with(mtcars,plot(wt, mpg))
abline(lm(mpg~wt,data=mtcars))
result<-summary(lm(mpg~wt,data=mtcars))
text(4.2, 30, expression(Y[i] == beta[0] + beta[1]*X[i]))

text(4.2,25,
substitute(
    paste(y[i], "=", beta0, beta1,x[i]),
    list(beta0 = round(result$coe[1,1],2), 
         beta1 = round(result$coe[2,1],2))))

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
attach(mtcars)
par(mfrow = c(2,2))
plot(wt, mpg, main = "Scatterplot of wt vs. mpg")
plot(wt, disp,main = "Scatterplot of wt vs disp")
hist(wt, main = "Histogram of wt")
boxplot(wt, main = "Boxplot of wt")
detach(mtcars)
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
attach(mtcars)
par(mfrow = c(2,2))
plot(wt, mpg, main = "Scatterplot of wt vs. mpg")
plot(wt, disp,main = "Scatterplot of wt vs disp")
hist(wt, main = "Histogram of wt")
boxplot(wt, main = "Boxplot of wt")
detach(mtcars)
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
hist(mtcars$wt,main='mtcars:wt');
hist(mtcars$mpg,main='mtcars:mpg')
hist(mtcars$disp,main='mtcars:disp')
hist(mtcars$cyl,main='mtcars:cyl')
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
par(mfrow = c(2, 2))
hist(mtcars$wt,main='mtcars:wt');
hist(mtcars$mpg,main='mtcars:mpg')
hist(mtcars$disp,main='mtcars:disp')
hist(mtcars$cyl,main='mtcars:cyl')
par(opar)

## ------------------------------------------------------------------------
attach(mtcars)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

## ------------------------------------------------------------------------
attach(mtcars)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

## ------------------------------------------------------------------------
par(mar=c(5.1,4.1,4.1,2))
par(oma=c(0,0,0,2))
attach(mtcars)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE),
widths = c(3, 1), heights = c(1, 2)) 
#3:1 for heights 1:2 for widths
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

## ------------------------------------------------------------------------
par(mar=c(5.1,4.1,4.1,2))
par(oma=c(0,0,0,2))
attach(mtcars)
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE),
widths = c(3, 1), heights = c(1, 2)) 
#3:1 for heights 1:2 for widths
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
par(fig = c(0, 0.8, 0, 0.8))
plot(mtcars$wt, mtcars$mpg, xlab = "Miles Per Gallon",
ylab = "Car Weight")
par(fig = c(0, 0.8, 0.55, 1), new = TRUE)
boxplot(mtcars$wt, horizontal = TRUE, axes = FALSE)
par(fig = c(0.6, 1, 0, 0.8), new = TRUE)
boxplot(mtcars$mpg, axes = FALSE)
mtext("Enhanced Scatterplot", side = 3, outer = TRUE,
line = -2)  ##side=3 top
par(opar)

## ------------------------------------------------------------------------
opar <- par(no.readonly = TRUE)
par(fig = c(0, 0.8, 0, 0.8))
plot(mtcars$wt, mtcars$mpg, xlab = "Miles Per Gallon",
ylab = "Car Weight")
par(fig = c(0, 0.8, 0.55, 1), new = TRUE)
boxplot(mtcars$wt, horizontal = TRUE, axes = FALSE)
par(fig = c(0.6, 1, 0, 0.8), new = TRUE)
boxplot(mtcars$mpg, axes = FALSE)
mtext("Enhanced Scatterplot", side = 3, outer = TRUE,
line = -2)  ##side=3 top
par(opar)

