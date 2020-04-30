<?php

namespace App\Model;

use Intervention\Image\ImageManager;

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

    public function getImage(){
        $dir = "sources/images/avatar/";
        $photos = glob("$dir*.jpg");
        return $photos;
    }

    public function getThumbs(){
        $dir = "sources/images/avatar/thumbs";
        $photos = glob("$dir*.jpg");
        return $photos;
    }

}