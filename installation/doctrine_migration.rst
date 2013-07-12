Installer DoctrineMigrationBundle
=================================

La procédure d'installation de DoctrineMigrationBundle est expliquée ici :

:doc:`DoctrineMigrationBundle Installation <http://symfony.com/fr/doc/current/bundles/DoctrineMigrationsBundle/index.html#installation>`

Cependant pour la réaliser vous devez modifier la stabilité minimum de votre application
dans le fichier composer.json en "dev" car il n'y a pas de version stable de doctrine/migrations.
C'est seulement en alpha.

Pour mettre à jour seulement ce vendor : 

.. code-block:: bash

   $ php composer.phar update doctrine/doctrine-migrations-bundle

Une fois l'installation faite, repassez en "stable".

Créer la base de données locale de déploiement
----------------------------------------------

Lorsque vous développez, vous utilisez une base de données de référence. Par exemple database.
Pendant vos développements, vous mettez à jour la structure de la base de données via la commande :

.. code-block:: bash

   $ php app/console doctrine:schema:update --force

DoctrineMigrations crée une jeu de requête SQL pour mettre à jour une base de données si sa structure ne correspond
pas à celle décrite par les entitées des bundles. Donc si vous créez la migration à partir de votre base de référence,
aucune migration ne sera détectée.

Vous devez donc créer une base de données de déploiement que nous appelons dans notre exemple : database_migration

Générer la migration
--------------------

Vous modifiez votre fichier parameters.yml pour basculer sur la base de données database_migration puis vous exécutez les commandes :

.. code-block:: bash

   $ php app/console doctrine:migration:diff
   $ php app/console doctrine:migration:migrate

Si tout se passe bien, c'est la que la migration fonctionne.

Pour éviter d'exécuter la migration sur votre base de données de référence, ajoutez le n° de version de migration dans la table de migration. 
Si elle n'existe pas encore, exécutez la commande suivante (en pensant à revenir sur votre base de référence dans parameters.yml) :

.. code-block:: bash

   $ php app/console doctrine:migration:status
