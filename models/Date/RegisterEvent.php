<?php

namespace App\Model\Date;

class RegisterEvent{

    private $userId;

    private $eventId;


    /**
     * Get the value of userId
     */ 
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * Get the value of eventId
     */ 
    public function getEventId()
    {
        return $this->eventId;
    }

     /**
     * Set the value of userId
     *
     * @return  self
     */ 
    public function setUserId($userId)
    {
        $this->userId = $userId;

        return $this;
    }

    /**
     * Set the value of eventId
     *
     * @return  self
     */ 
    public function setEventId($eventId)
    {
        $this->eventId = $eventId;

        return $this;
    }
}