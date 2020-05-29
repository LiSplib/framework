<?php

namespace App\Model;

class ModelMyCard{


    public function __construct(){
        
    }

    public function makeCard($admin, $title, $text){
        echo ''?><div class="row justify-content-center my-5">
        <div class="col-xl-6 col-sm-12">
            <div class="card card-grey-2 p-4">
                <h4 class="text-grey"><?= $title ?></h4>
                <a class="ml-auto" data-toggle="collapse" href="#<?= $text ?>" role="button" aria-expanded="false" aria-controls="<?= $text ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="1.5em" viewBox="0 0 35.83 30"><defs><style>.cls-1{fill:#adadad;}</style></defs><g id="Calque_2" data-name="Calque 2"><g id="Calque_1-2" data-name="Calque 1"><path class="cls-1" d="M17.91,30a1.15,1.15,0,0,1-.83-.36L.32,12.15A1.15,1.15,0,1,1,2,10.56L17.91,27.18,33.84,10.56a1.15,1.15,0,1,1,1.67,1.59L18.75,29.64A1.16,1.16,0,0,1,17.91,30Z"/><path class="cls-1" d="M17.91,19.8a1.15,1.15,0,0,1-.83-.36L.32,2A1.15,1.15,0,0,1,2,.36L17.91,17,33.84.36A1.15,1.15,0,0,1,35.51,2L18.75,19.44A1.16,1.16,0,0,1,17.91,19.8Z"/></g></g></svg>
                </a>
                <div class="collapse bg-Altair-grey text-white p-4" id="<?= $text ?>">
                    <div class="bg-Altair-grey text-white">
                        <h5><?= ucfirst((empty($admin[$text])) ? '' : $admin[$text]) ?></h5>
                    </div>
                </div>
            </div>
        </div>
    </div><?php
    }


}
