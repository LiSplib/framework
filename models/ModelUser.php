<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;


class ModelUser {

    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function getUsers(){
        $sql = 'SELECT * FROM users';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

    public function getUser($id){
        $sql = 'SELECT * FROM users WHERE id = :id';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':id', $id);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }
    
    public function getEmail($email){
        $sql = 'SELECT * FROM users WHERE email = ?';
        $query = $this->pdo->prepare($sql);
        $query->execute([$email]);
        var_dump($query);
        return $query->fetch();
    }

    public function editAdmin($lastname, $firstname, $email, $id){
        $sql = "UPDATE users SET lastname = :lastname, firstname = :firstname, email = :email WHERE id = :id";
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':lastname', $lastname);
        $query->bindParam(':firstname', $firstname);
        $query->bindParam(':email', $email);
        $query->bindParam(':id', $id);
        $query->execute();
        $_SESSION['lastname'] = $lastname;
        $_SESSION['firstname'] = $firstname;
        $_SESSION['email'] = $email;
    }

}