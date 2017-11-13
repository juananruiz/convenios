<?php

global $app;

use UniSevilla\Convenios\Convenio\Forma;

if (filter_has_var(INPUT_POST, 'id')) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $forma = new Forma();
    $forma->Load("id = $id");
    $forma->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $forma->save();

    header("location:index.php?page=admin/convenio/forma_listar&id=$forma->id");
}
