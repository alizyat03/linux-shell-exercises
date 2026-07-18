#!/bin/bash

# Lo script prevede un numero variabile di parametri. Il parametro -f indica un nome semplice di file, mentre gli altri devono essere nomi assoluti di directory (d1, ..., dn). 
# Per ognuna delle n directory, lo script cerca al suo interno tutti i file leggibili di nome indicato da -f. 
# Lo script stampa su stdout la somma delle dimensioni dei file trovati sia per ogni directory d1, ..., dn che globalmente.
# usage: $0 [-h] -f filename d1 .. dn"

usage() {
    echo "$0 [-h] -f filename d1 .. dn" >&2
    exit 1
}

while getopts ":hf:" opt; do
    case "$opt" in
        h)
            usage
            ;;
        f)
            filename="$OPTARG"
            ;;
        \?)
            echo "Opzione non riconosciuta: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "L'opzione -$OPTARG richiede un argomento" >&2
            usage
            ;;
    esac
done

shift $((OPTIND - 1))

if [[ -z "$filename" ]]; then
    echo "Il parametro -f è obbligatorio" >&2
    usage
fi

if [[ $# -eq 0 ]]; then
    echo "Serve almeno una directory (d1 .. dn)" >&2
    usage
fi

total=0

for dir in "$@"; do
    if [[ ! -d "$dir" || "$dir" != /* ]]; then
        echo "'$dir' non è il percorso assoluto di una directory esistente" >&2
        continue
    fi

    dir_total=0
    while read -r file; do
        size=$(stat -c%s "$file")
        ((dir_total += size))
    done < <(find "$dir" -type f -readable -name "$filename")

    echo "Somma dimensioni in '$dir': $dir_total byte"
    ((total += dir_total))
done

echo "--------------------------------------------------------"
echo "Somma totale su tutte le directory: $total byte"

