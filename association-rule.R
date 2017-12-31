## ***關聯規則Association rules/Titanic + Groceries資料集
install.packages("arules")
library(arules)
data("Titanic")
titanic0<-as.data.frame(Titanic)
str(titanic0)
titanic<-NULL
for (i in 1:4)
{
  titanic<-cbind(titanic, rep(as.character(titanic0[, i]), titanic0$Freq))
}
titanic<-as.data.frame(titanic)
names(titanic)<-names(titanic0) [1:4]

rule0<- apriori(titanic, parameter=list(minlen=2, supp=.005, conf=0.8), appearance=list(rhs=c("Survived=No", "Survived=Yes"), default="lhs"))
sorted0<- sort(rule0, by="lift")
inspect(sorted0)

rule1<- apriori(titanic, parameter=list(minlen=3, supp=.005, conf=0.8), appearance=list(rhs=c("Survived=Yes"), default="lhs"))
sorted1<- sort(rule1, by="confidence")
inspect(sorted1)

rule2<- apriori(titanic, parameter=list(minlen=3, supp=.005, conf=0.8), appearance=list(rhs=c("Survived=No"), default="lhs"))
sorted2<- sort(rule2, by="confidence")
inspect(sorted2)

