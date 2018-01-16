
## ----echo=FALSE----------------------------------------------------------
library(plot3D)
# x, y and z coordinates
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width
 scatter3D(x, y, z, phi = 0, bty = "g",
        pch = 20, cex = 2, ticktype = "detailed")

## ----eval=F--------------------------------------------------------------
## library(gcookbook)
## simpledat
## barplot(simpledat,beside=T);barplot(t(simpledat),beside=T)
## plot(simpledat[1,],type='l')
## lines(simpledat[2,],type='l',col='blue')

## ----eval=F--------------------------------------------------------------
## library(ggplot2)
## simpledat_long
## ggplot(simpledat_long,aes(x=Aval,y=value,fill=Bval))+
##   geom_bar(stat='identity',position='dodge')
## ggplot(simpledat_long,aes(x=Bval,y=value,fill=Aval))+
##   geom_bar(stat='identity',position='dodge')
## ggplot(simpledat_long,aes(x=Aval,y=value,colour=Bval,
##                           group=Bval))+geom_line()

## ----fig.height=5--------------------------------------------------------
library(ggplot2)
# with(mtcars,plot(wt,mpg))
ggplot(data=mtcars, aes(x=wt, y=mpg))+
  geom_point()+labs(title="Automobile Data",
                x="Weight", y="Miles Per Gallon")
# ggsave(file='data.pdf')

## ----fig.height=5--------------------------------------------------------
ggplot(data=mtcars, aes(x=wt, y=mpg)) +
  geom_point(pch=17,color="cornflowerblue",size=3)+
  geom_smooth(method="lm",color="red",se=F,linetype=1)+
labs(title="Automobile Data", x="Weight", y="MPG")

## ------------------------------------------------------------------------
p<-ggplot(data=mtcars, aes(x=wt, y=mpg)) 
p+ geom_point(pch=17, color="blue", size=2)+
geom_smooth(method="lm",color="red",linetype=1)+
labs(title="Automobile Data",x="Weight",y="mpg")

## ------------------------------------------------------------------------
data(mtcars)
mtcars$am <- factor(mtcars$am, levels=c(0,1),
                    labels=c("Automatic", "Manual"))
mtcars$vs <- factor(mtcars$vs, levels=c(0,1),
                    labels=c("V-Engine", "Straight Engine"))
mtcars$cyl <- factor(mtcars$cyl)

## ----echo=F--------------------------------------------------------------
library(ggplot2)
ggplot(data=mtcars, aes(x=hp, y=mpg,
                        shape=cyl, color=cyl)) +
  geom_point(size=3) +
  facet_grid(am~vs) +
  labs(title="Automobile Data by Engine Type",
       x="Horsepower", y="Miles Per Gallon")

## ----eval=F--------------------------------------------------------------
## library(ggplot2)
## ggplot(data=mtcars, aes(x=hp, y=mpg,
##                         shape=cyl, color=cyl)) +
##   geom_point(size=3) +
##   facet_grid(am~vs) +
##   labs(title="Automobile Data by Engine Type",
##        x="Horsepower", y="Miles Per Gallon")

## ----fig.height=5--------------------------------------------------------
library(ggplot2)
ggplot(data=mtcars, aes(x=wt, y=mpg))+geom_line()+
  geom_point() + labs(title="Automobile Data",
                x="Weight", y="Miles Per Gallon")

## ------------------------------------------------------------------------
data(singer, package="lattice")
p1<-ggplot(singer, aes(x=height)) + geom_histogram()
p2<-ggplot(singer,aes(x=voice.part,y=height))+geom_boxplot()
library(gridExtra);grid.arrange(p1, p2, ncol=2)

## ------------------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
library(ggplot2)
ggplot(Salaries, aes(x=rank, y=salary)) +
  geom_boxplot()+ geom_point()+ geom_rug()

## ------------------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
ggplot(Salaries, aes(x=rank, y=salary)) +
geom_boxplot(fill="cornflowerblue",color="black",notch=T)+
  geom_point(position='jitter',color="blue", alpha=.5)
# +  geom_rug(side="l", color="black")

## ------------------------------------------------------------------------
library(ggplot2)
data(singer, package="lattice")
ggplot(singer, aes(x=voice.part,y=height))+
geom_violin(fill="lightblue")+
geom_boxplot(fill="lightgreen", width=0.2)

