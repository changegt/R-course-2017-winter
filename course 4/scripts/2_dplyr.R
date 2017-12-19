## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(nycflights13);library(tibble)
options(width=36)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = TRUE, size="small")
##knitr::opts_chunk$set(results='asis')

## ------------------------------------------------------------------------
with(iris,tapply(iris[,1],Species,mean))

## ------------------------------------------------------------------------
s <- split(iris, iris$Species)
tmp.data<-iris[,1:3]
# head(tmp.data)
sapply(s, function(x) colMeans(tmp.data,na.rm=T))

## ----eval=T--------------------------------------------------------------
library(dplyr)
iris %>% group_by(Species) %>% 
  select(one_of('Sepal.Length')) %>%
  summarise_each(funs(mean(.)))
iris %>% group_by(Species) %>% 
  select(one_of(names(iris[,1:3]))) %>% summarise_each(funs(mean(.)))

## ----echo=F--------------------------------------------------------------
iris %>% group_by(Species) %>% select(one_of('Sepal.Length')) %>% summarise_each(funs(mean(.)))
iris %>% group_by(Species) %>% select(one_of(names(iris[,1:3]))) %>% summarise_each(funs(mean(.)))

## ----eval=T--------------------------------------------------------------
library(tibble)
iris;head(iris)
as.tibble(iris);tbl_df(iris)

## ------------------------------------------------------------------------
tibble(x=1:5,y=1,z=x^2+y)

## ------------------------------------------------------------------------
tribble(
  ~x,~y,~z,
  "a",2,3.6,
  "b",1,8.5
)

## ------------------------------------------------------------------------
df1 <- data.frame(x = 1:3, y = 3:1)
class(df1[, 1:2])
class(df1[, 1])
df2 <- tibble(x = 1:3, y = 3:1)
class(df2[, 1:2])
class(df2[, 1])

## ----eval=T--------------------------------------------------------------
library(dplyr)
library(nycflights13)
dim(flights)
head(flights)
flights  #tbl_df
print(tbl_df(mtcars),n=5)
tbl_df(iris)
glimpse(flights)

## ----eval=T--------------------------------------------------------------
flights[flights$month == 1 & flights$day == 1, ]

## ----eval=T--------------------------------------------------------------
library(nycflights13)
subset(flights, month == 1 & day == 1)

## ----eval=T--------------------------------------------------------------
library(nycflights13)
filter(flights, month == 1, day == 1) ##tidyr ":"" vs. "," 
filter(flights, month == 1 | month == 2)
filter(flights,carrier=='AA'|carrier=='UA')
filter(flights,carrier %in% c("AA","UA"))

## ----eval=T--------------------------------------------------------------
library(dplyr)
library(nycflights13)
flights[1:10,]

## ----eval=T--------------------------------------------------------------
library(nycflights13)
slice(flights, 1:10)

## ----eval=T--------------------------------------------------------------
flights[order(flights$year, flights$month, flights$day), ]
flights[order(-flights$arr_delay), ]#descend  

## ----eval=T--------------------------------------------------------------
library(nycflights13)
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

## ----eval=T--------------------------------------------------------------
library(nycflights13)
flights[,c("year","month","day")]
subset(flights, select=(year:day))

## ----eval=T--------------------------------------------------------------
library(nycflights13)
select(flights, year,month,day)
select(flights, year:day)

## ----eval=T--------------------------------------------------------------
library(nycflights13)
select(flights, -(year:day))

## ----eval=T--------------------------------------------------------------
library(nycflights13)
select(flights, tail_num = tailnum)

## ----eval=T--------------------------------------------------------------
library(nycflights13)
rename(flights, tail_num = tailnum)
flights

## ----eval=T--------------------------------------------------------------
library(nycflights13)
unique(select(flights, tailnum))
distinct(select(flights, tailnum))
distinct(select(flights, origin, dest))

