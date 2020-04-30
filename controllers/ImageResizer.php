<?php

namespace App\Controller;

use App\Model\ModelImage;

class ImageResizer{

    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest(){
        $img = new ModelImage;
        $photos = $img->getImage();
        return ['photos' => $photos];
    }

    public function httpPostRequest(){
        if(!empty($_POST)){
            $size = $_POST['size'];
            $newImg = new ModelImage;
            $newImg->resize($size);
            $_SESSION['flash']['success'] = "Images redimensionnées";
        }else{
            $_SESSION['flash']['danger'] = "Saisie incorrecte veuillez corrigez !" ;
            };
        header('Location:' . route_to_url('imageResize'));
        exit();
    }
}