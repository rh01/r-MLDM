## Hierarchical clustering
library(cluster)
library(MASS)
library(clusterSim)
data(iris)

max.nc <- 8
min.nc <- 2


id=sample(1:nrow(iris), 0.2*nrow(iris))
result3=hclust(dist(iris[id, -5]), method="average")
print(result3)
plot(result3, labels=iris$Species[id])
group3=cutree(result3, k=3)
print(group3)
table(group3)
rect.hclust(result3, k=3, border="red")

HC= array(0, c(max.nc-min.nc+1,2))
for (nc in min.nc : max.nc)
{
  fithc1 <- hclust(dist(iris[, -5]), method="average")
  ct1 <- cutree(fithc1, k=nc)
  HC[nc-(min.nc-1), 1] <- index.DB(iris[, -5], ct1, centrotypes="centroids")$DB
  
  fithc2 <- hclust(dist(iris[, -5]), method="ward.D")
  ct2 <- cutree(fithc2, k=nc)
  HC[nc-(min.nc-1), 2] <- index.DB(iris[, -5], ct2, centrotypes="centroids")$DB
}
which(HC[,1]==min(HC[,1]))
which(HC[,2]==min(HC[,2]))

