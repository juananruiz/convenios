<?php

global $app;

use UniSevilla\Convenios\Convenio\Objeto;

$objeto = new Objeto();
$objeto->created_at = date("Y-m-d H:i:s");
$objeto->save();
header("location:index.php?page=admin/convenio/objeto_editar&id=$objeto->id");
