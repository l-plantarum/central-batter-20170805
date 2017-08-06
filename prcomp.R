# セリーグ打者データ読み込み
batter<-read.table("cbatter.tsv",sep="\t",header=T,row.names=1)

# 主成分分析
batter.pc<-princomp(batter, cor=TRUE)

# 主成分分析結果の描画
windows()
plot(batter.pc$scores[,1:2],type="n")
text(batter.pc$scores,rownames(batter))

# 主成分
windows()
plot(batter.pc$loadings[,1:2],type="n")
text(batter.pc$loadings,rownames(batter.pc$loadings))

# デンドログラム
windows()
sc1<-data.frame(batter.pc$scores[,1], batter.pc$scores[,2])
dist.sc1<-dist(sc1)
hc.sc.ward<-hclust(dist.sc1, method="ward.D2")
plot(hc.sc.ward)
