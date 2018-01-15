<?php

namespace UniSevilla\Convenios\Convenio;

use UniSevilla\Convenios\Entidad\Entidad;

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

    /** @var Entidad */
    public $entidad;

    /** var $convenio */
    public $convenio;

    public function FindJoined($condicion)
    {
        $convenios_entidades = $this->Find($condicion);
        foreach ($convenios_entidades as $convenio_entidad) {
            $convenio_entidad->entidad = new Entidad();
            $convenio_entidad->entidad->Load("id = $convenio_entidad->id_entidad");
        }

        return $convenios_entidades;
    }
}
