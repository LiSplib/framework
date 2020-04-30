<?php

namespace App\Controller;

use App\Model\ModelAdmin;

class Connect{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){

        $dataAdmin = new ModelAdmin();
        $admins = $dataAdmin->getAdmins();
        return ['admins' => $admins];
    }

    public function httpPostRequest(){
        $admin = new ModelAdmin();

        if(!empty($_POST)){
            $adminEmail = $admin->getEmail($_POST['email']);
            if(password_verify($_POST['password'], $adminEmail['password']) && ($adminEmail['token'] === $GLOBALS['TOKEN_ID_FRAMEWORK_ALTAIR'])){
                $admin->addConnect($_POST['email'], password_hash($_POST['password'], PASSWORD_DEFAULT), $adminEmail['token']);
                $_SESSION['auth'] = $adminEmail;
                $_SESSION['username'] = $adminEmail['lastname'];
                $_SESSION['flash']['success'] = "Vous êtes maintenant connecté";
                header('Location:' . route_to_url('home'));
                exit();
            }else{
                $_SESSION['flash']['danger'] = 'Identifiant ou mot de passe incorrecte';
                header('Location:' .route_to_url('connect'));
                exit();
            }
        }
    }
}