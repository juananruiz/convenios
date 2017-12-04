<?php

namespace UniSevilla\Convenios\Fichero;

class Fichero extends \ADODB_Active_Record
{
    /** @var  string */
    public $_table = 'Fichero';

    /** @var int */
    public $id;

    /** @var  \DateTime */
    public $created_at;

    /** @var string */
    public $descripcion;

    /** @var int */
    public $es_privado;

    /** @var int */
    public $id_contenedor;

    /** @var array(string) */
    public $extensiones_permitidas;

    /** @var string */
    public $nombre;

    public function __construct()
    {
        parent::__construct();
        $this->extensiones_permitidas = array('doc', 'docx', 'gif', 'jpeg', 'jpg', 'odt', 'pdf', 'png');
    }

    public function subir($ficheros)
    {
        $extension = pathinfo($ficheros['file']['name'], PATHINFO_EXTENSION);
        if (!in_array(strtolower($extension), $this->extensiones_permitidas)) {

            return false;
        }

        if (move_uploaded_file($ficheros['file']['tmp_name'], __DIR__ . '/private/' . $this->id_contenedor . '/' . $ficheros['file']['name'])) {

            return true;
        }

        return false;
    }

}