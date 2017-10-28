<?php

namespace UniSevilla\Convenios\Persona;

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
     * @return Persona
     */
    public function LoadJoined($condicion)
    {
        $this->Load($condicion);

        return $this;
    }
}
