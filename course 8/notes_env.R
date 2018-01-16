Sys.setlocale(category = "LC_ALL", locale = "zh_cn.utf-8")
data<-data.frame(id=c('小王','小李','小明'),num=1:3)
write.csv(data,'test.csv',row.names=F)
write.table(data,'test.txt',quote=F,row.names=F,sep='\t')
read.csv('test.csv')

rm(list=ls())
x<-5
assign('y',6)

myenv<-new.env()
assign('x','magic',env=myenv)
assign('y','supermagic',env=myenv)
get('x',env=myenv)
myenv$x
ls(myenv)
parent.env(myenv)


###generic function
summary(women)
fit<-lm(weight~height,women)
summary(fit)
