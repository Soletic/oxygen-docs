Installer DoctrineMigrationBundle
=================================

Dans un permier veuillez suivre la procédure d'installation du bundle DoctrineMigrationBundle :

`DoctrineMigrationBundle - Installation <http://symfony.com/fr/doc/current/bundles/DoctrineMigrationsBundle/index.html#installation>`_

Le bundle DoctrineMigrationBundle n'est pour le moment que dans une version alpha. Vous devez donc    
modifier la stabilité minimum de votre application dans le fichier composer.json en "dev".

Lancez la commande suivante pour mettre à jour ce *vendor* : 

.. code-block:: bash

   $ php composer.phar update doctrine/doctrine-migrations-bundle

.. container:: alert alert-warning

   Une fois l'installation faite, repassez en "stable".

Créer la base de données locale de déploiement
----------------------------------------------

Lors de l'installation de Symfony2, vous avez dû renseigner le nom de votre base de données (par exemple : oxygen).
La mise à jour de la structure de votre base de données se fait avec la commande suivante :

.. code-block:: bash

   $ php app/console doctrine:schema:update --force

*DoctrineMigrations* crée un jeu de requête SQL pour mettre à jour une base de données si sa structure ne correspond
pas à celle décrite par les entitées des bundles. Donc si vous créez la migration à partir de votre base de référence,
aucune migration ne sera détectée.

Vous devez donc créer une base de données de déploiement que nous appelons dans notre exemple : *oxygen_migration*.

Générer la migration
--------------------

Modifiez votre fichier parameters.yml pour basculer sur la base de données *oxygen_migration* puis exécutez les commandes :

.. code-block:: bash

   $ php app/console doctrine:migration:diff
   $ php app/console doctrine:migration:migrate

Si tout se passe bien, la migration a fonctionné.

Pour éviter d'exécuter la migration sur votre base de données de référence (oxygen dans notre exemple), ajoutez le numéro
de version de migration dans la table de migration. Si elle n'existe pas encore, exécutez la commande suivante 
(en pensant à revenir sur votre base de référence dans parameters.yml) :

.. code-block:: bash

   $ php app/console doctrine:migration:status
