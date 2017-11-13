<?php

global $app;

use UniSevilla\Convenios\Convenio\Forma;

$forma = new Forma();
$formas = $forma->Find("id > 0 ORDER BY nombre");
$app->smarty->assign('formas', $formas);