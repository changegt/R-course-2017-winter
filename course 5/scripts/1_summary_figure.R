## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ------------------------------------------------------------------------
library(vcd);library(grid)
# Arthritis
str(Arthritis)
glimpse(Arthritis)
counts <- table(Arthritis$Improved)
counts

## ----eval=F--------------------------------------------------------------
## library(vcd);library(grid)
## counts <- table(Arthritis$Improved)
## barplot(counts, main = "Simple Bar Plot", xlab =
## "Improvement", ylab = "Frequency")

## ----echo=F--------------------------------------------------------------
counts <- table(Arthritis$Improved)
counts
barplot(counts, main = "Simple Bar Plot", xlab = 
          "Improvement", ylab = "Frequency")

## ----echo=F--------------------------------------------------------------
counts <- table(Arthritis$Improved)
counts
barplot(counts, main = "Horizontal Bar Plot",
xlab = "Frequency",ylab = "Improvement", horiz = TRUE)

## ----eval=F--------------------------------------------------------------
## counts <- table(Arthritis$Improved)
## barplot(counts, main = "Horizontal Bar Plot",
## xlab = "Frequency",ylab = "Improvement", horiz = TRUE)

## ------------------------------------------------------------------------
## get counts for Improved by Treatment table
counts <- table(Arthritis$Improved, Arthritis$Treatment)
counts

## ----echo=F--------------------------------------------------------------
counts <- table(Arthritis$Improved, Arthritis$Treatment)
barplot(counts, main = "Stacked Bar Plot",
        xlab = "Treatment", 
        ylab = "Frequency", col = c("red", 
        "yellow", "green"), 
        legend = rownames(counts),ylim=c(0,60))

## ----eval=F--------------------------------------------------------------
## counts <- table(Arthritis$Improved, Arthritis$Treatment)
## barplot(counts, main = "Stacked Bar Plot",
##         xlab = "Treatment",
##         ylab = "Frequency", col = c("red",
##         "yellow", "green"),
##         legend = rownames(counts),ylim=c(0,60))

## ----echo=F--------------------------------------------------------------
counts <- table(Arthritis$Improved, Arthritis
                $Treatment)
barplot(counts, main = "Grouped Bar Plot",
        xlab = "Treatment", 
        ylab = "Frequency", col = c("red",
        "yellow", "green"), 
        legend = rownames(counts), 
        beside = TRUE,ylim=c(0,40))

## ----eval=F--------------------------------------------------------------
## counts <- table(Arthritis$Improved,
##                 Arthritis$Treatment)
## barplot(counts, main = "Grouped Bar Plot",
##         beside = TRUE,
##         xlab = "Treatment",
##         ylab = "Frequency", col = c("red",
##                 "yellow", "green"),
##         legend = rownames(counts),
##         ylim=c(0,40))

## ----echo=F--------------------------------------------------------------
means<-tapply(iris$Sepal.Width,iris$Species,mean)
means<-means[order(means)]
x<-names(means)
barplot(means[1:3],names.arg=x,ylim=c(0,4))
title("Mean Sepal Width")

## ----eval=F--------------------------------------------------------------
## means<-tapply(iris$Sepal.Width,iris$Species,mean)
## means<-means[order(means)]
## x<-names(means)
## barplot(means[1:3],names.arg=x,ylim=c(0,4))
## title("Mean Sepal Width")

## ----echo=F--------------------------------------------------------------
par(mar = c(5, 10, 4, 2))
par(las = 2)
counts <- table(Arthritis$Improved)
barplot(counts, main = "Treatment Outcome", horiz = TRUE, 
               names.arg = c("No Improvement", 
               "Some Improvement", "Marked Improvement"))

## ----eval=F--------------------------------------------------------------
## par(mar = c(5, 10, 4, 2))
## par(las = 2)
## counts <- table(Arthritis$Improved)
## barplot(counts, main = "Treatment Outcome", horiz = TRUE,
##                 names.arg = c("No Improvement",
##                "Some Improvement", "Marked Improvement"))

