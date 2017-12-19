## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign)
options(width=60)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = TRUE, size="small")
##knitr::opts_chunk$set(results='asis')

## ------------------------------------------------------------------------
rawdata_long <- read.table(header=TRUE, text='
                           subject sex condition measurement
                           1   M   control         7.9
                           1   M     cond1        12.3
                           1   M     cond2        10.7
                           2   F   control         6.3
                           2   F     cond1        10.6
                           2   F     cond2        11.1
                           3   F   control         9.5
                           3   F     cond1        13.1
                           3   F     cond2        13.8
                           4   M   control        11.5
                           4   M     cond1        13.4
                           4   M     cond2        12.9
                           ')

rawdata_long$subject <- factor(rawdata_long$subject)
library(xtable)
head(rawdata_long)

## ------------------------------------------------------------------------
rm(list=ls())
rawdata_wide <- read.table(header=TRUE, text='
 subject sex control cond1 cond2
       1   M     7.9  12.3  10.7
       2   F     6.3  10.6  11.1
       3   F     9.5  13.1  13.8
       4   M    11.5  13.4  12.9
                          ')
rawdata_wide$subject <- factor(rawdata_wide$subject)
## within-subject design.
rawdata_wide

## ------------------------------------------------------------------------
head(iris[,c(1:4)])

## ------------------------------------------------------------------------
head(iris[,c(4:5)])

## ------------------------------------------------------------------------
head(iris)
iris_w<-iris[,c(1:4)]  ## wide data
iris_l<-stack(iris_w)  ##long data = stacked data
iris_w<-unstack(iris_l)##wide data = unstacked data
subdata<-iris[,4:5]    ## long data
str(subdata)
data_w<-unstack(subdata)
data_w
colMeans(data_w)
with(iris,tapply(iris[,4],Species,mean))

## ------------------------------------------------------------------------
rawdata_wide<-read.csv('data/rawdata_wide.csv')
rawdata_wide

## ------------------------------------------------------------------------
library(tidyr)
rawdata_wide<-read.csv('data/rawdata_wide.csv')
data_long <- gather(rawdata_wide, condition, 
                    measurement, control:cond2)
data_long
str(data_long)
gather(rawdata_wide, condition, measurement, 
                    control, cond1, cond2)

## ------------------------------------------------------------------------
# Rename factor names from "cond1" and "cond2" to
# "first" and "second"
levels(data_long$condition)[levels(data_long$condition)
                            =="cond1"] <- "first"
levels(data_long$condition)[levels(data_long$condition)
                            =="cond2"] <- "second"
# Sort by subject first, then by condition
data_long <- data_long[order(data_long$
                        subject, data_long$condition), ]
# arrange(data_long,subject,condition)

## ------------------------------------------------------------------------
data_long<-read.csv('data/rawdata_long.csv')
# Rename factor names from "cond1" and "cond2" to
# "first" and "second"
levels(data_long$condition)[levels(data_long$condition)
                            =="cond1"] <- "first"
levels(data_long$condition)[levels(data_long$condition)
                            =="cond2"] <- "second"
# Sort by subject first, then by condition
data_long <- data_long[order(data_long$
                        subject, data_long$condition), ]
# arrange(data_long,subject,condition)
head(data_long)

## ------------------------------------------------------------------------
rawdata_long<-read.csv('data/rawdata_long.csv')
head(rawdata_long)

## ------------------------------------------------------------------------
library(tidyr)
rawdata_long<-read.csv('data/rawdata_long.csv')
data_wide <- spread(rawdata_long, condition, measurement)
data_wide

## ------------------------------------------------------------------------
# Rename cond1 to first, and cond2 to second
names(data_wide)[names(data_wide)=="cond1"] <- "first"
names(data_wide)[names(data_wide)=="cond2"] <- "second"
# Reorder the columns
data_wide <- data_wide[, c(1,2,5,3,4)]
data_wide

## ------------------------------------------------------------------------
library(reshape2)
rawdata_wide<-read.csv('data/rawdata_wide.csv')
rawdata_wide
data_long <- melt(rawdata_wide,
                  id.vars=c("subject", "sex"))
data_long <- melt(rawdata_wide,
                    id.vars=c("subject", "sex"), ##not include in reshape
                    measure.vars=c("control", 
                                   "cond1", "cond2" ),## optional
                    variable.name="condition",
                    value.name="measurement"
  )
head(data_long)

## ------------------------------------------------------------------------
library(reshape2)
rawdata_long<-read.csv('data/rawdata_long.csv')
rawdata_long

dcast(rawdata_long, subject + sex~ 
        condition, value.var="measurement",mean)
head(data_wide)
data_wide


## ------------------------------------------------------------------------
library(reshape2)
iris_long<-melt(iris,id.vars='Species')
head(iris_long)
str(iris_long)
iris_long<-melt(iris,id='Species',variable.name =
                  "measurement",value.name = "value")
head(iris_long)
dcast(data=iris_long,formula=Species~measurement,
      value.var='value',fun=mean)
dcast(data=iris_long,formula=Species~measurement,
      value.var='value',fun=mean,na.rm=T)


## ------------------------------------------------------------------------
t(sapply(iris[,1:4],function(x) tapply(x, iris$Species, mean,na.rm=T)))
s <- split(iris, iris$Species)
sapply(s, function(x) colMeans(x[, 1:4],na.rm=T))

## ------------------------------------------------------------------------
head(tips)[1:3,]
dcast(tips, sex~.,value.var = 'tip',fun=mean)
dcast(tips, sex~size,value.var = 'tip',fun=mean)

## ------------------------------------------------------------------------
dcast(tips, sex~.,value.var = 'tip',fun=mean)
dcast(tips, sex~.,value.var = 'total_bill',fun=mean)
tips_melt<-melt(tips,id.vars=
      c('sex','smoker','day','time','size'))
head(tips_melt)
dcast(data=tips_melt,sex~variable,value.var 
      = 'value',fun=mean)

## ------------------------------------------------------------------------
tips_melt<-melt(tips,id.vars=c('sex','smoker','day','time','size'))
head(tips_melt)
tips_mean<-dcast(tips_melt,sex+smoker~variable,fun=mean)
tips_mean
tips_mean$rate<-with(tips_mean,tip/total_bill)
tips_mean

## ------------------------------------------------------------------------
data1<-read.dta('data/data1.dta')
data2<-read.dta('data/data2.dta')
data1;data2

## ------------------------------------------------------------------------
data1<-read.dta('data/data1.dta')
data2<-read.dta('data/data2.dta')
merge(data1,data2,by = 'IDs')
# merge(data1,data2,by.x ='IDs',by.y='ID')

## ------------------------------------------------------------------------
library(foreign)
data1<-read.dta('data/data1.dta')
data2<-read.dta('data/data2.dta')
merge(data1,data2,by = 'IDs',all=T)
merge(data1,data2,by = 'IDs',all.x=T)
merge(data1,data2,by = 'IDs',all.y=T)