## ----fig.height=4--------------------------------------------------------
Salaries <- read.csv("salaries.csv")
p<-ggplot(Salaries,aes(x=yrs.since.phd,y=salary))+geom_point()
q<-ggplot(Salaries,aes(x=yrs.since.phd,y=salary,
shape=sex,color=rank))+geom_point()
library(gridExtra);grid.arrange(p,q,ncol=2)

## ------------------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
ggplot(data=Salaries,aes(x=salary,fill=rank))+
  geom_density(alpha=.5,col='black')
# +facet_grid(rank~.)

## ------------------------------------------------------------------------
library(sm);Salaries <- read.csv("salaries.csv")
attach(Salaries);sm.density.compare(salary,rank)
colfill<-c(2:(2+length(levels(rank))))
legend('topright',levels(rank),fill=colfill,inset=0.02)

## ----fig.height=4--------------------------------------------------------
a<-ggplot(Salaries, aes(x=rank, fill=sex))+
geom_bar(position="stack")+labs(title='position="stack"')
b<-ggplot(Salaries, aes(x=rank, fill=sex))+
geom_bar(position="dodge")+labs(title='position="dodge"')
c<-ggplot(Salaries, aes(x=rank, fill=sex))+
geom_bar(position="fill")+labs(title='position="fill"')
library(gridExtra);grid.arrange(a,b,c,ncol=3)

## ----fig.height=3.8------------------------------------------------------
data<-data.frame(with(Salaries,table(sex,rank)))
a<-ggplot(data, aes(x=rank,y=Freq,fill=sex))+geom_bar(
stat='identity',position="stack")+labs(title='stack')
b<-ggplot(data, aes(x=rank,y=Freq,fill=sex))+geom_bar(
stat='identity',position="dodge")+labs(title='dodge')
c<-ggplot(data, aes(x=rank,y=Freq,fill=sex))+geom_bar(
stat='identity',position="fill")+labs(title='fill')
library(gridExtra);grid.arrange(a,b,c,ncol=3)

## ------------------------------------------------------------------------
data(singer, package="lattice")
ggplot(data=singer, aes(x=height)) +
geom_histogram() + facet_wrap(~voice.part,nrow=2)

## ------------------------------------------------------------------------
ggplot(Salaries, aes(x=yrs.since.phd, y=salary,
color=rank,shape=rank)) + geom_point() +
facet_grid(.~sex)

## ------------------------------------------------------------------------
data(singer, package="lattice")
library(ggplot2)
ggplot(data=singer, aes(x=height, fill=voice.part))+
  geom_density()+ facet_grid(voice.part~.)

## ----fig.height=3.8------------------------------------------------------
Salaries <- read.csv("salaries.csv")
a<-ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary)) +
geom_smooth() + geom_point()
b<-ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary,
linetype=sex, shape=sex, color=sex)) +
geom_smooth(method=lm, formula=y~poly(x,2),se=F,size=2)+
geom_point(size=2,alpha=0.5)# quadratic
library(gridExtra);grid.arrange(a,b,ncol=2)

## ------------------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
library(ggplot2)
ggplot(Salaries,aes(x=rank, y=salary,fill=sex))+
geom_boxplot() 

## ----echo=F--------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
library(ggplot2)
ggplot(data=Salaries, aes(x=rank, y=salary,fill=sex)) +
  geom_boxplot() +
  scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
                   labels=c("Assistant\nProfessor",
                            "Associate\nProfessor",
                            "Full\nProfessor")) +
  scale_y_continuous(breaks=c(50000, 100000, 150000, 200000),
                     labels=c("$50K", "$100K", "$150K", "$200K")) +
  labs(title="Faculty Salary by Rank and Sex", x="", y="")

## ----eval=F--------------------------------------------------------------
## Salaries <- read.csv("salaries.csv")
## library(ggplot2)
## ggplot(data=Salaries, aes(x=rank, y=salary,fill=sex)) +
##   geom_boxplot() +
##   scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
##                    labels=c("Assistant\nProfessor",
##                             "Associate\nProfessor",
##                             "Full\nProfessor")) +
##   scale_y_continuous(breaks=c(50000, 100000, 150000, 200000),
##                      labels=c("$50K", "$100K", "$150K", "$200K")) +
##   labs(title="Faculty Salary by Rank and Sex", x="", y="")

