<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;

/**
 * Class ModelAdmin
 * Sert a la gestion des données relative aux admins - users
 * @package App\Model
 */
class ModelAdmin
{

    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    /**
     * utilitaire des gestion et de protection des données à traiter
     * @param string $donnees
     * @return string
     */
    public function valid_donnees ($donnees){
        $donnees = trim($donnees);
        $donnees = stripslashes($donnees);
        $donnees = htmlspecialchars($donnees);
        return $donnees;
    }

    
    /**
     * Récupère la liste de tous les utilisateurs
     * 
     * @return array
     */
    public function getAdmins(): array
    {
        $sql = 'SELECT * FROM admin';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

        
    /**
     * Renvoi les infos de type coaching d'un admin(coaching pratiqué, adhérant etc...)
     *
     * @param  mixed $id
     * @return array
     */
    public function getAllInfo($id) :array
    {
        $sql = "SELECT * FROM admin LEFT JOIN admininfo ON id_admin = admin.id LEFT JOIN coaching ON coach_id = admin.id LEFT JOIN adminpro ON admin_id = admin.id WHERE admin.id = :id";
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    /**
     * Liste les users en attente de validation admin
     *
     * @return array
     */
    public function adminToValidate() :array
    {
        $sql = 'SELECT * FROM admin ORDER BY coach DESC';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }
    
    /**
     * Retourne les infos d'un utilisateur en fonction de son id dans la table admin(nom, prenom, email, image de profil, role, status)
     *
     * @param  mixed $id
     * @return array
     */
    public function getAdmin($id) :array
    {
        $sql = 'SELECT * FROM admin WHERE id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    /**
     * retourne les infos d'un utilisateur de la table admininfo(region, departement, adresse, societe, réseaux sociaux, tel, ville etc...)
     *
     * @param  mixed $id
     * 
     */
    public function getAdminInfo($id) 
    {
        $sql = 'SELECT * FROM admininfo WHERE id_admin = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    /**
     * retourne les infos d'un utilisateur de la table coaching( type de coaching pratiqué, adhérant à, catégorie)
     *
     * @param  mixed $id
     * 
     */
    public function getAdminCoaching($id)
    {
        $sql = 'SELECT * FROM coaching WHERE coach_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    /**
     * cherche un utilisateur inscrit avec son email
     *
     * @param  mixed $email
     * @return array
     */
    public function getEmail($email): array
    {
        $sql = 'SELECT * FROM admin WHERE email = ?';
        $query = $this->pdo->prepare($sql);
        $query->execute([$email]);
        return $query->fetch();
    }
    
    /**
     * Enregistre la connexion d'un utilisateur dans la table history
     *
     * @param  mixed $email
     * @param  mixed $password
     * @param  mixed $token
     * @return void
     */
    public function addConnect($email, $password, $token)
    {
        $sql = 'INSERT INTO history (email, password, token) VALUES (:email, :password , :token)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':email', $email);
        $query->bindParam(':password', $password);
        $query->bindParam(':token', $token);
        $query->execute();
        return $query;
    }
    
    /**
     * Modification de la fiche utilisateur basique
     *
     * @param  mixed $lastname
     * @param  mixed $firstname
     * @param  mixed $email
     * @param  mixed $image
     * @param  mixed $role
     * @param  mixed $id
     * @param  mixed $coach
     * @return void
     */
    public function editAdmin($lastname, $firstname, $email, $image, $role, $id, $coach)
    {
        $sql = "UPDATE admin SET lastname = :lastname, firstname = :firstname, email = :email, image = :image, role = :role, coach = :coach WHERE id = :id";
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':lastname', $lastname);
        $query->bindParam(':firstname', $firstname);
        $query->bindParam(':email', $email);
        $query->bindParam(':image', $image);
        $query->bindParam(':role', $role);
        $query->bindParam(':id', $id);
        $query->bindParam(':coach', $coach, \PDO::PARAM_INT);
        $query->execute();
        return $query;
    }
    
    /**
     * Modification de la fiche utilisateur détaillée
     *
     * @param  mixed $region
     * @param  mixed $departement
     * @param  mixed $ville
     * @param  mixed $telephone
     * @param  mixed $adresse
     * @param  mixed $job
     * @param  mixed $societe
     * @param  mixed $website
     * @param  mixed $facebook
     * @param  mixed $linkedin
     * @param  mixed $vimeo
     * @param  mixed $skype
     * @param  mixed $google
     * @param  mixed $youtube
     * @param  mixed $instagram
     * @param  mixed $pinterest
     * @param  mixed $snapchat
     * @param  mixed $twitter
     * @param  mixed $soundcloud
     * @param  mixed $spotify
     * @param  mixed $id
     * @return void
     */
    public function editAccount($region, $departement, $ville, $telephone, $adresse, $job, $societe, $website, $facebook, $linkedin, $vimeo, $skype, $google, $youtube, $instagram, $pinterest, $snapchat, $twitter, $soundclound, $spotify, $id)
    {
        $sql = 'UPDATE admininfo 
        SET region = :region, departement = :departement, ville = :ville, telephone = :telephone, adresse = :adresse, job = :job, societe = :societe, website = :website, facebook = :facebook, linkedin = :linkedin, vimeo = :vimeo, skype = :skype, google = :google, youtube = :youtube, instagram = :instagram, pinterest = :pinterest, snapchat = :snapchat, twitter = :twitter, soundcloud = :soundcloud, spotify = :spotify WHERE id_admin = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':region', $region);
        $query->bindParam(':departement', $departement);
        $query->bindParam(':ville', $ville);
        $query->bindParam(':telephone', $telephone);
        $query->bindParam(':adresse', $adresse);
        $query->bindParam(':job', $job);
        $query->bindParam(':societe', $societe);
        $query->bindParam(':website', $website);
        $query->bindParam(':facebook', $facebook);
        $query->bindParam(':linkedin', $linkedin);
        $query->bindParam(':vimeo', $vimeo);
        $query->bindParam(':skype', $skype);
        $query->bindParam(':google', $google);
        $query->bindParam(':youtube', $youtube);
        $query->bindParam(':instagram', $instagram);
        $query->bindParam(':pinterest', $pinterest);
        $query->bindParam(':snapchat', $snapchat);
        $query->bindParam(':twitter', $twitter);
        $query->bindParam(':soundcloud', $soundclound);
        $query->bindParam(':spotify', $spotify);
        $query->bindParam(':id', $id);
        $query->execute();
        return $query;
    }
    
    /**
     * Modification de la fiche admin coaching
     *
     * @param  mixed $coachingDo
     * @param  mixed $adherent
     * @param  mixed $categorie
     * @param  mixed $id
     * @return void
     */
    public function editCoaching($coachingDo, $adherent, $categorie, $id)
    {
        $sql = 'UPDATE coaching 
        SET coachingDo = :coachingDo, adherent = :adherent, categorie = :categorie WHERE coach_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':coachingDo', $coachingDo);
        $query->bindParam(':adherent', $adherent);
        $query->bindParam(':categorie', $categorie);
        $query->bindParam(':id', $id);
        $query->execute();
        return $query;
    }
    
    /**
     * création d'utilisateur
     *
     * @param  mixed $lastname
     * @param  mixed $firstname
     * @param  mixed $email
     * @param  mixed $image
     * @param  mixed $password
     * @param  mixed $role
     * @param  mixed $token
     * @param  mixed $coach
     * @return void
     */
    public function addAdmin($lastname, $firstname, $email, $image, $password, $role, $token, $coach)
    {
        $sql = 'INSERT INTO admin (lastname, firstname, email, image, password, role, token, coach) VALUES (:lastname, :firstname, :email, :image, :password, :role, :token, :coach)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':lastname', $lastname);
        $query->bindParam(':firstname', $firstname);
        $query->bindParam(':email', $email);
        $query->bindParam(':image', $image);
        $query->bindParam(':password', $password);
        $query->bindParam(':role', $role);
        $query->bindParam(':token', $token);
        $query->bindParam(':coach', $coach, \PDO::PARAM_INT);
        $query->execute();
        return $query;
    }
    
    /**
     * Ajoute les infos supplèmentaire de l'utilisateur
     *
     * @param  mixed $region
     * @param  mixed $departement
     * @param  mixed $ville
     * @param  mixed $telephone
     * @param  mixed $adresse
     * @param  mixed $job
     * @param  mixed $societe
     * @param  mixed $website
     * @param  mixed $facebook
     * @param  mixed $linkedin
     * @param  mixed $vimeo
     * @param  mixed $skype
     * @param  mixed $google
     * @param  mixed $youtube
     * @param  mixed $instagram
     * @param  mixed $pinterest
     * @param  mixed $snapchat
     * @param  mixed $twitter
     * @param  mixed $soundcloud
     * @param  mixed $spotify
     * @param  mixed $id
     * @return void
     */
    public function addInfo($region, $departement, $ville, $telephone, $adresse, $job, $societe, $website, $facebook, $linkedin, $vimeo, $skype, $google, $youtube, $instagram, $pinterest, $snapchat, $twitter, $soundclound, $spotify, $id)
    {
        $sql = 'INSERT INTO admininfo (region, departement, ville, telephone, adresse, job, societe, website, facebook, linkedin, vimeo, skype, google, youtube, instagram, pinterest, snapchat, twitter, soundcloud, spotify, id_admin) VALUES (:region, :departement, :ville, :telephone, :adresse, :job, :societe, :website, :facebook, :linkedin, :vimeo, :skype, :google, :youtube, :instagram, :pinterest, :snapchat, :twitter, :soundcloud, :spotify, :id_admin)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':region', $region);
        $query->bindParam(':departement', $departement);
        $query->bindParam(':ville', $ville);
        $query->bindParam(':telephone', $telephone);
        $query->bindParam(':adresse', $adresse);
        $query->bindParam(':job', $job);
        $query->bindParam(':societe', $societe);
        $query->bindParam(':website', $website);
        $query->bindParam(':facebook', $facebook);
        $query->bindParam(':linkedin', $linkedin);
        $query->bindParam(':vimeo', $vimeo);
        $query->bindParam(':skype', $skype);
        $query->bindParam(':google', $google);
        $query->bindParam(':youtube', $youtube);
        $query->bindParam(':instagram', $instagram);
        $query->bindParam(':pinterest', $pinterest);
        $query->bindParam(':snapchat', $snapchat);
        $query->bindParam(':twitter', $twitter);
        $query->bindParam(':soundcloud', $soundclound);
        $query->bindParam(':spotify', $spotify);
        $query->bindParam(':id_admin', $id);
        $query->execute();
        return $query;
    }
    
    /**
     * Ajoute les info de coaching de l'admin
     *
     * @param  mixed $coachingDo
     * @param  mixed $adherent
     * @param  mixed $categorie
     * @param  mixed $id
     * @return void
     */
    public function addCoaching($coachingDo, $adherent, $categorie, $id)
    {
        $sql = 'INSERT INTO coaching (coachingDo, adherent, categorie, coach_id) VALUES (:coachingDo, :adherent, :categorie, :coach_id)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':coachingDo', $coachingDo);
        $query->bindParam(':adherent', $adherent);
        $query->bindParam(':categorie', $categorie);
        $query->bindParam(':coach_id', $id);
        $query->execute();
        return $query;
    }
    
    /**
     * Suppression de l'utilisateur par son id
     *
     * @param  mixed $id
     * @return void
     */
    public function deleteAdmin($id)
    {
        $sql = ("DELETE FROM admin WHERE id = :id");
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        return $query->execute();
    }
    
    /**
     * Retourne le nombre d'utilisateur(s) qui attende(nt) la validation du status de coach
     *
     * @return array
     */
    public function countRequestAdmin(): array
    {
        $sql = 'SELECT COUNT(*) FROM admin WHERE coach = 1';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    /**
     * Retourne la liste des régions de la table admininfo pour l'afficher dans un select de la fiche d'information de l'utilisateur
     *
     * @return array
     */
    public function getRegion(): array
    {
        $sql = "SHOW COLUMNS FROM admininfo LIKE 'region'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $regions = substr($results, 5, -1);
        $regions = explode(",", $regions);
        $regions = str_replace("'", "", $regions);
        $regions[12] = "Provence-Alpes-Côte d'Azur";
        return $regions;
    }
    
    /**
     * Retourne la liste des type de coaching pratiqué de la table coaching pour l'afficher dans un select de la fiche d'information coaching de l'admin
     *
     * @return array
     */
    public function getCoachingDo(): array
    {
        $sql = "SHOW COLUMNS FROM coaching LIKE 'coachingDo'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $coachingDo = substr($results, 5, -1);
        $coachingDo = explode(",", $coachingDo);
        return $coachingDo;
    }
    
    /**
     * Retourne la liste des organismes dont l'admin peut adhérer de la table coaching pour l'afficher dans un select de la fiche d'information coaching de l'admin
     *
     * @return array
     */
    public function getAdherent(): array
    {
        $sql = "SHOW COLUMNS FROM coaching LIKE 'adherent'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $adherent = substr($results, 5, -1);
        $adherent = explode(",", $adherent);
        return $adherent;
    }
    
    /**
     * Retourne la liste des catégories de coaching pratiqué de la table coaching pour l'afficher dans un select de la fiche d'information coaching de l'admin
     *
     * @return array
     */
    public function getCategorie(): array
    {
        $sql = "SHOW COLUMNS FROM coaching LIKE 'categorie'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $categorie = substr($results, 5, -1);
        $categorie = explode(",", $categorie);
        return $categorie;
    }
    
    /**
     * addAdminPro
     *
     * @param  mixed $intervention
     * @param  mixed $training
     * @param  mixed $course
     * @param  mixed $publication
     * @param  mixed $interest
     * @param  mixed $quote
     * @param  mixed $admin_id
     * @return void
     */
    public function addAdminPro($intervention, $training, $course, $publication, $interest, $quote, $admin_id)
    {
        $sql = 'INSERT INTO adminpro (intervention, training, course, publication, interest, quote, admin_id) VALUES (:intervention, :training, :course, :publication, :interest, :quote, :admin_id)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':intervention', $intervention);
        $query->bindParam(':training', $training);
        $query->bindParam('course', $course);
        $query->bindParam(':publication', $publication);
        $query->bindParam(':interest', $interest);
        $query->bindParam(':quote', $quote);
        $query->bindParam('admin_id', $admin_id);
        $result = $query->execute();
        return $result;
    }

    public function updateAdminPro($intervention, $training, $course, $publication, $interest, $quote, $id)
    {
        $sql = 'UPDATE adminpro admin_id SET intervention = :intervention, training = :training, course = :course, publication = :publication, interest = :interest, quote = :quote WHERE admin_id = :admin_id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':intervention', $intervention);
        $query->bindParam(':training', $training);
        $query->bindParam(':course', $course);
        $query->bindParam(':publication', $publication);
        $query->bindParam(':interest', $interest);
        $query->bindParam(':quote', $quote);
        $query->bindParam(':admin_id', $id);
        $result = $query->execute();
        return $result;
    }

    public function getAdminPro($id)
    {
        $sql = 'SELECT * FROM adminpro WHERE admin_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
}
