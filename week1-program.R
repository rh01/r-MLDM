data(iris)
attributes(iris)
summary(iris)
plot(iris)
plot(Species, Sepal.Length, main="Distribution of Sepal.Length")
attach(iris)
var=c(1:4)
colMeans(iris[,-5])
cor(Sepal.Length, Sepal.Width)
corr=cor(iris[var], use="pairwise")
corr
cov(Petal.Length, Petal.Width)
covv=cov(iris[var], use="pairwise")
covv
install.packages("timeDate")
library(timeDate)
skewness(iris[,1:4]) # https://en.wikipedia.org/wiki/Skewness
kurtosis(iris[,1:4]) # https://en.wikipedia.org/wiki/Kurtosis
#偏態值 > 0，為正偏態，分配集中在平均數以下，低分群的個體較多。
#偏態值 < 0，為負偏態，分配集中在平均數以上，高分群的個體較多。
#峰度值 > 3，為高狹峰，較常態分配來得高瘦。
#峰度值 < 3，為低闊峰，較常態分配來得矮胖。