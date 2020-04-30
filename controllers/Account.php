<?php

namespace App\Controller;

use App\Model\ModelAdmin;
use App\Controller\Session;

class Account extends Session{
    
 
    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
        }else{
            $id = $_SESSION['auth']['id'];
        }
        $dataAdmin = new ModelAdmin();
        $admin = $dataAdmin->getAdmin($id);
        return ['admin' => $admin];    
    }

    public function httpPostRequest(){
        $id = (empty($_GET['id']) ? $_SESSION['auth']['id'] : $_GET['id']);
        $admins = new ModelAdmin;
        $admin = $admins->getAdmin($id);
        $lastname = $_POST['lastname'];
        $firstname = $_POST['firstname'];
        $email = $_POST['email'];
        $image = $_POST['image'];
        if ($_SESSION['auth']['role'] === 'superAdmin'){
            $role = $_POST['role'];
        }
        $role = $admin['role'];
        if ($role === 'admin'){
            $coach = 0;
        }
        $coach = $admin['coach'];
        $dataAdmin = new ModelAdmin;
        $dataAdmin->editAdmin($lastname, $firstname, $email, $image, $role, $id, $coach);
        $_SESSION['flash']['success'] = 'Membre modifié';
        redirect_to_route('account?id='.$id);
    }

}

