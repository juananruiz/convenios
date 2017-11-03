<?php

global $app;

use UniSevilla\Convenios\Convenio\Objeto;

if (filter_has_var(INPUT_POST, 'id')) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $objeto = new Objeto();
    $objeto->Load("id = $id");
    $objeto->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $objeto->save();

    header("location:index.php?page=admin/convenio/objeto_listar&id=$objeto->id");
}
