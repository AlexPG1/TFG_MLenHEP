# PRIMERA PART: Càrrega de dades -----------------------------------------------

# Carreguem les dades alltr, milte i tr1000
setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/Normal")
n = 7000000
alltr <- read.table("all_train.csv",header=TRUE,sep=",",quote="",  
                    stringsAsFactors=FALSE,comment.char="",nrows=n,                   
                    colClasses=c("numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric"))
milte <- read.table("1000_test.csv",header=TRUE,sep=",",quote="",  
                    stringsAsFactors=FALSE,comment.char="",nrows=n/2,                   
                    colClasses=c("numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric"))

setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/NoNormalTrue")

tr1000a <- read.delim("xttbar_m1000_aug4.txt", header = FALSE)
tr1000b <- read.delim("xttbar_m1000_aug17.txt", header = FALSE)
tr1000 <- rbind(tr1000a, tr1000b)
rm(tr1000a, tr1000b)


# SEGONA PART: Comparació normal i no normal -----------------------------------

hist(tr1000[,7], breaks = 80, xlab = "Energia GeV", main = "Histograma de l'energia del jet 1 per a masses de 1000", xlim = c(0,1200))
hist(milte[,8], breaks = 80, xlab = "Energia normalitzada", main = "Histograma de l'energia del jet 1 per a masses de 1000")


# TERCERA PART: Matriu de correlacions -----------------------------------------

install.packages("corrplot")
library(corrplot)
palette = colorRampPalette(c("green", "white", "red")) (20)

# Amb dades normalitzades
correl <- subset(alltr, select = c(2,8,12,16,20,24,25,26,27,28))
colnames(correl) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")

correl.cor = cor(correl)
heatmap(x = correl.cor, col = palette, symm = TRUE)
corrplot(correl.cor, type = 'lower', method = 'color')
corrplot.mixed(correl.cor, order = 'AOE')
corrplot.mixed(correl.cor, lower = 'shade', upper = 'pie', order = 'hclust')
corrplot(correl.cor, method = 'square', diag = FALSE, order = 'hclust',
         addrect = 6, rect.col = 'blue', rect.lwd = 3, tl.pos = 'd')


correlnonorm <- subset(tr1000, select = c(6,7,11,15,19,23,24,25,26,27))
colnames(correlnonorm) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")

correlnonorm.cor = cor(correlnonorm)
heatmap(x = correlnonorm.cor, col = palette, symm = TRUE)
corrplot(correlnonorm.cor, method = 'square', diag = FALSE, order = 'hclust',
         addrect = 6, rect.col = 'blue', rect.lwd = 3, tl.pos = 'd')
corrplot(correlnonorm.cor, type = 'lower', method = 'color')

















