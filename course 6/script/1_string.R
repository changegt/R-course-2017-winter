## ----setup, include=FALSE------------------------------------------------
library(knitr);library(xtable);library(foreign);library(dplyr);library(vcd);library(grid)
options(width=80)
opts_chunk$set(comment = "", warning = FALSE, message = FALSE, tidy = FALSE, size="small")
##knitr::opts_chunk$set(results='asis')

## ----eval=F--------------------------------------------------------------
## paste('Welcome','Qiang')
## paste('Welcome','Qiang','and his friends.')
## paste('Christ','mas',sep="") #equivalent to paste0
## paste('Welcome','Qiang','and his friends.',sep=' + ')
## ##vectorization
## paste('Welcome',c('Qiang','jack','Lucy'),
## c('and his friends.','and his classmates'),sep=" ")
## # result<-paste('Welcome',c('Qiang','jack','Lucy'),
## # c('and his friends.','and his classmates'),sep=" ")
## #   result
## #   cat(result,sep='\n')

## ----eval=F--------------------------------------------------------------
## vectorOfText<-c('Hello','everyone','out there',".")
## vectorOfText
## paste(vectorOfText,collapse="*")
## 
## paste(c('a','b','c','d'),collapse=" + ")
## ## "PC1 + PC2 + PC3 + PC4 + PC5 + PC6 + PC7 + PC8
## # + PC9 + PC10"
## PCs<-paste0('PC',1:10)
## PCs
## paste(PCs,collapse=" + ")
## paste0("PC", 1:10,collapse=" + ")#strjoin
## 

## ----eval=F--------------------------------------------------------------
## "Hello Qiang,the game will start at eight at
## Zhaohui campus"
## person='Ming';time='six';location='Pingfeng'
## 
## paste('Hello ',person,",the game will start at ",
##       time,' at ', location,' campus',sep="")
## 
## sprintf("Hello %s,the game will start at %s at %s campus",
##         person,time,location)
## 
## #vectoriztion
## person=c('Ming','Jack','Linda','Tracy');time='six';
## location=c('Pingfeng','Chaohui','Deqing','Keqiao')
## sprintf("Hello %s,the game will start at %s at %s campus",
##          person,time,location)

## ----eval=F--------------------------------------------------------------
## value<-c('gender','general','requirement','ecosystem')
## value[nchar(value)>8]
## length(value)
## nchar("");length("")
## DNA<-"ATGCtttACC"
## toupper(DNA)
## tolower(DNA)
## DNA
## chartr("Tt", "Uu", DNA)##character translation
## chartr("Tt", "UU", DNA)

## ----eval=F--------------------------------------------------------------
## str(substr)
## value<-c('a1243_v','b3934_d','c1723_t')
## substr(value,2,5)
## substr(value,2,5)<-'1234'
## value

## ----eval=F--------------------------------------------------------------
## str(grep) ##pattern is regular expression
## grep('A',c('ABC','DEF','XAT','ATZ'))
## grep('A',c('ABC','DEF','XAT','ATZ'),value=T)
## grepl('A',c('ABC','DEF','XAT','ATZ'))
## c('ABC','DEF','XAT','ATZ')[grepl('A',c('ABC','DEF','XAT','ATZ'))]
## ##regular expression.
## grep('^A',c('ABC','DEFA','XAT','ATZ'),value=T)
## 

## ----eval=F--------------------------------------------------------------
## # only works on Qiang's computer but you can revise
## # it accordingly for your purpose.
## files<-list.files('~/desktop/test')
## # pattern=".*stata[0-9]*_[0-9]*\\.dta$"
## files
## files[grep("^e.*\\.csv$", files)]
## ##"\\"escape character(转义字符).

## ----eval=F--------------------------------------------------------------
## paste('I\'m', 'a', 'big  fan of R')
## # cat('Hello','World!')
## # text<-  c("Hellow, Adam!", "Hi, Adam!",
## # "How are you, Adam.")
## # sub(pattern=".*(Adam).*",
## # replacement="\\1", text)
## 

## ------------------------------------------------------------------------
vec<-c('ABAAAABBBAAAAB','AAABBBBBBBAABBB',
       'AAAAAAAABBBBBAA','AABBBABBBAABBAB')

