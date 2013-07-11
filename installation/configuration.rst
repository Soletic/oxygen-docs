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
