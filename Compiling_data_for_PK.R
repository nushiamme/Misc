## Script to compile data for Pratik

setwd("C:\\Users\\ANUSHA\\Desktop")
temp <- read.csv("Kinetics.csv")

temp$Average <- rowMeans(subset(temp, select = c(Val1, Val2, Val3)), na.rm = TRUE)

temp$Average456 <- rowMeans(subset(temp, select = c(Val4, Val5, Val6)), na.rm = TRUE)

temp$Average789 <- rowMeans(subset(temp, select = c(Val7, Val8, Val9)), na.rm = TRUE)

newtempD <- temp[which(temp$ID1=='D'),]
write.csv(newtempD[,c(2:7,14)],file = "wellD_Jun2_2017.csv")

newtempE <- temp[which(temp$ID1=='E'),]
write.csv(newtempE[,c(2:7,14)],file = "wellE_Jun2_2017.csv")

newtempF <- temp[which(temp$ID1=='F'),]
write.csv(newtempF[,c(2:7,14)],file = "wellF_Jun2_2017.csv")

newtempG <- temp[which(temp$ID1=='G'),]
write.csv(newtempG[,c(2:7,14)],file = "wellG_Jun2_2017.csv")

newtempH <- temp[which(temp$ID1=='H'),]
write.csv(newtempH[,c(2:7,14)],file = "wellH_Jun2_2017.csv")

bcols <- temp[which(temp$ID1=='B'),]
write.csv(newtempB123[,c(2:7,14)],file = "Dopa123_Jun2_2017.csv")
write.csv(newtempB123[,c(2:4,8:10,15)],file = "Dopa456_Jun2_2017.csv")
write.csv(newtempB123[,c(2:4,11:13,16)],file = "Dopa789_Jun2_2017.csv")

