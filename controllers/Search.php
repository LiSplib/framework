<?php

namespace App\Controller;

use App\Model\ModelSearch;
use App\Model\ModelMyEvents;

class Search{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }
    
    public function httpGetRequest(){
            if(empty($_GET['search_name']) && !isset($_GET['filter']) && !isset($_GET['coachingCat'])){
                $_SESSION['flash']['danger'] = 'Vous n\'avez rien saisie !';
                redirect_to_route('calendar');
            }else{     
            $result = new ModelSearch;
            $coachEvents = new ModelMyEvents;
            $events = $result->eventSearch();

            switch ($_GET){
                case !empty($_GET['filter']):
                    $coachs = $result->coachingSearch();
                break;
                case !empty($_GET['coachingCat']):
                    $coachs = $result->catSearch();
                break;
                case !empty($_GET['search_name']):
                    $coachs = $result->coachSearch();
                break;
            }
            return ['coachs' => $coachs,
            'events' => $events,
            'coachEvents' => $coachEvents
            ];
        }
    }

    public function httpPostRequest(){

    }

}