# 1.1. familiarització amb les variables -----------------------------
# Primerament, el procés d'aprenentatge sencer, amb proves de diferents mètodes 
# per carregar les dades i diagnòstic de la seua eficiència amb Sys.time() / system.time().


getwd() # Comprovar working directory
# Importar data al Global Environment
startTime <- Sys.time()
setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/Normal") # Escollir working directory
alltr <- read.csv("all_train.csv", header = TRUE, sep = ",")
endTime <- Sys.time()
print(endTime - startTime) # read.csv tarda entre 5 i 8 minuts


system.time(alltr <- read.csv("all_train.csv", header = TRUE, sep = ",") )
# Amb el dataset ja escanejat 302.66 s | Creant el dataset: 257.23 s



# Mètode alternatiu, és més ràpid? ---------------------------------------------
install.packages(data.table)
library(data.table)

# startTime1 <- Sys.time()
# alltr <- fread("all_train.csv", header = TRUE)
# endTime1 <- Sys.time()
# print(endTime1 - startTime1) # fread ha tardat menys d'1 minut! Provem per als txt

# DESCARTAT! No carrega les dades com números i no permet fer l'histograma després.
# La conversió de les dades a numèriques afig un temps de processament superior 
# al que s'estalvia respecte de read.csv



# CÀRREGA DE DADES NORMALITZADES
setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/Normal")

alltr <- read.csv("all_train.csv", header = TRUE, sep = ",")
allte <- read.csv("all_test.csv", header = TRUE, sep = ",")
miltr <- read.csv("1000_train.csv", header = TRUE, sep = ",")
milte <- read.csv("1000_test.csv", header = TRUE, sep = ",")
nomiltr <- read.csv("not1000_train.csv", header = TRUE, sep = ",")
nomilte <- read.csv("not1000_test.csv", header = TRUE, sep = ",")

alltr_1000 <- subset(alltr, mass == 1000)


# omegatestrain <- rbind(allte, alltr, milte, miltr, nomilte, nomiltr, fill = TRUE)
# write.csv(omegatestrain, "omega_testrain.csv")

# Alerta!!! fread és més ràpid però no guarda les dades com numèriques!!!
# La conversió a numèriques tarda més que la pròpia càrrega amb el mètode anterior :/



setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/NoNormalTrue")
startTime1 <- Sys.time()
tr500a <- read.delim("xttbar_m500_aug4.txt", header = FALSE)
tr500b <- read.delim("xttbar_m500_aug17.txt", header = FALSE)
endTime1 <- Sys.time()
print(endTime1-startTime1) # Uns tres minuts
tr500 <- rbind(tr500a, tr500b)
rm(tr500a, tr500b)

startTime2 <- Sys.time()
tr500a <- fread("xttbar_m500_aug4.txt", header = FALSE)
tr500b <- fread("xttbar_m500_aug17.txt", header = FALSE)
tr500 <- rbind(tr500a, tr500b)
rm(tr500a, tr500b)
endTime2 <- Sys.time()
print(endTime2 - startTime2) # 13 segons!!! DESCARTAT



# CÀRREGA DE DADES NO NORMALITZADES
setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/NoNormalTrue")

tr500a <- read.delim("xttbar_m500_aug4.txt", header = FALSE)
tr500b <- read.delim("xttbar_m500_aug17.txt", header = FALSE)
tr500 <- rbind(tr500a, tr500b)
rm(tr500a, tr500b)

tr750a <- read.delim("xttbar_m750_aug4.txt", header = FALSE)
tr750b <- read.delim("xttbar_m750_aug17.txt", header = FALSE)
tr750 <- rbind(tr750a, tr750b)
rm(tr750a, tr750b)

tr1000a <- read.delim("xttbar_m1000_aug4.txt", header = FALSE)
tr1000b <- read.delim("xttbar_m1000_aug17.txt", header = FALSE)
tr1000 <- rbind(tr1000a, tr1000b)
rm(tr1000a, tr1000b)

