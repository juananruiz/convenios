<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $persona = new Persona();
    if ($persona->Load("id = $id")) {
        $app->smarty->assign('persona', $persona);
        $entidad = new \UniSevilla\Convenios\Entidad\Entidad();
        $entidades = $entidad->Find("id > 0");
        $app->smarty->assign('entidades', $entidades);
    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}