## ----echo=F--------------------------------------------------------------
counts <- table(Arthritis$Treatment, Arthritis$Improved)
spine(counts, main = "Spinogram Example")

## ----eval=F--------------------------------------------------------------
## counts <- table(Arthritis$Treatment, Arthritis$Improved)
## spine(counts, main = "Spinogram Example")

## ----echo=F--------------------------------------------------------------
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main = "Simple Pie Chart")

## ----eval=F--------------------------------------------------------------
## slices <- c(10, 12, 4, 16, 8)
## lbls <- c("US", "UK", "Australia", "Germany", "France")
## pie(slices, labels = lbls, main = "Simple Pie Chart")

## ----echo=F--------------------------------------------------------------
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices) * 100)
lbls2 <- paste(lbls, " ", pct, "%", sep = "")
# lbls2
pie(slices, labels = lbls2, col = rainbow(length(lbls)), 
    main = "Pie Chart with Percentages")

## ----eval=F--------------------------------------------------------------
## slices <- c(10, 12, 4, 16, 8)
## lbls <- c("US", "UK", "Australia", "Germany", "France")
## pct <- round(slices/sum(slices) * 100)
## lbls2 <- paste(lbls, " ", pct, "%", sep = "")
## pie(slices, labels = lbls2, col = rainbow(length(lbls)),
##     main = "Pie Chart with Percentages")

## ----echo=F--------------------------------------------------------------
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
library(plotrix)
pie3D(slices, labels = lbls, explode =
        0.1, main = "3D Pie Chart ")

## ----eval=F--------------------------------------------------------------
## slices <- c(10, 12, 4, 16, 8)
## lbls <- c("US", "UK", "Australia", "Germany", "France")
## library(plotrix)
## pie3D(slices, labels = lbls, explode = 0.1,
##       main = "3D Pie Chart ")

## ----echo=F--------------------------------------------------------------
mytable <- table(state.region)
lbls <- paste(names(mytable), "\n", mytable, sep = "")
pie(mytable, labels = lbls, 
    main = "Pie Chart from a Table\n (with sample sizes)")

## ----eval=F--------------------------------------------------------------
## mytable <- table(state.region)
## lbls <- paste(names(mytable), "\n", mytable, sep = "")
## pie(mytable, labels = lbls,
##     main = "Pie Chart from a Table\n (with sample sizes)")

## ----echo=F--------------------------------------------------------------
library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels = lbls, main = "Fan Plot")

## ----eval=F--------------------------------------------------------------
## library(plotrix)
## slices <- c(10, 12, 4, 16, 8)
## lbls <- c("US", "UK", "Australia", "Germany", "France")
## fan.plot(slices, labels = lbls, main = "Fan Plot")

## ------------------------------------------------------------------------
hist(mtcars$mpg)

## ----echo=F--------------------------------------------------------------
##```{r,echo=F,,fig.show='animate', interval=0.2, aniopts="controls",out.width = ''}
hist(mtcars$mpg, breaks = 12, col = "red", 
     xlab = "Miles Per Gallon", 
     main = "Colored histogram with 12 bins")


## ----eval=F--------------------------------------------------------------
## hist(mtcars$mpg)
## hist(mtcars$mpg, breaks = 12, col = "red",
##      xlab = "Miles Per Gallon",
##      main = "Colored histogram with 12 bins")

