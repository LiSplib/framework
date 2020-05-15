<?php

namespace App\Controller;

use App\Model\dataBase\PdoSql;
use App\Model\Date\{
    Events,
    Month
};

class Calendar {

    private $pdo;

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function httpGetRequest(){
        $events = new Events($this->pdo);
        $month = new Month($_GET['month'] ?? null, $_GET['year'] ?? null); 
        $start = $month->getStartingDay();
        $start = $start->format('N') === '1' ? $start : $month->getStartingDay()->modify('last monday');
        $weeks = $month->getWeeks();
        $end = (clone $start)->modify('+' . (6 + 7 * ($weeks -1)) . 'days');
        $events = $events->getEventsBetweenByDay($start, $end);
        return ['events' => $events,
                'month' => $month,
                'weeks' => $weeks,
                'start' => $start,
                'end' => $end
                ];
    }

    public function httpPostRequest(){}
}
    