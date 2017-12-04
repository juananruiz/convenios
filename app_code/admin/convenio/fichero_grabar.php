<?php

global $app;

use UniSevilla\Convenios\Fichero\Fichero;

if (filter_has_var(INPUT_POST, 'id_convenio')) {
    $id_convenio = filter_input(INPUT_POST, 'id_convenio', FILTER_SANITIZE_NUMBER_INT);
    $fichero = new Fichero;

    if (filter_has_var(INPUT_POST, 'id_fichero')) {
        $id_fichero = filter_input(INPUT_POST, 'id_fichero', FILTER_SANITIZE_NUMBER_INT);
        $fichero->Load("id = $id_fichero");
    } else {
        $fichero->created_at = date("Y-m-d H:i:s");
        // Gestiona la subida del fichero al servidor
        // ...
        $fichero->nombre = "";
        $fichero->id_contenedor = $id_convenio;
    }
    $fichero->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_SANITIZE_STRING);
    $fichero->es_privado = filter_input(INPUT_POST, 'es_privado', FILTER_SANITIZE_STRING);
    $fichero->save();

    header("location:index.php?page=admin/convenio/convenio_editar&id=$convenio->id");
}
