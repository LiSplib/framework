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
        if($_SERVER['REQUEST_METHOD'] === 'POST'){   
            $data = $_POST;
            $errors = $_POST['errors'];
            return ['errors' => $errors,
                    'data' => $data];
        }
    }

    public function httpPostRequest(){

        $admin = new ModelAdmin();
        $isEmpty = $admin->getAdmins();
        $email = $_POST['email'];
        $emailCheck = $admin->getEmail($email);
        $data = $_POST;

        if(!empty($_POST)){
            $errors = [];
        
            if(empty($_POST['lastname']) || !preg_match('/^[a-zA-Z_]+$/', $_POST['lastname'])){
                $errors['lastname'] = "Votre Nom n'est pas valide! Uniquement des lettres merci";
            }
            if(empty($_POST['firstname']) || !preg_match('/^[a-zA-Z_]+$/', $_POST['firstname'])){
                $errors['firstname'] = "Votre prénom n'est pas valide! Uniquement des lettres merci";
            }
            if(empty($_POST['email']) || !filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)){
                $errors['email'] = "Votre email n'est pas valide!";
            }
            if($emailCheck['email'] === $_POST['email']){
                $errors['emailExist'] = "Cet email est déjà enregistré!";
            }
            if(empty($_POST['password']) || $_POST['password'] != $_POST['confirm_password']){
                $errors['password'] = "Votre password n'est pas valide!";
            }
            if(!empty($_POST['image']) && !filter_var($_POST['image'], FILTER_VALIDATE_URL)){
                $errors['image'] = 'L\'url de l\'image n\'est pas valide!';
            }
            
            if(empty($errors)){
                if(empty($_POST['image'])){
                    $_POST['image'] = 'https://c.pxhere.com/images/87/58/9a3f15235f2fb5cec91a3dc25ead-1441529.jpg!d';
                }
                $lastname = $admin->valid_donnees($_POST['lastname']);
                $firstname = $admin->valid_donnees($_POST['firstname']);
                $email = strtolower($admin->valid_donnees($_POST['email']));
                $image = $admin->valid_donnees($_POST['image']);
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
                if (empty($isEmpty)){
                    $role = 'superAdmin';
                }else{
                    $role = 'user';
                }
                $token = $GLOBALS['TOKEN_ID_FRAMEWORK_ALTAIR'];
                if($_POST['coach'] === 'on'){
                    $coach = 1;
                }else{
                    $coach = 0;
                }
                $admin->addAdmin($lastname, $firstname, $email, $image, $password, $role, $token, $coach);
                $_SESSION['flash']['success'] = "Vous êtes maintenant enregistré";
                redirect_to_route('home');
            }else{
                   $_SESSION['flash']['danger'] = "Saisie incorrecte veuillez corrigez !" ;
                   return ['errors' => $errors,
                            'data' => $data];
                };
                // redirect_to_route('register');
            }
        }
    }
