<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $persona = new Persona();
    $persona->Load("id = $id");
    $app->smarty->assign("persona", $persona);
} else {

    header("location:index.php?page=admin/persona/persona_listar");
}
