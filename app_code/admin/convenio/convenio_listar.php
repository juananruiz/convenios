<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;

$search = '';
$condicion = "id > 0";
if (filter_has_var(INPUT_POST, "search")) {
    $search = filter_input(INPUT_POST, "search", FILTER_SANITIZE_STRING);
    $condicion = "titulo LIKE '%$search%'";
}
$condicion .= " ORDER BY fecha_firma DESC";

$convenio = new Convenio();
$convenios = $convenio->FindJoined($condicion);
$app->smarty->assign('convenios', $convenios);
$app->smarty->assign('search', $search);