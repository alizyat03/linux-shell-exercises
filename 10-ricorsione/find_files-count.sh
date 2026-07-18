#!/bin/bash

# Scrivere uno script che prevede 3 parametri. Il primo parametro deve essere il nome assoluto di una directory (D), mentre il secondo ed il terzo vanno trattati come nomi semplici di file (F1),
# (F2). Lo script cerca ricorsivamente in D per verificare che esistano (anche in directory diverse) almeno 1 file di nome F1 ed almeno 1 file di nome F2. 
# Stampare il numero di occorrenze di F1 ed F2.

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

counter_files_1=$(find "$directory" -type f -name "$first_file" | wc -l)
counter_files_2=$(find "$directory" -type f -name "$second_file" | wc -l)

if [[ $counter_files_1 -lt 1 || $counter_files_2 -lt 1 ]]; then
    echo "Errore: Uno o entrambi i file non sono stati trovati nella directory (occorrenze minori di 1)." >&2
    exit 1
fi

echo "--------------------------------------------------------"
echo "Numero di occorrenze '$first_file' == '$counter_files_1'"
echo "--------------------------------------------------------"
echo "Numero di occorrenze '$second_file' == '$counter_files_2'"