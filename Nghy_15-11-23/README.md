
<br>

<p align="center">
  <h2 align="center">Attaque par .cmd - Nghy 15/11/23</h2>

  <p align="center">
    
<br>

    
<br>

  </p>
</p>

/!\ **Ce projet est pour but de tester la sécurité et la fiabilité de vos amis. Ce projet ne doit en aucun cas être utilisé pour nuire à autrui et n'est pas à utiliser sans consentement.** /!\

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

Ce projet est un projet de test de sécurité et de fiabilité de vos amis.
Le fonctionnement est le suivant :
Il y a trois fichiers :
* [Launch.cmd](/Nghy_15-11-23/Launch.cmd)
* [Esc.cmd](/Nghy_15-11-23/Esc.cmd)
* [Esc.cmd.lmk](/Nghy_15-11-23/Esc.cmd.lmk)

[Launch.cmd](/Nghy_15-11-23/Launch.cmd) est le fichier qui va être lancé par la cible.
Il va tout d'abord vérifier s'il est lancé en tant qu'administrateur.
Si ce n'est pas le cas, il va demander les droits d'administrateur et se relancer en tant qu'administrateur.
Une fois lancé en tant qu'administrateur, il va copier le fichier [Esc.cmd](/Nghy_15-11-23/Esc.cmd) et le fichier [Esc.cmd.lmk](/Nghy_15-11-23/Esc.cmd.lmk) dans le dossier "C:\" (extraction de la clé vers le disque dur).
Il va ensuite créer un utilisateur "Coucou", lui donner les droits d'administrateur et lui attribuer un mot de passe (ici "CoucouWas-here").
Il va ensuite activer le compte "Administrateur"/"Administrator" et lui attribuer un mot de passe (ici "CoucouWas-hereAdmin").
Il va ensuite désactiver le compte "Coucou" pour éviter que la cible ne se doute de quelque chose.
Enfin il va copier le fichier [Esc.cmd](/Nghy_15-11-23/Esc.cmd) dans le dossier "C:\Windows\SysWOW64" en tant que "MicrosoftStore_Updater.cmd" et le fichier [Esc.cmd.lmk](/Nghy_15-11-23/Esc.cmd.lmk) dans le dossier "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" en tant que "MicrosoftStore_Updater.lmk".
Il lancera finallement le programme défini au préalable dans le fichier et se fermera une fois le programme terminé.

