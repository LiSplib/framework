<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;

class ModelCustomSite{

    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function getColors(){
        $sql = 'SELECT * FROM custom_site';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

    public function getAnimation(){
        $sql = 'SELECT tranform-scale, transition FROM custom_site';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        return $query->fetchAll();
    }

    public function editBackgroundColor(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    backgroundColor    = '$dataStyle[0]'
                WHERE 
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editBoxBackgroundColor(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    boxBackgroundColor = '$dataStyle[1]'
                WHERE
                    customSiteId = '1'
                ";
            $query = $this->pdo->prepare($sql);
            $query->execute($dataStyle);
    }

    public function editBoxShadow(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    boxShadow = '$dataStyle[2]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTextColor(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    textColor    = '$dataStyle[3]'
                WHERE 
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTextFontSize(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    textFontSize    = '$dataStyle[4]'
                WHERE 
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTextFontFamily(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    textFontFamily    = '$dataStyle[5]'
                WHERE 
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTitleColor(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    titleColor = '$dataStyle[6]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTitleFontSize(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    titleFontSize = '$dataStyle[7]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTitleFontFamily(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    titleFontFamily = '$dataStyle[8]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editTitleTextShadow(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    titleTextShadow = '$dataStyle[9]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }


    public function editClassZoom(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    class = '$dataStyle[10]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }

    public function editBtnEffect(Array $dataStyle){
        $sql = "UPDATE
                    custom_site
                SET
                    btnEffect = '$dataStyle[11]'
                WHERE
                    customSiteId = '1'
                ";
        $query = $this->pdo->prepare($sql);
        $query->execute($dataStyle);
    }
}