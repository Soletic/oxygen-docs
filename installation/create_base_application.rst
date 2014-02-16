Installation de Symfony2 pour Oxygen
====================================

Créer la base de données
------------------------

Créer la base de données de votre application. Dans notre exemple nous utiliserons comme base de données *oxygen*.

Créer l'application Symfony2
----------------------------

Vous pouvez télécharger Symfony2 à l'adresse suivante : `Télécharger SF2 <http://symfony.com/download>`_

Nous vous recommandons d'utiliser `<http://getcomposer.org/>`_. Une fois votre console lancée et dans le dossier où vous 
souhaitez créer le dossier de votre application, exécutez les commandes suivantes :

.. code-block:: bash
   
    $ curl -sS https://getcomposer.org/installer | php
    $ php composer.phar create-project symfony/framework-standard-edition oxygen/ 2.3.1

.. container:: alert alert-info

   Remplacer *2.3.1* par la version de Symfony2 souhaitée.

Pendant l'installation, des questions vous seront posées pour paramétrer l'application : driver à utiliser pour la base de données, 
connexion à la base de données, couche transport pour l'envoi des emails, etc.

.. container:: alert alert-info
   
   Pour la couche transport, nous vous invitons à consulter des tutoriels très bien fait pour cela :
   
   * `Utiliser Gmail <http://symfony.com/fr/doc/current/cookbook/email/gmail.html>`_
   
   * Utiliser sendmail avec MacOSX : `Paramétrer Postfix <http://www.justneuf.com/wiki/index.php/Envoyer_un_email_par_php_sous_Mac_OS_X>`_

Configurer apache
-----------------

Cette configuration a pour objectif de rendre accessible l'application créée sous le nom de domaine http://www.oxygen.dev depuis votre navigateur. 
Remplacer */path/to/oxygen/web* par le chemin complet du dossier web de votre application.

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

        ################################
        # OPTIONNAL / FOR OPTIMISATION #
        ################################
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

.. container:: alert alert-warning

   Pour que la configuration Apache ci-dessus fonctionne, vous devez installer (ou activer) les 
   extensions Apache suivantes :
   
   * mod_expires
   
   * mod_rewrite
   
   * mod_headers

Si vous n'utilisez pas de fichier .htaccess dans le dossier web pour la reécriture d'URL, vous devez ajouter dans votre
virtual host :

.. code-block:: apache

   <VirtualHost *:80>
      ...
      <Directory "/path/to/oxygen/web">
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

.. container:: alert alert-warning

   Si vous être en production, remplacer app_dev.php par app.php

En fonction de votre plateforme, vous devez vérifier si le fichier de configuration apache de votre virtualhost est bien 
inclus dans le fichier de configuration d'Apache.

Pour Apache sous MacOSX :

.. code-block:: apache

    NameVirtualHost *:80
    Include conf/oxygen.conf

Pour Apache sous Ubuntu, vous n'avez normalement pas besoin de faire cela. Nous vous renvoyons vers la documentation Apache 
sous Ubuntu qui explique très bien le fonctionnement des virtualhost sur cette plateforme : 
`Tutoriel - Les virtualhost sous Apache 2 <http://doc.ubuntu-fr.org/tutoriel/virtualhosts_avec_apache2>`_.

Dans le fichier */etc/hosts* associez www.oxygen.dev à votre ordinateur :
    
.. code-block:: text
    
    127.0.0.1  www.oxygen.dev

.. container:: alert alert-danger

   **Redémarrez votre serveur apache !!**

   Sous MacOS X :
   
   .. code-block:: bash
      
      $ apachectl restart

   Sous Ubuntu :
   
   .. code-block:: bash
   
      $ service apache2 restart


Voilà, vous pouvez vérifier que cela fonctionne en tapant dans votre navigateur : http://www.oxygen.dev. 
Vous devriez voir la page de démonstration de Symfony2.