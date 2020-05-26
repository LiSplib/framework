<?php

namespace App\Controller;

use App\Model\dataBase\PdoSql;
use App\Model\Date\{
    Events,
    Month
};

class Calendar {

    private $pdo;

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function httpGetRequest(){
        
        $classEvents = new \App\Model\Date\Events;
        $events = new Events($this->pdo);
        $month = new Month($_GET['month'] ?? null, $_GET['year'] ?? null); 
        $start = $month->getStartingDay();
        $start = $start->format('N') === '1' ? $start : $month->getStartingDay()->modify('last monday');
        $weeks = $month->getWeeks();
        $end = (clone $start)->modify('+' . (6 + 7 * ($weeks -1)) . 'days');
        $events = $events->getEventsBetweenByDay($start, $end);
        if(!empty($_GET['eventId'])){
            $id = $_GET['eventId'];
            $current = $classEvents->find($id);
            $adresse = $current->getAdress();
            $adresse = str_replace(' ', '+', $adresse);
            $zip = $current->getZipcode();
            if($zip === '0'){
                $zip = '83000';
            }
            $city = $current->getCity();
            $city = str_replace(' ', '+', $city);
            $url = "https://nominatim.openstreetmap.org/search?countrycode=fr&q=$adresse,$zip,$city&format=json&limit=1";
            //need user_agent set in php.ini
            $json = file_get_contents($url);
            $obj = json_decode($json, true);
            $lat = $obj[0]['lat'];
            $lon = $obj[0]['lon'];
            $maps = "https://embed.waze.com/fr/iframe?zoom=15&lat=$lat&lon=$lon&pin=1";
            $color = $current->getThemeColor();
                switch ($color){
                    case 'danger';
                    $themeRgb = "#ff3547";
                break;
                    case 'success';
                    $themeRgb = "#00c851";
                break;
                    case 'primary';
                    $themeRgb = "#4285f4";
                break;
                    case 'warning';
                    $themeRgb = "#fb3";
                break;
                }
        }
        return ['events' => $events,
                'month' => $month,
                'weeks' => $weeks,
                'start' => $start,
                'end' => $end,
                'classEvents' => $classEvents,
                'current' => (empty($current)) ? '' : $current,
                'maps' => (empty($maps)) ? '' : $maps,
                'themeRgb' => (empty($themeRgb)) ? '' : $themeRgb
                ];
    }

    public function httpPostRequest(){
        $events = new \App\Model\Date\Events();
        if(!empty($_POST)){
            $userId = intval($_SESSION['auth']['id']);
            $eventId = intval($_GET['eventId']);
            if(isset($_POST['interested'])){
                $events->interestedEvent($userId, $eventId);
                $_SESSION['flash']['success'] = 'Cet évènement vous intéresse';
                redirect_to_route('calendar');
            }else{
                $events->registerEvent($userId, $eventId);
                $_SESSION['flash']['success'] = 'Vous êtes inscrit';
                header('Location:' . route_to_url('calendar'));
                exit();    
            } 
        }
    }
}
    