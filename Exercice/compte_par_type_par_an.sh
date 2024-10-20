#!/usr/bin/bash

chemin="/Users/zeinabomar/Desktop/M1 TAL/Programmation Projet Encadré/TD1/Exercice1/ann"

type_entite=$1

for annee in 2016 2017 2018 
do 
	compte=$(grep "$type_entite" "$chemin/$annee"/*/*.ann | wc -l)
	echo -e "Annontations en $annee : \n$compte\n"
done 

