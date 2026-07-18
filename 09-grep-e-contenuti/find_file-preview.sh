#!/bin/bash

# Scrivere uno script che prevede 2 parametri. Il primo parametro deve essere il nome assoluto di una directory (D), mentre il secondo va trattato come un nome semplice di file (F). 
# Lo script cerca ricorsivamente in D tutti i file di nome F, ne stampa il percorso completo su standard output, e mostra anche le prima e le ultime due linee del suo contenuto.


if [[ $# -ne 2 ]]; then
    echo "Il numero di parametri passati allo script non è corretto" >&2
    exit 1
fi

directory="$1"
filename="$2"

if [[ ! -d "$directory" || "$directory" != /* ]]; then
    echo "Il parametro passato allo script non rappresenta il percorso assoluto di una directory" >&2
    exit 1
fi

if [[ "$filename" == */* ]]; then
    echo "Il parametro passato allo script non rappresenta un nome semplice di file" >&2
    exit 1
fi

while read -r file; do
    percorso_file="$file"
    linee_file="$(wc -l < "$file")"
    echo "Percorso = '$percorso_file'"

    if [[ "$linee_file" -le 2 ]]; then
        echo "------ Contenuto completo (<= 2 linee) ------"
        cat "$file"
    else
        echo "------ Prime due linee ------"
        head -2 "$file"
        echo "------ Ultime due linee ------"
        tail -2 "$file"
        echo ""
    fi
done < <(find "$directory" -type f -name "$filename")