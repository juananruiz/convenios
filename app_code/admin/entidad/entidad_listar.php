<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

$entidad = new Entidad();
$entidades = $entidad->FindJoined("id > 0");
$app->smarty->assign('entidades', $entidades);
