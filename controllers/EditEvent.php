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
        $token = bin2hex(random_bytes(32));
        $_SESSION['token'] = $token;
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
            
            $allThemes = new \App\Model\Date\Events;
            $AllTheme = $allThemes->enumTheme();
            $data = [
                'title' => $this->event->getTitle(),
                'urlImage' => $this->event->getUrlImage(),
                'date' => $this->event->getStart()->format('Y-m-d'),
                'start' => $this->event->getStart()->format('H:i'),
                'end' => $this->event->getEnd()->format('H:i'),
                'theme' => $this->event->getTheme(),
                'content' => $this->event->getContent(),
                'adress' => $this->event->getAdress(),
                'zipcode' => $this->event->getZipcode(),
                'city' => $this->event->getCity()
            ];

            return ['event' => $this->event,
                    'data' => $data,
                    'errors' => $errors,
                    'theme' => $AllTheme,
                    'token' => $token
                    ];
            
        }else {
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }
    }

    public function httpPostRequest(){
        if(isset($_SESSION['token']) && isset($_POST['token'])){
            if($_SESSION['token'] == $_POST['token']){            
                if($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $data = $_POST;
                    $theme = $data['theme'];
                    $validator = new \App\Model\Date\EventValidator();
                    $this->errors = $validator->validates($data);
                    if (empty($this->errors)) {
                        $color = $this->events->addColorTheme($theme);
                        $data['themeColor'] = $color;
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
        else{
            $_SESSION['flash']['danger'] = 'Erreur de vérification';
            redirect_to_route('home');
        }
    }

}