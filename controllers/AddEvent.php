<?php

namespace App\Controller;

use PDO;

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
        
            $validator = new \App\Model\App\Validator($data);
            if(!$validator->validate('date', 'date')) {
                $data['date'] = date('Y-m-d');
            };
            return ['data' => $data,
                    'validator' => $validator,
                    'errors' => $errors
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
            $validator = new \App\Model\Date\EventValidator();
            $errors = $validator->validates($data);
            if (empty($errors)) {
                $events = new \App\Model\Date\Events();
                $event = $events->hydrate(new \App\Model\Date\Event(), $data);
                $events->create($event);
                $_SESSION['flash']['success'] = 'L\'événement a été crée';
                header('Location:' . route_to_url('calendar'));
                exit();
            }
        }
    }
}