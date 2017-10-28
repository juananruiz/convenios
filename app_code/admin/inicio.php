<?php

global $app;

$persona= new UniSevilla\Convenios\Persona\Persona();
$personas = $persona->Find("WHERE nombre IS NOT NULL ORDER BY nombre");
$app->smarty->assign('personas', $personas);