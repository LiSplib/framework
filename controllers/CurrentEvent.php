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
        $id = $_GET['id'];
        $participants = $this->events->registerCount($id);
        $register = $this->events->eventsRegister($id);
        $data = [
            'title' => $this->event->getTitle(),
            'date' => $this->event->getStart()->format('Y-m-d'),
            'start' => $this->event->getStart()->format('H:i'),
            'end' => $this->event->getEnd()->format('H:i'),
            'content' => $this->event->getContent()
        ];

        return ['event' => $this->event,
                'data' => $data,
                'errors' => $errors,
                'image' => $image,
                'lastname' => $lastname,
                'participants' => $participants,
                'register' => $register
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