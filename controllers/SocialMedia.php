<?php

namespace App\Controller;

use App\Model\ModelSocialMedia;
use DateTime;
use DateTimeImmutable;

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
            $today = new DateTimeImmutable();
            $timeInDay = floor($time / 86400);
            $nextToken = $today->modify('+'.$timeInDay.'day');
            $nextDate = $nextToken->format('Y-m-d');
            $dayTo = $nextToken->diff($today);
            return ['result' => $result,
                    'dayTo' => $dayTo,
                    'nextDate' => $nextDate
                    ];
        }
        $fbBdd = new ModelSocialMedia;
        $appId = $fbBdd->getAppId();
        $appSecret = $fbBdd->getAppSecret();
        // $longToken = $fbBdd->getLongTokenFb();
        $fb = new \Facebook\Facebook([
            'app_id' => $appId,
            'app_secret' => $appSecret,
            'default_graph_version' => 'v6.0',
        ]);
        $nextDate = $fbBdd->getNextDateInsta();
        $today = new DateTime();
        $format = ('Y-m-d');
        $nextDate = DateTime::CreateFromFormat($format, $nextDate['nextTokenDate']);
        $dayTo = $nextDate->diff($today);
        $helper = $fb->getRedirectLoginHelper();
        $permissions = ['email'];
        $loginUrl = $helper->getLoginUrl('fb-callback.php', $permissions);
        return ['loginUrl' => (empty($loginUrl)) ? '' : $loginUrl,
                'dayTo' => $dayTo
                ];    
    }

    public function httpPostRequest(){
        if (!empty($_POST)){
           $insta = new ModelSocialMedia;
           $nextTokenDate = $_POST['nextTokenDate'];
           $format = ('Y-m-d');
           $newDateToken = DateTime::createFromFormat($format, $nextTokenDate);
           $newDateToken = $newDateToken->format('Y-m-d');
           $long_token_insta = $_POST['long_token_insta'];
           $insta->updateNextTokenDateInsta($newDateToken);
           $insta->updateTokenInsta($long_token_insta);
           $_SESSION['flash']['success'] = "Token mis a jour";
           route_to_url('socialMedia');
        }

    }

}