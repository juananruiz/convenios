<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

$persona = new Persona();
$personas = $persona->Find("id > 0");
$app->smarty->assign('personas', $personas);