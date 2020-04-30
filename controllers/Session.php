<?php

namespace App\Controller;
use App\Interfaces\ISession;

class Session implements ISession{
    

    public function sessionStart()
    {
          if(session_status() == PHP_SESSION_NONE){
            session_start();
        }
    
    }
    
    
}