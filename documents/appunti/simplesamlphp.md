simpleSAMLphp
============

Un'implementazione base di SAML con cui creare un Identity Provider di test è [SimpleSAMLphp](http://simplesamlphp.org/download).
Il pacchetto software può essere configurato sia come IdP che come SP.

La docroot del progetto deve essere configurata come la sottodirectory del pacchetto __www__.

Il primo step per vedere il sistema funzionante è andare sotto __/config/config.php__ e modificare la chiave __baseurlpath__ con il punto di mount apache. La default infatti é _simplesaml_, mentre configurando la docroot come detto sopra è sufficiente configurarla come _/_.

Allestire un Identity Provider SAML di test
------------------------------------------------------------

La configurazione di un Idp è data dalla [seguente guida](http://simplesamlphp.org/docs/stable/simplesamlphp-idp).

### File coinvolti: 

* config/config.php
* module/exempleauth/enable [da creare]
* config/authsources.php
* metadata/saml20-idp-hosted.php
* metadata/shib13-idp-hosted.php
* metadata/saml20-sp-remote.php
* metadata/shib13-sp-remote.php
* cert/server.pem
* cert/server.crt

### Configurazione degli SP nel Identity Provider: 

L'unica configurazione necessaria per censire gli SP è aggiungerli in: 

* metadata/saml20-sp-remote.php
* metadata/shib13-sp-remote.php

```
<?php
$metadata['https://sp.example.org/simplesaml/module.php/saml/sp/metadata.php/default-sp'] = array(
    'AssertionConsumerService' => 'https://sp.example.org/simplesaml/module.php/saml/sp/saml2-acs.php/default-sp',
    'SingleLogoutService'      => 'https://sp.example.org/simplesaml/module.php/saml/sp/saml2-logout.php/default-sp',
);
```

La prima chiamata usata come chiave dei metadati `https://sp.example.org/simplesaml/module.php/saml/sp/metadata.php/default-sp` è una chiamata verso il Service Provider che ne restituisce i metadati in formato XML.

### Note

Il PHP su cui deve girare l'identity provider ha bisogno del modulo PHP OpenSSL abilitato per poter manipolare le chiavi.


Allestire un Service Provider SAML di test
------------------------------------------------------------

La configurazione di un Sp è data dalla [seguente guida](http://simplesamlphp.org/docs/stable/simplesamlphp-sp).

### File coinvolti

* config/authsources.php
* cert/saml.pem (da creare, __diverso__ dal server.pem)
* cert/saml.crt (da creare, __diverso__ dal server.crt)
* metadata/saml20-idp-remote.php
* metadata/shib13-idp-remote.php

### Configurazione del IdP nel Service Provider: 

Andando all'indirizzo dell'Identity Provider, tab __Federazione__, cliccando su __Mostra metadati__ in riferimento a SAML 2.0 si ottiene direttamente il codice PHP da incollare all'interno di __metadata/saml20-idp-remote.php__ per registrare nel Service Provider l'Identity.

```
$metadata['http://idpsaml.zion:7000/saml2/idp/metadata.php'] = array (
  'name' => array(
		'en' => 'Zion Identity Provider',
		'da' => 'Zion Identity Provider',
  ),
  'metadata-set' => 'saml20-idp-remote',
  'entityid' => 'http://idpsaml.zion:7000/saml2/idp/metadata.php',
  'SingleSignOnService' => 
  array (
    0 => 
    array (
      'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
      'Location' => 'http://idpsaml.zion:7000/saml2/idp/SSOService.php',
    ),
  ),
  'SingleLogoutService' => 'http://idpsaml.zion:7000/saml2/idp/SingleLogoutService.php',
  'certData' => 'MIICgTCCAeoCCQCbOlrWDdX7FTANBgkqhkiG9w0BAQUFADCBhDELMAkGA1UEBhMCTk8xGDAWBgNVBAgTD0FuZHJlYXMgU29sYmVyZzEMMAoGA1UEBxMDRm9vMRAwDgYDVQQKEwdVTklORVRUMRgwFgYDVQQDEw9mZWlkZS5lcmxhbmcubm8xITAfBgkqhkiG9w0BCQEWEmFuZHJlYXNAdW5pbmV0dC5ubzAeFw0wNzA2MTUxMjAxMzVaFw0wNzA4MTQxMjAxMzVaMIGEMQswCQYDVQQGEwJOTzEYMBYGA1UECBMPQW5kcmVhcyBTb2xiZXJnMQwwCgYDVQQHEwNGb28xEDAOBgNVBAoTB1VOSU5FVFQxGDAWBgNVBAMTD2ZlaWRlLmVybGFuZy5ubzEhMB8GCSqGSIb3DQEJARYSYW5kcmVhc0B1bmluZXR0Lm5vMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDivbhR7P516x/S3BqKxupQe0LONoliupiBOesCO3SHbDrl3+q9IbfnfmE04rNuMcPsIxB161TdDpIesLCn7c8aPHISKOtPlAeTZSnb8QAu7aRjZq3+PbrP5uW3TcfCGPtKTytHOge/OlJbo078dVhXQ14d1EDwXJW1rRXuUt4C8QIDAQABMA0GCSqGSIb3DQEBBQUAA4GBACDVfp86HObqY+e8BUoWQ9+VMQx1ASDohBjwOsg2WykUqRXF+dLfcUH9dWR63CtZIKFDbStNomPnQz7nbK+onygwBspVEbnHuUihZq3ZUdmumQqCw4Uvs/1Uvq3orOo/WJVhTyvLgFVK2QarQ4/67OZfHd7R+POBXhophSMv1ZOo',
  'NameIDFormat' => 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
);
```
