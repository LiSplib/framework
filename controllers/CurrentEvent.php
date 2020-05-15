<?php

namespace App\Controller;

class CurrentEvent{

    private $events;
    private $event;

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
       $this->events = new \App\Model\Date\Events();
       $this->event = $this->events->find($_GET['id']);
    }

    public function httpGetRequest(){
        $errors = [];
        
        if (!isset($_GET['id'])) {
            //TODO 404;
        }
        
        try {
            $this->event;
            }catch (\Exception $e) {
            //TODO 404;
        }

        $image = $this->event->getImage();
        $lastname = $this->event->getLastname();
        $firstname = $this->event->getFirstname();
        $id = $_GET['id'];
        $participants = $this->events->registerCount($id);
        $register = $this->events->eventsRegister($id);
        $date = $this->event->getStart();
        $date = $date->format('Y/m/d');
        setlocale(LC_TIME, "fr_FR", "French");
        $date = strftime("%A %d %B %G", strtotime($date));
        $adress = $this->event->getAdress(). ' ' .$this->event->getZipcode(). ' '.$this->event->getCity();
        $adresse = $this->event->getAdress();
        $adresse = str_replace(' ', '+', $adresse);
        $zip = $this->event->getZipcode();
        if($zip === '0'){
            $zip = '83000';
        }
        $city = $this->event->getCity();
        $city = str_replace(' ', '+', $city);
        $url = "https://nominatim.openstreetmap.org/search?countrycode=fr&q=$adresse,$zip&format=json&limit=1";
        //need user_agent set in php.ini
        $json = file_get_contents($url);
        $obj = json_decode($json, true);
        $lat = $obj[0]['lat'];
        $lon = $obj[0]['lon'];
        $maps = "https://embed.waze.com/fr/iframe?zoom=15&lat=$lat&lon=$lon&ct=livemap";

        $data = [
            'title' => $this->event->getTitle(),
            'date' => $this->event->getStart()->format('Y-m-d'),
            'start' => $this->event->getStart()->format('H:i'),
            'end' => $this->event->getEnd()->format('H:i'),
            'theme' => $this->event->getTheme(),
            'content' => $this->event->getContent()
        ];

        return ['event' => $this->event,
                'data' => $data,
                'errors' => $errors,
                'image' => $image,
                'lastname' => $lastname,
                'firstname' => $firstname,
                'participants' => $participants,
                'register' => $register,
                'date' => ucwords($date),
                'adress' => $adress,
                'lat' => $lat,
                'lon' => $lon,
                'maps' => $maps
        ];
    }

    public function httpPostRequest(){
        $events = new \App\Model\Date\Events();
        if(!empty($_POST)){    
            $userId = intval($_SESSION['auth']['id']);
            $eventId = intval($_GET['id']);
            $events->registerEvent($userId, $eventId);
            $_SESSION['flash']['success'] = 'Vous êtes inscrit';
            header('Location:' . route_to_url('calendar'));
            exit();
        }
    }
}