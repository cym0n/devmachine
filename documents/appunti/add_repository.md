Aggiungere un repository Slitaz
===============================

* tazpkg add-undigest
  * scrivere la url del repository
* tazpkg recharge

Nel repository devono essere presenti, come minimo, i file `packages.list` e `packages.md5`. Questi verranno scaricati e utilizzati per gli indici della ricerca pacchetti. 

__Attenzione__: i mirror avranno sempre la priorità su questo tipo di repository. Se in questo repository c'è una versione del pacchetto _superiore_ a quella del mirror, l'upgrade comunque non funzionerà. Sarà necessario installare il pacchetto esplicitando la versione
