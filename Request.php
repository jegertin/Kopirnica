<?php

class Request
{
    public static function getRuta()
    {
        $ruta='/';
        if(isset($_SERVER['REDIRECT_PATH_INFO'])){
            $ruta=$_SERVER['REDIRECT_PATH_INFO'];
        }else if(isset($_SERVER['REQUEST_URI'])){
            $ruta=$_SERVER['REQUEST_URI'];
        }
        // dodati još ključeva koji sadrže rutu
        return $ruta;
    }
}

//8 linija ako je postavljen donja crta server pod redirect path info tada dolar ruta jednako redirect path info inace ponovit isset request uri,
//vidit na stranici, moze se dodavat jos else if 