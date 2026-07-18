#!/bin/bash

# Scrivere uno script che prevede 2 parametri. Il primo parametro deve essere il nome assoluto di una directory (D), mentre il secondo va trattato come un numero intero positivo (N). 
# Lo script cerca ricorsivamente in D tutte le directory che contengono almeno un file (solo file non directory) con dimensione in byte maggiore di N. Ordinare (in modo decrescente) 
# le directory trovate in base numero di file (che contengono) che rispettano il criterio specificato sopra.

if [[ $# -ne 2 ]]; then
    echo "Il numero di parametri passati allo script non è corretto" >&2
    exit 1
fi

directory="$1"
integer_positive="$2"

if [[ ! -d "$directory" || "$directory" != /* ]]; then
    echo "Il parametro passato allo script non rappresenta il nome assoluto di una directory" >&2
    exit 1
fi

if [[ ! "$integer_positive" =~ ^[0-9]+$ || "$integer_positive" -le 0 ]]; then
  echo "Il parametro non rappresenta un numero intero positivo" >&2
  exit 1
fi

while read -r dir; do
    counter_file=$(find "$dir" -maxdepth 1 -type f -size +"${integer_positive}c" | wc -l)
    
    # Stampiamo prima il numero e poi la directory (utile per il sort successivo)

    if [[ $counter_file -gt 0 ]]; then
        echo "$counter_file $dir"
    fi
done < <(find "$directory" -type d) | sort -rn | while read -r num d; do
    echo "Number_files = '$num' ==> Directory = '$d'"
done 