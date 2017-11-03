<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    if ($entidad->Load("id=$id")) {
        $app->smarty->assign('entidad', $entidad);
        $tipo = new \UniSevilla\Convenios\Entidad\Tipo();
        $tipos = $tipo->Find("id > 0");
        $app->smarty->assign('tipos', $tipos);
    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}