mse <- function(error) #mean-square root error
{
  sum(error^2)/(length(ts.id)-1)
}
mad <- function(error) #mean absolute deviation
{
  sum(abs(error))/( length(ts.id)-1)
}
mape <- function(errpe) #mean absolute percentage error
{
  sum(abs(errpe))/( length(ts.id)-1)
}


install.packages("clusterSim")
library(clusterSim)
IC_data <- read.csv("IC_design.csv")  # IC_資料集
IC_normal <-data.Normalization( IC_data[,1:24], type ="n4", normalization = "column") #正規化unitization with zero minimum ((x-min)/range)
eps_data= IC_normal
eps_data$EPS= IC_data$EPS
roe_data= IC_normal
roe_data$ROE= IC_data$ROE

n=0.33*nrow(IC_data)    #訓練與測試集切割 1/3 vs 2/3
ts.id=sample(1:nrow(IC_data), n)
eps.tr= eps_data [-ts.id, ]
eps.ts= eps_data [ts.id, ]
roe.tr= roe_data [-ts.id, ]
roe.ts= roe_data [ts.id, ]


roe.lm<-lm(ROE~., data = roe.tr)
anova(roe.lm)
summary(step(roe.lm), k=2, method="both")
roe.pre<-predict.lm(roe.lm, roe.ts)
roe.result<- data.frame(realY=roe.ts$ROE, predictY=roe.pre)
roe.er= roe.result$realY - roe.result$predictY
roe.pe=roe.er/roe.result$realY
mse(roe.er)
mad(roe.er)
mape(roe.pe)


eps.lm<-lm(EPS~., data = eps.tr)
anova(eps.lm)
summary(step(eps.lm), k=2, method="both")
eps.pre<-predict.lm(eps.lm, eps.ts)
eps.result<- data.frame(realY=eps.ts$EPS, predictY=eps.pre)
eps.er= eps.result$realY - eps.result$predictY
eps.pe= eps.er/eps.result$realY
eps.pe=subset(eps.pe, eps.pe!=-Inf & eps.pe!=Inf)
mse(eps.er)
mad(eps.er)
mape(eps.pe)





