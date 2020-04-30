<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;

class ModelMyEvents {

    private $pdo;

    public function __construct() {

        $this->pdo = (new PdoSql)->getPdo();
        
    }

    public function myAllEvents($id){
        $sql = "SELECT * FROM register LEFT JOIN admin ON register.admin_id = admin.id LEFT JOIN events ON register.events_id = events.id WHERE admin.id = $id ORDER BY start";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }

    public function myCreatedEvents($id){
        $sql = "SELECT * FROM events WHERE id_admin = $id ORDER BY start";
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetchAll();
        return $result;
    }

}