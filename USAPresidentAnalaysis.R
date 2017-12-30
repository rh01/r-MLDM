male = c(Bush=315,Perot=152,Clinton=337)
female = c(Bush=346,Perot=126,Clinton=571)
rbind(male,female)
chisq.test(rbind(male,female)) #卡方鉴定

citizen = c(sum(male), sum(female))
bush = c(male[1],female[1])
prop.test(bush,citizen,alternative="greater") #比例鉴定                                                                            

perot = c(male[2],female[2])
prop.test(perot,citizen,alternative="two.sided")
prop.test(perot,citizen,alternative="greater")

clinton = c(male[3],female[3])
prop.test(clinton,citizen,alternative="less")

data("iris")
setosa = subset(iris,Species=="setosa")
versicolor = subset(iris,Species=="versicolor")
var.test(setosa$Petal.Width,versicolor$Petal.Width) #变异数检定
t.test(setosa$Petal.Width, versicolor$Petal.Width,var.equal = FALSE)
t.test(setosa$Petal.Width, versicolor$Petal.Width, alternative = "less",var.equal = FALSE) #alternative表示对立假说为