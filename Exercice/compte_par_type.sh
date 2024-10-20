#!/usr/bin/bash

chemin="/Users/zeinabomar/Desktop/M1 TAL/Programmation Projet Encadré/TD1/Exercice1/ann"

annee=$1
type_entite=$2

compte=$(grep "$type_entite" "$chemin/$annee"/*/*.ann | wc -l)

echo "$compte"

