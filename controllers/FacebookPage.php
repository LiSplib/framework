<?php

namespace App\Controller;

use Facebook\Facebook;

class FacebookPage{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest(){
        $fb = new Facebook([
            'app_id' => '2551864771733343',
            'app_secret' => 'fe7b2802c990a277af929b85f8371486',
            'default_graph_version' => 'v2.2',
        ]);
        $fb->setDefaultAccessToken('EAAkQ6FE7518BABqpoz1pZA8ynApbP9laLPJ9ESPL3AM3ZADJyU7xtIKXviPiKGOSZBvjfobJ50GgocIr8H3hb4UK80ArIsaxYQtjtZB22x2P9tSnDZArBjUMVyRF5ZC1dEie7fz5ZCGWWwsZCvaid9W9CpgKXXABYQy3oEenZAEUI4QZDZD');
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