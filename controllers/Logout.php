<?php 

namespace App\Controller;


class Logout extends Session{


    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
        unset($_SESSION['auth'], $_SESSION['username']);
        $_SESSION['flash']['danger'] = 'Vous êtes bien déconnecté';
        header('Location:' . route_to_url('home'));
        exit();
    }

    public function httpGetRequest(){
       
    }

    public function httpPostRequest(){

    }
}