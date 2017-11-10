<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_POST, "busqueda")) {
    $busqueda = filter_input(INPUT_POST, "busqueda", FILTER_SANITIZE_STRING);
    $condicion = "nombre LIKE '%$busqueda%' OR apellidos LIKE '%$busqueda%'";
} else {
    $condicion = "id > 0";
}
$condicion .= " ORDER BY apellidos";


$persona = new Persona();
$personas = $persona->FindJoined($condicion);
$app->smarty->assign('personas', $personas);
