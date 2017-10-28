<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;
use UniSevilla\Convenios\Persona\Rol;

$rol = new Rol();
$roles = $rol->Find("id > 0");
$app->smarty->assign('roles', $roles);


$persona = new Persona();
$personas = $persona->Find("id > 0");
$app->smarty->assign('personas', $personas);