tr1250a <- read.delim("xttbar_m1250_aug4.txt", header = FALSE)
tr1250b <- read.delim("xttbar_m1250_aug24.txt", header = FALSE)
tr1250 <- rbind(tr1250a, tr1250b)
rm(tr1250a, tr1250b)

tr1500a <- read.delim("xttbar_m1500_aug4.txt", header = FALSE)
tr1500b <- read.delim("xttbar_m1500_aug24.txt", header = FALSE)
tr1500 <- rbind(tr1500a, tr1500b)
rm(tr1500a, tr1500b)


# Guardar les dades en format alternatiu més eficient de carregar?
tr1000a <- fread("xttbar_m1000_aug4.txt", header = FALSE)
tr1000b <- fread("xttbar_m1000_aug17.txt", header = FALSE)
alter1000 <- rbind(tr1000a, tr1000b)
rm(tr1000a, tr1000b)



# read.table, mètode alternatiu
setwd("D:/OneDrive/Universitat/5. Quart'/TFG/RstudioPython/Dades/Normal")


n=7000000
system.time(alternatiu <- read.table("all_train.csv",header=TRUE,sep=",",quote="",  
                              stringsAsFactors=FALSE,comment.char="",nrows=n,                   
                              colClasses=c("numeric","numeric","numeric",                        
                                           "numeric","numeric","numeric","numeric",                        
                                           "numeric","numeric","numeric","numeric",                        
                                           "numeric","numeric","numeric","numeric",
                                           "numeric","numeric","numeric","numeric",
                                           "numeric","numeric","numeric","numeric",
                                           "numeric","numeric","numeric","numeric",
                                           "numeric","numeric")))

# Vora dos minuts: 113.49 s

# Mètode definitiu de càrrega --------------------------------------------------

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
milte <- read.table("1000_test.csv",header=TRUE,sep=",",quote="",  
                    stringsAsFactors=FALSE,comment.char="",nrows=n/2,                   
                    colClasses=c("numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",                        
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric","numeric","numeric","numeric",
                                 "numeric"))

setwd("D:/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/NoNormalTrue")

tr1000a <- read.delim("xttbar_m1000_aug4.txt", header = FALSE)
tr1000b <- read.delim("xttbar_m1000_aug17.txt", header = FALSE)
tr1000 <- rbind(tr1000a, tr1000b)
rm(tr1000a, tr1000b)




# CONCLUSIONS PART 1:
#     1. Hem aprés com fer split de files i com seleccionar sols aquells que complisquen una condició.
#     2. Hem estat treballant amb els datasets i hem descobert una mètode alternatiu per carregar els fitxer 3 vegades més ràpid.
# read.table sembla més eficient i sense contres. Entenc que definir a priori el tipus de variable que trobarà  i el nombre
# d'esdeveniments alleugera la càrrega perquè evita haver de relocalitzar la informació. 
#     3. Els fitxers .csv són els normalitzats; els .txt, els no normalitzats.

# DUBTES PART 1:
#     1. Les dades en els fitxers normalitzat són una subsecció dels normalitzats? trnonorm (34,105,228 observables) vs. trall... (31,500,000 obser)
# RESOLT: No totes les dades simulades s'empren després per a els fitxers normalitzats 





--------------------------------------------------------------------------------
# 1.2. Representació i comparació entre norm i nonorm ------------------
# Representem ara histogrames de lepton_pt no normalitzat del dataset alltrain per a cada massa

leptonTrainNorm <- alltr[,2]
hist(leptonTrainNorm, breaks=40, xlab = "Energia normalitzada", main = "Amb 40 breaks")
hist(leptonTrainNorm, breaks=80, xlab = "Energia normalitzada", main = "Amb 80 breaks")


