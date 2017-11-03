<?php

namespace UniSevilla\Convenios\Convenio;

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

    /** @var \DateTime */
    public $created_at;

    /** @var  string */
    public $economica;

    /** @var  int */
    public $ejercicio;

    /** @var bool */
    public $es_ingreso;

    /** @var bool */
    public $es_gasto;

    /** @var  bool */
    public $es_prorrogable;

    /** @var Estado */
    public $estado;

    /** @var  \DateTime */
    public $fecha_fin;

    /** @var  \DateTime */
    public $fecha_firma;

    /** @var Formalizacion */
    public $formalizacion;

    /** @var  int */
    public $id_convenio_marco;

    /** @var  int */
    public $id_estado;

    /** @var  int */
    public $id_formalizacion;

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
            $estado = new Estado();
            if($estado->Load("id = $this->id_estado")){
                $this->estado = $estado;
            }

            $formalizacion = new Formalizacion();
            if ($formalizacion->Load("id = $this->id_formalizacion")) {
                $this->formalizacion = $formalizacion;
            }

            $objeto = new Objeto();
            if ($objeto->Load("id = $this->id_objeto")) {
                $this->objeto = $objeto;
            }

            $responsable = new Persona();
            if ($responsable->Load("id = $this->id_responsable")) {
                $this->responsable = $responsable;
            }

            $tipo_entidad = new Tipo();
            if ($tipo_entidad->Load("id = $this->tipo_entidad")) {
                $this->tipo_entidad = $tipo_entidad;
            }

            $convenio_marco = new Convenio();
            if ($convenio_marco->Load("id = $this->id_convenio_marco")) {
                $this->convenio_marco = $convenio_marco;
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
        $registros = $this->Find($condicion);
        if (is_array($registros)) {
            foreach ($registros as $registro) {
                $estado = new Estado();
                $estado->Load("id = $registro->id_estado");
                if ($estado->Load("id = $registro->id_estado")) {
                    $registro->estado = $estado;
                }
                $convenio = new Convenio();
                if ($registro->id_convenio_marco
                    && $convenio->Load("id = $registro->id_convenio_marco")) {
                    $registro->convenio_marco = $convenio;
                }
                $persona = new Persona();
                if ($persona->Load("id = $registro->id_responsable")) {
                    $registro->responsable = $persona;
                }

                $tipo_entidad = new Tipo();
                if ($tipo_entidad->Load("id = $registro->tipo_entidad")) {
                    $registro->tipo_entidad = $tipo_entidad;
                }
            }

            return $registros;
        } else {

            return false;
        }
    }


}