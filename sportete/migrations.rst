Ce document liste les ruptures de compatibilité avec le projet Sport'été dans le cadre de la refonte d'Oxygen

==============
Commons Bundle
==============

------------------------------
Classes changeant de Namespace
------------------------------
* Move Oxygen\CommonsBundle\Lib\Entity\EntityManager to Oxygen\CommonsBundle\Oxygen\Entity\EntityManager
* Move Oxygen\CommonsBundle\Lib\UserAgent to Oxygen\CommonsBundle\Oxygen\UserAgent
* Move Oxygen\CommonsBundle\Lib\UserAgentException to Oxygen\CommonsBundle\Oxygen\UserAgentException
* Move Oxygen\CommonsBundle\Lib\StringConversion to Oxygen\CommonsBundle\Oxygen\Utils\StringConversion
* Move Oxygen\CommonsBundle\Exception\UserMessageException to Oxygen\CommonsBundle\Oxygen\Exception\UserMessageException

---------
PhoneType
---------
Suppression du type de formulaire de saisie d'un numéro de téléphone : Oxygen\CommonsBundle\Form\Type\PhoneType

