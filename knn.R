install.packages("class")
library(class)

data("iris")
err_knn <- rep(0, 5) ## 针对花卉选择合适的k值
for(i in 1:5){
  ## -5表示去掉第五列，即Special
  ## 这里的训练数据集和测试数据集是同一个数据集
  pre_knn <- knn(iris[, -5], iris[, -5], cl=iris[,5], k=2*i-1) ## 这里的k值选择的是奇数
  err_knn[i] <- sum(as.numeric(pre_knn != iris[,5]) / nrow(iris))
}
err_knn
plot(err_knn, type = "l", xlab = "k", main="Selection of k=1,3,5,7,9")

iris_knn = knn(iris[,-5], iris[,-5], cl=iris[,5], k=1)
result_knn = table(iris[,5], iris_knn)
result_knn
sum(diag(result_knn)) / sum(result_knn) ## test accuracy

