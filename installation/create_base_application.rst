Symfony2
========

Créer la base de données
------------------------

Créer la base de données de votre application. Dans notre exemple nous utiliserons comme base de données *oxygen*

Créer l'application Symfony2
----------------------------

Lire la documentation Symfony2 pour commencer : :doc:`Télécharger SF2 <http://symfony.com/download>`

Nous vous recommandons d'utiliser composer. Une fois votre console lancée et 
dans le dossier où vous souhaitez créer le dossier de votre application, exécuter les
commandes suivantes :

.. code-block:: bash

    $ curl -sS https://getcomposer.org/installer | php
    $ php composer.phar create-project symfony/framework-standard-edition oxygen/ 2.3.1

Remplacer *2.3.1* par la version de Symfony2 souhaitée.

Pendant l'installation, des questions vous seront posées pour paramétrer l'application : driver à utiliser pour la base de données, 
connexion à la base de données, couche transport pour l'envoi des emails, ...

Pour la couche transport, nous vous invitons à consulter des tutoriels très bien fait pour cela :

* :doc:`Utiliser Gmail <http://symfony.com/fr/doc/current/cookbook/email/gmail.html>`
* Utiliser sendmail avec MacOSX : :doc:`Paramétrer Postfix <http://www.justneuf.com/wiki/index.php/Envoyer_un_email_par_php_sous_Mac_OS_X>`

Configurer apache
-----------------

Cette configuration a pour objectif de rendre accessible l'application créée sous le nom de domaine :
http://www.oxygen.dev depuis votre navigateur :

.. code-block:: apache

    <VirtualHost *:80>
        ServerName www.oxygen.dev
        DocumentRoot "/path/to/oxygen/web"

        <Directory "/path/to/oxygen/web">
                php_value short_open_tag Off
                Options FollowSymLinks
                AllowOverride none
                Order allow,deny
                Allow from all
        </Directory>

        # Log
        ErrorLog "logs/oxygen-error_log"
        TransferLog "logs/oxygen-access_log"

        #############
        # OPTIONAL / FOR OPTIMISATION
        ############
        # Turn on Expires and set default expires to 1 week
        ExpiresActive On
        ExpiresDefault A604800
        # Set up caching on media files for 1 week
        <FilesMatch "\.(ico|gif|jpg|jpeg|png|flv|pdf|swf|mov|mp3|wmv|ppt)$">
                ExpiresDefault A604800
                Header append Cache-Control "public"
        </FilesMatch>
        # Set up 48 Hour caching on commonly updated files
        <FilesMatch "\.(js|css)$">
                ExpiresDefault A172800
                Header append Cache-Control "public"
        </FilesMatch>
   </VirtualHost>

Remplacer */path/to/oxygen/web* par le chemin complet du dossier web de votre application.

Si vous n'utilisez pas de fichier .htaccess dans le dossier web pour la reécriture d'URL, vous devez ajouter dans votre
virtual host :

.. code-block:: apache

   <VirtualHost *:80>
      ...
      <Directory "/Users/lolozere/Developpement/goodbuy/web">
             ...
             DirectoryIndex app_dev.php
             <IfModule mod_rewrite.c>
                RewriteEngine On
                RewriteCond %{REQUEST_URI}::$1 ^(/.+)/(.*)::\2$
                RewriteRule ^(.*) - [E=BASE:%1]
                RewriteCond %{ENV:REDIRECT_STATUS} ^$
                RewriteRule ^app_dev\.php(/(.*)|$) %{ENV:BASE}/$2 [R=301,L]
                RewriteCond %{REQUEST_FILENAME} -f
                RewriteRule .? - [L]
                RewriteRule .? %{ENV:BASE}/app_dev.php [L]
             </IfModule>
             ...             
      </Directory>
      ...
   </VirtualHost>
   
Si vous être en production, remplacer app_dev.php par app.php

Vous devez activer les extensions apache suivantes :

* mod_expires
* mod_rewrite

Dans le fichier httpd.conf vous devez aussi avoir ces deux lignes :

.. code-block:: apache

    NameVirtualHost *:80
    Include conf/oxygen.conf
    
Ensuite dans le fichier */etc/hosts* associer www.oxygen.dev à votre ordinateur :

.. code-block:: bash

    $ vi /etc/hosts
    
.. code-block:: text
    
    127.0.0.1  www.oxygen.dev
    
Redémarrer votre serveur apache :

.. code-block:: bash

    $ apachectl restart
    
Editer le fichier .htaccess se trouvant dans le répertoire web de l'application et remplacer app.php par app_dev.php.

Pour vérifier que cela fonctionne, tapez dans votre navigateur : http://www.oxygen.dev

