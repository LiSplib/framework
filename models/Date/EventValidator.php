<?php

namespace App\Model\Date;

use App\Model\App\Validator;

class EventValidator extends Validator{
    
    /**
     * validates
     *
     * @param  array $data
     * @return array|bool
     */
    public function validates(array $data){

        parent::validates($data);
        $this->validate('title', 'minLength', 3);
        $this->validate('date', 'date');
        $this->validate('start', 'beforeTime', 'end');
        $this->validate('city', 'checkCity', 'adress', 'zipcode');
        return $this->errors;
    }
}