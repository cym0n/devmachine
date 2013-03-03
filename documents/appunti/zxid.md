Appunti per installare zxid
===========================

Prerequisiti
------------

*  Installare `curl-dev`
*  Installare `php-dev`
*  Installare tutto quello che riguarda JAVA (se proprio si vuole installare anche la componente per JAVA...)

Makefile
--------

Non esiste un configure, ma il Makefile ha bisogno di alcune modifiche.

Per i path apache: 
```
root@zion:/# find / -name ap_config.h; find / -name apr.h; find / -name mod_auth
_basic.so
/usr/include/ap_config.h
/usr/include/apr-1/apr.h
/usr/share/apache/modules/mod_auth_basic.so
```

Vista la sua complessità, meglio escludere i binding JAVA.
Per farlo, escludere il paramentro zxidjava dalla all (o creare una nuova condiurazione che non lo comprenda?)

``all: default precheck_apache samlmod phpzxid apachezxid smime zxidwspcgi``

Compilazione
------------

Il comando da eseguire è `make all` (o altra opzione se se ne è scritta una custom) per avere i bindings di tutti i linguaggi opzionali.

`make dir` crea invece le strutture dei file di configurazione e le posizioni dove andrà a scrivere zxid. Essendo una struttura sotto /var sono il primo comando che necessita obbligatoriamente **root**

Per le componenti perl andare sotto la directory Net e lanciare un `make && make install`, altrimenti le librerie C non verranno installate nei path corretti.



Configurazione Apache
---------------------

A questo punto si mette il compilato come una webroot Apache. Questo, per come è configurato l'apache SliTaz, rende già (quasi) operativo php. Per perl e C bisogna configurare il cgi Handler.


Note
----

Per il file PHP meglio sostituire tutti i `<?` con i `<?php`
