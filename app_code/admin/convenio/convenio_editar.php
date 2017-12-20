<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;
use UniSevilla\Convenios\Convenio\Estado;
use UniSevilla\Convenios\Convenio\Forma;
use UniSevilla\Convenios\Convenio\Objeto;
use UniSevilla\Convenios\Entidad\Tipo;
use UniSevilla\Convenios\Fichero\Fichero;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    if ($id < 1) {
        header("location:index.php?page=error/error404&text='Identificador no valido'");
    }
    $convenio = new Convenio();
    if ($convenio->Load("id=$id")){
        $app->smarty->assign('convenio', $convenio);

        $forma = new Forma();
        $formas = $forma->Find("id > 0");
        $app->smarty->assign('formas', $formas);

        $objeto = new Objeto();
        $objetos = $objeto->Find("id > 0");
        $app->smarty->assign('objetos', $objetos);

        $estado = new Estado();
        $estados = $estado->Find("id > 0");
        $app->smarty->assign('estados', $estados);

        $tipo_entidad = new Tipo();
        $tipos_entidades = $tipo_entidad->Find("id > 0");
        $app->smarty->assign('tipos_entidades', $tipos_entidades);

        $marco = new Convenio();
        $marcos = $marco->Find("id != $id AND id_convenio_marco =''");
        $app->smarty->assign('marcos', $marcos);

        $responsable = new \UniSevilla\Convenios\Persona\Persona();
        $responsables = $responsable->Find("id > 0");
        $app->smarty->assign('responsables', $responsables);

        $fichero = new Fichero();
        $ficheros = $fichero->Find("id_contenedor= $id AND tipo_contenedor = 'Convenio'");
        $app->smarty->assign('ficheros', $ficheros);
    } else {

        header("location:index.php?page=error/error404&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error404&text='Se necesita un identificador'");
}
