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
        $admin = $admin->getAdminPro($id);
        return ['admin' => $admin];
    }

    public function httpPostRequest(){
        $admin = new ModelAdmin;
        $intervention = $admin->valid_donnees($_POST['intervention']);
        $training = $admin->valid_donnees($_POST['training']);
        $course = $admin->valid_donnees($_POST['course']);
        $publication = $admin->valid_donnees($_POST['publication']);
        $interest = $admin->valid_donnees($_POST['interest']);
        $quote = $admin->valid_donnees($_POST['quote']);
        $admin_id = $_GET['id'];
        $id = $_GET['id'];
        $adminInfo = $admin->getAdminPro($id);
        if(empty($adminInfo) && !empty($intervention) && !empty($training) && !empty($course) && !empty($publication) && !empty($interest) && !empty($quote)){
            $admin->addAdminPro($intervention, $training, $course, $publication, $interest, $quote, $admin_id);
            $_SESSION['flash']['success'] = 'Info ajouté';
        }else{
            $admin->updateAdminPro($intervention, $training, $course, $publication, $interest, $quote, $id);
            $_SESSION['flash']['success'] = 'Info modifié';
        }
    }
}