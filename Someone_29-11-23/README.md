<br>
<p align="center">
  <h2 align="center">Prank Server 2008 R2 - Someone 29/11/23</h2>
  <p align="center">
    <br>
    <br>
  </p>
</p>

/!\ **Ce projet a pour but de tester la sécurité et la fiabilité de vos amis. Ce projet ne doit en aucun cas être utilisé pour nuire à autrui et n'est pas à utiliser sans consentement.** /!\
/!\ **Ce projet est un projet de test dont le but était d' "installer" un Windows XP sur un laptop moderne, ne pas utiliser sans consentement.** /!\

## Sommaire

* [A Propos](#A-Propos)
* [Pour Utiliser](#Pour-Utiliser)
  * [Prérequis](#Prérequis)
  * [Préparation](#Préparation)
* [Roadmap](#Roadmap)
* [Contribuer](#Contribuer)
* [License](#License)
* [Autheurs](#Autheurs)

## A Propos

_Projet qui a demandé beaucoup de recherche pour le support de disque NVME et des technologies AHCI qui ont évolué. Le projet était à la base prévu sous XP et a dû à cause de cela passer sous Windows 2008 R2 après des journées de tentatives ratées._

Ce projet est un projet de "rétro installation".
Le projet est possible grâce à 4 outils principaux :
* [Acronis True Image](/Someone_29-11-23/Launch.cmd) (ou autre logiciel de clonage/backup de disque complet)
* [VMWare Workstation](/Someone_29-11-23/Esc.cmd) (ou autre logiciel de virtualisation permettant de changer le type de BIOS et de plug une clé USB)
* [Windows Server 2008 R2](/Someone_29-11-23/Esc.cmd.lmk) (Aucune autre édition d'XP n'est supportée, Windows Server 2003 est théoriquement mieux supporté mais non testé par notre équipe à l'heure actuelle)
* [Legacy Update](https://legacyupdate.org/) (Permet de mettre à jour le système pour le support de disque NVME)

[Launch.cmd](/Someone_29-11-23/Launch.cmd) 

[Esc.cmd](/Someone_29-11-23/Esc.cmd) 

[Esc.cmd.lmk](/Someone_29-11-23/Esc.cmd.lmk) 

## Pour Utiliser

Pour utiliser ce projet, suivez les étapes suivantes :

### Prérequis

* ISO de Windows Server 2008 R2 (Disponible sur [Archive.org](https://archive.org/))
* Clé/Stockage USB (amorçage de Acronis True Image et stockage du backup de Windows Server 2008 R2)
* Un logiciel de virtualisation (VMWare Workstation, VirtualBox, ...) permettant de changer le type de BIOS et de plug une clé USB physique

### Préparation

0. Téléchargez le dossier [Someone_29-11-23](/Someone_29-11-23) et placez le dans la clé USB

## Roadmap

* -

## Contribuer

* Si vous avez des suggestions pour ajouter ou supprimer des projets, n'hésitez pas à [Issues](https://github.com/E5-MMGE/Coucou/issues) pour en discuter, ou créez directement une demande d'extraction après avoir édité le fichier *README.md* avec les changements nécessaires.
* Créer un PR individuel pour chaque suggestion.

## License

Distribué sous la license WTFPL. Voir [WTFPL](http://www.wtfpl.net/about/) pour plus d'information.

## Autheurs

* [Nikki Devil](https://github.com/Nikki-Devil/)