<?php

global $app;

use UniSevilla\Convenios\Convenio\Convenio;

$convenio = new Convenio();
$convenio->created_at = date("Y-m-d H:i:s");
$convenio->save();
header("location:index.php?page=admin/convenio/convenio_editar&id=$convenio->id");
