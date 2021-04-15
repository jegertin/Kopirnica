<?php

class View
{
    private $predlozak;

    public function __construct($predlozak='predlozak')
    {
        $this->predlozak=$predlozak;
    }
    public function render($stranicaZaRender,$parametri=[])
    {
        ob_start();
        extract($parametri);
        include BP . 'view' . DIRECTORY_SEPARATOR . 
        $stranicaZaRender . '.phtml';
        $sadrzaj = ob_get_clean();
        include BP . 'view' . DIRECTORY_SEPARATOR .
        $this->predlozak . '.phtml';
    }
}