# Pacchettizzare un commit

* rilevare i file presenti nel commit con ``git show --names-only $HASH_COMMIT``

(oppure, con più commit: ``git diff -name-only $FIRST_HASH_COMMIT $SECOND_HASH_COMMIT``

* salvare l'elenco dei file in un file release.txt

* creare una directory release

* usare il seguente comando bash

```
while read line; 
do 
cp --parents "$line" release; 
done < release.txt
```
