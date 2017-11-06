<?php

global $app;

use UniSevilla\Convenios\Entidad\Entidad;

$entidad = new Entidad();
$entidad->created_at = date("Y-m-d H:i:s");
$entidad->save();
header("location:index.php?page=admin/entidad/entidad_editar&id=$entidad->id");
