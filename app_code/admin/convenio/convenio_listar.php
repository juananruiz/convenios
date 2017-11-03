<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;

$convenio = new Convenio();
$convenios = $convenio->Find("id > 0");
$app->smarty->assign('convenios', $convenios);