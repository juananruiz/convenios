<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

if (filter_has_var(INPUT_POST, 'id')) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->Load("id = $id");
    $entidad->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $entidad->cif = filter_input(INPUT_POST, 'cif', FILTER_SANITIZE_STRING);
    $entidad->id_tipo_entidad = filter_input(INPUT_POST, 'id_tipo_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad->save();

    header("location:index.php?page=admin/entidad/entidad_listar");
}