[Esc.cmd](/Nghy_15-11-23/Esc.cmd) est un fichier qui va être lancé à chaque démarrage d'une session.
(Cela est possible grâce au fichier [Esc.cmd.lmk](/Nghy_15-11-23/Esc.cmd.lmk) qui est lancé à chaque démarrage d'une session car il est dans le dossier "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp")
Il ne se lancera automatiquement que si la session est ouverte en tant qu'administrateur. (Pour le moment, il ne se lance que si la session est ouverte en tant qu'Administrateur, le bug n'est à ce jour pas compris).
Il va recréer l'utilisateur "Coucou", lui donner les droits d'administrateur et lui attribuer un mot de passe (ici "CoucouWas-here"). L'idée étant de le remettre en place si la cible a supprimé le compte "Coucou".
Il va ensuite activer le compte "Administrateur"/"Administrator" et lui attribuer un mot de passe (ici "CoucouWas-hereAdmin") Pour la même raison que pour le compte "Coucou".
Il va ensuite activer le compte "Coucou" pour pouvoir se connecter dessus. (Le compte "Coucou" est désactivé à la fin du programme [Launch.cmd](/Nghy_15-11-23/Launch.cmd), mais une fois l'ordinateur redémarré, on peut considérer que détecter Coucou n'est plus un problème).

[Esc.cmd.lmk](/Nghy_15-11-23/Esc.cmd.lmk) est un racourci qui permet de lancer le fichier [Esc.cmd](/Nghy_15-11-23/Esc.cmd) à chaque démarrage d'une session puisqu'il est dans le dossier "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp".

## Pour Utiliser

Pour utiliser ce projet, suivez les étapes suivantes :

### Prérequis

* Clé/Stockage USB (amorçage du programme)
* Clone du dossier [Nghy_15-11-23](/Nghy_15-11-23)

### Préparation

0. Téléchargez le dossier [Nghy_15-11-23](/Nghy_15-11-23) et placez le dans la clé USB
1. Changez le "Propriétaire" du fichier "Esc.cmd" et "Launch.cmd" en "System"
Cela permet de lancer les fichiers sans avoir besoin de forcer le lancement d'application "non sécurisée"

<br>

1.a Allez dans les propriétés du fichier "Esc.cmd" et "Launch.cmd"

<br>

![Propriétés](/Img/Nghy_15-11-23_1.png?raw=true "Propriétés")

<br>

1.b Allez dans l'onglet "Sécurité"

<br>

![Sécurité](/Img/Nghy_15-11-23_2.png?raw=true "Sécurité")

<br>

1.c Cliquez sur "Avancé"

<br>

![Avancé](/Img/Nghy_15-11-23_3.png?raw=true "Avancé")

<br>

1.d Cliquez sur "Modifier"

<br>

![Modifier](/Img/Nghy_15-11-23_4.png?raw=true "Modifier")

<br>

1.e Cliquez sur "Avancé"

<br>

![Avancé](/Img/Nghy_15-11-23_5.png?raw=true "Avancé...")

<br>

1.f Cliquez sur "Rechercher"

<br>

![Rechercher](/Img/Nghy_15-11-23_6.png?raw=true "Rechercher")

<br>

1.g Choisissez "SYSTEM" et cliquez sur "OK"

<br>

![SYSTEM](/Img/Nghy_15-11-23_7.png?raw=true "SYSTEM")

<br>

1.h Cliquez sur "OK"

<br>

![OK](/Img/Nghy_15-11-23_8.png?raw=true "OK")

<br>

1.i Cliquez sur "Appliquer"

<br>

![Appliquer](/Img/Nghy_15-11-23_9.png?raw=true "Appliquer")

<br>

1.j Cliquez sur "OK"

<br>

![OK](/Img/Nghy_15-11-23_10.png?raw=true "OK")

<br>


2. Modifiez le programme "Launch.cmd" pour pointer vers un programme de votre choix
2.a Mettez un programe de votre choix dans la clé USB qui pourrait necessiter des droits d'administrateur
2.b La ligne a modifier est à la fin du fichier (ligne 74)
3. Débranchez la clé USB
4. Branchez la clé USB sur la machine cible
5. Lancez le fichier "Launch.cmd"
5.a Le but ici est de faire croire à la cible que le script est un programme de votre choix
6. Une fois le programme lancé, s'il y a une demande d'élévation de privilège, donnez les droits d'administrateur
7. Une fois le programme lancé, attendez que le programme se ferme tout seul


## Roadmap

* Ajouter une vérification de la lettre de montage de la clé USB
* Fix le lancement de la seconde partie du programme ([Esc.cmd](/Nghy_15-11-23/Esc.cmd)) en arrière plan hors compte Administrateur/Administrator
* Ajouter un système de détection des comptes administrateurs pour supprimer leurs droits d'administrateur

## Contribuer

* Si vous avez des suggestions pour ajouter ou supprimer des projets, n'hésitez pas à [Issues](https://github.com/E5-MMGE/Coucou/issues) pour en discuter, ou créez directement une demande d'extraction après avoir édité le fichier *README.md* avec les changements nécessaires.
* Créer un PR individuel pour chaque suggestion.

## License

Distribué sous la license WTFPL. Voir [WTFPL](http://www.wtfpl.net/about/) pour plus d'information.

## Autheurs

* [Nikki Devil](https://github.com/Nikki-Devil/)