<?php

namespace UniSevilla\Convenios\Persona;

class Rol extends \ADODB_Active_Record
{
    /** @var string */
    var $_table = "Rol";

    /** @var int */
    public $id;

    /** @var string */
    public $descripcion;

    /** @var string */
    public $nombre;
}