# Identificació de variables - representació en histogrames
hist(tr1000[,1], breaks=80, xlab = "Energia GeV", main = "Lepton p_T")                                #  1. Leptó pT *
hist(tr1000[,2], breaks=60, xlab = "Angle (rad)", main = "Lepton eta", xlim = c(-2.5,2.5))            #  2. Leptó eta
hist(tr1000[,3], breaks=80, xlab = "Angle (rad)", main = "Lepton phi")                                #  3. Leptó phi
hist(tr1000[,4], xlab = "Energia GeV", main = "Missing Energy magnitude", xlim = c(0,500), breaks = 200)     # 4. ME Magnitude
hist(tr1000[,5], xlab = "Angle (rad)", main = "Missing Energy phi", breaks = 25)                      #  5. ME phi (neutrí) 
hist(tr1000[,6], xlab = "Nombre de jets", main = "Freqüència de nre. de jets", breaks = 8)            #  6. Nombre de jets *
hist(tr1000[,7], xlab = "Energia GeV", main = "Jet 1 pT", breaks = 100, xlim = c(0,1000))             #  7. Jet 1 pT    *
hist(tr1000[,8], xlab = "Pseudorapidity", main = "Jet 1 eta", breaks = 100)                           #  8. Jet 1 eta
hist(tr1000[,9], xlab = "Angle (rad)", main = "Jet 1 phi", breaks = 10)                               #  9. Jet 1 phi
hist(tr1000[,10], xlab = "0 o 1", main = "Jet 1 btag", breaks = 2)                                    # 10. Jet 1 btag
hist(tr1000[,11], xlab = "Energia GeV", main = "Jet 2 pT", breaks = 100, xlim = c(0,1000))            # 11. Jet 2 pT    *    
hist(tr1000[,12], xlab = "Pseudorapidity", main = "Jet 2 eta", breaks = 100)                          # 12. Jet 2 eta
hist(tr1000[,13], xlab = "Angle (rad)", main = "Jet 2 phi", breaks = 10)                              # 13. Jet 2 phi
hist(tr1000[,14], xlab = "0 o 1", main = "Jet 2 btag", breaks = 5) # 0 o 1. Btag?                     # 14. Jet 2 btag
hist(tr1000[,15], xlab = "Energia Gev", main = "Jet 3 pT", breaks = 50, xlim = c(0,600))              # 15. Jet 3 pT    *
hist(tr1000[,16], xlab = "Pseudorapidity", main = "Jet 3 eta", breaks = 100)                          # 16. Jet 3 eta
hist(tr1000[,17], xlab = "Angle (rad)", main = "Jet 3 phi", breaks = 100)                             # 17. Jet 3 phi
hist(tr1000[,18], xlab = "0 o 1", main = "Jet 3 btag", breaks = 5)                                    # 18. Jet 3 btag
hist(tr1000[,19], xlab = "Energia GeV", main = "Jet 4 pT", breaks = 50, xlim = c(0,300))              # 19. Jet 4 pT    *
hist(tr1000[,20], xlab = "Pseudorapidity", main = "Jet 4 eta", breaks = 100)                          # 20. Jet 4 eta
hist(tr1000[,21], xlab = "Angle (rad)", main = "Jet 4 phi", breaks = 10)                              # 21. Jet 4 phi
hist(tr1000[,22], xlab = "0 o 1", main = "Jet 4 btag", breaks = 5)                                    # 22. Jet 4 btag
hist(tr1000[,23], xlab = "Massa (GeV)", main = "M_jj", breaks = 1000, xlim = c(0,1000))               # 23. M_jj        *
hist(tr1000[,24], xlab = "Massa (GeV)", main = "M_jjj", breaks = 200, xlim = c(0,1500))               # 24. M_jjj       *
hist(tr1000[,25], xlab = "Massa (GeV)", main = "M_lv", breaks = 100, xlim = c(60,500))                # 25. M_lv        *
hist(tr1000[,26], xlab = "Massa (GeV)", main = "M_jlv", breaks = 100, xlim = c(60,1600))              # 26. M_jlv       *
hist(tr1000[,27], xlab = "Massa (GeV)", main = "M_wwbb", breaks = 100, xlim = c(60,4500))             # 27. M_wwbb      *

