<?php

namespace App\Controller;

use Facebook\Facebook;

class FacebookLive{

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
            $response = $fb->get('/me?fields=id,name,live_videos, videos{source}');
            $resPageLive = $fb->get('631254443954084/?fields=live_videos{permalink_url,live_views,embed_html,status}');
          } catch(\Facebook\Exceptions\FacebookResponseException $e) {
            // When Graph returns an error
            echo 'Graph returned an error: ' . $e->getMessage();
            exit;
          } catch(\Facebook\Exceptions\FacebookSDKException $e) {
            // When validation fails or other local issues
            echo 'Facebook SDK returned an error: ' . $e->getMessage();
            exit;
          }
          $liveVideo = $response->getDecodedBody()['live_videos']['data'];
          $videos = $response->getDecodedBody()['videos']['data'];
          $pageLive = $resPageLive->getDecodedBody()['live_videos']['data'];
          
          return ['liveVideo' => $liveVideo,
                    'videos' => $videos,
                    'pageLive' => $pageLive
                ];
    
    }

    public function httpPostRequest(){}
}