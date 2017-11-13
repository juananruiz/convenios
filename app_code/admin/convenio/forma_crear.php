<?php

global $app;

use UniSevilla\Convenios\Convenio\Forma;

$forma = new Forma();
$forma->created_at = date("Y-m-d H:i:s");
$forma->save();
header("location:index.php?page=admin/convenio/forma_editar&id=$forma->id");
