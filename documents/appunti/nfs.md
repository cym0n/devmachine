File di configurazione
----------------------

__/etc/exports__: aggiungere una riga contenente la directory da condividere e le flag. E' sufficiente:

`/dir/to/share (rw)`

Per rendere le cose più facili è bene che l'ownership della directory sia di un utente con la stessa UID dell'utente che la userà una volta montata.

Servizi
-------

I servizi necessari sono __due__.

* portman
* unfsd

E devono essere fatti partire in quest'ordine
