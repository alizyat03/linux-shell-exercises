# Esercizi di Shell Scripting (Bash) - Linux

Raccolta di script Bash sviluppati come esercizi sulla programmazione di shell in ambiente Linux, con particolare attenzione alla gestione degli argomenti da riga di comando, ai permessi dei file, al filesystem e all'uso del comando `find`.

Ogni esercizio è disponibile in una o più **varianti**: implementazioni diverse dello stesso task, utili per confrontare approcci differenti alla stessa soluzione (uso di `[[ ]]` vs `[ ]`, gestione degli errori, stile del codice, ecc.).

Consegne degli esercizi: 

1. **Crea file con permessi specificati** — script che riceve nome file e permessi (notazione ottale) e crea un file regolare vuoto con quei permessi.
2. **Script che genera uno script "Hello World!"** — riceve un nome file, crea uno script eseguibile che stampa `Hello World!` e lo esegue.
3. **Verifica directory esistente e leggibile** — controlla che l'argomento passato sia una directory esistente e leggibile nel filesystem.
4. **Crea file con il proprio percorso assoluto** — riceve una directory scrivibile (D) e un nome file (F), crea F dentro D con scritto il proprio percorso assoluto.
5. **Primo e ultimo argomento** — stampa il primo e l'ultimo argomento passati allo script, indipendentemente dal loro numero.
6. **Tipo di percorso (assoluto / relativo / relativo semplice)** — analizza una stringa e stabilisce se rappresenta un percorso assoluto, relativo o un nome semplice.
7. **Elenco file con redirezione differenziata** — elenca i file della directory corrente, mandando quelli con estensione `.sh` su stderr e gli altri su stdout.
8. **Elenco ricorsivo con contatori file/directory** — scorre una directory, marca ogni elemento con `F` (file) o `D` (directory) e riporta il totale di ciascuno.
9. **Profondità delle sottodirectory** — esplora ricorsivamente una directory (sia con funzione ricorsiva sia con `find -printf`) stampando il livello di profondità di ogni sottocartella.
10. **Ricerca file per nome e lunghezza (righe)** — cerca ricorsivamente file con un dato nome la cui lunghezza in righe rientra in un intervallo `[N1, N2]`.
11. **Ricerca file per nome e contenuto numerico** — cerca file che contengono una cifra sia nel nome sia nel contenuto.
12. **Ricerca directory per numero di file contenuti** — individua le directory che contengono un numero di file compreso tra 1 e N.
13. **Ricerca directory per dimensione dei file, ordinate** — individua le directory con almeno un file più grande di N byte, ordinandole per numero di file che rispettano il criterio.
14. **Ricerca file con stampa delle prime/ultime righe** — cerca file per nome semplice e ne stampa il percorso completo, oltre a prime e ultime due righe.
15. **Ricerca combinata di due nomi di file** — verifica la presenza di almeno un file per due nomi diversi (F1, F2) e conta le occorrenze di ciascuno.
16. **Ricerca file per dimensione e contenuto testuale** — cerca file più grandi di N byte che contengono una determinata stringa, riportando il numero di occorrenze.

## Requisiti

- Bash 4+ (per l'uso di `[[ ]]`, espansioni parametriche ed espressioni regolari)
- Utility standard GNU/Linux: `find`, `grep`, `stat`, `wc`, `chmod`, `touch`

## Come eseguire uno script

```bash
chmod +x nome_script.sh
./nome_script.sh [argomenti]
```

Ogni script valida il numero di argomenti ricevuti e restituisce un messaggio d'errore su stderr in caso di input non corretto, insieme a un codice di uscita diverso da zero.

## Note

- Gli esercizi sono stati sviluppati a scopo didattico, nell'ambito dello studio della shell Linux/Unix.
- Alcune varianti rappresentano approcci alternativi alla stessa consegna, utili per confrontare stili diversi di validazione degli input e gestione degli errori.