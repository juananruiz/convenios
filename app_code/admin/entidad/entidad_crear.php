<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

$entidad = new Entidad();
$entidad->save();
header("location:index.php?page=admin/entidad/entidad_editar&id=$entidad->id");
