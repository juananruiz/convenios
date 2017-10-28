<?php

namespace UniSevilla\Convenios\Convenio;

class Estado extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'ConvenioEstado';

    /** @var  string */
    public $nombre;

    /** @var  int */
    public $id;

}