# Resultat extrapolable obviament a tr500 - tr1500.
# Identificació de variables (ídem), però amb les dades normalitzades (alltr, els fitxers estan ordenats diferents)
# Segons el readme.txt, les variables normalitzades són (afegint-hi 1 pq R comença en 1, no en 0) : 1 4 6 7 11 15 19 23 24 25 26 27, és a dir,
# els moments transversals del leptó i els 4 jets, les masses i el nre. de jets??
# En els fitxers normalitzats tenim dues variables més: una al principi (X..Label?, preguntar) i altra al final (massa de la simulació particular)
# Les variables adients en aquest format doncs seran: 2 5 7 8 12 16 20 24 25 26 27 28

hist(alltr[,1], breaks=80, xlab = "", main = "X..label") # 0 o 1, X..label??
hist(alltr[,2], breaks=80, xlab = "Energia normalitzada", main = "Moment transversal del leptó normalitzat")    # 2. Leptó pT
hist(alltr[,5], breaks=40, xlab = "Energia normalitzada", main = "Magnitud de la ME", xlim = c(-4,4))           # 5. ME Magnitude
hist(alltr[,7], breaks=5, xlab = "?", main = "Nombre de jets?")                                                 # 7. Nre Jets
hist(alltr[,8], breaks=80, xlab = "Energia normalitzada", main = "Moment transversal del Jet 1")                # 8. Jet 1 pT
hist(alltr[,12], breaks=40, xlab = "Energia normalitzada", main = "Moment transversal del Jet 2")               # 12. Jet 2 pT
hist(alltr[,16], breaks=40, xlab = "Energia normalitzada", main = "Moment transversal del Jet 3")               # 16. Jet 3 pT
hist(alltr[,20], breaks=40, xlab = "Energia normalitzada", main = "Moment transversal del Jet 4")               # 20. Jet 4 pT
hist(alltr[,24], breaks=40, xlab = "Energia normalitzada", main = "M_jj")                                       # 24. M_jj
hist(alltr[,25], breaks=40, xlab = "Energia normalitzada", main = "M_jjj")                                      # 25. M_jjj
hist(alltr[,26], breaks=40, xlab = "Energia normalitzada", main = "M_lv")                                       # 26. M_lv
hist(alltr[,27], breaks=40, xlab = "Energia normalitzada", main = "M_jlv")                                      # 27. M_jlv
hist(alltr[,28], breaks=40, xlab = "Energia normalitzada", main = "M_wwbb")                                     # 28. M_wwbb


# Comparem doncs els jets normalitzats i els no normalitzats per exemple, el jet 1 per a masses de 1000 GeV

hist(tr1000[,7], breaks = 80, xlab = "Energia GeV", main = "Histograma de l'energia del jet 1 per a masses de 1000", xlim = c(0,1200))
hist(tr1000[,11], breaks = 80, xlab = "Energia GeV", main = "Histograma de l'energia del jet 2 per a masses de 1000", xlim = c(0,1200))
hist(tr1000[,15], breaks = 80, xlab = "Energia GeV", main = "Histograma de l'energia del jet 3 per a masses de 1000", xlim = c(0,500))



prova <- subset(milte, X..label == 0)
prova2 <- subset(milte, X..label == 1)
hist(prova[,8], breaks = 120, xlab = "Energia GeV", main = "Histograma de l'energia del jet 1 per a masses de 1000")
hist(prova2[,8], breaks = 120, xlab = "Energia GeV", main = "Histograma de l'energia del jet 1 per a masses de 1000")



hist(milte[,8], breaks = 80, xlab = "Energia normalitzada", main = "Histograma de l'energia del jet 1 per a masses de 1000")
hist(milte[,12], breaks = 80, xlab = "Energia normalitzada", main = "Histograma de l'energia del jet 2 per a masses de 1000")
hist(milte[,16], breaks = 80, xlab = "Energia normalitzada", main = "Histograma de l'energia del jet 3 per a masses de 1000")


# library(dplyr)
# df2 <- mutate_all(tr1000, function(x) as.numeric(as.character(x)))


