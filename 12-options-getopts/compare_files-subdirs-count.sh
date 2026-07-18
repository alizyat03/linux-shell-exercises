#!/bin/bash

# Lo script prevede 2 parametri. Il parametro -d specifica il nome assoluto di una directory.
# Il parametro -m può assumere due valori EQ|NE. Lo script cerca ricorsivamente nella directory
# indicata da -d, tutte le directory in cui il numero di file contenuti e il numero di sotto
# directory contenute sia uguale (se -m=EQ) o diverso (se -m=NE).
#
# usage: $0 [-h] -d dirname -m EQ|NE

usage() {
    echo "usage: $0 [-h] -d dirname -m EQ|NE" >&2
    exit 1
}

directory=""
mode=""

while getopts ":hd:m:" opt; do
    case "$opt" in
        h)
            usage
            ;;
        d)
            directory="$OPTARG"
            ;;
        m)
            mode="$OPTARG"
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

if [[ -z "$directory" || -z "$mode" ]]; then
    echo "Parametri -d e -m sono entrambi obbligatori" >&2
    usage
fi

if [[ ! -d "$directory" || "$directory" != /* ]]; then
    echo "Il parametro -d non rappresenta il percorso assoluto di una directory esistente" >&2
    exit 1
fi

if [[ "$mode" != "EQ" && "$mode" != "NE" ]]; then
    echo "Il parametro -m deve essere EQ oppure NE" >&2
    exit 1
fi

found=0

while read -r dir; do
    num_files=$(find "$dir" -maxdepth 1 -type f | wc -l)
    num_subdirs=$(find "$dir" -mindepth 1 -maxdepth 1 -type d | wc -l)

    if [[ "$mode" == "EQ" && "$num_files" -eq "$num_subdirs" ]]; then
        echo "$dir (file: $num_files, sottodirectory: $num_subdirs)"
        found=1
    elif [[ "$mode" == "NE" && "$num_files" -ne "$num_subdirs" ]]; then
        echo "$dir (file: $num_files, sottodirectory: $num_subdirs)"
        found=1
    fi
done < <(find "$directory" -type d)

if [[ "$found" -eq 0 ]]; then
    echo "Nessuna directory trovata che soddisfi il criterio richiesto"
fi