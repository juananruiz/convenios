<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;
use UniSevilla\Convenios\Persona\Persona;
use UniSevilla\Convenios\Persona\Rol;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $persona = new Persona();
    if ($persona->Load("id = $id")) {
        $app->smarty->assign('persona', $persona);
        $entidad = new Entidad();
        $entidades = $entidad->Find("id > 0 ORDER BY nombre");
        $app->smarty->assign('entidades', $entidades);
        $rol = new Rol();
        $roles = $rol->Find("id > 0 ORDER BY id");
        $app->smarty->assign('roles', $roles);
    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}
