<?php

namespace App\Controller;

use App\Model\ModelAdmin;

class AdminPro{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart(); 
    }

    public function httpGetRequest(){
        $admin = new ModelAdmin;
        $id = $_GET['id'];
        $adminCoaching = $admin->getAdminCoaching($id);
        $coach = $admin->getCoachingDo();
        $adherent = $admin->getAdherent();
        $categorie = $admin->getCategorie();
        $admin = $admin->getAdminPro($id);
        return ['admin' => $admin,
                'adminCoaching' => $adminCoaching,
                'coach' => $coach,
                'adherent' => $adherent,
                'categorie' => $categorie,
                'id' => $id
                ];
    }

    public function httpPostRequest(){
        $admin = new ModelAdmin;
        $coachingDo = $admin->valid_donnees($_POST['coachingDo']);
        $adherent = $admin->valid_donnees($_POST['adherent']);
        $categorie = $admin->valid_donnees($_POST['categorie']);
        $intervention = $admin->valid_donnees($_POST['intervention']);
        $training = $admin->valid_donnees($_POST['training']);
        $course = $admin->valid_donnees($_POST['course']);
        $publication = $admin->valid_donnees($_POST['publication']);
        $interest = $admin->valid_donnees($_POST['interest']);
        $quote = $admin->valid_donnees($_POST['quote']);
        $admin_id = (empty($_GET['id']) ? $_SESSION['auth']['id'] : $_GET['id']);
        $id = (empty($_GET['id']) ? $_SESSION['auth']['id'] : $_GET['id']);
        $adminInfo = $admin->getAdminPro($id);
        $adminCoaching = $admin->getAdminCoaching($id);
        if(empty($adminInfo) && empty($adminCoaching) && !empty($intervention) && !empty($training) && !empty($course) && !empty($publication) && !empty($interest) && !empty($quote)){
            $admin->addAdminPro($intervention, $training, $course, $publication, $interest, $quote, $admin_id);
            $admin->addCoaching($coachingDo, $adherent, $categorie, $id);
            $_SESSION['flash']['success'] = 'Info ajouté';
            redirect_to_route('fullAccount?id='.$id);
        }else{
            $admin->updateAdminPro($intervention, $training, $course, $publication, $interest, $quote, $id);
            $admin->editCoaching($coachingDo, $adherent, $categorie, $id);
            $_SESSION['flash']['success'] = 'Info modifié';
            redirect_to_route('adminPro?id='.$id);
        }
    }
}