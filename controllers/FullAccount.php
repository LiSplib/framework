<?php

namespace App\Controller;

use App\Model\ModelAdmin;

class FullAccount{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){
        if($_SESSION['auth']){
            if(isset($_GET['id'])){
                $id = $_GET['id'];
            }else{
                $id = $_SESSION['auth']['id'];
            }
            $dataAdmin = new ModelAdmin();
            $admin = $dataAdmin->getAllInfo($id);
            return ['admin' => $admin];
        }else{
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }

    }

    public function httpPostRequest(){}

}