#!/bin/bash

IFS=","
while read f1 f2 f3
do
    sobrenome=`echo ${f2##* }`
    linha="NOME: $f1 $sobrenome E-MAIL: $f3"
    
    arquivo=$f1"_"$sobrenome
    echo $linha > $arquivo".txt"

#    pandoc $arquivo".txt" --pdf-engine=xelatex -o $arquivo".pdf"
    pandoc $arquivo".txt" -o "certificados/"$arquivo".pdf" 
    rm $arquivo".txt"
done < $1

