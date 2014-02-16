Oxygen CMF
==========

Installer la version standard de Symfony CMF
--------------------------------------------

Commencer par la documentation d'installation officielle
pour installer Symfony CMF : `Symfony CMF <http://symfony.com/doc/master/cmf/getting-started/installing-symfony-cmf.html>`_

| Ne pas encore installer la base de données !

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

Configurer la base de données
-----------------------------

* Dans votre navigateur, tapez l'adresse : http://www.oxygen.dev/config.php
* Cliquez sur le lien *Configure your Symfony Application online* et saisir votre paramètres

Puis exécuter les commandes suivantes

.. code-block:: bash

   $ php app/console doctrine:database:create
   $ php app/console doctrine:phpcr:init:dbal
   $ php app/console doctrine:phpcr:register-system-node-types
   $ php app/console doctrine:phpcr:fixtures:load

Paramétrer les locales (pour internationalisation)
--------------------------------------------------

Editer le fichier app/config/parameters.yml pour modifier les paramètres locale et locales :

.. code-block:: yaml

   parameters:
      locale: fr
      locales: [fr, en, de]
      
Puis éditer le fichier app/config/config.yml pour ajouter la locale fr :

.. code-block:: yaml

   doctrine_phpcr:
   odm:
      ...
      locales:
         ...
         fr:
            - fr
            - en
         
Installer Sonata Admin
----------------------

Lire la documentation officielle : `Cmf and Sonata Admin <http://symfony.com/doc/master/cmf/tutorials/creating-cms-using-cmf-and-sonata.html>`_

Puis ajouter dans app/AppKernel.php :

.. code-block:: php

   public function registerBundles() {
        $bundles = array(
            // enable symfony-standard bundles
            ...
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            ...
        );
   }

Enfin créer un fichier de configuration de la sécurité security.yml dans app/config

.. code-block:: yaml

   security:
       encoders:
           Symfony\Component\Security\Core\User\User: plaintext
   
       role_hierarchy:
           ROLE_ADMIN:       ROLE_USER
           ROLE_SUPER_ADMIN: [ROLE_USER, ROLE_ADMIN, ROLE_ALLOWED_TO_SWITCH]
   
       providers:
           in_memory:
               memory:
                   users:
                       user:  { password: userpass, roles: [ 'ROLE_USER' ] }
                       admin: { password: adminpass, roles: [ 'ROLE_ADMIN' ] }
   
       firewalls:
           dev:
               pattern:  ^/(_(profiler|wdt)|css|images|js)/
               security: false
   
           login:
               pattern:  ^/demo/secured/login$
               security: false
   
           secured_area:
               pattern:    ^/demo/secured/
               form_login:
                   check_path: _security_check
                   login_path: _demo_login
               logout:
                   path:   _demo_logout
                   target: _demo
               #anonymous: ~
               #http_basic:
               #    realm: "Secured Demo Area"
   
       access_control:
           #- { path: ^/login, roles: IS_AUTHENTICATED_ANONYMOUSLY, requires_channel: https }
           
à importer dans config.yml :

.. code-block:: yaml

   imports:
       ...
       - { resource: security.yml }
           
