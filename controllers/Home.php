<?php

namespace App\Controller;


class Home{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }
    
    public function httpGetRequest(){

    }

    public function httpPostRequest(){

    }
}