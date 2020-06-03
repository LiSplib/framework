<?php

namespace App\Model\App;

class ZipCode{

    public function curlInit($url){
        $curl = curl_init($url);    // Initialiser curl
        curl_setopt($curl,CURLOPT_HTTPGET,true);   // pour requête GET
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);   // retourn la valeur du curl_exec() en string.
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   // verifie la validité du certificat        !!! NE PAS LAISSER EN FALSE EN PROD !!!!  et inclure le fichier ssl
        $result = curl_exec($curl);   // Execute la requête
        curl_close($curl);   // ferme la session curl
        return $result;
    }

    public function checkLocation($adress, $zipcode){
        $url = "https://api-adresse.data.gouv.fr/search/?q=$adress&postcode=$zipcode&limit=1";
        $check = new ZipCode;
        $curl = $check->curlInit($url);
        $curl = json_decode($curl, true);
        return $curl;
    }

}