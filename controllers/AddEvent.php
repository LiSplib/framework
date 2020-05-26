<?php

namespace App\Controller;

class AddEvent {

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){
        if($_SESSION['auth']['role'] === 'admin' || $_SESSION['auth']['role'] === 'superAdmin'){
            $data = [
                'date' => $_GET['date'] ?? date('Y-m-d'),
                'start' => date('H:i'),
                'end' => date('H:i')
            ];
            $errors = [];
            $allTheme = new \App\Model\Date\Events;
            $theme = $allTheme->enumTheme();
            $validator = new \App\Model\App\Validator($data);
            if(!$validator->validate('date', 'date')) {
                $data['date'] = date('Y-m-d');
            };
            return ['data' => $data,
                    'validator' => $validator,
                    'errors' => $errors,
                    'theme' => $theme
                ];
        }else{
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }
    }

    public function httpPostRequest(){
        $errors = [];

        if($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = $_POST;
            $theme = $data['theme'];
            $validator = new \App\Model\Date\EventValidator();
            $errors = $validator->validates($data);
            if (empty($errors)) {
                $events = new \App\Model\Date\Events();
                $color = $events->addColorTheme($theme);
                $data['themeColor'] = $color;
                $data['isValide'] = 1;
                $event = $events->hydrate(new \App\Model\Date\Event(), $data);
                var_dump($event);
                $events->create($event);
                $_SESSION['flash']['success'] = 'L\'événement a été crée, il est en attente d\'acceptation';
                header('Location:' . route_to_url('calendar'));
                exit();
            }
        }
    }
}