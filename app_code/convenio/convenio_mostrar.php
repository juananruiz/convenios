<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;
use UniSevilla\Convenios\Fichero\Fichero;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $convenio = new Convenio();
    if ($convenio->LoadJoined("id=$id")) {
        $app->smarty->assign('convenio', $convenio);
        if ($children = $convenio->FindChildren()) {
            $app->smarty->assign('children', $children);
        }

        $fichero = new Fichero();
        $ficheros = $fichero->Find("id_contenedor= $id AND tipo_contenedor = 'Convenio'");
        $app->smarty->assign('ficheros', $ficheros);

    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}
