#!/bin/bash

# Scrivere uno script che prevede 3 parametri. Il primo parametro deve essere il nome assoluto di una directory (D), mentre il secondo ed il terzo vanno trattati come nomi semplici di file (F1),
# (F2). Lo script cerca ricorsivamente in D tutte le directory che contengono entrambi i file F1 ed F2, ne stampa il percorso completo, e mostra anche la somma della dimensione in byte di F1 ed F2.

if [[ $# -ne 3 ]]; then
    echo "Il numero di parametri passati allo script non è corretto" >&2
    exit 1
fi

directory="$1"
first_file="$2"
second_file="$3"

if [[ ! -d "$directory" || "$directory" != /* ]]; then
    echo "Il parametro passato allo script non rappresenta il percorso assoluto di una directory" >&2
    exit 1
fi

if [[ "$first_file" == */* || "$second_file" == */* ]]; then
    echo "Uno o più dei parametri passati allo script non rappresenta il nome semplice di un file" >&2
    exit 1
fi

while read -r dir; do
    p1="$dir/$first_file"
    p2="$dir/$second_file"
    
    if [[ -f "$p1" && -f "$p2" ]]; then
        echo "--------------------------------------------------------"
        echo "Directory trovata: $dir"
        
        read -r size_first size_second < <(stat -c %s "$p1" "$p2")
        
        echo "Somma dimensioni ($first_file + $second_file): $((size_first + size_second)) byte"
    fi
done < <(find "$directory" -type d)

exit 0