## ----eval=F--------------------------------------------------------------
## vec<-c('ABAAAABBBAAAAB','AAABBBBBBBAABBB',
##        'AAAAAAAABBBBBAA','AABBBABBBAABBAB')
## regexpr('AB',vec)
## gregexpr('AB',vec)
## sapply(gregexpr('AB',vec),length)

## ----eval=F--------------------------------------------------------------
## str(sub)
## sub('a','x',c('abcda','bcda','xdg_a','xgh_a'))
## gsub('a','x',c('abcda','bcda','xdg_a','xgh_a'))
## 
## ##blank:space and tab
## sub('\\s','_',c('abcd','hello world!','jack Ma'))
## sub('_.','_x',c('abcda','bcda','xdg_a','xgh_a'))

## ----eval=F--------------------------------------------------------------
## library(rmatio)
## data(iris)
## names(iris)
## names(iris)<-sub("\\.", "_", names(iris))
## names(iris)

## ----eval=F--------------------------------------------------------------
## data(iris);names(iris)
## sub(".", "_", names(iris))
## sub("\\.", "_", names(iris))
## names(iris)<-sub(".", "_", fixed = T,names(iris))
## names(iris)
## sub("[.]", "_", names(iris))
## 
## ## with pipeline.
## library(dplyr);library(rmatio)
## iris %>% setNames(sub("[.]", "_", names(.)))
## names(iris)
## out<-split(iris[,c(1:4)],f=iris$Species)
## write.mat(out,'iris_nested.mat')

## ------------------------------------------------------------------------
namelist<-c('Jack Ma','Bruce Lee','Jackie Chan',
            'Jet Lee','Chow Yunfat')
namelist

## ----eval=F--------------------------------------------------------------
## str(strsplit)
## namelist<-c('Jack Ma','Bruce Lee','Jackie Chan',
##             'Jet Lee','Chow Yunfat')
## y<-strsplit(namelist," ")
## y
## # sapply(y,'[')[1,]
## do.call('rbind',y)

## ------------------------------------------------------------------------
grep('^A',c('ABC','DEF','XAT','ATZ','aBC')) 
grep('C$',c('ABC','DEF','XAT','ATZ','aBC')) 


## ----eval=F--------------------------------------------------------------
## # var<-c('a123','bcda','a456','xdfa','xddga')
## # grep('^a',var)
## # grep('a$',var)
## # sub('^a','',var)
## # sub('a$','',var)
## var0<-c('aa123b_a','bcdab_bc','a45b6_c',
##         'xdafa_d','xgaab_e')
## sub('_.','',var0)
## sub('_.?','',var0)
## grep('aa?b',var0,value=T)
## grep('aa+b',var0,value=T)
## grep('aa*b',var0,value=T)

## ------------------------------------------------------------------------
var0<-c('aa123b_a','bcdab_b','ba45b6_c',
        'xdafa_d','xgaab_e')  
sub('_[a-e]','',var0)
grep('ab|ba',var0,value=T)
grep('[Aa$]',c('ABC','DEF','XAT$','ATZ','aBC'),value=T) 
grep("(ab)?c",c("ababc","ac","cde"))

## ----eval=F--------------------------------------------------------------
## variable<-c('A1234','A1234M6','A1234X5','A1565',
##             'A2456Z4','1245')
## var1<-c('data','hi14','history','hi2','thim','hi5')
## grep('^h.*[0-9]+$',var1,value = T)
## 
## 
## var2<-c(5,9,1,4,5,2)
## var3<-rep(1:3,2)
## data<-data.frame(var1,var2,var3)
## data
## data[grep('^hi[0-9]+$',data[,1]),]
## grep('^A[0-9]+$', variable, value=TRUE)
## variable[grepl('^A.',variable)]

## ----eval=F--------------------------------------------------------------
## sub('a$','x',c('abcd','bcda'))
## sub('a.c','',c('abcd','bcda'))
## var0<-c('aa123b_a','bcdab_b','a45b6_c','xdafa_d',
##         'xgaab_e')
## sub('a*b','',c('akbcd','dcaaaba'))
## sub('a*d','',c('abcd','bcda'))
## sub('a.*e','',c('abcde','edcba'))
## sub('ba|ab','',c('abcd','cdba'))
## sub('[^ab]',"",var0)

