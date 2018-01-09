## ----echo=F--------------------------------------------------------------
x=seq(0,20,by = 1)
y1=dpois(x,1)
y2=dpois(x,4)
y3=dpois(x,10)

plot(x,y1,type="o",lwd=3,col="black",pch=21,bg='peru',xlab='K',ylab='P(X=K)',main='possion distribution',cex=2)
lines(x,y2,type="o",lwd=3,col="black",pch=21,bg='purple',cex=2)
lines(x,y3,type="o",lwd=3,col="black",pch=21,bg='skyblue',cex=2)
legend("topright",legend=paste("lambda:",c(1,4,10)),lwd=3,col=c("peru", "purple","skyblue"),pt.bg = 'white')

## ----eval=F--------------------------------------------------------------
## 3^0*exp(-3)/factorial(0)
## 3^1*exp(-3)/factorial(1)
## 3^2*exp(-3)/factorial(2)
## dpois(0:2,3)
## sum(dpois(0:2,3))
## ppois(2,3)

