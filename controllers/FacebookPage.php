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
            'app_id' => '596355230967973',
            'app_secret' => '6d383edbce2edd715d2ff3d393414995',
            'default_graph_version' => 'v2.2',
        ]);
        $fb->setDefaultAccessToken('EAAIeYcWzqKUBAE2oFcfyJHJQfh8TsIGWpz0JMGAHqXt21h1ssd3NrgS0UelCvwDJxKJZActq4bhPYOsnXilHWcFr84BPCLWKJ8oU35n0GDOIb0nEVhmGR76ng14LWq4E5EB0IyQ0ltlyc6vwQxDQW4gjiS8zJ9uaI8lBpVvJpm98QNNHe');
        try {
            // Requires the "read_stream" permission
            $response = $fb->get('/631254443954084?fields=events{cover,description,name,start_time,end_time,id}');
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