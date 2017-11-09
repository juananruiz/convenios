<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;

if (filter_has_var(INPUT_POST, "busqueda")) {
    $busqueda = filter_input_array(INPUT_POST, "busqueda", FILTER_SANITIZE_STRING);
    $condicion = "titulo LIKE '%$busqueda%'";;
} else {
    $condicion = "id > 0";
}

$convenio = new Convenio();
$convenios = $convenio->Find($condicion);
$app->smarty->assign('convenios', $convenios);