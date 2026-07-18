#!/bin/bash

# Scrivere uno script che prevede 2 parametri. Il primo parametro deve essere il nome assoluto di una directory (D), mentre il secondo va trattato come un nome semplice di file (F). 
# Lo script cerca ricorsivamente in D tutti i file di nome F, e crea un link simbolico ad ognuno di essi all'interno della cartella /tmp. 
# I link simbolici creati devono avere un nome nella forma /tmp/link_1 .. /tmp/link_n.

if [[ $# -ne 2 ]]; then
    echo "Il numero di parametri passati allo script non è corretto" >&2
    exit 1
fi

directory="$1"
file_name="$2"

if [[ ! -d "$directory" || "$directory" != /* ]]; then
    echo "Il parametro passato allo script non rappresenta il percorso assoluto di una directory" >&2
    exit 1
fi

if [[ "$file_name" == */* ]]; then
    echo "Il parametro passato allo script non rappresenta il nome semplice di un file" >&2
    exit 1
fi

counter=1

while read -r file; do
    ln -sf "$file" "/tmp/link_$counter"
    ((counter++))
done < <(find "$directory" -type f -name "$file_name")

exit 0