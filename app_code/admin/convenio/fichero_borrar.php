<?php

global $app;

use UniSevilla\Convenios\Fichero\Fichero;

if (filter_has_var(INPUT_GET, 'id')) {
    $id_fichero = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $fichero = new Fichero;
    $fichero->Load("id = $id_fichero");
    $fichero->borrar();
    $claseContenedor = $fichero->tipo_contenedor;
    $contenedor = strtolower($claseContenedor);
    $id_contenedor = $fichero->id_contenedor;
    $aviso = "borrado_correcto";
    //Reenviamos a la edicion del contenedor
    header("location:index.php?page=admin/$contenedor/${contenedor}_editar&id=$id_contenedor&aviso=$aviso");
} else {
    $error = "faltan_parametros";

    header("location:index.php?page=admin/convenio/convenio_listar&error=$error");
}
