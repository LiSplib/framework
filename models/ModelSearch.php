<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;

class ModelSearch{

    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function countCoach(){
        $sql = "SELECT COUNT(*) FROM admin";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $nb = $query->fetch();
        return $nb;
    }

    public function coachSearch(){
        $searchName = $_GET['search_name'];
        $sql = "SELECT admin.id, lastname, firstname, email, image, role, coachingDo, adherent, categorie, coach_id FROM admin LEFT JOIN coaching ON admin.id = coach_id WHERE lastname LIKE LOWER(:name) AND role LIKE '%n' ";
        $query = $this->pdo->prepare($sql);
        $concat = $searchName.'%';
        $query->bindParam(':name', $concat);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }

    public function coachNext(){
        $perPage = 3;
        $cPage = 1;
        $nb = intval((new ModelSearch)->countCoach());
        $nbPage = ceil($nb/$perPage);
    }


    public function eventSearch(){
        
        switch ($_GET){
            case !empty($_GET['search_name']):
                $searchname = $_GET['search_name'];
            break;
            case !empty($_GET['filter']):
                $searchname = $_GET['filter'];
            break;
            case !empty($_GET['coachingCat']):
                $searchname = $_GET['coachingCat'];
            break;
        }
        $sql = 'SELECT * FROM events WHERE title LIKE LOWER(:name)';
        $query = $this->pdo->prepare($sql);
        $concat = $searchname.'%';
        $query->bindParam(':name', $concat);
        $query->execute();
        return $query->fetchAll();
    }

    public function userSearch(){
        if (isset($_POST)){
            $searchName = $_POST['search_name'];
        }else {
            $searchName = $_GET['search_name'];
        }
        $sql = "SELECT * FROM admin WHERE lastname OR firstname LIKE LOWER(:name) AND role = 'user'";
        $query = $this->pdo->prepare($sql);
        $concat = $searchName.'%';
        $query->bindParam(':name', $concat);
        $query->execute();
        return $query->fetchAll();
    }

    public function coachingSearch(){
        $coachingDo = $_GET['filter'];
        $sql = "SELECT * FROM coaching LEFT JOIN admin ON admin.id = coach_id WHERE coachingDo LIKE LOWER(:coachDo)";
        $query = $this->pdo->prepare($sql);
        $coachingDo = str_replace('+', ' ', $coachingDo);
        $query->bindParam(':coachDo', $coachingDo);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }

    public function catSearch(){
        $categorie = $_GET['coachingCat'];
        $sql = "SELECT * FROM admin LEFT JOIN coaching ON coach_id = admin.id WHERE categorie LIKE LOWER(:categorie)";
        $query = $this->pdo->prepare($sql);
        $categorie = str_replace('+', ' ', $categorie);
        $query->bindParam(':categorie', $categorie);
        $query->execute();
        return $query->fetchAll();
    }

}