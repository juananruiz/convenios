<?php

namespace UniSevilla\Convenios\Convenio;

use UniSevilla\Convenios\Entidad\Entidad;
use UniSevilla\Convenios\Entidad\Tipo;
use UniSevilla\Convenios\Persona\Persona;


class Convenio extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'Convenio';

    /** @var integer */
    public $id;

    /** @var Convenio */
    public $convenio_marco;

    /** @var string */
    public $created_at;

    /** @var  string */
    public $economica;

    /** @var  int */
    public $ejercicio;

    /** @var Entidad[] */
    public $entidades;

    /** @var bool */
    public $es_ingreso;

    /** @var bool */
    public $es_gasto;

    /** @var  bool */
    public $es_prorrogable;

    /** @var Estado */
    public $estado;

    /** @var  string */
    public $fecha_fin;

    /** @var  string */
    public $fecha_firma;

    /** @var Forma */
    public $forma;

    /** @var  int */
    public $id_convenio_marco;

    /** @var  int */
    public $id_estado;

    /** @var  int */
    public $id_forma;

    /** @var  int */
    public $id_objeto;

    /** @var  int */
    public $id_responsable;

    /** @var  int */
    public $id_tipo_entidad;

    /** @var  double */
    public $importe;

    /** @var Objeto */
    public $objeto;

    /** @var  string */
    public $organica;

    /** @var Persona */
    public $responsable;

    /** @var Tipo */
    public $tipo_entidad;

    /** @var  string */
    public $titulo;

    /**
     * @param string $condicion
     * @return bool
     */
    public function LoadJoined($condicion)
    {
        if ($this->Load($condicion)) {
            $this->getEntidades();
            if ($this->id_estado) {
                $this->estado = new Estado();
                $this->estado->Load("id = $this->id_estado");
            }
            if ($this->id_forma) {
                $this->forma = new Forma();
                $this->forma->Load("id = $this->id_forma");
            }

            if ($this->id_objeto) {
                $this->objeto = new Objeto();
                $this->objeto->Load("id = $this->id_objeto");
            }
            if ($this->id_responsable) {
                $this->responsable = new Persona();
                $this->responsable->Load("id = $this->id_responsable");
            }
            if ($this->id_tipo_entidad) {
                $this->tipo_entidad = new Tipo();
                $this->tipo_entidad->Load("id = $this->id_tipo_entidad");
            }
            if ($this->id_convenio_marco) {
                $this->convenio_marco = new Convenio();
                $this->convenio_marco->Load("id = $this->id_convenio_marco");
            }

            return true;
        }

        return false;
    }

    /**
     * @param string $condicion
     * @return Convenio[]|bool
     */
    public function FindJoined($condicion)
    {
        $convenios = $this->Find($condicion);
        if (is_array($convenios)) {
            foreach ($convenios as $convenio) {
                if ($convenio->id_estado) {
                    $convenio->estado = new Estado();
                    $convenio->estado->Load("id = $convenio->id_estado");
                }
                if ($convenio->id_convenio_marco) {
                    $convenio->convenio_marco = new Convenio();
                    $convenio->convenio_marco->Load("id = $convenio->id_convenio_marco");
                }
                if ($convenio->id_responsable) {
                    $convenio->responsable = new Persona();
                    $convenio->responsable->Load("id = $convenio->id_responsable");
                }
                if ($convenio->id_tipo_entidad) {
                    $convenio->tipo_entidad = new Tipo();
                    $convenio->tipo_entidad->Load("id = $convenio->id_tipo_entidad");
                }
            }

            return $convenios;
        } else {

            return false;
        }
    }

    /**
     * @return Convenio[]|bool
     */
    public function FindChildren()
    {
        $convenios = $this->Find("id_convenio_marco = $this->id ORDER BY fecha_firma");

        return $convenios;
    }

    public function getEntidades()
    {
        $convenio_entidad = new ConvenioEntidad();
        $convenios_entidades = $convenio_entidad->Find("id_convenio = $this->id");
        foreach ($convenios_entidades as $convenio_entidad) {
            $entidad = new Entidad();
            $entidad->LoadJoined("id = $convenio_entidad->id_entidad");
            $this->entidades[] = $entidad;
        }
    }

}