## ------------------------------------------------------------------------
iris$Sepal_sum<- iris$Sepal.Length +iris$ Sepal.Width
head(iris)[,c(1:2,5:6)]

## ----eval=T--------------------------------------------------------------
library(nycflights13)
transform(flights,
          gain = arr_delay - dep_delay,
          speed = distance / air_time * 60)

## ----eval=T--------------------------------------------------------------
library(nycflights13)
mutate(flights,
       gain = arr_delay - dep_delay,
       speed = distance / air_time * 60)

## ----eval=T--------------------------------------------------------------
mutate(flights,
       gain = arr_delay - dep_delay,
       gain_per_hour = gain / (air_time / 60)
)

 transform(flights,
   gain = arr_delay - delay,
   gain_per_hour = gain / (air_time / 60)
 )

## ----eval=T--------------------------------------------------------------
transmute(flights,
          gain = arr_delay - dep_delay,
          gain_per_hour = gain / (air_time / 60)
)

## ----eval=T--------------------------------------------------------------
iris_new<-mutate_each(iris[,1:4],
                      funs(ratio=./max(.),avg=mean(.)))
head(iris_new)

## ------------------------------------------------------------------------
library(nycflights13)
summarise(flights,
  delay = mean(dep_delay, na.rm = TRUE))

## ------------------------------------------------------------------------
library(nycflights13)
summarise_each(iris[,1:4],funs(avg=mean(.,na.rm=T)))

## ------------------------------------------------------------------------
# count(iris, Species)
count(iris, Species,wt=Sepal.Length)
with(iris,tapply(iris[,1],Species,sum))

## ----eval=T--------------------------------------------------------------
sample_n(flights, 10)
sample_frac(flights, 0.01)
sample_frac(flights, 0.01,replace = T) ##bootstrap

## ----eval=T--------------------------------------------------------------
library(nycflights13)
by_tailnum <- group_by(flights, tailnum)
by_tailnum
delay <- summarise(by_tailnum,
  count = n(),
  dist = mean(distance, na.rm = TRUE),
  delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dist < 2000)
with(delay,plot(dist,delay))
abline(with(delay,lm(delay~dist)))

## ----eval=T,width=24-----------------------------------------------------
destinations <- group_by(flights, dest)
destinations
dest<-summarise(destinations,
planes = n_distinct(tailnum),
flights = n()
)
arrange(dest,desc(planes))
summarise(dest,sum(flights))

## ----eval=T--------------------------------------------------------------
daily <- group_by(flights, month, day)
(per_day   <- summarise(daily, flights = n()))
(per_month <- summarise(per_day, flights = sum(flights)))
(per_year  <- summarise(per_month, flights = sum(flights)))

## ----eval=T--------------------------------------------------------------
flights<-mutate(flights,hrs=air_time/60,
                speed=distance/hrs)
flights0<-group_by(flights,tailnum) 
flight<-select(flights0,speed)
flight
summarise(flight,
        speed_mean=mean(speed,na.rm=T))  


## ----eval=T--------------------------------------------------------------
a1 <- group_by(flights, year, month, day)
a2 <- select(a1, arr_delay, dep_delay)
a3 <- summarise(a2,
  arr = mean(arr_delay, na.rm = TRUE),
  dep = mean(dep_delay, na.rm = TRUE))
a4 <- filter(a3, arr > 30 | dep > 30)

## ----eval=T--------------------------------------------------------------
filter(
  summarise(
    select(
      group_by(flights, year, month, day),
      arr_delay, dep_delay
    ),
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ),
  arr > 30 | dep > 30
)

## ----eval=T--------------------------------------------------------------
flights %>%
  group_by(year, month, day) %>%
  select(arr_delay, dep_delay) %>%
  summarise(
    arr = mean(arr_delay, na.rm = TRUE),
    dep = mean(dep_delay, na.rm = TRUE)
  ) %>%
  filter(arr > 30 | dep > 30)

