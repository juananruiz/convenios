<?php

namespace UniSevilla\Convenios\Convenio;

class Objeto extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'ConvenioObjeto';

    /** @var  int */
    public $id;

    /** @var  string */
    public $nombre;

    /** @var string */
    public $created_at;
}