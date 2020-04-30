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
                'dept' => $dept
        ];
    }

    public function httpPostRequest(){
            $id = (empty($_GET['id']) ? $_SESSION['auth']['id'] : $_GET['id']);
            $region = $_POST['region'];
            $departement = $_POST['departement'];
            $ville = ucwords($_POST['ville']);
            $telephone = $_POST['telephone'];
            $adresse = $_POST['adresse'];
            $societe = $_POST['societe'];
            $website = $_POST['website'];
            $facebook = $_POST['facebook'];
            $linkedin = $_POST['linkedin'];
            $viadeo = $_POST['viadeo'];
            $skype = $_POST['skype'];
            $dataAdmin = new ModelAdmin;
            $adminInfo = $dataAdmin->getAdminInfo($id);
            if(empty($adminInfo) && !empty($region) && !empty($departement) && !empty($ville)){
                $dataAdmin->addInfo($region, $departement, $ville, $telephone, $adresse, $societe, $website, $facebook, $linkedin, $viadeo, $skype, $id);
                $_SESSION['flash']['success'] = 'Info ajouté';
            }else{
            $dataAdmin->editAccount($region, $departement, $ville, $telephone, $adresse, $societe, $website, $facebook, $linkedin, $viadeo, $skype, $id);
            $_SESSION['flash']['success'] = 'Info modifié';
            }
            redirect_to_route('adminEdit?id='.$id);
    }
}