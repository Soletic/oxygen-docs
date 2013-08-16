Comment transformer un bundle de l'application en un sous-module Git ?
======================================================================

Dans votre application, vous allez devoir créer des bundles.
Nous vous proposons ce tutoriel pour créer ces bundles comme étant un dépôt Git à part entière
et placé dans le dépôt de l'application.

En faisant ceci, vous permettez à d'autres d'utiliser votre bundle sans récupérer toute l'application.

Tout d'abord vous devez créer votre bundle.
Lire la documentation :doc:`Générer un squelette pour un nouveau bundle <http://symfony.com/fr/doc/current/bundles/SensioGeneratorBundle/commands/generate_bundle.html>`

Assurez-vous d'avoir Git d'installer sur votre ordinateur.

Créer le dépôt et l'initialiser sur son ordinateur
--------------------------------------------------

Créer un dépôt sur Github : :doc:`GitHub <https://www.github.com/>`

Nous supposons que l'URL du dépôt est https://github.com/you/AcmeSomethingBundle.git

Lancer votre terminal et se rendre dans le dossier du bundle (/path/to/application/src/Acme/SometingBundle)
pour enfin l'initialiser un dépôt et le relier au dépôt GitHub

.. code-block:: bash

    $ cd /path/to/application/src/Acme/SometingBundle
    $ git init
    $ git remote add origin https://github.com/you/AcmeSomethingBundle.git
    
Vous devez ensuite tirer le dépôt distant, faire un commit des nouveautés dans la version locale et pousser avant de passer à l'étape suivante.

Ajouter le dépôt comme sous-module du dépôt de l'application
------------------------------------------------------------

.. code-block:: bash

    $ cd /path/to/application
    $ git -c diff.mnemonicprefix=false -c core.quotepath=false submodule add -f https://github.com/you/AcmeSomethingBundle.git ./src/Acme/SomethingBundle
    
Puis avec votre client Git préféré vous effectuez un commit puis un push.