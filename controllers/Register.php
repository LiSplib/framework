<?php

namespace App\Controller;
use App\Model\ModelAdmin;

class Register{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){
    }

    public function httpPostRequest(){

        $admin = new ModelAdmin();

        if(!empty($_POST)){
            $errors = [];
            if(empty($_POST['lastname']) || !preg_match('/^[a-zA-Z0-9_]+$/', $_POST['lastname'])){
                $errors['lastname'] = "Votre Nom n'est pas valide!";
            }
            if(empty($_POST['firstname']) || !preg_match('/^[a-zA-Z0-9_]+$/', $_POST['firstname'])){
                $errors['firstname'] = "Votre prénom n'est pas valide!";
            }
            if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
                $errors['email'] = "Votre email n'est pas valide!";
            }
            if(empty($_POST['password']) || $_POST['password'] != $_POST['confirm_password']){
                $errors['password'] = "Votre password n'est pas valide!";
            }
            if(empty($_POST['image']) || !filter_var($_POST['image'], FILTER_VALIDATE_URL)){
                $errors['image'] = 'L\'url n\'est pas valide!';
            }
            if(empty($errors)){
                $lastname = $_POST['lastname'];
                $firstname = $_POST['firstname'];
                $email = $_POST['email'];
                $image = $_POST['image'];
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                $role = 'user';
                $token = $GLOBALS['TOKEN_ID_FRAMEWORK_ALTAIR'];
                if($_POST['coach'] === 'on'){
                    $coach = 1;
                }else{
                    $coach = 0;
                }
                $admin->addAdmin($lastname, $firstname, $email, $image, $password, $role, $token, $coach);
                $_SESSION['flash']['success'] = "Vous êtes maintenant enregistré";
                header('Location:' . route_to_url('home'));
                exit();
            }else{
                   $_SESSION['flash']['danger'] = "Saisie incorrecte veuillez corrigez !" ;
                };
                header('Location:' .route_to_url('register'));
                exit();
            }
        }
    }
