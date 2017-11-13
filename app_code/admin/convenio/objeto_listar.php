<?php

global $app;

use UniSevilla\Convenios\Convenio\Objeto;

$objeto = new Objeto();
$objetos = $objeto->Find("id > 0 ORDER BY nombre");
$app->smarty->assign('objetos', $objetos);