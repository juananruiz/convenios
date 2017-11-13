<?php


namespace UniSevilla\Convenios\Entidad;


class Entidad extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'Entidad';

    /** @var  string */
    public $cif;

    /** @var \DateTime */
    public $created_at;

    /** @var  int */
    public $id;

    /** @var  int */
    public $id_tipo_entidad;

    /** @var  string */
    public $nombre;

    /** @var  Tipo */
    public $tipo;


    /**
     * @param string $condicion
     * @return bool
     */
    public function LoadJoined($condicion)
    {
        if ($this->Load($condicion)) {
            $this->tipo = new Tipo();
            $this->tipo->Load("id = $this->id_tipo_entidad");

            return true;
        }

        return false;
    }

    /**
     * @param string $condicion
     * @return Entidad[]|bool
     */
    public function FindJoined($condicion)
    {
        $entidades = $this->Find($condicion);
        if (is_array($entidades)) {
            foreach ($entidades as $entidad) {
                $entidad->tipo = new Tipo();
                $entidad->tipo->Load("id = $entidad->id_tipo_entidad");
            }

            return $entidades;
        }

        return false;
    }

}