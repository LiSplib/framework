<?php

namespace App\Model;

use App\Model\dataBase\PdoSql;

class ModelSocialMedia
{

    private $longLivedToken;
    private $pdo;

    public function __construct()
    {
        $this->pdo = (new PdoSql)->getPdo();
    }

    public function curlInit($url)
    {
        $curl = curl_init($url);    // Initialiser curl
        curl_setopt($curl, CURLOPT_HTTPGET, true);   // pour requête GET
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);   // retourn la valeur du curl_exec() en string.
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   // verifie la validité du certificat        !!! NE PAS LAISSER EN FALSE EN PROD !!!!  et inclure le fichier ssl
        $result = curl_exec($curl);   // Execute la requête
        curl_close($curl);   // ferme la session curl
        return $result;
    }

    public function refreshToken()
    {
        $insta = new ModelSocialMedia;
        $this->longLivedToken = $insta->getTokenInsta();
        $url = "https://graph.instagram.com/refresh_access_token?grant_type=ig_refresh_token&&access_token=$this->longLivedToken";
        $curl = $insta->curlInit($url);
        return $curl;
    }

    public function getFluxInsta()
    {
        $insta = new ModelSocialMedia;
        $this->longLivedToken = $insta->getTokenInsta();
        $url = "https://graph.instagram.com/me/media?fields=caption,media_url,permalink,media_type,children&access_token=$this->longLivedToken";
        $curl = $insta->curlInit($url);
        return $curl;
    }

    public function getPreviousFlux($url)
    {
        $insta = new ModelSocialMedia;
        $this->longLivedToken = $insta->getTokenInsta();
        $curl = $insta->curlInit($url);
        return $curl;
    }

    public function getNextFlux($url)
    {
        $insta = new ModelSocialMedia;
        $this->longLivedToken = $insta->getTokenInsta();
        $curl = $insta->curlInit($url);
        return $curl;
    }

    public function toDateInterval($seconds)
    {
        return ['toDateInterval' => date_create('@' . (($now = time()) + $seconds))->diff(date_create('@' . $now))];
    }

    public function getTokenInsta()
    {
        $sql = 'SELECT long_token_insta FROM social_media';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result['long_token_insta'];
    }

    public function setTokenInsta($long_token_insta)
    {
        $sql = 'INSERT INTO social_media (long_token_insta) VALUES (:long_token_insta)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':long_token_insta', $long_token_insta);
        $query->execute();
        return $query;
    }

    public function updateTokenInsta($long_token_insta)
    {
        $sql = 'UPDATE social_media SET long_token_insta = :long_token_insta WHERE id = "1"';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':long_token_insta', $long_token_insta);
        $query->execute();
        return $query;
    }

    public function updateNextTokenDateInsta($nextTokenDate)
    {
        $sql = 'UPDATE social_media SET nextTokenDate = :nextTokenDate WHERE id = "1"';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':nextTokenDate', $nextTokenDate);
        $query->execute();
        return $query;
    }

    public function getNextDateInsta()
    {
        $sql = 'SELECT nextTokenDate FROM social_media WHERE id = "1"';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result;
    }

    public function setNextTokenDate($next_token_date)
    {
        $sql = 'INSERT INTO social_media (nextTokenDate) VALUES (:nextTokenDate)';
        $query = $this->pdo->prepare($sql);
        $query->bindParam(':nextTokenDate', $next_token_date);
        $query->execute();
        return $query;
    }

    public function getLongTokenFb()
    {
        $sql = 'SELECT long_token_fb FROM social_media';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result['long_token_fb'];
    }

    public function getAppId()
    {
        $sql = 'SELECT app_id FROM social_media';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result['app_id'];
    }

    public function getAppSecret()
    {
        $sql = 'SELECT app_secret FROM social_media';
        $query = $this->pdo->prepare($sql);
        $query->execute();
        $result = $query->fetch();
        return $result['app_secret'];
    }
}