# DUBTES DE LA SEGONA PART
#   1. Per què el nre. de jets tb està normalitzat?
#   2. Per què els btag són nombres enters en el fitxer no normalitzat, però en el normalitzat no?
#   3. De nou, les dades miltr no són subsets de tr1000, itat? 
# RESPOSTA
#   1. i 2. Sense cap motiu, sembla que la normalització s'aplica també, però no té relevància
#   3. No, veure 1.1.



--------------------------------------------------------------------------------
# 1.3. Matriu de correlacions -----------------------------------------
# Recordem el mètode de selecció de columnes (Primer exercici). Escollim únicament les variables pT i masses, és a dir:
# Dataset normalitzat:    2 8 12 16 20 24 25 26 27 28
# Dataset no normalitzat: 1 7 11 15 19 23 24 25 26 27
# En un foro recomana ficar noms a les columnes i després extraure-les? https://stackoverflow.com/questions/10085806/extracting-specific-columns-from-a-data-frame
# Alternativament, més senzillament:
correl <- subset(alltr, select = c(2,8,12,16,20,24,25,26,27,28))
colnames(correl) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")


# A la pàgina https://www.displayr.com/how-to-create-a-correlation-matrix-in-r/ empren aquest mecanisme per a matrius de correlació:

install.packages("corrplot")
library(corrplot)
palette = colorRampPalette(c("green", "white", "red")) (20)

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


# NOVETATS SEGONA SESSIÓ:
# - Refer les correlacions separant signal i background.



# SEGONA SESSIÓ
# 2.1. Càlcul de la normalització ----------------------------------------------
# Separem background i signal per a masses de 1000 normalitzat
background <- subset(alltr, mass == 1000 & X..label == 0)
signal <- subset(alltr, mass == 1000 & X..label == 1)


# Normalitzem primer calculant el log(x + 10**-5)
noNormal <- subset(tr1000, select = c(6,7,11,15,19,23,24,25,26,27))
colnames(noNormal) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")
reNormal <- sapply(noNormal, function(x) log(x+10**-5, base=exp(1)))

# Ara treballem únicament amb el jet 1 p.e. Calculem la mitjana 
jet1LogNormal <- reNormal [,2]
mitjana <- mean(jet1LogNormal)
jet1ReNormal <- (jet1LogNormal-mitjana)/mitjana



mitjana <- mean(noNormal[,2])
reNormal <- (noNormal[,2]-mitjana)/mitjana
jet1ReNormal <- sapply(reNormal, function(x) log(x+10**-5, base=exp(1)))


hist(jet1ReNormal, breaks = 80, xlab = "Energia normalitzada", main = "Hist de p_T1 per a masses de 1000. Renormalitzat 2")
hist(signal[,8], breaks = 120, xlab = "Energia normalitzada", main = "Hist de p_T1 signal per a masses de 1000 prenormalitzat")
hist(background[,8], breaks = 120, xlab = "Energia normalitzada", main = "Hist de p_T1 backgr per a masses de 1000 prenormalitzat")
# EUREKA! La distribució de pt1 normalitzat per mi és anàloga a la part signal ja normalitzada!!


hist(milte[,12], breaks = 80, xlab = "Energia normalitzada", main = "Histograma de l'energia del jet 2 per a masses de 1000")
hist(milte[,16], breaks = 80, xlab = "Energia normalitzada", main = "Histograma de l'energia del jet 3 per a masses de 1000")

hist(reNormal[,2], breaks = 80, xlab = "Energia GeV", main = "Histograma de l'energia del jet 1 per a masses de 1000")




# 2.2. Recàlcul de les correlacions separant signal/back -----------------------
# Separem dades de background i single, en particular, el fitxer alltr
install.packages("corrplot")
library(corrplot)
palette = colorRampPalette(c("green", "white", "red")) (20)

signal <- subset(alltr, X..label == 1)
background <- subset(alltr, X..label == 0)
rm(alltr)

signalSelec <- subset(signal, select = c(2,8,12,16,20,24,25,26,27,28))
backSelec  <- subset(background, select = c(2,8,12,16,20,24,25,26,27,28))
rm(signal, background)

