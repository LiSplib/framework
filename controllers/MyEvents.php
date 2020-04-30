<?php

namespace App\Controller;

use App\Model\ModelMyEvents;
use App\Controller\Session;
use App\Model\Date\Events;

class MyEvents{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){
        $events = new ModelMyEvents;
        $currentEvent = new Events;
        $id = $_SESSION['auth']['id'];
        if ($_SESSION['auth']['role'] === 'superAdmin' || $_SESSION['auth']['role'] === 'admin'){
            $result = $events->myCreatedEvents($id);
        }else{
            $result = $events->myAllEvents($id);
        }
        return ['result' => $result,
                'currentEvent' => $currentEvent
                ];
    }

    public function httpPostRequest(){

    }

}