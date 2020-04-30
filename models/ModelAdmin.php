<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;

class ModelAdmin{

    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function getAdmins(){
        $sql = 'SELECT * FROM admin';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

    public function getAllInfo($id){
        $sql = "SELECT * FROM admin LEFT JOIN admininfo ON id_admin = admin.id LEFT JOIN coaching ON coach_id = admin.id WHERE admin.id = :id";
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        return $query->fetch();
    }

    public function adminToValidate(){
        $sql = 'SELECT * FROM admin ORDER BY coach DESC';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

    public function getAdmin($id){
        $sql = 'SELECT * FROM admin WHERE id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }

    public function getAdminInfo($id){
        $sql = 'SELECT * FROM admininfo WHERE id_admin = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    } 

    public function getAdminCoaching($id){
        $sql = 'SELECT * FROM coaching WHERE coach_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    public function getEmail($email){
        $sql = 'SELECT * FROM admin WHERE email = ?';
        $query = $this->pdo->prepare($sql);
        $query->execute([$email]);
        return $query->fetch();
    }

    public function addConnect($email, $password, $token){
        $sql = 'INSERT INTO history (email, password, token) VALUES (:email, :password , :token)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':email', $email);
        $query->bindParam(':password', $password);
        $query->bindParam(':token', $token);
        $query->execute();
        return $query;
    }

    public function editAdmin($lastname, $firstname, $email, $image, $role, $id, $coach){
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

    public function editAccount($region, $departement, $ville, $telephone, $adresse, $societe, $website, $facebook, $linkedin, $viadeo, $skype, $id){
        $sql = 'UPDATE admininfo 
        SET region = :region, departement = :departement, ville = :ville, telephone = :telephone, adresse = :adresse, societe = :societe, website = :website, facebook = :facebook, linkedin = :linkedin, viadeo = :viadeo, skype = :skype WHERE id_admin = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':region', $region);
        $query->bindParam(':departement', $departement);
        $query->bindParam(':ville', $ville);
        $query->bindParam(':telephone', $telephone);
        $query->bindParam(':adresse', $adresse);
        $query->bindParam(':societe', $societe);
        $query->bindParam(':website', $website);
        $query->bindParam(':facebook', $facebook);
        $query->bindParam(':linkedin', $linkedin);
        $query->bindParam(':viadeo', $viadeo);
        $query->bindParam(':skype', $skype);
        $query->bindParam(':id', $id);
        $query->execute();
        return $query;
    }

    public function editCoaching($coachingDo, $adherent, $coachingType, $categorie, $id){
        $sql = 'UPDATE coaching 
        SET coachingDo = :coachingDo, adherent = :adherent, coachingType = :coachingType, categorie = :categorie WHERE coach_id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':coachingDo', $coachingDo);
        $query->bindParam(':adherent', $adherent);
        $query->bindParam(':coachingType', $coachingType);
        $query->bindParam(':categorie', $categorie);
        $query->bindParam(':id', $id);
        $query->execute();
        return $query;
    }

    public function addAdmin($lastname, $firstname, $email, $image, $password, $role, $token, $coach){
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

    public function addInfo($region, $departement, $ville, $telephone, $adresse, $societe, $website, $facebook, $linkedin, $viadeo, $skype, $id){
        $sql = 'INSERT INTO admininfo (region, departement, ville, telephone, adresse, societe, website, facebook, linkedin, viadeo, skype, id_admin) VALUES (:region, :departement, :ville, :telephone, :adresse, :societe, :website, :facebook, :linkedin, :viadeo, :skype, :id_admin)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':region', $region);
        $query->bindParam(':departement', $departement);
        $query->bindParam(':ville', $ville);
        $query->bindParam(':telephone', $telephone);
        $query->bindParam(':adresse', $adresse);
        $query->bindParam(':societe', $societe);
        $query->bindParam(':website', $website);
        $query->bindParam(':facebook', $facebook);
        $query->bindParam(':linkedin', $linkedin);
        $query->bindParam(':viadeo', $viadeo);
        $query->bindParam(':skype', $skype);
        $query->bindParam(':id_admin', $id);
        $query->execute();
        return $query;
    }

    public function addCoaching($coachingDo, $adherent, $coachingType, $categorie, $id){
        $sql = 'INSERT INTO coaching (coachingDo, adherent, coachingType, categorie, coach_id) VALUES (:coachingDo, :adherent, :coachingType, :categorie, :coach_id)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':coachingDo', $coachingDo);
        $query->bindParam(':adherent', $adherent);
        $query->bindParam(':coachingType', $coachingType);
        $query->bindParam(':categorie', $categorie);
        $query->bindParam(':coach_id', $id);
        $query->execute();
        return $query;
    }

    public function deleteAdmin($id){
        $sql = ("DELETE FROM admin WHERE id = :id");
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id );
        return $query->execute();
    }

    public function countRequestAdmin(){
        $sql = 'SELECT COUNT(*) FROM admin WHERE coach = 1';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }

    public function getRegion(){
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

    public function getCoachingDo(){
        $sql = "SHOW COLUMNS FROM coaching LIKE 'coachingDo'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $coachingDo = substr($results, 5, -1);
        $coachingDo = explode(",", $coachingDo);
        return $coachingDo;
    }

    public function getAdherent(){
        $sql = "SHOW COLUMNS FROM coaching LIKE 'adherent'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $adherent = substr($results, 5, -1);
        $adherent = explode(",", $adherent);
        return $adherent;
    }

    public function getType(){
        $sql = "SHOW COLUMNS FROM coaching LIKE 'coachingType'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $coachingType = substr($results, 5, -1);
        $coachingType = explode(",", $coachingType);
        return $coachingType;
    }

    public function getCategorie(){
        $sql = "SHOW COLUMNS FROM coaching LIKE 'categorie'";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        $results = $result['Type'];
        $categorie = substr($results, 5, -1);
        $categorie = explode(",", $categorie);
        return $categorie;
    }

}