## ----echo=F--------------------------------------------------------------
hist(mtcars$mpg, freq = FALSE, breaks = 12, col = "red", 
     xlab = "Miles Per Gallon", 
     main = "Histogram, rug plot, density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg), col = "blue", lwd = 2)
density(mtcars$mpg)

## ----eval=F--------------------------------------------------------------
## hist(mtcars$mpg, freq = FALSE, breaks = 12, col = "red",
##      xlab = "Miles Per Gallon",
##      main = "Histogram, rug plot, density curve")
## rug(jitter(mtcars$mpg))
## lines(density(mtcars$mpg), col = "blue", lwd = 2)

## ----echo=F--------------------------------------------------------------
x <- mtcars$mpg
hist(mtcars$mpg, prob=TRUE,breaks = 12, col = "red", 
          xlab = "Miles Per Gallon", 
          main = "Histogram with normal curve and box")
curve(dnorm(x, mean=mean(mtcars$mpg), sd=sd(mtcars$mpg)), add=TRUE,col = "blue", lwd = 2)

## ----eval=F--------------------------------------------------------------
## x <- mtcars$mpg
## hist(mtcars$mpg, prob=TRUE,breaks = 12, col = "red",
##           xlab = "Miles Per Gallon",
##     main = "Histogram with normal curve and box")
## curve(dnorm(x, mean=mean(mtcars$mpg),
##   sd=sd(mtcars$mpg)), add=TRUE,col = "blue", lwd = 2)

## ----echo=F--------------------------------------------------------------
h = hist(mtcars$mpg,breaks=12,col='red')
h
t(as.matrix(h$density)) %*% as.matrix(diff(h$breaks,1))#it just equals 1.
h$density <- h$counts/sum(h$counts)*100
plot(h,freq=F,ylab='Percentage',col='red',xlim=c(10,35),ylim=c(0,30),main='histogram: Percentage')

## ----eval=F--------------------------------------------------------------
## par(mfrow=c(1,1))
## h = hist(x,breaks=12,col='red')
## # h$density
## # t(as.matrix(h$density)) %*% as.matrix
## #(diff(h$breaks,1))#it just equals 1.
## h$density <- h$counts/sum(h$counts)*100
## plot(h,freq=F,ylab='Percentage',col='red',
##      xlim=c(10,35),ylim=c(0,30),main=
##        'histogram: Percentage')

## ----echo=F--------------------------------------------------------------
par(mfrow = c(2, 1))
d <- density(mtcars$mpg)
plot(d)
d <- density(mtcars$mpg)
plot(d, main = "Kernel Density of Miles Per Gallon")
polygon(d, col = "red", border = "blue")
rug(mtcars$mpg, col = "brown")

## ----eval=F--------------------------------------------------------------
## par(mfrow = c(2, 1))
## d <- density(mtcars$mpg)
## plot(d)
## d <- density(mtcars$mpg)
## plot(d, main = "Kernel Density of Miles Per Gallon")
## polygon(d, col = "red", border = "blue")
## rug(mtcars$mpg, col = "brown")

## ----echo=F--------------------------------------------------------------
par(mfrow = c(1, 1))
par(lwd = 2)
library(sm)
attach(mtcars)
cyl.f <- factor(cyl, levels = c(4, 6, 8), 
                labels = c("4 cylinder", "6 cylinder", "8 cylinder"))
sm.density.compare(mpg, cyl, xlab = "Miles Per Gallon")
title(main = "MPG Distribution by Car Cylinders")
colfill <- c(2:(2 + length(levels(cyl.f))))
# cat("Use mouse to place legend...", "\n\n")
legend('topright', levels(cyl.f), fill = colfill,inset = 0.02)
detach(mtcars)
par(lwd = 1)

## ----eval=F--------------------------------------------------------------
## par(lwd = 2)
## library(sm)
## attach(mtcars)
## cyl.f <- factor(cyl, levels = c(4, 6, 8),
##                 labels = c("4 cylinder", "6 cylinder", "8 cylinder"))
## sm.density.compare(mpg, cyl, xlab = "Miles Per Gallon")
## title(main = "MPG Distribution by Car Cylinders")
## colfill <- c(2:(2 + length(levels(cyl.f))))
## # cat("Use mouse to place legend...", "\n\n")
## legend('topright', levels(cyl.f), fill = colfill)
## detach(mtcars) #locator(1)
## par(lwd = 1)

## ----echo=F--------------------------------------------------------------
boxplot.stats(mtcars$mpg)$stats

## ----echo=F--------------------------------------------------------------
boxplot(mpg ~ cyl, data = mtcars, 
        main = "Car Milage Data", 
        xlab = "Number of Cylinders", 
        ylab = "Miles Per Gallon")

## ----echo=F,warning=F----------------------------------------------------
boxplot(mpg ~ cyl, data = mtcars, notch = T, 
        varwidth = TRUE, col = "red", 
        main = "Car Mileage Data", 
        xlab = "Number of Cylinders", 
        ylab = "Miles Per Gallon")


## ----eval=F--------------------------------------------------------------
## boxplot(mpg ~ cyl, data = mtcars, notch = T,
##         varwidth = TRUE, col = "red",
##         main = "Car Mileage Data",
##         xlab = "Number of Cylinders",
##         ylab = "Miles Per Gallon")
## 

## ----echo=F--------------------------------------------------------------
mtcars$cyl.f <- factor(mtcars$cyl, levels = c(4, 6, 
                                              8), labels = c("4", "6", "8"))
mtcars$am.f <- factor(mtcars$am, levels = c(0, 1), 
                      labels = c("auto", "standard"))
boxplot(mpg ~ am.f * cyl.f, data = mtcars, 
        varwidth = TRUE, col = c("gold", "darkgreen"), 
        main = "MPG Distribution by Auto Type", 
        xlab = "Auto Type")

## ----eval=F--------------------------------------------------------------
## mtcars$cyl.f <- factor(mtcars$cyl, levels = c(4, 6,
##                        8), labels = c("4", "6", "8"))
## mtcars$am.f <- factor(mtcars$am, levels = c(0, 1),
##                       labels = c("auto", "standard"))
## boxplot(mpg ~ am.f * cyl.f, data = mtcars,
##         varwidth = TRUE, col = c("gold", "darkgreen"),
##         main = "MPG Distribution by Auto Type",
##         xlab = "Auto Type")

## ----echo=F--------------------------------------------------------------
suppressPackageStartupMessages(library(vioplot))
x1 <- mtcars$mpg[mtcars$cyl == 4]
x2 <- mtcars$mpg[mtcars$cyl == 6]
x3 <- mtcars$mpg[mtcars$cyl == 8]
vioplot(x1, x2, x3, 
        names = c("4 cyl", "6 cyl", "8 cyl"), 
        col = "gold")
title("Violin Plots of Miles Per Gallon")

## ----eval=F--------------------------------------------------------------
## library(vioplot)
## x1 <- mtcars$mpg[mtcars$cyl == 4]
## x2 <- mtcars$mpg[mtcars$cyl == 6]
## x3 <- mtcars$mpg[mtcars$cyl == 8]
## vioplot(x1, x2, x3,
##         names = c("4 cyl", "6 cyl", "8 cyl"),
##         col = "gold")
## title("Violin Plots of Miles Per Gallon")

## ----echo=F--------------------------------------------------------------
dotchart(mtcars$mpg, labels = row.names(mtcars), 
         cex = 0.7, 
         main = "Gas Milage for Car Models", 
         xlab = "Miles Per Gallon")

## ----eval=F--------------------------------------------------------------
## dotchart(mtcars$mpg, labels = row.names(mtcars),
##          cex = 0.7,
##          main = "Gas Milage for Car Models",
##          xlab = "Miles Per Gallon")

## ----echo=F--------------------------------------------------------------
x <- mtcars[order(mtcars$mpg), ]
x$cyl <- factor(x$cyl)
x$color[x$cyl == 4] <- "red"
x$color[x$cyl == 6] <- "blue"
x$color[x$cyl == 8] <- "darkgreen"
dotchart(x$mpg, labels = row.names(x), cex = 0.7, 
         pch = 19, groups = x$cyl, 
         color = x$color, 
         main = "Gas Milage for Car Models\ngrouped by cylinder", 
         xlab = "Miles Per Gallon")

## ----eval=F--------------------------------------------------------------
## x <- mtcars[order(mtcars$mpg), ]
## x$cyl <- factor(x$cyl)
## x$color[x$cyl == 4] <- "red"
## x$color[x$cyl == 6] <- "blue"
## x$color[x$cyl == 8] <- "darkgreen"
## dotchart(x$mpg, labels = row.names(x), cex = 0.7,
##          pch = 19, groups = x$cyl,
##          color = x$color,
##          main = "Gas Milage for Car Models\n
##          grouped by cylinder",
##          xlab = "Miles Per Gallon")

