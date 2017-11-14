<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;

if (filter_has_var(INPUT_POST, 'id')) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $convenio = new Convenio();
    $convenio->Load("id = $id");
    $convenio->titulo = filter_input(INPUT_POST, 'titulo', FILTER_SANITIZE_STRING);
    $convenio->organica = filter_input(INPUT_POST, 'organica', FILTER_SANITIZE_STRING);
    $convenio->importe = filter_input(INPUT_POST, 'importe', FILTER_SANITIZE_STRING);
    $convenio->es_ingreso = filter_input(INPUT_POST, 'es_ingreso', FILTER_SANITIZE_STRING);
    $convenio->es_gasto = filter_input(INPUT_POST, 'es_gasto', FILTER_SANITIZE_STRING);
    $convenio->es_prorrogable = filter_input(INPUT_POST, 'es_prorrogable', FILTER_SANITIZE_STRING);
    $convenio->economica = filter_input(INPUT_POST, 'economica', FILTER_SANITIZE_STRING);
    $convenio->fecha_fin = filter_input(INPUT_POST, 'fecha_fin', FILTER_SANITIZE_STRING);
    $convenio->ejercicio = filter_input(INPUT_POST, 'ejercicio', FILTER_SANITIZE_STRING);
    $convenio->fecha_firma = filter_input(INPUT_POST, 'fecha_firma', FILTER_SANITIZE_STRING);
    $convenio->id_forma = filter_input(INPUT_POST, 'id_forma', FILTER_SANITIZE_NUMBER_INT);
    $convenio->id_estado = filter_input(INPUT_POST, 'id_estado', FILTER_SANITIZE_NUMBER_INT);
    $convenio->id_objeto = filter_input(INPUT_POST, 'id_objeto', FILTER_SANITIZE_NUMBER_INT);
    $convenio->id_tipo_entidad = filter_input(INPUT_POST, 'id_tipo_entidad', FILTER_SANITIZE_NUMBER_INT);
    $convenio->id_responsable = filter_input(INPUT_POST, 'id_responsable', FILTER_SANITIZE_NUMBER_INT);
    $convenio->id_convenio_marco = filter_input(INPUT_POST, 'id_convenio_marco', FILTER_SANITIZE_NUMBER_INT);
    $convenio->save();


    header("location:index.php?page=convenio/convenio_mostrar&id=$convenio->id");
}
