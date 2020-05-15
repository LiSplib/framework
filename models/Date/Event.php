<?php

namespace App\Model\Date;

class Event{

    private $id;

    private $title;

    private $content;

    private $start;

    private $end;

    private $id_admin;

    private $image;

    private $lastname;

    private $firstname;

    private $registerCount;

    private $theme;

    private $themeColor;

    private $urlImage;

    private $isValide;

    private $adress;

    private $zipcode;

    private $city;

    
    /**
     * Get the value of id
     */ 
    public function getId(): int
    {
        return $this->id;
    }

    /**
     * Get the value of title
     */ 
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * Get the value of content
     */ 
    public function getContent(): string
    {
        return $this->content ?? '';
    }

    /**
     * Get the value of start
     */ 
    public function getStart(): \DateTime
    {
        return new \Datetime($this->start);
    }

    /**
     * Get the value of end
     */ 
    public function getEnd(): \DateTime
    {
        return new \Datetime($this->end);
    }

    /**
     * Get the value of id_admin
     */ 
    public function getId_admin()
    {
        return $this->id_admin;
    }
    
    /**
     * Set the value of title
     *
     * @return  self
     */ 
    public function setTitle(string $title)
    {
        $this->title = $title;

        // return $this;
    }

    /**
     * Set the value of content
     *
     * @return  self
     */ 
    public function setContent(string $content)
    {
        $this->content = $content;

        // return $this;
    }

    /**
     * Set the value of start
     *
     * @return  self
     */ 
    public function setStart(string $start)
    {
        $this->start = $start;

        // return $this;
    }

    /**
     * Set the value of end
     *
     * @return  self
     */ 
    public function setEnd(string $end)
    {
        $this->end = $end;

        // return $this;
    }    


    /**
     * Set the value of id_admin
     *
     * @return  self
     */ 
    public function setId_admin(int $id_admin)
    {
        $this->id_admin = $id_admin;

        return $this;
    }


    /**
     * Get the value of image
     */ 
    public function getImage()
    {
        return $this->image;
    }

    /**
     * Set the value of image
     *
     * @return  self
     */ 
    public function setImage($image)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get the value of lastname
     */ 
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * Set the value of lastname
     *
     * @return  self
     */ 
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * Get the value of registerCount
     */ 
    public function getRegisterCount()
    {
        return $this->registerCount;
    }

    /**
     * Set the value of registerCount
     *
     * @return  self
     */ 
    public function setRegisterCount($registerCount)
    {
        $this->registerCount = $registerCount;

        return $this;
    }

    /**
     * Get the value of theme
     */ 
    public function getTheme()
    {
        return $this->theme;
    }

    /**
     * Set the value of theme
     *
     * @return  self
     */ 
    public function setTheme($theme)
    {
        $this->theme = $theme;

        return $this;
    }

    /**
     * Get the value of themeColor
     */ 
    public function getThemeColor()
    {
        return $this->themeColor;
    }

    /**
     * Set the value of themeColor
     *
     * @return  self
     */ 
    public function setThemeColor($themeColor)
    {
        $this->themeColor = $themeColor;

        return $this;
    }

    /**
     * Get the value of urlImage
     */ 
    public function getUrlImage()
    {
        return $this->urlImage;
    }

    /**
     * Set the value of urlImage
     *
     * @return  self
     */ 
    public function setUrlImage($urlImage)
    {
        $this->urlImage = $urlImage;

        return $this;
    }

    /**
     * Get the value of isValide
     */ 
    public function getIsValide()
    {
        return $this->isValide;
    }

    /**
     * Set the value of isValide
     *
     * @return  self
     */ 
    public function setIsValide($isValide)
    {
        $this->isValide = $isValide;

        return $this;
    }

    /**
     * Get the value of firstname
     */ 
    public function getFirstname()
    {
        return $this->firstname;
    }

    /**
     * Set the value of firstname
     *
     * @return  self
     */ 
    public function setFirstname($firstname)
    {
        $this->firstname = $firstname;

        return $this;
    }

    /**
     * Get the value of adress
     */ 
    public function getAdress()
    {
        return $this->adress;
    }

    /**
     * Set the value of adress
     *
     * @return  self
     */ 
    public function setAdress($adress)
    {
        $this->adress = $adress;

        return $this;
    }

    /**
     * Get the value of zipcode
     */ 
    public function getZipcode()
    {
        return $this->zipcode;
    }

    /**
     * Set the value of zipcode
     *
     * @return  self
     */ 
    public function setZipcode($zipcode)
    {
        $this->zipcode = $zipcode;

        return $this;
    }

    /**
     * Get the value of city
     */ 
    public function getCity()
    {
        return $this->city;
    }

    /**
     * Set the value of city
     *
     * @return  self
     */ 
    public function setCity($city)
    {
        $this->city = $city;

        return $this;
    }
}