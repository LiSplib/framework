<?php

namespace App\Controller;

use App\Model\ModelMyEvents;
use App\Model\ModelAdmin;
use DateTime;

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
            $myEvents = new ModelMyEvents;
            $today = new DateTime();
            $today = $today->format('Y-m-d');
            if ($_SESSION['auth']['role'] === 'admin' || $_SESSION['auth']['role'] === 'superAdmin'){
                $events = $myEvents->myCreatedEvents($id);
            }else{
                $events = $myEvents->myAllEvents($id);
            };
            $admin = $dataAdmin->getAllInfo($id);
            return ['admin' => $admin,
                    'id' => $id,
                    'events' => $events,
                    'today' => $today
                    ];
        }else{
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }

    }

    public function httpPostRequest(){}

}