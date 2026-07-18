# Esercizi di Shell Scripting (Bash) — Linux

Raccolta di script Bash sviluppati come esercizi di shell scripting in ambiente Linux, organizzata per argomento in cartelle progressive: dalla gestione di file e permessi fino a ricerche ricorsive combinate con `find` e `grep`.

## Struttura del repository

```
├── 01-file-e-permessi        # creazione file e controllo permessi
├── 02-creazione-script        # script che generano altri script
├── 03-directory                # lettura del contenuto di una directory
├── 04-argomenti                # gestione degli argomenti da riga di comando
├── 05-percorsi                  # analisi e classificazione di percorsi
├── 06-output-e-redirezioni      # redirezione differenziata di stdout/stderr
├── 07-file-e-directory          # verifiche combinate su file e directory
├── 08-find                       # ricerche con find su dimensione e conteggio
├── 09-grep-e-contenuti           # ricerche basate sul contenuto dei file
├── 10-ricorsione                  # esplorazione ricorsiva del filesystem
├── 11-esercizi-completi           # esercizi riepilogativi che combinano più concetti
├── docs                            # approfondimenti e note aggiuntive
└── examples                        # esempi di utilizzo ed output di riferimento
```

Ogni cartella numerata raggruppa gli script relativi a uno stesso argomento; all'interno, ogni sottocartella corrisponde a un esercizio (in alcuni casi sono presenti più varianti dello stesso task, utili per confrontare approcci diversi: uso di `[[ ]]` vs `[ ]`, gestione degli errori, stile del codice, ecc.).

## Argomenti trattati

### 01 — File e permessi
- **check_directory** — verifica che l'argomento passato sia una directory esistente e leggibile nel filesystem.
- **file_permission** — riceve nome file e permessi in notazione ottale e crea un file regolare vuoto con quei permessi.

### 02 — Creazione di script
- **create-path-script** — riceve una directory scrivibile e un nome file, e crea al suo interno un file contenente il proprio percorso assoluto.
- **nested_script_creation** — riceve un nome file, genera uno script eseguibile che stampa `Hello World!` e lo esegue.

### 03 — Directory
- **list-directory-content** — elenca il contenuto di una directory passata come argomento.

### 04 — Argomenti da riga di comando
- **get_first-last-arg** — stampa il primo e l'ultimo argomento passati allo script, indipendentemente dal loro numero.

### 05 — Percorsi
- **check-path-type** — analizza una stringa e stabilisce se rappresenta un percorso assoluto, relativo o un semplice nome.

### 06 — Output e redirezioni
- **list_files-redirect** — elenca i file della directory corrente, inviando quelli con estensione `.sh` su stderr e gli altri su stdout.

### 07 — File e directory
- **search-readable-files** — cerca ricorsivamente i file leggibili all'interno di una directory data.

### 08 — Find
- **dir_filesize-count.sh** — individua le directory contenenti almeno un file più grande di N byte.
- **file_count_dir** — individua le directory che contengono un numero di file compreso in un intervallo dato.
- **files_by_size** — cerca file in base alla dimensione e ne riporta il percorso.

### 09 — Grep e contenuti
- **find-script** — cerca ricorsivamente file per nome e ne analizza il contenuto.
- **name_content-digit** — cerca file che contengono una cifra sia nel nome sia nel contenuto.

### 10 — Ricorsione
- **dir_file_count** — scorre ricorsivamente una directory, marcando ogni elemento con `F` (file) o `D` (directory) e riportando i totali.
- **files_length-range** — cerca ricorsivamente file con un dato nome la cui lunghezza in righe rientra in un intervallo `[N1, N2]`.
- **oldest_file_leaf** — individua il file più vecchio all'interno delle directory "foglia" (senza sottodirectory).
- **rec_directory-paths** — stampa ricorsivamente i percorsi di file e directory con il relativo livello di profondità.

### 11 — Esercizi completi
- **count_files_string** — conta le occorrenze di una stringa all'interno dei file trovati.
- **file-e-directory** — esercizio riepilogativo di verifica su file e directory.
- **find_files_min_lines** — cerca file con un numero minimo di righe.
- **leaf_dir_ext** — individua le directory foglia che contengono file con una determinata estensione.
- **leaf_dir_size_report** — genera un report sulle dimensioni dei file nelle directory foglia.
- **leaf_directory-report** — report riepilogativo sulle directory foglia del filesystem.

> Le descrizioni sopra sono una bozza dedotta dai nomi degli script; puoi correggerle o integrarle con la consegna esatta di ciascun esercizio.

## Requisiti

- Bash 4+ (per l'uso di `[[ ]]`, espansioni parametriche ed espressioni regolari)
- Utility standard GNU/Linux: `find`, `grep`, `stat`, `wc`, `chmod`, `touch`

## Come eseguire uno script

```bash
chmod +x nome_script.sh
./nome_script.sh [argomenti]
```

Ogni script valida il numero e la validità degli argomenti ricevuti e restituisce un messaggio d'errore su stderr in caso di input non corretto, insieme a un codice di uscita diverso da zero.

## Documentazione ed esempi

- **docs/** — note di approfondimento su singoli comandi o concetti (es. `find`, redirezioni, permessi ottali).
- **examples/** — esempi pratici di input/output per verificare rapidamente il comportamento degli script.

## Note

- Gli esercizi sono stati sviluppati a scopo didattico, nell'ambito dello studio della shell Linux/Unix.
- Alcune varianti rappresentano approcci alternativi alla stessa consegna, utili per confrontare stili diversi di validazione degli input e gestione degli errori.