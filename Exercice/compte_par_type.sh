#!/usr/bin/bash
if [ "$#" -ne 2 ]; then
	echo "Format arguments : <annee> <type_entite>"                  
  	exit 1                                                                      
fi                                                                              
chemin="/Users/zeinabomar/Desktop/M1 TAL/Programmation Projet Encadré/TD1/Exercice1/ann"

annee=$1
type_entite=$2

compte=$(grep "$type_entite" "$chemin/$annee"/*/*.ann | wc -l)

echo "$compte"

