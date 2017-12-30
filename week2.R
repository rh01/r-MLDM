data(iris)
attach(iris)
x = boxplot(iris[,1:4],main="Three species")
x$stats


gender_outlier <- read.csv('gender_outlier.csv')
attach(gender_outlier)
Male = subset(gender_outlier,gender_outlier$Gender=='male')
Female = subset(gender_outlier,gender_outlier$Gender=='female')
Ma.mean <- colMeans(Male[,-4])
Fe.mean <- colMeans(Female[,-4])

Ma.var<-cov(Male[c(1:3)], use="pairwise")
Fe.var<-cov(Female[c(1:3)], use="pairwise")

Male$mdis<- mahalanobis(Male[, -4], Ma.mean, Ma.var)
Female$mdis<-mahalanobis(Female[, -4], Fe.mean, Fe.var)
Male$maout<-(Male$mdis< qchisq(df=3, p=0.95))
Female$feout<-(Female$mdis< qchisq(df=3, p=0.95))


stock<- read.table("2016stock.csv", header=T, sep=",") #台灣股市資料
x=1:nrow(stock); y=stock$Index #original data
plot(x,y)
install.packages("qcc")
library(qcc)

#移動平均法 (SMA- simple moving average)
n=c(5,10,20) #length (5 天、10 天、20 天移動平均線)
y1=cbind(y,y,y) #初始化SMA

for (nd in 1:length(n)) #nd: index for length of moving average
{
  for (i in (n[nd]+1) : length(y))
  {
    j= i-n[nd]; k=i-1;
    y1[i, nd] = mean(y[j : k])
  }
  
}
plot(x, y, col=1, ylab="stock", xlab="date", main="Simple Moving Average")
points(x, y1[,1], col=2, pch=2)
points(x, y1[,2], col=3, pch=3)
points(x, y1[,3], col=4, pch=4)
lines(ewmaSmooth(x, y, lambda=0.1), col="brown")

#指數平滑法 (exponentially weighted moving average)
y2=cbind(y,y,y) #初始化EWMA
lambda1=0.1; lambda2=0.3; gap=0.1;
for (ld in 1 : ((lambda2-lambda1)/gap+1))
{
  lambda=lambda1+gap*(ld-1)
  for (i in 2 : length(y))
  {
    y2[i, ld]= lambda*y[i-1] + (1-lambda)*y2[i-1, ld]
  }
}


plot(x, y, col=1, ylab="stock", xlab="date", main="Exponentially Weighted Moving
     Average")
points(x, y2[,1], col=2, pch=2)
points(x, y2[,2], col=3, pch=3)
points(x, y2[,3], col=4, pch=4)
lines(ewmaSmooth(x, y, lambda=0.1), col="brown")