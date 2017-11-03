<?php

global $app;

use UniSevilla\Convenios\Convenio\Objeto;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $objeto = new Objeto();
    if ($objeto->Load("id=$id")) {
        $app->smarty->assign('objeto', $objeto);
    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}