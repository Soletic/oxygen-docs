Todo List des développements
============================

* [Oxygen-docs] Ecrire comment obtenir, modifier et générer la documentation
* [NC][Oxygen-docs] Habiller la documentation avec un thème propre à Oxygen
* [OxygenFramework] Pourvoir remplacer la classe EntityManager à utiliser dans EntitiesServer via fichier de configuration
* [OxygenFramework] Ligne de commande d'installation des entités d'un bundle Oxygen dans un autre bundle
* [OxygenUI] Documenter liste des ressources proposées
* [OxygenUI] Documenter présentation layout
* [NC][OxygenUI] Trouver comment faire $(this).oxygen.ui();
* [Oxygen??] Comment permettre à tout bundle de fixer facilement les meta d'une page ?
   * Soit c'est des noms de blocs pré-définis dans le layout
   * Soit c'est des fonctions twig
   * Soit des bloccs twig en utilisant KnpBlockBundle (se renseigner sur ce bundle et voir ce qu'il permet)
* [OxygenUI] Afficher un formulaire dans une élement DOM, récupéré en appel ajax et gérant la soumission en ajax (s'inspirer de dialogAjaxForm mais à coder sous forme Bootstrap)
   * exemple : <a href="#" data-toggle="form" data-target="...">Afficher formulaire</a>
* [OxygenUI] Comment ajouter la classe form-control sans passer par le forms.html.twig mais par le renderer ?
* [OxygenPassbook] : enlever le groupe 'default' des fichiers de validation (pour comptabilité SSNTherapass)

Nouveau bundle
--------------

OxygenMailerBundle
++++++++++++++++++

Ce bundle simplifie l'envoi d'emails.