<?php

namespace UniSevilla\Convenios\Convenio;

class Forma extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'ConvenioFormalizacion';

    /** @var  int */
    public $id;

    /** @var  string */
    public $nombre;

    /** @var string */
    public $created_at;

}