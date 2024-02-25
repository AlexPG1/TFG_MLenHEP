# We load the data from simulation using m1000 and the background files
setwd("D:/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/NoNormalTrue")
tr1000a <- read.delim("xttbar_m1000_aug4.txt", header = FALSE)
tr1000b <- read.delim("xttbar_m1000_aug17.txt", header = FALSE)
tr1000 <- rbind(tr1000a, tr1000b)
rm(tr1000a, tr1000b)
trbacka <- read.delim("smttbar_aug4.txt", header = FALSE)
trbackb <- read.delim("smttbar_aug24.txt", header = FALSE)
trback <- rbind(trbacka, trbackb)
rm(trbacka, trbackb)

# We have also loaded the normalized variables for comparison (alltr) and selected signal
setwd("D:/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/Normal")
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
background <- subset(alltr, mass == 1000 & X..label == 0)
signal <- subset(alltr, mass == 1000 & X..label == 1)

# We select the variables that will be normalized
noNormal1 <- subset(tr1000, select = c(6,7,11,15,19,23,24,25,26,27))
noNormal0 <- subset(trback, select = c(6,7,11,15,19,23,24,25,26,27))
noNormal <- rbind(noNormal1, noNormal0)
colnames(noNormal) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")


# We normalize the variables according to the procedure explained on readme.txt
# 1. Logarithm
reNormal <- sapply(noNormal, function(x) log10(x+10**-5))
# 2. We will consider only jet1 for simplicity
jet1LogNormal <- reNormal [,2]
# 3. We calculate the mean
mitjana <- mean(jet1LogNormal)
# 4. We substract and divide by the mean
jet1ReNormal <- (jet1LogNormal-mitjana)/mitjana


# We repeat the procedure using the mean of the complete dataset but only on
# signal 
# 1. Logarithm
reNormal1 <- sapply(noNormal1, function(x) log10(x+10**-5))
# 2. We select solely jet1
jet1LogNormal1 <- reNormal1 [,2]
# 3. We substract and divide by the mean of the complete dataset
jet1ReNormal1 <- (jet1LogNormal1-mitjana)/mitjana

# We represent the normalized ditribution (only signal)
hist(jet1ReNormal1, breaks = 80, xlab = "Normalized energy", main = "Histogram of pt1 normalized according to .txt, only signal")
hist(signal[,8], breaks = 120, xlab = "Normalized energy", main = "Histogram of prenormalized pt1")

