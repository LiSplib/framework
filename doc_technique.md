# Présentation du site

## Sommaire :
- [Description](#description)
- [la page d'accueil](#register)
- [la connexion](#connect)
- [le calendrier](#calendar)
- [le compte](#myAccount)
- [le superAdmin](#superAdmin)
- [liste des membres](#members)
- [les réseaux sociaux](#socialMedia)
- [le resizer](#resizer)
- [la barre de recherche](#search)

## Description {#description}

Ce site est en gestionnaire d'évènements et d'utilisateurs.
Il se présente sous la forme d'un calendrier 

## La page d'accueil : {#register}

![Page register](/sources/images/doc/register.jpg)

Pour accéder au site il faut obligatoirement avoir un compte enregistré.
Lors de l'enregistrement l'utilisateur peut faire une demande pour s'inscrire comme Coach (possibilité de créer des évènements).
Si tous les champs sont bien remplis :
- Nom et prénom en majuscule ou minuscule uniquement (pas de chiffre ni de caractères spéciaux)
- Email au format valide (xxxx@xxx.xx)
- Une photo déjà hébergée sur un site le lien doit être valide
- Et le mot de passe doit correspondre avec la confirmation demandée.

L'utilisateur est alors enregistré dans la base de donnée, s'il a fait une demande pour être coach le superAdmin doit valider cette demande.

Une fois enregistré l'utilisateur peut se connecter.

## La connexion : {#connect}

![Connexion](/sources/images/doc/connect.jpg)

La connexion s'effectue avec l'email et mot de passe si l'utilsateur est trouvé et existe alors il est connecté et redirigé vers l'accueil.

![Accueil](/sources/images/doc/home.jpg)

Cette page est pour le moment vide juste un logo en fond de page.

L'utilisateur a maintenant accès au site grace à la barre de navigation latérale

![Navbar](/sources/images/doc/navbar.jpg)

## Calendrier Évènements : {#calendar}

![Calendar](/sources/images/doc/calendar.jpg)

Sur cette page on peut selectionner le mois voulu (par défaut le mois affiché est le mois en cours).
On y trouve les catégories d'évènements avec leur code couleur.
Seuls les coachs et le superAdmin peuvent créer un évènement.
L'utilisateur peut naviguer de mois en mois s'il le souhaite.
Il peut avoir plus d'information sur un évènement en le selectionnant soit sur le calendrier ou dans le menu de droite.

![Event](/sources/images/doc/calendarShow.jpg)

Une fois l'évènement affiché il peut s'y inscrire, s'y intéresser et le partager
On peut voir le thème de l'évènement avec son code couleur, le titre et une description.
On peut aussi voir qui a créer cet évènement à quelle heure à t'il lieu ainsi que les autres utilisateurs inscrits ou intéressés.

![Location](/sources/images/doc/calendarShowEnd.jpg)

L'utilisateur peut aussi voir sur une carte **Waze** ou se situe l'évènement.
La carte peut être zoomer ou dezoomer, si l'utilisateur clic sur agrandir la carte en haut a droite l'application **Waze** se lancera sur son mobile ou dans son navigateur pour un guidage plus facile.

Si l'utilisateur s'est inscrit à un ou plusieurs évènements il pourra les retrouver facilement dans l'onglet Mon Compte de la barre de navigation.

<img id="account" src="sources/images/doc/navbarAccount.jpg">

![UserEvents](/sources/images/doc/userEvents.jpg)

#### Version Coach

 Le coach pourra créer un nouvel évènement en cliquant directement sur la date qu'il souhaite ou sur le bouton créer un événement.

 ![AddEvent](/sources/images/doc/addEvent.jpg)
 - le titre doit avoir plus de 3 caractère pour être valide
 - le lien de l'image doit être un lien valide (*ce champ est facultatif*)
 - le thème choisi définira la couleur de la pastille de l'évènement sur le calendrier
 - l'heure de fin ne peut pas être antérieure à l'heure de début
 - l'adresse doit être valide pour pouvoir apparaitre sur la carte **Waze**

> ----
> *Une fois créer l'évènement doit être validé par le superAdmin pour apparaitre dans le calendrier.*
>
> <img id="awaitEvent" src="sources/images/doc/awaitingEvents.jpg">
>
> ---- 


## Mon Compte {#myAccount}

L'utilisateur enregistré peut modifier ses infos dans l'onglet <a href="#account">Mon Compte</a>

![Account](/sources/images/doc/account.jpg)

En cliquant sur modifier mon profil ou sur la roue cranté version mobile il pourra rajouté d'autres informations s'il le souhaite

![AccountEdit](/sources/images/doc/adminEdit.jpg).

- La selection pour la région et le département s'effectue avec une liste déroulante.
- Pour les réseaux sociaux il peut choisir jusqu'à 4. En fonction de son choix les bonnes icones *sous son pseudo* apparaitront avec le bon lien.

Si l'utilisateur est un coach alors apparaitra tout en bas le bouton Mes Infos Pro.

![AdminPro](/sources/images/doc/adminPro.jpg)

Sur cette page il pourra renseigner ces informations professionnelles :

- Coaching pratiqué
- A quel orgabisme il adhére
- Sa catégorie
- Son domaine d'intervention
- Sa formation et certification
- Son parcours

Et des infos plus personnelle : 

- Une publication d'un client ou autre
- Ses centres d'intêrets
- Sa citation favorite


## Le superAdmin {#superAdmin}

C'est le premier utilisateur à s'inscrire sur le site qui aura le rôle de `superAdmin`.
> C'est lui qui validera les <a href="#members">coachs</a>.
> Il validera aussi les <a href="#awaitEvent">évènements</a> avant leur publication.
> Il a tout contrôle sur le site.
> Il pourra modifier tous les profils et tous les évènements si besoin.
> Il devra gérer les <a href="#socialMedia">tokens pour Instagram et Facebook.</a>
> Il pourra modifier certains éléments graphique du site dans <a href="#parameter">Paramètrage</a>

![AdminNavbar](/sources/images/doc/adminNavbar.jpg "les chiffres sur fond jaune indique de manière dynamique les élèments en attente(s)")
> *les chiffres sur fond jaune indique de manière dynamique les élèments en attente(s)*

#### La liste des membres {#members}

![Members](/sources/images/doc/allMembers.jpg)

Sur cette page le `superAdmin` pourra Éditer le profil des membres (valider le rôle de coach si la demande a été faite) ou supprimer un profil.

![editUser](/sources/images/doc/editUser.jpg "Editer le rôle de l'utilisateur")

Il pourra classer les membres par demandes pour retouver plus facilement les coachs en attentes.
Il pourra aussi utiliser la recherche (par prénom) pour trouver un utilisateur plus facilement.

#### Les réseaux Sociaux {#socialMedia}

![social](/sources/images/doc/social.jpg "Gestion des Tokens")

Sur cette page le `superAdmin` pourra renouveler ses `Tokens` afin d'avoir accès sur ce site a ses réseaux sociaux et les afficher directement selon ses besoins et utilités.
Actuellement sont gérées :
- la page <a href="#instagram">Instagram</a> avec tous les posts photos et vidéos.
- la page <a href="#facebook">Facebook</a> avec les évènements crées sur Facebook.
- la page <a hreef="liveFb">Live Facebook</a> ou l'on retrouve les vidéos Live de la page ainsi que les vidéos déjà postées sur Facebook.

> **Pour Instagram :**
Il suffit d'appuyer sur le bouton Token 60j pour faire la demande de renouvellement du Token (valable 60 jours). Il faudra le faire avant que le compteur de jour restant ne tombe à 0 sinon il faudra recommencer toute la manipulation pour obtenir à nouveau un Token 60j.
En appuyant sur le bouton Mise a jour après avoir demander un nouveau Token 60j, le nouveau token va s'enregistrer dans la base de donnée et y être stocké et appelé chaque fois qu'il sera nécessaire.

> **Pour Facebook :**
Il faut être admin de la page facebook en question, ou enregister comme testeur dans l'API créer avec le compte Facebook Developper.
Il faut cliquer sur le bouton Se connecter avec Facebook et de se connecter avec son compte facebook sur la page qui va s'ouvrir, accorder les droits à l'appli.
Cet accord renvoi sur une page ou sera inscrit le nouveau Token 60j pour Facebook.
*L'automatisation de se procédé reste a développer il n'est pas encore terminé.*

#### Instagram {#instagram}

![instagram](/sources/images/doc/instagram.jpg)

Cette page va donc afficher selon le format obtenu soit les images soit les vidéos qui auront été posté sur l'application instagram par son propriètaire.
Dès qu'il y aura un nouveau post sur Instagram il apparaitra içi aussi directement.

>*Il me reste à développer un filtre de recherche par hashtag pour cette page.*

#### Facebook {#facebook}
- La partie évènement :
Comme pour la partie Instagram cette page affiche les événements créer sur Facebook par le propriètaire de la page.

![FacebookEvents](/sources/images/doc/fbEvents.jpg "Le design n'est pas fini sur cette page, je vais l'harmoniser avec le reste du site")

- La partie Live :

    - Dans cette page apparaitront les vidéos en live quand elles sont diffusées sur Facebook.
    - Un petit logo live apparait sur l'onglet Facebook quand une vidéo est en live.
![FacebookLive](/sources/images/doc/fbLive.jpg "Le design n'est pas fini sur cette page, je vais l'harmoniser avec le reste du site")
###
- La partie Vidéo : 
Affiche toutes les vidéos postées sur la page Facebook.

![FacebookVideos](/sources/images/doc/fbVideos.jpg "design a terminé")


#### Resizer {#resizer}

> Fonctionnalité en cours de développement.
Va chercher les photos (URL) dans la base de données, les importes et les redimmensionnes au format choisi en gardant le bon aspect hauteur/largeur.
Permet une uniformisation des tailles des photos sur le site.

#### La barre de recherche {#search}

Elle permet de trouver un coach et/ou un évènement.
Fonctionne avec une seule lettre la recherche se fera sur les noms des coachs et/ou le titre d'un évènement.

![Search](/sources/images/doc/search.jpg "exemple pour une recherche avec la lettre 'b', design a terminé")
