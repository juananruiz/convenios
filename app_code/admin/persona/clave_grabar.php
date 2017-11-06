<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_POST, 'id') AND filter_has_var(INPUT_POST, 'clave')) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $clave = filter_input(INPUT_POST, 'clave', FILTER_SANITIZE_STRING);
    $persona = new Persona();
    $persona->Load("id = $id");
    $hash = password_hash($clave, PASSWORD_BCRYPT);
    $persona->clave = $hash;
    $persona->Save();

    header("location:index.php?page=admin/persona/persona_listar");
} else {

    header("location:index.php?page=admin/persona/persona_listar");
}

