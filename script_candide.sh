#!/bin/bash 

path="candide.txt"

punct_mini=$(cat "$path" | tr 'A-Z' 'a-z' | tr -d [:punct:])
mot=$(echo "$punct_mini" | grep -o '\w\+')

echo"$punct_mini"
echo"$mot"


