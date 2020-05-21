<?php

namespace App\Model;

use Intervention\Image\ImageManager;
use App\Model\ModelAdmin;

class ModelImage{


    public function __construct(){

    }

    public function resize($size){
        
        $manager = new ImageManager;
        $dir = "sources/images/avatar/";
        $photos = glob("$dir*.jpg");
        foreach ($photos as $photo){
            $manager->make($photo)->fit($size)->save($dir . "/thumbs/" . pathinfo($photo, PATHINFO_FILENAME) . '_'. $size .'.jpg');
        }

    }

    public function getAdminsImg(){
        $admins = new ModelAdmin;
        $img = $admins->getAdmins();
        $adminImg = [];
        foreach($img as $i){
            array_push($adminImg, $i['image']);
        }
        return $adminImg;
    }

    public function getImage(){
        $dir = "sources/images/avatar/";
        $photos = glob("$dir*.jpg");
        $adminsImg = new ModelImage;
        $imgs = $adminsImg->getAdminsImg();
        return $photos;
    }

    public function getThumbs(){
        $dir = "sources/images/avatar/thumbs";
        $photos = glob("$dir*.jpg");
        return $photos;
    }

}