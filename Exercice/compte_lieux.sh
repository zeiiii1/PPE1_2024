#!/usr/bin/bash


if [ "$#" -ne 3 ]; then
    echo "Format arguments : <annee> <mois> <nombre_de_lieux>"
    exit 1
fi


annee=$1
mois=$2
nombre_de_lieux=$3


chemin="/Users/zeinabomar/Desktop/M1 TAL/Programmation Projet Encadré/TD1/Exercice1/ann/$annee/$mois"

compte=$(grep "Location" "$chemin"/*.ann | cut -f3 | sort | uniq -c | sort -nr | head -n "$nombre_de_lieux")
echo "$compte"

