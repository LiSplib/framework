<?php

namespace App\Controller;

use App\Model\ModelCustomSite;

class Parameter extends Session{


    public function __construct()
    {
        $session = new Session;
        $session->sessionStart();
    }

    public function httpGetRequest(){
      
    }

    public function httpPostRequest(){
        
        $dataStyle = [
            $backgroundColor    = $_POST['backgroundColor'],
            $boxBackgroundColor = $_POST['boxBackgroundColor'],
            $boxShadow          = $_POST['boxShadow'],
            $textColor          = $_POST['textColor'],
            $textFontSize       = $_POST['textFontSize'],
            $textFontFamily     = $_POST['textFontFamily'],
            $titleColor         = $_POST['titleColor'],
            $titleFontSize      = $_POST['titleFontSize'],
            $titleFontFamily    = $_POST['titleFontFamily'],
            $titleTextShadow    = $_POST['titleTextShadow'],
            $class              = $_POST['class'],
            $btnEffect          = $_POST['btnEffect']
        ];


        $editDataStyle = new ModelCustomSite();
        $editDataStyle->editBackgroundColor($dataStyle);
        $editDataStyle->editBoxBackgroundColor($dataStyle);
        $editDataStyle->editboxShadow($dataStyle);
        $editDataStyle->editTextColor($dataStyle);
        $editDataStyle->editTextFontSize($dataStyle);
        $editDataStyle->editTextFontFamily($dataStyle);
        $editDataStyle->editTitleColor($dataStyle);
        $editDataStyle->editTitleFontSize($dataStyle);
        $editDataStyle->editTitleFontFamily($dataStyle);
        $editDataStyle->editTitleTextShadow($dataStyle);
        $editDataStyle->editClassZoom($dataStyle);
        $editDataStyle->editBtnEffect($dataStyle);
        header("Refresh:0");
    }
    
}