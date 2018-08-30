<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;
use UniSevilla\Convenios\Fichero\Fichero;

if (filter_has_var(INPUT_POST, 'id_convenio')) {
    $id_convenio = filter_input(INPUT_POST, 'id_convenio', FILTER_SANITIZE_NUMBER_INT);
    $fichero = new Fichero;

    if (filter_has_var(INPUT_POST, 'id_fichero')) {
        // Editando un fichero existente
        $id_fichero = filter_input(INPUT_POST, 'id_fichero', FILTER_SANITIZE_NUMBER_INT);
        $fichero->Load("id = $id_fichero");
    } else {
        $convenio = new Convenio();
        $convenio->Load("id = $id_convenio");
        $fichero->created_at = date("Y-m-d H:i:s");
        $fichero->tipo_contenedor = 'Convenio';
        $fichero->id_contenedor = $id_convenio;
        // Gestiona la subida del fichero al servidor
        $fichero_subido = $_FILES['fichero'];
        if (!$fichero->subir($fichero_subido, $convenio)) {
            $error = "no_se_ha_podido_subir_el_fichero";

            header("location:index.php?page=admin/convenio/convenio_editar&id=$id_convenio&error=$error");
        }
    }

    $fichero->descripcion = filter_input(INPUT_POST, 'descripcion', FILTER_SANITIZE_STRING);
    $fichero->es_privado = filter_input(INPUT_POST, 'es_privado', FILTER_SANITIZE_STRING);
    $fichero->save();

    header("location:index.php?page=admin/convenio/convenio_editar&id=$id_convenio#ficheros");
} else {
    $error = "faltan_parametros";

    header("location:index.php?page=admin/convenio/convenio_listar&error=$error");
}
