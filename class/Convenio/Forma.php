<?php

namespace UniSevilla\Convenios\Convenio;

class Forma extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'ConvenioFormalizacion';

    /** @var  string */
    public $nombre;

    /** @var  int */
    public $id;

}