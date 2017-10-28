<?php

namespace UniSevilla\Convenios;

use UniSevilla\Convenios\Persona\Persona;

class App
{

    /**
     * @var \ADOConnection
     */
    public $adodb;

    /**
     * @var string
     * Define configuración de idioma
     */
    public $idioma;

    /**
     * @var string
     * Página actual
     */
    public $page;

    /**
     * @var string
     * Plantilla de la página actual (ruta relativa fichero tpl)
     */
    public $plantilla;

    /**
     * @var \Smarty
     */
    public $smarty;

    /**
     * @var Persona
     * Usuario que ha iniciado sesión en la aplicación
     */
    public $usuario;

}