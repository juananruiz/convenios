<?php

global $app;

use UniSevilla\Convenios\Convenio\Objeto;

$objeto = new Objeto();
$objetos = $objeto->Find("id > 0");
$app->smarty->assign('objetos', $objetos);