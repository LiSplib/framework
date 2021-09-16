<?php

namespace App\Controller;

class Delete{

    private $events;

    public function __construct(){
        $session = new Session;
        $session->sessionStart();
        $this->events = new \App\Model\Date\Events();
    }

    public function httpGetRequest(){
        if(isset($_SESSION['token']) && isset($_GET['token'])){
            if($_SESSION['token'] == $_GET['token']){    
                if(isset($_GET['delete'])){
                    $getId = $_GET['delete'];
                    $this->events->delete($getId);
                    $_SESSION['flash']['danger'] = 'L\'événement a été supprimé';
                    header('Location:' . route_to_url('calendar'));
                    exit();
                }
            }
        }
        else{
            $_SESSION['flash']['danger'] = 'Erreur de vérification';
            redirect_to_route('home');
        }
    }

    public function httpPostRequest(){

    }
}