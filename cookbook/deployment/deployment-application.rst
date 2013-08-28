Déployer son application avec Capifony
======================================

Cette documentation est un exemple parmi tant d'autres pour déployer son application Symfony2 :

* Le serveur de production accède aux dépôts Git composant l'application


Pré-requis
----------

* L'extension OpenSSL de PHP sur le serveur de production doit-être activée
* Créer la base de données sur votre serveur
* Installer Capifony : http://capifony.org/. Faire uniquement l'étape 1.
* Créer un compte utilisateur sur votre serveurayant un accès SSH (par exemple ssn ayant comme mot de passe ssnpass) 
* Créer un dossier pour votre projet dans le dossier de cette utilisateur (par exemple application)
* Utiliser DoctrineMigrationBundle dans votre application (:doc:`Installer DoctrineMigrationBundle <../../installation/doctrine_migrations.rst>`)

Avec ces pré-requis, l'application est déployée dans le dossier /home/ssn/application
de votre serveur.

Change session configuration
++++++++++++++++++++++++++++

Pour un déploiement optimal, nous vous invitons à suivre ce tutoriel pour conserver les sessions malgré un déploiement :

`How to keep Symfony2 sessions after deploy <http://capifony.org/cookbook/how-to-keep-sessions-after-deploy.html>`_

Setup project
-------------

Créer la configuration initiale du projet à déployer :

.. code-block:: bash

   $ cd path/to/application
   $ capifony .
   
Configurer votre fichier de configuration de déploiement se trouvant dans app/config/deploy.rb. A la fin de cette page,
un exemple vous est donné.


Créez l'arborescence de déploiement sur le serveur :

.. code-block:: bash

   $ cd path/to/application
   $ cap deploy:setup

Ajoutez dans shared/app/config vos fichiers de paramétrages. Exemple avec parameters.yml :

.. code-block:: bash

   ssn@server$ cd path/to/application
   ssn@server$ mkdir -p shared/app/config
   ssn@server$ vi shared/app/config/parameters.yml
   
Deploy
------

Premier déploiement
+++++++++++++++++++

Si c'est votre premier déploiement, capifony essayera d'installer composer.phar avec la ligne de commande 
curl -s http://getcomposer.org/installer | php

Si votre serveur n'a pas curl, vous devez avoir à la racine de votre application cette installation déjà faite.

Déploiement continu
+++++++++++++++++++
Si vous utilisez DoctrineMigrations :

.. code-block:: bash

   $ cd path/to/application
   $ cap deploy:migrations
   
Sinon

.. code-block:: bash

   $ cd path/to/application
   $ cap deploy
   
Deploy config file example
--------------------------

.. code-block:: ruby

   set :conf_application,  "Your application name"
   set :conf_domain,       "your server : IP, domain name, ..."
   set :conf_user,         "ssh user to deploy"
   set :conf_password,     "ssh user password"
   set :conf_deploy_to,    "directory in server"
   set :conf_repository,   "url of git repository"
   
   set :application, "#{conf_application}"
   set :domain,      "#{conf_domain}"
   set :deploy_to,   "#{conf_deploy_to}"
   set :deploy_via, :remote_cache
   set :app_path,    "app"
   
   set :repository,  "#{conf_repository}"
   set :scm,         :git
   set :git_enable_submodules, 1
   # Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`
   
   #set :update_vendors, false
   set :shared_files,      ["app/config/parameters.yml", "app/config/parameters-application.yml"]
   set :shared_children,   [app_path + "/logs", web_path + "/uploads", "vendor", app_path + "/sessions"]
   set :use_composer, true
   set :composer_options,  "--no-dev --verbose --prefer-dist --optimize-autoloader"
   
   set :model_manager, "doctrine"
   # Or: `propel`
   
   set :interactive_mode, false
   
   # ASSETIC AND CACHE
   set :cache_warmup, true
   set :dump_assetic_assets, true
   
   role :web,              domain                         # Your HTTP server, Apache/etc
   role :app,              domain, :primary => true       # This may be the same as your `Web` server
   
   set :user,           "#{conf_user}"
   set :password,          "#{conf_password}"
   set :use_sudo,       false
   set :keep_releases,  3
   
   # Be more verbose by uncommenting the following line
   logger.level = Logger::MAX_LEVEL