colnames(signalSelec) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")
colnames(backSelec) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")
signalSelec.cor = cor(signalSelec)
backSelec.cor = cor(backSelec)

heatmap(x = signalSelec.cor, col = palette, symm = TRUE)
corrplot(signalSelec.cor, type = 'lower', method = 'color')
corrplot.mixed(signalSelec.cor, order = 'AOE')
corrplot.mixed(signalSelec.cor, lower = 'shade', upper = 'pie', order = 'hclust')
corrplot(signalSelec.cor, method = 'square', diag = FALSE, order = 'hclust',
         addrect = 6, rect.col = 'blue', rect.lwd = 3, tl.pos = 'd')

heatmap(x = backSelec.cor, col = palette, symm = TRUE)
corrplot(backSelec.cor, type = 'lower', method = 'color')
corrplot.mixed(backSelec.cor, order = 'AOE')
corrplot.mixed(backSelec.cor, lower = 'shade', upper = 'pie', order = 'hclust')
corrplot(backSelec.cor, method = 'square', diag = FALSE, order = 'hclust',
         addrect = 6, rect.col = 'blue', rect.lwd = 3, tl.pos = 'd')


# 2.3. Decision Trees amb LL / LL-HL / variables discriminants ------------------
library(rpart)
library(rpart.plot)
dataset = alltr
colnames(dataset) <- c("label","lpt","etal","psil","MET","MEphi","njets","pT1","eta1","psi1","b1","pT2","eta2","psi2","b2","pT3","eta3","psi3","b3","pT4","eta4","psi4","b4","m_jj","m_jjj","m_lv","m_jlv","m_wwbb","mass")
# 1 label, 2-4 lepton, 5-6 ME, 7 njets, 8-11 jet1, 12-15 jet2, 16-19 jet3, 20-23 jet4, 24-28 masses, 29 mass

treeLL <- rpart(label ~ lpt+etal+psil+MET+MEphi+njets+pT1+eta1+psi1+b1+pT2+eta2+psi2+b2+pT3+eta3+psi3+b3+pT4+eta4+psi4+b4,dataset, control = "max_depth = 3")
# Temps infinit d'execució ?!?!?!
rpart.plot(treeLL)

treeALL <- rpart(label ~ lpt+etal+psil+MET+MEphi+njets+pT1+eta1+psi1+b1+pT2+eta2+psi2+b2+pT3+eta3+psi3+b3+pT4+eta4+psi4+b4+m_jj+m_jjj+m_lv+m_jlv+m_wwbb+mass,dataset)


# 3.1. Recàlcul de la distribució normalitzada (menor dispersió): --------------

# Agafem únicament els moments i les masses
noNormal <- subset(tr1000, select = c(6,7,11,15,19,23,24,25,26,27))
colnames(noNormal) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")

# Apliquem el logaritme. Treballem únicament amb el jet 1 de moment. Calculem la mitjana i normalitzem
reNormal <- sapply(noNormal, function(x) log10(x+10**-5))
jet1LogNormal <- reNormal [,2]
mitjana <- mean(jet1LogNormal)
jet1ReNormal <- (jet1LogNormal-mitjana)/mitjana


# Provem a normalitzar i després calcular el logaritme (contrari al .txt) --> error, logaritme de negatiu
mitjanaGran <- mean(noNormal[,2])
jet1Anti <- (noNormal[,2]-mitjanaGran)/mitjanaGran
jet1AntiNormal <- sapply(jet1Anti, function(x) log(x+10**-5, base=exp(1)))

# I si no dividírem per la mitjanaGran?
reNormal <- sapply(noNormal, function(x) log(x+10**-5, base=exp(1)))
jet1Prova <- reNormal [,2]
mitjana <- mean(jet1Prova)
jet1Prova <- (jet1Prova-mitjana)



