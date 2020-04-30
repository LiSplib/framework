<?php

namespace App\Model;

class ModelSocialMedia{

    public function refreshToken(){

        $longLivedToken = 'IGQVJVdkZAYZA1FneHpwMDF3aG9mOXRKbC1UTTNYMndHaUFwVE1VcVAtREZAWTnhxMzdkSnA0bVplZA0l1M080MDNOdjMxTFlFZA1NhWElkZAk1ZAc3djMGx0aUh3Y1N1WTduckEyZAXhxdVA1akxrM0cwR3ROLXBRRjdKYTM3MDkw';
        $url = "https://graph.instagram.com/refresh_access_token";
        $access_token_parameters = array(
            'grant_type'         =>     'ig_refresh_token',
            'access_token'       =>     $longLivedToken
        );

        $curl = curl_init($url);    // we init curl by passing the url
            curl_setopt($curl,CURLOPT_POST,true);   // to send a POST request
            curl_setopt($curl,CURLOPT_POSTFIELDS,$access_token_parameters);   // indicate the data to send
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);   // to return the transfer as a string of the return value of curl_exec() instead of outputting it out directly.
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   // to stop cURL from verifying the peer's certificate.
            $result = curl_exec($curl);   // to perform the curl session
            curl_close($curl);   // to close the curl session

            var_dump($result);
    }    
    
    public function toDateInterval($seconds){
        return ['toDateInterval' => date_create('@' . (($now = time()) + $seconds))->diff(date_create('@' . $now))];
    }

}