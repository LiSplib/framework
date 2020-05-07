<?php

namespace App\Controller;

use App\Model\ModelSocialMedia;
use Facebook\Facebook;

class FacebookLive{

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
            'default_graph_version' => 'v2.2',
        ]);
        
        //TODO boucle génération token
        //Expire Juillet 2020
        

        $fb->setDefaultAccessToken($longToken);
        try {
            // Requires the "read_stream" permission
            $response = $fb->get('/177742082376259?fields=id,name,videos{source}');
            $resPageLive = $fb->get('177742082376259/?fields=live_videos{permalink_url,live_views,embed_html,status}');
            // $resPageLive = $fb->get('631254443954084/?fields=live_videos{permalink_url,live_views,embed_html,status}');
          } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
          } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
          }
          $videos = $response->getDecodedBody()['videos']['data'];
          $pageLive = $resPageLive->getDecodedBody()['live_videos']['data'];
          
          return['videos' => $videos,
                'pageLive' => $pageLive];
    
    }

    public function httpPostRequest(){}
}