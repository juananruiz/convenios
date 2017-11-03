<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;
use UniSevilla\Convenios\Convenio\Estado;
use UniSevilla\Convenios\Convenio\Formalizacion;
use UniSevilla\Convenios\Convenio\Objeto;
use UniSevilla\Convenios\Entidad\Tipo;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $convenio = new Convenio();
    if ($convenio->Load("id=$id")){
        $app->smarty->assign('convenio', $convenio);

        $formalizacion = new Formalizacion();
        $formalizaciones = $formalizacion->Find("id > 0");
        $app->smarty->assign('formalizaciones', $formalizaciones);

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
        $marcos = $marco->Find("id != $id AND id_convenio_marco IS null");
        $app->smarty->assign('marcos', $marcos);

        $responsable = new \UniSevilla\Convenios\Persona\Persona();
        $responsables = $responsable->Find("id > 0");
        $app->smarty->assign('responsables', $responsables);


    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}
