#!/usr/bin/bash

annee=$1
mois=$2
nombre_de_lieux=$3

chemin="/Users/zeinabomar/Desktop/M1 TAL/Programmation Projet Encadré/TD1/Exercice1/ann/$annee/$mois"

grep "Location" "$chemin"/*.ann | cut -f3 | sort | uniq -c | sort -nr | head -n "$nombre_de_lieux"

