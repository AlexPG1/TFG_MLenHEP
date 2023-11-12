# TFG: Machine Learning in HEP
Nom complet: Estudio de la extracción de la señal resonante de sucesos ttbar mediante técnicas de Machine Learning en el experimento ATLAS.

Arxius en R i python (Jupyter Notebook).

### Diari de canvis

#### 30/10/2023:
- He actualitzat PrimeraSessió afegint la part amb la normalització i els càlculs de correlació refets separant background i signal, així com la part de DT amb LL (llibreria rpart i rpartplot).
- La part de DT està per polir, el DT sembla incomplet? Solament dues branques i únicament empra el nre. de jets per a classificar. Falta aprofundir, però sembla que la var LL més significativa podria ser aquesta.
- També he afegit el codi en Python en format Jupyter Notebook (v. 3.6.3). En ell, he replicat el procés de càrrega i he estudiat un algoritme de DT (https://www.youtube.com/watch?v=NxEHSAfFlK8&list=PLcWfeUsAys2k_xub3mHks85sBHZvg24Jd&index=5). Aquest sembla poc eficient, però m'ha sigut útil per entendre amb més profunditat el procediment. També he tantejat les funcions de la llibreria sklearn.
- Així doncs, treballaré per polir la part de DT en ambdos llenguatges.

#### 31/10/2023:
- Exàmens de precisió amb diferents seleccions de variables amb Python.sklearn. Màxim de precisió i rapidesa amb max_depth = 3 i variables 0, 3, 6 i 26 amb el dataset 1000_train/test.
- Potser seria raonable calcular l'error de la precisió separant el dataset de test en diversos i fer la mitjana i desviació? Quin rigor tindria?

#### 02/11/2023:
- S'afigen les mesures kappa i F1-Score per avaluar els DT (python).
- Experimentació amb noves variables. I si dividim f25 i f26 pel logaritme de la massa?

#### 07/11/2023:
- Ordre d'apunts i comentaris per fer R més llegible.
- Experimentació amb rpart (Rstudio) sense èxit (temps d'execució de l'ordre de les desenes de minuts per a seleccions petites).
- RandomForest i AdaBoost tantejats en Python.

#### 09/11/2023:
- Càlcul de la massa invariant --> desnormalització dels btag i selecció d'esdeveniments amb dos bjets.
- Selecció de les dades dels jets no b molt ineficient (~30 minuts) --> trobar altre mecanisme --> igualment, he guardat vectors com un csv.
- Representació en histogrames d'ambdues distribucions de masses en camí.

#### 12/11/2023:
- Representació en histogrames de les masses completades, tres distribucions diferents detectant possibles errors.
- Càlcul de precisió/kappa/F1S mitjana i desviació dividint el test en múltiples tests, però sense resultat satisfactori: sembla arbitrari escollir un nombre de tests o altre, ídem amb hiperparàmetres --> error arbitrari?
