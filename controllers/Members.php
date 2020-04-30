<?php

namespace App\Controller;

use App\Model\ModelAdmin;
use App\Controller\Session;
use App\Model\ModelSearch;


class Members{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest(){
        if($_SESSION['auth']['role'] === 'admin' || $_SESSION['auth']['role'] === 'superAdmin'){
            if(isset($_GET['delete'])){
                $id = $_GET['delete'];
                $dataAdmin = new ModelAdmin;
                $dataAdmin->deleteAdmin($id);
            }
            $dataMembers = new ModelAdmin();
            $members = $dataMembers->getAdmins();
            $membersAwait = $dataMembers->adminToValidate();
            if(isset($_GET['coachAwait'])){
                return ['members' => $membersAwait];
            }else{
            return ['members' => $members];
            }
        }else {
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }
    }

    public function httpPostRequest(){
        $search = new ModelSearch;
        $members =$search->userSearch();
        return ['members' => $members];
    }

}