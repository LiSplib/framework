<?php

namespace App\Controller;

use App\Model\ModelSocialMedia;
use Facebook\Facebook;

class FacebookPage{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest(){

        $fbBdd = new ModelSocialMedia;
        $appId = $fbBdd->getAppId();
        $appSecret = $fbBdd->getAppSecret();
        $longToken = $fbBdd->getLongTokenFb();

        $fb = new Facebook([
            'app_id' => $appId,
            'app_secret' => $appSecret,
            'default_graph_version' => 'v6.0',
        ]);
        $fb->setDefaultAccessToken($longToken);
        try {
            // Requires the "read_stream" permission
            $response = $fb->get('/177742082376259?fields=events{cover,description,name,start_time,end_time,id}');
          } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
          } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
          }
          $allEvents = $response->getDecodedBody()['events']['data'];
          return ['allEvents' => $allEvents];
    
    }

    public function httpPostRequest(){}
}