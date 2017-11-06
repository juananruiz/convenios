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

}