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

output_dir="../tableaux"
output_file="${output_dir}/tableau-fr.html"

mkdir -p "$output_dir"

echo "<!DOCTYPE html>" > "$output_file"
echo "<html lang='fr'>" >> "$output_file"
echo "<head>" >> "$output_file"
echo "  <meta charset='UTF-8'>" >> "$output_file"
echo "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>" >> "$output_file"
echo "  <title>Tableau des URLs</title>" >> "$output_file"
echo "  <style>" >> "$output_file"
echo "    table { border-collapse: collapse; width: 100%; }" >> "$output_file"
echo "    th, td { border: 1px solid black; padding: 8px; text-align: left; }" >> "$output_file"
echo "    th { background-color: #f2f2f2; }" >> "$output_file"
echo "  </style>" >> "$output_file"
echo "</head>" >> "$output_file"
echo "<body>" >> "$output_file"
echo "  <h1>Résultats d'analyse des URLs</h1>" >> "$output_file"
echo "  <table>" >> "$output_file"
echo "    <tr>" >> "$output_file"
echo "      <th>Numéro</th>" >> "$output_file"
echo "      <th>URL</th>" >> "$output_file"
echo "      <th>Code HTTP</th>" >> "$output_file"
echo "      <th>Nombre de mots</th>" >> "$output_file"
echo "    </tr>" >> "$output_file"

line_number=0
while read -r url; do
    line_number=$((line_number + 1))
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "$url")
    word_count=$(curl -s "$url" | wc -w)

    echo "    <tr>" >> "$output_file"
    echo "      <td>${line_number}</td>" >> "$output_file"
    echo "      <td>${url}</td>" >> "$output_file"
    echo "      <td>${http_code}</td>" >> "$output_file"
    echo "      <td>${word_count}</td>" >> "$output_file"
    echo "    </tr>" >> "$output_file"
done < "$file"

echo "  </table>" >> "$output_file"
echo "</body>" >> "$output_file"
echo "</html>" >> "$output_file"
