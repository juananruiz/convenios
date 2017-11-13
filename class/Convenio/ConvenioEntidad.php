<?php

namespace UniSevilla\Convenios\Convenio;

class ConvenioEntidad extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'ConvenioEntidad';

    /** @var  int */
    public $id;

    /** @var  int */
    public $id_convenio;

    /** @var  int */
    public $id_entidad;

}
