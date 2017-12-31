install.packages("MASS")
library(MASS)
install.packages("cluster")
library(cluster)
install.packages("clusterSim")
library(clusterSim)

data("iris")
min.nc = 2
max.nc = 8

result0 <- kmeans(iris[, -5], centers = 3)
print(result0)
names(result0)
result0["cluster"]
result0["centers"]

