agree = c("台北市"=116,"台中市"=130,"高雄市"=135)
disagree = c("台北市"=184,"台中市"=150,"高雄市"=150)
cbind(agree,disagree)
chisq.test(cbind(agree,disagree)) #卡方鉴定
# 衡量两个变数的关联
# 对立假设> 0.05不成立 
