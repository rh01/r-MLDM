install.packages("mclust")
library(mclust)
result4=Mclust(iris[,-5], G=3) ## 高斯混合模型
summary(result4, parameters=TRUE)
names(result4)
result4$classification
plot(result4)

fitEM1=Mclust(iris[,-5])
summary(fitEM1, parameters=TRUE)
names(fitEM1)
fitEM1$BIC
plot(fitEM1) # (1:BIC, 2:classification, 3:uncertainty, 4:density, 0:exit)


data_gender<- read.csv("gender_size.csv")

result5=Mclust(data_gender[,-4], G=2)
summary(result5, parameters=TRUE)
fitEM2=Mclust(data_gender[,-4])
summary(fitEM2, parameters=TRUE)
plot(fitEM2)


iris.BIC=mclustBIC(iris[,-5], G=seq(from=1, to=9, by=1))
iris.BIC
plot(iris.BIC)
iris.BICsum=summary(iris.BIC, data=iris[,-5])
iris.BICsum
names(iris.BICsum)

mclust2Dplot(iris[, 3:4], classification=iris.BICsum$classification)
iris.dens1=densityMclust(iris[, 3:4])
plot(iris.dens1, iris[, 3:4], col="blue", nlevels=15)
iris.dens2=densityMclust(iris[,1:2])
plot(iris.dens2, iris[, 1:2], type="persp", col="red")



