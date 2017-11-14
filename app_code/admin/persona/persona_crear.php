<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

$persona = new Persona();
$persona->id_rol = 1;
$persona->id_entidad = 1;
$persona->fecha_alta = date("Y-m-d H:i:s");
$persona->save();
header("location:index.php?page=admin/persona/persona_editar&id=$persona->id");

