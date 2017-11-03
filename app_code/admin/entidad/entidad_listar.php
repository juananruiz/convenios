<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

$entidad = new Entidad();
$entidades = $entidad->Find("id > 0");
$app->smarty->assign('entidades', $entidades);
