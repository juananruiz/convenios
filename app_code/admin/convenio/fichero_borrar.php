<?php

global $app;

use UniSevilla\Convenios\Fichero\Fichero;


if (filter_has_var(INPUT_POST, 'id_fichero')) {
    $id_fichero = filter_input(INPUT_POST, 'id_fichero', FILTER_SANITIZE_NUMBER_INT);
    $fichero = new Fichero;
    $fichero->Load("id = $id_fichero");
    $fichero->Delete();
    $aviso = "borrado_correcto";

    header("location:index.php?page=admin/convenio/convenio_listar&aviso=$aviso");
} else {
    $error = "faltan_parametros";

    header("location:index.php?page=admin/convenio/convenio_listar&error=$error");
}
