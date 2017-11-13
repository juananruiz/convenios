<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

if (filter_has_var(INPUT_POST, "busqueda")) {
    $busqueda = filter_input(INPUT_POST, "busqueda", FILTER_SANITIZE_STRING);
    $condicion = "nombre LIKE '%$busqueda%' OR cif LIKE '%busqueda%'";
    print $condicion;
} else {
    $condicion = "id > 0";
}
$condicion .= " ORDER BY nombre DESC";

$entidad = new Entidad();
$entidades = $entidad->FindJoined($condicion);
$app->smarty->assign('entidades', $entidades);
