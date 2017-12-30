install.packages("class")
library("class")


## 构建训练数据集和测试数据集
tr.iris = rbind(iris[1:25,], iris[51:75,], iris[101:125,]) ## training数据集
ts.iris = rbind(iris[26:50,], iris[76:100,], iris[126:150,]) ## test 数据集
## 利用我们自定义的数据集进行建模，并给出准确率
iris_knn0 = knn(tr.iris[,-5], tr.iris[,-5], cl=tr.iris[,5], k=3)
table(tr.iris$Species, iris_knn0)
result_knn0 = table(tr.iris[,5], iris_knn0)
sum(diag(result_knn0)) / sum(result_knn0) ## training accuracy

## 构建训练数据集和测试数据集
tr.iris = rbind(iris[1:25,], iris[51:75,], iris[101:125,]) ## training数据集
ts.iris = rbind(iris[26:50,], iris[76:100,], iris[126:150,]) ## test 数据集
## 利用我们自定义的数据集进行建模，并给出准确率
## tr建模，ts测试
iris_knn = knn(tr.iris[,-5], ts.iris[,-5], cl=tr.iris[,5], k=3)
table(ts.iris$Species, iris_knn)
result_knn= table(ts.iris[,5], iris_knn0)
sum(diag(result_knn)) / sum(result_knn) ## test accuracy
sum(as.numeric(ts.iris$Species == iris_knn)) / nrow(tr.iris)
