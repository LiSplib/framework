<?php

namespace App\Controller;

use App\Model\ModelSearch;
use App\Model\ModelMyEvents;
use App\Model\ModelAdmin;

class Search{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }
    
    public function httpGetRequest(){
        $users = new ModelSearch;
        $nbUsers = $users->countCoach(); // servira pour la pagination 
              
        if (isset($_GET['filter']) && $_GET['filter'] === 'coaching'){
                $result = new ModelSearch;
                $coachs = $result->coachingSearch();
                $events = $result->eventSearch();
                $coachEvents = new ModelMyEvents;
                $coachInfo = new ModelAdmin;
                return ['coachs' => $coachs,
                'events' => $events,
                'coachEvents' => $coachEvents,
                'coachInfo' => $coachInfo
            ];
        }
        
        if (isset($_GET['filter']) && $_GET['filter'] === 'categorie'){
            $result = new ModelSearch;
            $coachs = $result->catSearch();
            $events = $result->eventSearch();
            $coachEvents = new ModelMyEvents;
            $coachInfo = new ModelAdmin;
            return ['coachs' => $coachs,
            'events' => $events,
            'coachEvents' => $coachEvents,
            'coachInfo' => $coachInfo
            ];
        }
        if(isset($_GET['search_name'])){
            $result = new ModelSearch;
            $coachs = $result->coachSearch();
            $events = $result->eventSearch();
            $coachEvents = new ModelMyEvents;
            $coachInfo = new ModelAdmin;
            return ['coachs' => $coachs,
                    'events' => $events,
                    'coachEvents' => $coachEvents,
                    'coachInfo' => $coachInfo
            ];
        }
    }

    public function httpPostRequest(){

    }

}