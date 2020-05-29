<?php

namespace App\Controller;

use App\Model\ModelAdmin;


class AdminEdit{

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
        $adminInfo = $dataAdmin->getAdminInfo($id);
        $regions = $dataAdmin->getRegion();
        $dept = $GLOBALS['departements'];
        return ['adminInfo' => $adminInfo,
                'regions' => $regions,
                'dept' => $dept,
                'id' => $id
        ];
    }

    public function httpPostRequest(){
        $dataAdmin = new ModelAdmin;
        $id = (empty($_GET['id']) ? $_SESSION['auth']['id'] : $_GET['id']);
        $region = $dataAdmin->valid_donnees($_POST['region']);
        $departement = $dataAdmin->valid_donnees($_POST['departement']);
        $ville = $dataAdmin->valid_donnees(ucwords($_POST['ville']));
        $telephone = $dataAdmin->valid_donnees($_POST['telephone']);
        $adresse = $dataAdmin->valid_donnees($_POST['adresse']);
        $job = $dataAdmin->valid_donnees($_POST['job']);
        $societe = $dataAdmin->valid_donnees($_POST['societe']);
        $website = $dataAdmin->valid_donnees($_POST['website']);
        $facebook = $dataAdmin->valid_donnees($_POST['facebook']);
        $linkedin = $dataAdmin->valid_donnees($_POST['linkedin']);
        $vimeo = $dataAdmin->valid_donnees($_POST['vimeo']);
        $skype = $dataAdmin->valid_donnees($_POST['skype']);
        $google = $dataAdmin->valid_donnees($_POST['google']);
        $youtube = $dataAdmin->valid_donnees($_POST['youtube']);
        $instagram = $dataAdmin->valid_donnees($_POST['instagram']);
        $pinterest = $dataAdmin->valid_donnees($_POST['pinterest']);
        $snapchat = $dataAdmin->valid_donnees($_POST['snapchat']);
        $twitter = $dataAdmin->valid_donnees($_POST['twitter']);
        $soundcloud = $dataAdmin->valid_donnees($_POST['soundcloud']);
        $spotify = $dataAdmin->valid_donnees($_POST['spotify']);
        $adminInfo = $dataAdmin->getAdminInfo($id);
        if(empty($adminInfo) && !empty($region) && !empty($departement) && !empty($ville)){
            $dataAdmin->addInfo($region, $departement, $ville, $telephone, $adresse, $job, $societe, $website, $facebook, $linkedin, $vimeo, $skype, $google, $youtube, $instagram, $pinterest, $snapchat, $twitter, $soundcloud, $spotify, $id);
            $_SESSION['flash']['success'] = 'Info ajouté';
        }else{
        $dataAdmin->editAccount($region, $departement, $ville, $telephone, $adresse, $job, $societe, $website, $facebook, $linkedin, $vimeo, $skype, $google, $youtube, $instagram, $pinterest, $snapchat, $twitter, $soundcloud, $spotify, $id);
        $_SESSION['flash']['success'] = 'Info modifié';
        }
        redirect_to_route('fullAccount?id='.$id);
    }
}