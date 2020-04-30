<?php

namespace App\Table;

use App\Model\ModelUser;
use App\Model\dataBase\PdoSql;
use PDO;

final class UserTable {

    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    protected $table = "user";
 
    protected $class = ModelUser::class;

    public function findByEmail($email){
        $query = $this->pdo->prepare('SELECT * FROM admin WHERE email = :email');
        $query->execute(['email' => $email]);
        $query->setFetchMode(PDO::FETCH_CLASS, $this->class);
        $result = $query->fetch();
        if($result === false){
            'Email non reconnu';
        }
        return $result;

    }

}