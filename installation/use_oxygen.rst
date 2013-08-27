Utiliser Oxygen
===============

Installer les bundles requis
----------------------------

Pour compléter votre application Symfony2 avec les capacités offertes par Oxygen et une première interface utilisateur
opérationnelle, des bundles sont obligatoires et à installer :

* OxygenFrameworkBundle : :doc:`Installer OxygenFramework <../bundles/framework/installation>`
* OxygenUIBundle : :doc:`Installer OxygenUI <../bundles/ui/installation>`

Votre application est ainsi une application Oxygen.

Créer le bundle de l'application
--------------------------------

Squelette du bundle Application
+++++++++++++++++++++++++++++++

Symfony2 recommande de toujours créer des bundles indépendant les uns des autres. Ensuite ils sont installées et configurées
dans l'application.

Cependant pour orchestrer l'utilisation des fonctionnalités offertes par ces bundles afin de créer une logique applicative complète,
vous devez créer un bundle central qui aura ce rôle. Nous l'appelons généralement : *le bundle Application*.

Si par exemple, vous souhaitez créez un logiciel collaboratif pour partager des documents et un carnet d'adresses communs, s'appellant
Coopnet, vous créez un bundle : CoopnetApplication. Si votre société est MyCompany, ce bundle se trouve dans : 
/path/to/application/src/MyCompany/CoopnetApplicationBundle

:doc:`Créer un bundle <http://symfony.com/fr/doc/current/bundles/SensioGeneratorBundle/commands/generate_bundle.html>`

Layout de base
++++++++++++++

Créer un fichier layout.html.twig à la racine du dossier views de votre bundle d'application et étendant le layout
de OxygenUIBundle.

.. code-block:: twig

   {# src/MyCompany/CoopnetApplication/Resources/views/layout.html.twig #}
   {% extends 'OxygenUIBundle::layout.html.twig' %}
   
   ...
   
Vous pouvez ensuite décider d'étendre ou remplacer :doc:`les blocs de base proposés par OxygenUI <../bundles/ui/book/layout>`

Chaque vue crée au sein de votre bundle d'application étendra ce layout.

Configurer layout de l'application
++++++++++++++++++++++++++++++++++

Il est fortement recommandé pour les vues de vos bundle d'utiliser un layout variable :
:doc:`Lire la documenation Templating d'OxygenFramwork <../bundles/framework/set_application_layout>` 

Le layout de votre application est donc finalement : 

.. code-block:: twig

   {# src/MyCompany/CoopnetApplication/Resources/views/layout.html.twig #}
   {% extends oxygen_layout() %}

Avec dans le fichier de configuration :  

.. code-block:: yml

   # app/config/config.yml
   oxygen_framework:
       templating:
           layouts:
               full: 'MyCompanyCoopnetBundle::layout.html.twig'
               
Pensez à déployer les assets :

.. code-block:: bash

   $ cd /path/to/application
   $ php app/console assets:install --symlink web

