install.packages("MASS")
library(MASS)
install.packages("cluster")
library(cluster)
install.packages("clusterSim")
library(clusterSim)

data("iris")
min.nc = 2
max.nc = 8

## 定義模型
result0 <- kmeans(iris[, -5], centers = 3)
print(result0)
names(result0)
result0["cluster"]
result0["centers"]
result0$centers

table(iris$Species, result0$cluster)
## pch 符號和col顏色
plot(iris[, 1:2], pch=(result0$cluster), col=result0$cluster)
## 在圖片上標出中心位置
points(result0$centers[, 1:2], col=1:3, pch=8)

## 定義最佳分群數
## 選擇最佳分群數
KM <- array(0, c(max.nc-min.nc+1, 1))
for (nc in min.nc:max.nc){
  fitkm = kmeans(iris[, 1:4], center = nc)
  KM[nc-(min.nc-1), 1]=index.DB(iris[, -5], fitkm$cluster, centrotypes="centroids", p=2)$DB
}
which(KM[, 1] == min(KM[, 1]))
## [1] 表示分成2（min.nc）群比較好

result = kmeans(iris[, 1:4], centers = 2)
plot(iris[, 3:4], pch=(result$cluster), col=result$cluster)
points(result$centers[, 3:4], col=1:2, pch = 8)
