<?php

namespace UniSevilla\Convenios\Persona;

use UniSevilla\Convenios\Entidad\Entidad;

class Persona extends \ADODB_Active_Record
{
    /** @var string */
    public $_table = 'Persona';

    /** @var int */
    public $id;

    /** @var bool */
    public $activo;

    /** @var string */
    public $apellidos;

    /** @var string */
    public $clave;

    /** @var string */
    public $correo;

    /** @var \DateTime */
    public $fecha_alta;

    /** @var \DateTime */
    public $fecha_modificacion;

    /** @var int */
    public $id_entidad;

    /** @var int */
    public $id_rol;

    /** @var string */
    public $nombre;

    /** @var string */
    public $sexo;

    /** @var \DateTime */
    public $ultimo_inicio_sesion;

    /** @var string */
    public $destino;

    /** @var string */
    public $telefono;

    /** @var string */
    public $nif;


    /**
     * @param string $condicion
     * @return bool
     */
    public function LoadJoined($condicion)
    {
        if ($this->Load($condicion)) {
            $this->entidad = new Entidad();
            $this->entidad->Load("id = $this->id_entidad");
            $this->rol = new Rol();
            $this->rol->Load("id = $this->id_rol");

            return true;
        }

        return false;
    }

    /**
     * @param string $condicion
     * @return Persona[]|bool
     */
    public function FindJoined($condicion)
    {
        if ($personas = $this->Find($condicion)) {
            foreach ($personas as $persona) {
                $persona->entidad = new Entidad();
                $persona->entidad->Load("id = $persona->id_entidad");
                $persona->rol = new Rol();
                $persona->rol->Load("id = $persona->id_rol");
            }

            return $personas;
        }

        return false;
    }

}
