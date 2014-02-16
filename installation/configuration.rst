Configuration d'Oxygen
======================

Vous trouverez ci-après les modifications à faire dans le fichier *config.yml* de votre application.

Assetics
--------

Activer l'utilisation d'assetics pour tous les bundles en commentant la ligne *bundles*.

.. code-block:: yaml
   :linenos:
   
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
   :linenos:
   
   framework:
      translator: { fallback: %locale% }

.. container:: alert alert-info

   Le paramètre *locale* doit-être définie dans le fichier parameters.yml.