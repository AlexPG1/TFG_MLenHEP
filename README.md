# TFG: Machine Learning in HEP
Nom complet: Estudio de la extracción de la señal resonante de sucesos ttbar mediante técnicas de Machine Learning en el experimento ATLAS.

Arxius en R i python (Jupyter Notebook).

### Diari de canvis

#### 30/10/2023:
- He actualitzat PrimeraSessió afegint la part amb la normalització i els càlculs de correlació refets separant background i signal, així com la part de DT amb LL (llibreria rpart i rpartplot).
- La part de DT està per polir, el DT sembla incomplet? Solament dues branques i únicament empra el nre. de jets per a classificar. Falta aprofundir, però sembla que la var LL més significativa podria ser aquesta.
- També he afegit el codi en Python en format Jupyter Notebook (v. 3.6.3). En ell, he replicat el procés de càrrega i he estudiat un algoritme de DT (https://www.youtube.com/watch?v=NxEHSAfFlK8&list=PLcWfeUsAys2k_xub3mHks85sBHZvg24Jd&index=5). Aquest sembla poc eficient, però m'ha sigut útil per entendre amb més profunditat el procediment. També he tantejat les funcions de la llibreria sklearn.
- Així doncs, treballaré per polir la part de DT en ambdos llenguatges.
