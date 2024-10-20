#!/usr/bin/bash

chemin_ann="/Users/zeinabomar/Desktop/M1 TAL/Programmation Projet Encadré/TD1/Exercice1/ann"

for annee in 2016 2017 2018
do
    compte=$(grep "Location" "$chemin_ann/$annee"/*/*.ann | wc -l)
    echo -e "Annotations en $annee :\n$compte\n"
done
 
