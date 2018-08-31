<?php

namespace UniSevilla\Convenios\Entidad;


class Tipo extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'EntidadTipo';

    /** @var  string */
    public $nombre;

    /** @var  int */
    public $id;
}

