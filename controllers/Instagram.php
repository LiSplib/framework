<?php

namespace App\Controller;

use App\Model\ModelSocialMedia;

class Instagram
{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest()
    {

        $flux = new ModelSocialMedia;
        $datas = $flux->getFluxInsta();
        $datas = json_decode($datas);
        $previous = (empty($datas->paging->previous) ? '' : $datas->paging->previous);
        $next = (empty($datas->paging->next) ? '' : $datas->paging->next);

        if (!empty($previous) && isset($_GET['previous'])) {
            $url = $previous;
            $datas = $flux->getPreviousFlux($url);
            $datas = json_decode($datas);
            $previous = (empty($datas->paging->previous) ? '' : $datas->paging->previous);
            $next = (empty($datas->paging->next) ? '' : $datas->paging->next);
            foreach ($datas as $data) {
                return [
                    'data' => $data,
                    'previous' => $previous,
                    'next' => $next,
                    'datas' => $datas
                ];
            }
        }
        if (!empty($next) && isset($_GET['next'])) {
            $url = $next;
            $datas = $flux->getNextFlux($url);
            $datas = json_decode($datas);
            $previous = (empty($datas->paging->previous) ? '' : $datas->paging->previous);
            $next = (empty($datas->paging->next) ? '' : $datas->paging->next);
            foreach ($datas as $data) {
                return [
                    'data' => $data,
                    'previous' => $previous,
                    'next' => $next,
                    'datas' => $datas
                ];
            }
        }
        foreach ($datas as $data) {
            return [
                'data' => $data,
                'previous' => $previous,
                'next' => $next,
                'datas' => $datas
            ];
        }
    }

    public function httpPostRequest()
    {

        redirect_to_route('instagram');
    }
}
