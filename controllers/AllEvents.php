<?php

namespace App\Controller;

use DateTime;

class AllEvents{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){

        if($_SESSION['auth']['role'] === 'admin' || $_SESSION['auth']['role'] === 'superAdmin'){
            $events = new \App\Model\Date\Events;
            $allEvents = $events->eventsToValidate();
            if(empty($allEvents)){
                $_SESSION['flash']['success'] = 'Aucun évènement en cours de validation';
                redirect_to_route('calendar');
            }else{
               
                return ['allEvents' => $allEvents];
            }
        }else {
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }

    }

    public function httpPostRequest(){
            $id = $_POST['id'];
            $isValide = $_POST['isValide'];
            $events = new \App\Model\Date\Events;
            $events->validateEvent($isValide, $id);
            $_SESSION['flash']['success'] = 'Évènement validé';
            redirect_to_route('evenements');
    }
}