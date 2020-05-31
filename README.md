# Framework Altair

> Calendrier de gestion d'évènements pour entreprise de formation.
>* En cours de développement

## Prérequis
>* Connexion internet
>* Connaissance Git
>* Wamp, Xamp ou Lamp
>* Un éditeur de code

## Langages utilisés 

>* **HTML5, CSS3**
>* **PHP, MySQL** (tables relationnelles)
>* **Javascript et jquery** pour la partie [Bootstrap](https://getbootstrap.com/)
>* [Material Design for Bootstrap](https://mdbootstrap.com/)
>* Architecture: **MVC**


## Démarrage

* **composer** - installer les dépendances. `composer install`
* créer la base de donnée **framework_altair** avec le fichier sql. (avec phpMyAdmin)
* mettre à jour le chemin vers le dossier racine du fichier **config.php** pour un déploiement (local ou hébergement web).
* mettre à jour **PdoSql.php** (dbname, host, user, password).
* dans **php.ini** activer la ligne user_agent (pour les requete HTTP a openstreetmap pour la localisation).

### !! Infos importantes !!

A la première utilisation la personne qui va s'enregistrer en premier sera  **superAdmin** ( *c'est lui qui aura accès à toute les fonctionnalités : ajout d'admin, modification des utilisateurs et des évènements, validation d'évènement, gestion des tokens pour les réseaux sociaux etc...*).
Tous les futurs enregistrements seront considérés comme utilisateurs (avec la possibilité de demander à être "admin / coach").

#### La base de donnée comprend :
> A la date du 28/05/2020

* La table **admin** = les utilisateurs (infos basique: nom, prénom, email, image, mot de passe, role, token, demande admin).
* La table **admininfo** = les infos communes aux users et aux admins (adresse, socièté, diplomes, site web, réseaux sociaux).
* La table **adminpro** = les coachs (infos sur leurs parcours, spécialités etc...).
* La table **coaching** = elle va fusionner avec la table adminpro.
* La table **custom_site** va enregistrer des paramatres de design globales pour le site (couleur du header, du footer, des titres, type de police, couleur des textes etc...).
* La table **events** = les évènements (titre, contenu, date, theme, image, est validé, adresse).
* La table **history** enregistre les connexions des utilisateurs.
* La table **interested** fait la jonction entre l'évènement et l'utilisateur si ce dernier est interréssé.
* La table **register** fait la jonction entre l'évènement est l'utilisateur qui s'est inscrit à cet évènement.
* La table **social_media** stockes les infos sensibles pour les réseaux sociaux et leur utilisation via l'API (token, clé secrète etc...).
* La table **vote** *permettra* d'enregistrer une note donnée à un coach par un utilisateur (*pas encore développé*).

![Modele SQL](/sources/images/sql.jpg)


## Utilisation des routes

> Dans le fichier **.htaccess**
>
> Cette modification est appelée réécriture d'URL. C'est un moyen de mettre en œuvre le mappage ou le routage d'URL dans une application Web.
<code>\<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-l
    RewriteRule ^(.+) index.php?r=$1 [QSA,L]
\</IfModule></code>

> Dans le fichier **road.php**
>* On commence par le nom de la route `'route' => [`
>* Ensuite on ouvre un tableau avec le controller `'controller' => 'NomDuController',`
>* On le lie à la vue `'view' => 'nom_de_la_vue.phtml']`
>* Ca donne :
><pre><code>'route' => [
>            'controller' => 'MonController',
>           'view' => 'mavue.phtml'
>            ]
></code></pre>

>
## Utilisation du calendrier

>* Inspiré du calendrier de [Grafikart](https://www.grafikart.fr/tutoriels/calendrier-php-partie1-995 "tuto Calendrier PHP")

#### Les évènements sont gérés par le Model Events :
* Créer, Afficher, Mettre à jour, Effacer.
* S'inscrire ou s'interésser à un évènement.
* Retourne les évènements en cours de validation, le nombre d'inscrit(s) ou d'interéssé(s).
> Utilisé dans les controller :
>* AddEvent `App\Controller\AddEvent.php`
>* AwaitEvents `App\Controller\AwaitEvents.php`
>* MyEvents `App\Controller\MyEvents.php`
>* EditEvent `App\Controller\EditEvent.php`
>* Delete `App\Controller\Delete.php`
>* CurrentEvent `App\Controller\CurrentEvent.php`
>* Calendar `App\Controller\Calendar.php`

#### Le Model Event :
* Appelé par la fonction <code>find($id)</code> de la classe **Events**. `App\Model\Date\Events.php`
* getter et setter pour les élements de le table events.
> Utilisé dans les controller : 
>* AddEvent `App\Controller\AddEvent.php`
>* EditEvent `App\Controller\EditEvent.php`


#### Le Model Month : 
* Gére les dates en général (jour, mois, année) version fr.
* Permet de naviguer de mois en mois sur le calendrier.
> Utilisé dans le controller : 
>* Calendar `App\Controller\Calendar.php`


#### Le Model EventValidator : 
* Utilise le Model **Validator** `App\Model\App\Validator.php`
* Valide les données des évènements (titre, format de la date et vérifie si la date de fin n'est pas avant la date de début).
> Utilisé dans les controller : 
>* AddEvent `App\Controller\AddEvent.php`
>* EditEvent `App\Controller\EditEvent.php`

#### Le ModelMyEvents :
* Liste les évènements crées par l'admin ou les évènements ou l'utilisateur s'est inscrit.
> Utilisé dans les controller : 
>* FullAccount `App\Controller\FullAccount.php`
>* MyEvents `App\Controller\MyEvents.php`
>* Search `App\Controller\Search.php`

#### Le ModelSearch :
* Outil de recherche de coach et d'évènement.
* Permet de filtrer les coachs en fonction de leur type de coaching ou de leur catégorie.
> Utilisé dans les controller : 
>* Members `App\Controller\Members.php`
>* Search `App\Controller\Search.php`

## La gestion des utilisateurs

#### Le ModelAdmin : 
* Créer, Afficher, Mettre à jour, Effacer.
* Gestion des infos Utilisateur, Coach.
* Liste les coachs en attentent de validation.
* Nombres de coach en attentent de validation. `config.php`
`$GLOBALS['new'] = $admin->countRequestAdmin()` 
* Récupère le mail pour la connexion.
> Utilisé dans les controller : 
>* Account `App\Controller\Account.php`
>* AdminEdit `App\Controller\AdminEdit.php`
>* AdminPro `App\Controller\AdminPro.php`
>* Coaching `App\Controller\Coaching.php`
>* Connect `App\Controller\Connect.php`
>* FullAccount `App\Controller\FullAccount.php`
>* Members `App\Controller\Members.php`
>* Register `App\Controller\Register.php`
>* Search `App\Controller\Search.php`


## Note:
> A savoir:
>* Pour le partage d'évènement il faut que le site soit hébergé afin de générer une vrai URL pour le partage (astuce on peut ouvrir le port 443 en local).
>----
>* Projet en cours de développement.
>----
>* Réalisé par [Jean-christophe BARRET](https://www.linkedin.com/in/jcbarret83160/) pendant mon stage chez [Altaïr Communication](http://altair-communication.fr/) avec l'aide de mes tuteurs de stage [Benjamin Roumagne](https://www.linkedin.com/in/ben-roumagne-6738b5159/) et [Yoann Martinez](https://www.linkedin.com/in/yoann-martinez83/).
>----