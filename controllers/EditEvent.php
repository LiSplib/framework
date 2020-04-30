<?php

namespace App\Controller;


class EditEvent{

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
        if($_SESSION['auth']['role'] === 'superAdmin' || $this->event->getId_admin() === $_SESSION['auth']['id']){
            $errors = [];
            
            if (!isset($_GET['id'])) {
                //TODO 404;
            }
            
            try {
                $this->event;
            } catch (\Exception $e) {
                //TODO 404;
            }

            $data = [
                'title' => $this->event->getTitle(),
                'date' => $this->event->getStart()->format('Y-m-d'),
                'start' => $this->event->getStart()->format('H:i'),
                'end' => $this->event->getEnd()->format('H:i'),
                'content' => $this->event->getContent()
            ];

            return ['event' => $this->event,
                    'data' => $data,
                    'errors' => $errors
        ];
            
        }else {
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }
    }

    public function httpPostRequest(){
                
        if($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = $_POST;
            $validator = new \App\Model\Date\EventValidator();
            $this->errors = $validator->validates($data);
            if (empty($this->errors)) {
                $this->events->hydrate($this->event, $data);
                $this->events->update($this->event);
                session_start();
                $_SESSION['flash']['success'] = 'L\'événement a été modifié';
                header('Location:' . route_to_url('calendar'));
                exit();
            }
        } 
    }

}