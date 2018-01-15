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

    public static function mime($nombre_fichero)
    {
        $coincidencias = array();
        if (preg_match('/\w+$/', $nombre_fichero, $coincidencias)) {
            $map = array('au' => 'audio/basic',
                'avi' => 'video/avi',
                'bmp' => 'image/bmp',
                'bz2' => 'application/x-bzip2',
                'css' => 'text/css',
                'dtd' => 'application/xml-dtd',
                'doc' => 'application/msword',
                'gif' => 'image/gif',
                'gz' => 'application/x-gzip',
                'hqx' => 'application/mac-binhex40',
                'html?' => 'text/html',
                'jar' => 'application/java-archive',
                'jpe?g' => 'image/jpeg',
                'js' => 'application/x-javascript',
                'midi' => 'audio/x-midi',
                'mp3' => 'audio/mpeg',
                'mpe?g' => 'video/mpeg',
                'ogg' => 'audio/vorbis',
                'pdf' => 'application/pdf',
                'png' => 'image/png',
                'ppt' => 'application/vnd.ms-powerpoint',
                'ps' => 'application/postscript',
                'qt' => 'video/quicktime',
                'ram?' => 'audio/x-pn-realaudio',
                'rdf' => 'application/rdf',
                'rtf' => 'application/rtf',
                'sgml?' => 'text/sgml',
                'sit' => 'application/x-stuffit',
                'svg' => 'image/svg+xml',
                'swf' => 'application/x-shockwave-flash',
                'tgz' => 'application/x-tar',
                'tiff' => 'image/tiff',
                'txt' => 'text/plain',
                'wav' => 'audio/wav',
                'xls' => 'application/vnd.ms-excel',
                'xml' => 'application/xml',
                'zip' => 'application/x-zip-compressed'
            );
            foreach ($map as $key => $value) {
                if (preg_match('/' . $key . '/', strtolower($coincidencias[0]))) {
                    return $value;
                }
            }
        }
        return 'application/octet-stream';
    }
}
