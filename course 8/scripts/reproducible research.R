## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = TRUE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----eval=F--------------------------------------------------------------
## ##chunk
## <<>>=
## set.seed(1121)
## (x=rnorm(20))
## mean(x);var(x)
## @
## ##inline
## \Sexpr{pi}

## ----eval=F--------------------------------------------------------------
## <<xtable, results="asis">>=
n <- 100
x <- rnorm(n)
y <- 2*x + rnorm(n)
out <- lm(y ~ x)
library(xtable)
xtable(summary(out)$coef, digits=c(0, 2, 2, 1, 2))
## @

## ----results='asis',message=FALSE----------------------------------------
result<-summary(with(mtcars,lm(mpg~hp+wt)))
library(knitr)
kable(result$coe)

## ----eval=F, fig.height=4, fig.width=8-----------------------------------
## n <- 100
## x <- rnorm(n)
## par(mfrow=c(1,2), las=1)
## for(i in 1:8) {
##   y <- i*x + rnorm(n)
##   plot(x, y, main=i)
## }

## ----eval=F--------------------------------------------------------------
 library(knitr)
 library(markdown)
##generate .md file
 knit("test.Rmd")

## ----eval=F--------------------------------------------------------------
## #devtools::install_github("slidify", "ramnathv")
 library(slidify)
 author('Qiang')

