<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_POST, 'id')) {
    $id = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $persona = new Persona();
    $persona->Load("id = $id");
    $persona->apellidos = filter_input(INPUT_POST, 'apellidos', FILTER_SANITIZE_STRING);
    $persona->correo = filter_input(INPUT_POST, 'correo', FILTER_SANITIZE_STRING);
    $persona->id_rol = filter_input(INPUT_POST, 'id_rol', FILTER_SANITIZE_NUMBER_INT);
    $persona->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
    $persona->sexo = filter_input(INPUT_POST, 'sexo', FILTER_SANITIZE_STRING);
    $persona->destino = filter_input(INPUT_POST, 'destino', FILTER_SANITIZE_STRING);
    $persona->telefono = filter_input(INPUT_POST, 'telefono', FILTER_SANITIZE_STRING);
    $persona->nif = filter_input(INPUT_POST, 'nif', FILTER_SANITIZE_STRING);
    $persona->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $persona->fecha_modificacion = date("Y-m-d H:i:s");
    $persona->save();

    header("location:index.php?page=admin/persona/persona_listar");
}
