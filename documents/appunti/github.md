Configurazione repositori github
================================

Per avere a disposizione il repository github sul server ho dovuto:

* 1: creare uno script _/usr/bin/github_ssh.sh_ per agganciare al client una chiave privata diversa da quella standard.

```
#!/bin/sh
ssh -i /root/.ssh/id_rsa_my $* 
```

* 2: creare nella mia home uno script che configuri la variabile di sistema relativa al client SSH usato da git.

```
export GIT_SSH=/usr/bin/github_ssh.sh
export PS1="(git-dev)"$PS1
```

* 3: prendere la chiave privata github, portarla sulla macchina e **convertirla nel formato di dropbear**

``dropbearconvert openssh dropbear id_github _id_rsa_my``

A questo punto facendo il source dello script con l'environment è poi possibile svolgere le varie operazioni di git verso github.