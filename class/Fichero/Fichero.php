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

    /** @var string */
    public $tipo_contenedor;


    public function __construct()
    {
        parent::__construct();
        $this->extensiones_permitidas = array('doc', 'docx', 'gif', 'jpeg', 'jpg', 'odt', 'pdf', 'png');
    }

    public function subir($fichero, $contenedor)
    {
        // Comprobar extensión
        $extension = pathinfo($fichero['name'], PATHINFO_EXTENSION);
        if (!in_array(strtolower($extension), $this->extensiones_permitidas)) {

            return false;
        }
        // Preparar carpeta
        $ruta = $this->prepararCarpetaDestino($contenedor); //TODO:comprobar que devuelve para capturar errores
        // Limpiar y setear nombre
        $this->nombre = $this->setNombre($fichero['name']);

        // Mover fichero a ubicación final
        if (move_uploaded_file($fichero['tmp_name'], $ruta . $this->nombre)) {

            return true;
        }

        return false;
    }

    public function prepararCarpetaDestino($contenedor)
    {
        $tipo_contenedor = get_class($contenedor);
        $tipo_contenedor = substr($tipo_contenedor, strrpos($tipo_contenedor, '\\') + 1);
        $ruta = DIR_BASE . "/private/$tipo_contenedor/$contenedor->id/";

        if (!is_dir($ruta)) {
            mkdir($ruta, 0755, true);
        }

        return $ruta;
    }

    public function setNombre($nombre)
    {
        $nombre = strtolower(preg_replace('/[^\w\._]+/', '', $nombre));
        $this->nombre = $nombre;

        return $nombre;
    }
}
