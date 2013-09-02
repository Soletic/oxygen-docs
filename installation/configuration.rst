Configuration
=============

Assetics
--------

Activer l'utilisation d'assetics pour tous les bundles en commentant la ligne 

.. code-block:: yaml

   assetic:
      debug:          %kernel.debug%
      use_controller: false
      #bundles:        [ ]
      #java: /usr/bin/java
      filters:
        cssrewrite: ~

Traductions
-----------

Pour correctement afficher les libellés dans la langue locale, vous devez ajouter dans le fichier config.yml de l'application :

.. code-block:: yaml

   framework:
      translator: { fallback: %locale% }

Bien entendu, le paramètre *locale* doit-être définie.