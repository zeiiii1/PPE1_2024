#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Erreur : Vous devez fournir un fichier contenant les URLs."
    echo "Usage : $0 <chemin_du_fichier>"
    exit 1
fi

file="$1"
if [ ! -f "$file" ]; then
    echo "Erreur : Le fichier '$file' n'existe pas."
    exit 1
fi


line_number=0
while read -r url; do
    line_number=$((line_number + 1))
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    word_count=$(curl -s "$url" | wc -w)
   
    echo -e "${line_number}\t${url}\t${http_code}\t${word_count}"
done < "$file"

