std<-function(x){
  n <- length(x)
  meanx <- sum(x)/n
  css <- sum((x-meanx)**2)
  df=n
  sdx <- sqrt(css/df)  
  return(sdx)
}