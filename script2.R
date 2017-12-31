## 再論clustering (NBA資料集)
nba<-read.csv("2011NBA.csv", header=T, sep=",")
nba[1:5,]
nba.clus<-nba[,-c(1,2)] #排除資料集中的player與division文字欄位
means<-apply(nba.clus, 2, mean) #計算欄變數的平均數，2表column，1表row
sds<-apply(nba.clus, 2, sd) #計算每欄變數的標準差，2表column，1表row
nba.clus<-scale(nba.clus, center=means, scale=sds)  #標準化欄變數，計算Z分數
nba.dist<-dist(nba.clus, method="euclidean") #計算歐幾里得距離
nba.fit<-hclust(nba.dist, method="ward.D2") #以Ward法進行集群分析
names(nba.fit) #平均得分、平均籃板、平均助攻、單場火鍋、單場抄截 (原始)
plot(nba.fit, labels=nba$player, main="NBA TOP25") #繪製集群分析樹狀圖
rect.hclust(nba.fit, k=5, border="red") #以紅線界定5個集群

cluster5<-cutree(nba.fit, k=5) #指定集群分析為5群
nba$player[cluster5==1] #呼叫屬於第一集群的分析結果
sapply(unique(cluster5), function(cluster5)nba$player) #呼叫全部集群分析結果
nba.new<-cbind(nba, cluster5)  #將集群分析產生的label與原資料合併
nba.new[1:5,]
nba.new$cluster5<-factor(nba.new$cluster5, levels=c(1:5), labels=c("scorer", "defender", "point-guard", "combo-guard", "power-forward"))  #得分、防守、控衛、全能衛、大前鋒 (五個集群依序命名)
table(nba.new$division, nba.new$cluster5)  #比較NBA東西區的集群分布
