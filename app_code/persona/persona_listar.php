<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_POST, "search")) {
    $search = filter_input(INPUT_POST, "search", FILTER_SANITIZE_STRING);
    $condicion = "nombre LIKE '%$search%' OR apellidos LIKE '%$search%'";
} else {
    $condicion = "id > 0";
}
$condicion .= " ORDER BY apellidos";


$persona = new Persona();
$personas = $persona->FindJoined($condicion);
$app->smarty->assign('personas', $personas);
