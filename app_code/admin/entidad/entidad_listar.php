<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

$search = "";
if (filter_has_var(INPUT_POST, "search")) {
    $search = filter_input(INPUT_POST, "search", FILTER_SANITIZE_STRING);
    $condicion = "nombre LIKE '%$search%' OR cif LIKE '%$search%'";
    print $condicion;
} else {
    $condicion = "id > 0";
}
$condicion .= " ORDER BY nombre";

$entidad = new Entidad();
$entidades = $entidad->FindJoined($condicion);
$app->smarty->assign('entidades', $entidades);
$app->smarty->assign('search', $search);
