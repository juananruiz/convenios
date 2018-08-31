<?php

namespace UniSevilla\Convenios\Persona;

class Permiso extends \ADODB_Active_Record
{
    public $_table = "Permiso";

    /** @var int */
    public $id;

    /** @var string */
    public $fechafin;

    /** @var string */
    public $fechainicio;

    /** @var int */
    public $idpersona;

    /** @var int */
    public $idrol;

    /** @var Persona */
    public $persona;

    /** @var Rol */
    public $rol;

    /**
     * @param string $condicion
     * @return $this
     */
    public function LoadJoined($condicion)
    {
        $this->Load($condicion);

        $rol = new Rol();
        $rol->Load("id = $this->idrol");
        $this->rol = $rol;

        $persona = new Persona();
        $persona->Load("id = $this->idpersona");
        $this->persona = $persona;

        return $this;
    }

    /**
     * @param string $condicion
     * @return array|bool
     */
    public function FindJoined($condicion)
    {
        $registros = $this->Find($condicion);
        if (is_array($registros)) {
            foreach ($registros as $registro) {
                $rol = new Rol();
                $rol->Load("id = $registro->idrol");
                if ($rol->Load("id = $registro->idrol")) {
                    $registro->rol = $rol;
                }

                $persona = new Persona();
                if ($persona->Load("id = $registro->idpersona")) {
                    $registro->persona = $persona;
                }
            }

            return $registros;
        } else {

        return false;
        }
    }
    public function Permiso($condicion)
    {
        if ($this->Load($condicion)){
            return true;
        } else {
            return false;
        }
    }
}