## ----echo=F--------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
ggplot(data=Salaries, aes(x=rank, y=salary, fill=sex)) +
  geom_boxplot() +
scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
                   labels=c("Assistant\nProfessor",
                            "Associate\nProfessor",
                            "Full\nProfessor")) +
  scale_y_continuous(breaks=c(50000, 100000, 150000, 200000),
                     labels=c("$50K", "$100K", "$150K", "$200K")) +
  labs(title="Faculty Salary by Rank and Gender",
       x="", y="", fill="Gender") +
  theme(legend.position=c(.15,.8))

## ----eval=F--------------------------------------------------------------
## Salaries <- read.csv("salaries.csv")
## ggplot(data=Salaries, aes(x=rank, y=salary, fill=sex)) +
##   geom_boxplot() +
## scale_x_discrete(breaks=c("AsstProf", "AssocProf", "Prof"),
##                    labels=c("Assistant\nProfessor",
##                             "Associate\nProfessor",
##                             "Full\nProfessor")) +
##   scale_y_continuous(breaks=c(50000, 100000, 150000, 200000),
##                      labels=c("$50K", "$100K", "$150K", "$200K")) +
##   labs(title="Faculty Salary by Rank and Gender",
##        x="", y="", fill="Gender") +
##   theme(legend.position=c(.15,.8))

## ------------------------------------------------------------------------
# table(mtcars$disp)
ggplot(mtcars, aes(x=wt, y=mpg, size=disp)) +
  geom_point(shape=21, color="black", fill="cornsilk") +
  labs(x="Weight", y="Miles Per Gallon",
title="Bubble Chart", size="Engine\nDisplacement")

## ------------------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
ggplot(data=Salaries, aes(x=yrs.since.phd, y=salary, color=rank))  +
  geom_point(size=2)+
  scale_color_manual(values=c("orange", "olivedrab", "navy"))

## ------------------------------------------------------------------------
Salaries <- read.csv("salaries.csv")
ggplot(Salaries,aes(x=yrs.since.phd,y=salary,color=rank))+
scale_color_brewer(palette="Set1")+
geom_point(size=2)
# "Set2","Set3", "Pastel1", "Pastel2", "Paired", "Dark2", or "Accent")

## ------------------------------------------------------------------------
library(RColorBrewer);display.brewer.all()

## ----fig.height=3.8------------------------------------------------------
library(ggthemes)
p1<-ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +labs(title='Cars')
p2<-ggplot(mtcars, aes(wt, mpg)) +
geom_point() + geom_rangeframe() +
theme_tufte()
library(gridExtra);grid.arrange(p1,p2,ncol=2)

## ----fig.height=5--------------------------------------------------------
p<-ggplot(iris,aes(Sepal.Length,Sepal.Width,colour
= Species))+ geom_point(size=1.3)
p + theme_economist() +
scale_color_economist()+
ggtitle("Iris data sets")

## ----fig.height=5--------------------------------------------------------
p<-ggplot(iris,aes(Sepal.Length,Sepal.Width,colour
= Species))+ geom_point(size=1.3)
p + theme_wsj()+ scale_colour_wsj("colors6")+
ggtitle("Iris data")# rgby, red_green, black_green, dem_rep,colors6.

## ----fig.height=5--------------------------------------------------------
p<-ggplot(iris,aes(Sepal.Length,Sepal.Width,colour
= Species))+ geom_point(size=2)
p + theme_calc()+ scale_colour_calc()+
ggtitle("Iris data")

## ----fig.height=5--------------------------------------------------------
p<-ggplot(iris,aes(Sepal.Length,Sepal.Width,colour
= Species))+ geom_point(size=2)
p + theme_hc()+ scale_colour_hc()

## ----fig.height=5--------------------------------------------------------
p<-ggplot(iris,aes(Sepal.Length,Sepal.Width,colour= Species))+ geom_point(size=2)
p + theme_stata() + scale_color_stata() +
ggtitle("Iris data")

## ------------------------------------------------------------------------
 
myplot<-ggplot(data=mtcars,aes(x=mpg))+
                  geom_histogram()
ggsave(file='mygraph.png',plot=myplot,width=5,height=4)
ggsave(file='mygraph.png',width=5,height=4)