# Representem i comparem
hist(jet1LogNormal, breaks = 80, xlab = "Logaritme de l'energia", main = "Hist pt1 - m1000. Distribució del logaritme.")
hist(jet1ReNormal, breaks = 80, xlab = "Energia normalitzada", main = "Hist pt1 - m1000. Renormalitzat conforme al .txt")
hist(jet1AntiNormal, breaks = 80, xlab = "Energia normalitzada", main = "Hist pt1 - m1000. Renormalitzat a la inversa, 1r mitjana, 2n logaritme.")
hist(jet1Prova, breaks = 80, xlab = "Energia normalitzada", main = "Hist pt1 - m1000. Semblat a .txt, però sense dividir per mitjana.")
hist(signal[,8], breaks = 120, xlab = "Energia normalitzada", main = "Hist de p_T1 signal per a masses de 1000 prenormalitzat")
hist(background[,8], breaks = 120, xlab = "Energia normalitzada", main = "Hist de p_T1 backgr per a masses de 1000 prenormalitzat")


hist(noNormal[,2], breaks = 80, xlab = "Energia no normalitzada")



reNormal <- sapply(noNormal, function(x) log10(x+10**-5))
jet1LogNormal <- reNormal [,2]
mitjana <- mean(jet1LogNormal)
desviacio <- sd(jet1LogNormal)
jet1ReNormal <- (jet1LogNormal-mitjana)/desviacio
hist(jet1ReNormal, breaks = 80, xlab = "Energia normalitzada", main = "Hist pt1 - m1000. Renormalitzat conforme al .txt")





# 4.4 Recàlcul de la distribució normalitzada: mesclar signal i background -----
# Càrrega de dades:
## Carreguem tb trback
setwd("D:/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/NoNormalTrue")
trbacka <- read.delim("smttbar_aug4.txt", header = FALSE)
trbackb <- read.delim("smttbar_aug24.txt", header = FALSE)
trback <- rbind(trbacka, trbackb)
rm(trbacka, trbackb)

# Seleccionem les dades no normalitzades
noNormal1 <- subset(tr1000, select = c(6,7,11,15,19,23,24,25,26,27))
noNormal0 <- subset(trback, select = c(6,7,11,15,19,23,24,25,26,27))
noNormal <- rbind(noNormal1, noNormal0)
colnames(noNormal) <- c("Lept_pt","j1_pt","j2_pt","j3_pt","j4_pt","m_jj","m_jjj","m_lv","m_jlv","m_wwbb")

# Fem els càlculs: 
# 1. logaritme
reNormal <- sapply(noNormal, function(x) log10(x+10**-5))
# 2. Seleccionem jet 1 solament
jet1LogNormal <- reNormal [,2]
# 3. Calculem la mitjana
mitjana <- mean(jet1LogNormal)
# 4. Restem i dividim per la mitjana
jet1ReNormal <- (jet1LogNormal-mitjana)/mitjana


# Representem la renormalització progressivament
# 1. Distribució sense normalitzar
hist(noNormal[,2], breaks = 80, xlab = "1. Energia no normalitzada")
# 2. Distribució del logaritme
hist(jet1LogNormal, breaks = 80, xlab = "Logaritme de l'energia", main = "2. Logaritme de l'energia")
# 3. Distribució renormalitzada
hist(jet1ReNormal, breaks = 80, xlab = "Energia normalitzada", main = "3. Renormalitzat conforme al .txt. Signal i back junts")



# Ara repetirem els càlculs emprant la mitjana amb signal i back per a normalitzar únicament signal
# 1. logaritme
reNormal1 <- sapply(noNormal1, function(x) log10(x+10**-5))
# 2. Seleccionem jet 1 solament
jet1LogNormal1 <- reNormal1 [,2]
# 4. Restem i dividim per la mitjana
jet1ReNormal1 <- (jet1LogNormal1-mitjana)/mitjana

# 3. Distribució renormalitzada solament amb signal
hist(jet1ReNormal1, breaks = 80, xlab = "Energia normalitzada", main = "4. Renormalitzat conforme al .txt. Signal solament")

# 6. Recàlcul d'alguns plots ---------------------------------------------------

# Càrrega de dades (Nou PC)
# Variables normalitzades
setwd("C:/Users/alexp/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/Normal")
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
                                 "numeric"))

