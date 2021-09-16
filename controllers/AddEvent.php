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
            $token = bin2hex(random_bytes(32));
            $_SESSION['token'] = $token;    
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
                    'theme' => $theme,
                    'token' => $token
                ];
        }elseif($_SERVER['REQUEST_METHOD'] === 'POST'){
            $data = $_POST;
            $allTheme = new \App\Model\Date\Events;
            $theme = $allTheme->enumTheme();
            $validator = new \App\Model\Date\EventValidator();
            $errors = $validator->validates($data);
            return ['errors' => $errors,
                    'data' => $data, 
                    'theme' => $theme
                    ];
        }
        else{
            $_SESSION['flash']['danger'] = 'Vous n\'avez pas le droit !!!';
            redirect_to_route('home');
        }
    }

    public function httpPostRequest(){
        if(isset($_SESSION['token']) && isset($_POST['token']) && !empty($_SESSION['token']) && !empty($_POST['token'])){
            if($_SESSION['token'] == $_POST['token']){
                if($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $data = $_POST;
                    $theme = $data['theme'];
                    $validator = new \App\Model\Date\EventValidator();
                    $errors = $validator->validates($data);
                    var_dump($errors);
                    $allTheme = new \App\Model\Date\Events;
                    $allTheme = $allTheme->enumTheme();
                    $token = $_SESSION['token'];
                    if (empty($errors)) {
                        $events = new \App\Model\Date\Events();
                        $color = $events->addColorTheme($theme);
                        $data['themeColor'] = $color;
                        $data['isValide'] = 1;
                        $event = $events->hydrate(new \App\Model\Date\Event(), $data);
                        $events->create($event);
                        $_SESSION['flash']['success'] = 'L\'événement a été crée, il est en attente d\'acceptation';
                        redirect_to_route('calendar');
                    }else{
                        $_SESSION['flash']['danger'] = 'L\'événement comporte des erreurs merci de les corriger';
                        // redirect_to_route('addEvent');
                        return [
                            'data' => $data,
                            'theme' => $allTheme,
                            'errors' => $errors,
                            'token' => $token
                            ];
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