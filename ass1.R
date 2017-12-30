gender <- read.csv("gender_outlier.csv")
gender
attributes(gender)
summary(gender)
plot(gender)

var = c(1:3)
# colMeans(gender[,-5])
corr = cor(gender[var],use = "pairwise")
corr

covv=cov(gender[var], use="pairwise")
covv
install.packages("timeDate")
library(timeDate)
skewness(gender[,1:3]) # https://en.wikipedia.org/wiki/Skewness
kurtosis(gender[,1:3]) # https://en.wikipedia.org/wiki/Kurtosis
#偏態值 > 0，為正偏態，分配集中在平均數以下，低分群的個體較多。
#偏態值 < 0，為負偏態，分配集中在平均數以上，高分群的個體較多。
#峰度值 > 3，為高狹峰，較常態分配來得高瘦。
#峰度值 < 3，為低闊峰，較常態分配來得矮胖。

attributes(gender)
# 判定男女生在身
male = subset(gender,Gender=="male")
female = subset(gender,Gender=="female")
var.test(male$Height,female$Height) #变异数检定
t.test(male$Height, female$Height, var.equal = FALSE)
t.test(male$Height, female$Height, alternative = "less",var.equal = TRUE) #alternative表示对立假说为

# 判定男女生在体重
male = subset(gender,Gender=="male")
female = subset(gender,Gender=="female")
var.test(male$Weight,female$Weight) #变异数检定
t.test(male$Weight, female$Weight, var.equal = FALSE)
t.test(male$Weight, female$Weight, alternative = "less",var.equal = TRUE) #alternative表示对立假说为

# 判定男女生胸围
male = subset(gender,Gender=="male")
female = subset(gender,Gender=="female")
var.test(male$Waist,female$Waist) #变异数检定
t.test(male$Waist, female$Waist, var.equal = FALSE)
t.test(male$Waist, female$Waist, alternative = "greate",var.equal = TRUE) #alternative表示对立假说为

# 身高、体重、腰围是否符合常态分配
attach((gender))
hist(gender$Height, breaks=seq(128, 200.0, 2))
hist(gender$Height, breaks=seq(128, 200.0, 2), prob=TRUE)
# hist(Sepal.Length, breaks=seq(4.0, 8.0, 0.25), prob=TRUE)
qqnorm(gender$Height, xlab= "Z-score", ylab="Height")
qqline(gender$Height, col="red")
curve(dnorm(x, mean(gender$Height), sd(gender$Height)), 128, 200.0, col="red")
shapiro.test(gender$Height)
qqplot(Sepal.Length, Sepal.Width) #判定兩者的機率分配是否相似
install.packages("nortest")
library(nortest)

ad.test(gender$Height)
sf.test(gender$Height)
cvm.test(gender$Height)
lillie.test(gender$Height)
pearson.test(gender$Height)
shapiro.test(gender$Height)


ad.test(gender$Weight)
sf.test(gender$Weight)
cvm.test(gender$Weight)
lillie.test(gender$Weight)
pearson.test(gender$Weight)
shapiro.test(gender$Weight)

ad.test(gender$Waist)
sf.test(gender$Waist)
cvm.test(gender$Waist)
lillie.test(gender$Waist)
pearson.test(gender$Waist)
shapiro.test(gender$Waist)