setwd("C:/Users/alexp/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/NoNormalTrue")

# Variables no normalitzades
tr1000a <- read.delim("xttbar_m1000_aug4.txt", header = FALSE)
tr1000b <- read.delim("xttbar_m1000_aug17.txt", header = FALSE)
tr1000 <- rbind(tr1000a, tr1000b)
rm(tr1000a, tr1000b)

setwd("C:/Users/alexp/OneDrive/Universitat/5. Quint/TFG/RstudioPython/Dades/NoNormalTrue")
trbacka <- read.delim("smttbar_aug4.txt", header = FALSE)
trbackb <- read.delim("smttbar_aug24.txt", header = FALSE)
trback <- rbind(trbacka, trbackb)
rm(trbacka, trbackb)


Jet1SignalNoNorm <- subset(tr1000, select = c(7))
Jet1BackgrNoNorm <- subset(trback, select = c(7))

c1 <- rgb(144,238,144,max = 255, alpha = 80, names = "lt.green")
c2 <- rgb(255, 71, 76, max = 255, alpha = 80, names = "lt.red")
c3 <- rgb(46,218,255, max = 255, alpha = 80, names = "lt.blue")

hist(Jet1SignalNoNorm[,1], ylab = "Freqüència", xlab = "Energia GeV", main = "Moment transversal del primer jet - BSM 1000", breaks = 100, xlim = c(0,1000), col = c1)
hist(Jet1BackgrNoNorm[,1], ylab = "Freqüència", xlab = "Energia GeV", main = "Moment transversal del primer jet - SM", breaks = 100, xlim = c(0,1000), col = c2, add = TRUE)
hist(Jet1BackgrNoNorm[,1], ylab = "Freqüència", xlab = "Energia GeV", main = "Moment transversal del primer jet - SM", breaks = 250, xlim = c(0,400), col = c2)

# Si ara mesclem nombre semblant d'ambdós (5 milions de cada), podem reproduïr el contingut de la mostra ja normalitzada
# Ara repetirem els càlculs emprant la mitjana amb signal i back per a normalitzar únicament signal
# 1. logaritme
logaritmeSignal <- sapply(Jet1SignalNoNorm[0:5000000,1], function(x) log10(x+10**-5))
logaritmeBackgr <- sapply(Jet1BackgrNoNorm[0:5000000,1], function(x) log10(x+10**-5))
# 2. Unim ambdós en un: calcular la mitjana
logaritmeBoth <- rbind(logaritmeSignal, logaritmeBackgr)
mitjana <- mean(logaritmeBoth)

# 3. Restem i dividim per la mitjana
Jet1SignalNORM <- (logaritmeSignal-mitjana)/mitjana
Jet1BackgrNORM <- (logaritmeBackgr-mitjana)/mitjana

# 4. Representem ambdós junts
hist(Jet1SignalNORM, ylab = "Freqüència", xlab = "Energia normalitzada", main = "Moment transversal del primer jet normalitzat - SM i BSM", breaks = 100, col = c1)
hist(Jet1BackgrNORM, ylab = "Freqüència", xlab = "Energia normalitzada", breaks = 100, col = c2, add = TRUE)
legend(0.3,100000, legend=c("BSM", "SM"), pch=15, col = c(c1,c2))


# Representem també l'histograma prenormalitzat
c3 <- rgb(46,218,255, max = 255, alpha = 80, names = "lt.blue")
c4 <- rgb(142,124,195, max = 255, alpha = 80, names = "lt.purple")
SignalPreNorm <- subset(milte, X..label == 1)
BackgrPreNorm <- subset(milte, X..label == 0)
hist(SignalPreNorm[,8], ylab = "Freqüència", xlab = "Energia normalitzada", main = "Moment transversal del primer jet prenormalitzat - SM i BSM", breaks = 100, col = c4)
hist(BackgrPreNorm[,8], ylab = "Freqüència", xlab = "Energia normalitzada", breaks = 100, col = c3, add = TRUE)
legend(2.5,20000, legend=c("BSM", "SM"), pch=15, col = c(c4,c3))
