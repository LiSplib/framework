<?php

namespace App\Controller;

use App\Model\ModelSocialMedia;


class SocialMedia{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest(){
        if(isset($_GET['refresh'])){
            $token = new ModelSocialMedia;
            $result = $token->refreshToken();
            $result = json_decode($result);
            $time = $result->expires_in;
            $expire = $token->toDateInterval($time);
            foreach($expire as $value){
                if($_SESSION['auth']['role'] === 'superAdmin') {
                    $_SESSION['value'] = $value;
                }
            }
            return ['result' => $result,
                    'value' => $value
                    ];
        }    
    }

    public function httpPostRequest(){
        if (!empty($_POST)){
           $insta = new ModelSocialMedia;
           $long_token_insta = $_POST['long_token_insta'];
           $insta->setTokenInsta($long_token_insta);
           $_SESSION['flash']['success'] = "Token mis a jour";
           route_to_url('socialMedia');
        }

    }

}