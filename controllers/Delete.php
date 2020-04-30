<?php

namespace App\Controller;

class Delete{

    private $events;
    

    public function __construct(){
        $this->events = new \App\Model\Date\Events();
    }

    public function httpGetRequest(){
        
        if(isset($_GET['delete'])){
            $getId = $_GET['delete'];
            $this->events->delete($getId);
            session_start();
            $_SESSION['flash']['danger'] = 'L\'événement a été supprimé';
            header('Location:' . route_to_url('calendar'));
            exit();
        }
    }

    public function httpPostRequest(){

    }
}