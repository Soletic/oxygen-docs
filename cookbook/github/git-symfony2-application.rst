Comment héberger une application Symfony2 sur GitHub ?
======================================================

GitHub est un service en ligne permettant la gestion de codes sources (basé sur Git).

L'intérêt de placer son application Symfony2 sous contrôle Git est de pouvoir plus facilement déployer
son application par la suite avec Capifony. Dans ce tutoriel, nous expliquons comment créer un
dépôt Git (via GitHub) pour votre application.

De plus, nous vous conseillons de placer *uniquement* l'application et non pas les bundles que vous allez créer ou modifier.
Chaque bundle devrait être aussi un dépôt à part entière et placé dans le dépôt de votre application comme un sous-module.
Lire le tutoriel suivant pour cette opération : :doc:`git-symfony2-submodules`

Pré-requis :

* Vous avez déjà créé votre application en local sur votre ordinateur :doc:`Créer son projet Oxygen <installation/requirements>`
* Git est disponible sur votre ordinateur

Créer un dépôt et l'initialiser sur son ordinateur.
---------------------------------------------------

Tout d'abord vous devez créer un dépôt sur Github : :doc:`GitHub <https://www.github.com/>`

Nous supposons que l'URL du dépôt est https://github.com/you/application.git

Ensuite lancez votre terminal et placez-vous dans le dossier de votre projet (/path/to/application)
pour initialiser un dépôt et le relier au dépôt GitHub

.. code-block:: bash

    $ cd /path/to/application
    $ git init
    $ git remote add origin https://github.com/you/application.git
    
Ensuite vous pouvez utiliser votre client Git favori pour gérer votre dépôt. Nous vous recommandons 
:doc:`SourceTree <http://www.sourcetreeapp.com/>` pour les utilisateurs Mac ou Windows et SmartGit sur Ubuntu.

Exclure des fichiers/dossiers
-----------------------------

Pour tout projet Symfony2, nous recommandons d'exclure du dépôt un certain nombre de fichiers contenant des codes d'accès ou des dossiers
comme celui du cache. Pour ce faire un fichier .gitignore est à créer à la racine du dépôt.

Le fichier suivant est un exemple :

.. code-block:: text

   /web/bundles/
   /app/cache/
   /app/logs/
   /vendor/
   /app/config/parameters*.yml
   /app/bootstrap.php.cache
   /build/
   /bin/
   /composer.phar
   /app/config/deploy.rb
   Capfile
   *~
   .DS_Store
   .Thumbs
   .profile.save
 
Si en plus vous développez votre application sous forme de projet Eclipse, ajoutez les lignes :

.. code-block:: text
   
   .settings
   .buildpath
   .project

Vous devez ensuite tirer le dépôt distant, faire un commit des nouveautés dans la version locale et pousser.
