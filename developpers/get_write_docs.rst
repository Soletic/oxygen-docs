Documentation Oxygen
====================

La documentation Oxygen se trouve dans le dépôt suivant :

* `Oxygen-docs GitHub <https://github.com/Soletic/oxygen-docs>`_

Elle utilise `Sphinx <http://sphinx-doc.org/>`_ pour la générer dans un format particulier.

Installation des pré-requis
---------------------------

Les explications suivantes concernent une installation sur Ubuntu.

Installer sphinx :

.. code-block:: bash

   $ easy_install -U Sphinx


Cloner les dépôts Git des documentations
----------------------------------------

Créer un dossier dans lequel se trouvera le dépôt Git de la documentation Oxygen.

.. code-block:: bash

   $ mkdir oxygen-docs
   $ cd oxygen-docs
   $ git clone https://github.com/Soletic/oxygen-docs
   
Créer un dossier dans lequel se trouveront les dépôts Git des différents bundles (au même niveau que le dossier ci-dessus).

.. code-block:: bash

   $ cd ..
   $ mkdir bundles
   $ cd bundles
   $ git clone https://github.com/Soletic/OxygenFrameworkBundle
   $ git clone https://github.com/Soletic/OxygenUIBundle
   $ git clone https://github.com/Soletic/OxygenDatagridBundle

Création des liens symboliques vers les dossiers de documentation de chaque bundle pour la génération de toute la documentation. 
Pour se faire, il faut revenir dans le dossier du dépôt Git de la documentation Oxygen.

.. code-block:: bash

   $ cd ../oxygen-docs
   $ mkdir bundles
   $ cd bundles
   $ ln -s ../../bundles/OxygenFrameworkBundle/Resources/doc framework
   $ ln -s ../../bundles/OxygenUIBundle/Resources/doc ui
   $ ln -s ../../bundles/OxygenDatagridBundle/Resources/doc datagrid

Il faut maintenant télécharger les extensions Symfony (SensioLab) pour Sphinx :

.. code-block:: bash

   $ wget https://github.com/fabpot/sphinx-php/archive/master.zip
   $ unzip master.zip
   $ mkdir _exts
   $ mv master/sensio _exts
   
Il ne reste plus qu'à générer la documentation au foramt :

.. code-block:: bash

   $ make html

Le documentation au format HTML se trouvera dans un dossier *_build/html*.

Outils conseillés
-----------------

Extension Eclipse
+++++++++++++++++

Pour être assiter dans l'édition de fichiers \*.rst sur Eclipse, vous pouvez installer l'extension rEst Editor.
URL de rEst Editor pour l'installer via "Install new software" : http://resteditor.sourceforge.net/eclipse.

Une dépendance vous sera peut-être demandée : Eclipse Color Theme.
URL de Eclipse Color Theme pour l'installer via "Install new software" : http://eclipse-color-theme.github.io/update/.
 


