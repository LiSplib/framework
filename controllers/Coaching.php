<?php

namespace App\Controller;

use App\Model\ModelAdmin;

class Coaching{

    public function __construct()
    {
       $session = new Session;
       $session->sessionStart();
    }

    public function httpGetRequest(){
        if(isset($_GET['id'])){
            $id = $_GET['id'];
        }else{
            $id = $_SESSION['auth']['id'];
        }
        $dataAdmin = new ModelAdmin();
        $adminCoaching = $dataAdmin->getAdminCoaching($id);
        $coach = $dataAdmin->getCoachingDo();
        $adherent = $dataAdmin->getAdherent();
        $categorie = $dataAdmin->getCategorie();
        return ['adminCoaching' => $adminCoaching,
                'coach' => $coach,
                'adherent' => $adherent,
                'categorie' => $categorie
                ];
    }

    public function httpPostRequest(){
        $id = (empty($_GET['id']) ? $_SESSION['auth']['id'] : $_GET['id']);
        $coachingDo = $_POST['coachingDo'];
        $adherent = $_POST['adherent'];
        $categorie = $_POST['categorie'];
        $dataAdmin = new ModelAdmin;
        $adminCoaching = $dataAdmin->getAdminCoaching($id);
        if(isset($adminCoaching)){
            $dataAdmin->addCoaching($coachingDo, $adherent, $categorie, $id);
            $_SESSION['flash']['success'] = 'Info ajoutées';
        }else{
            $dataAdmin->editCoaching($coachingDo, $adherent, $categorie, $id);
            $_SESSION['flash']['success'] = 'Info modifiées';
        }
        redirect_to_route('coaching?id='.$id);
    }
}