<?php

global $app;

use UniSevilla\Convenios\Convenio\ConvenioEntidad;

if (filter_has_var(INPUT_POST, 'id_convenio')
    && filter_has_var(INPUT_POST, 'id_entidad')) {
    $convenio_entidad = new ConvenioEntidad();
    $convenio_entidad->id_convenio = filter_input(INPUT_POST, 'id_convenio', FILTER_SANITIZE_NUMBER_INT);
    $convenio_entidad->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $convenio_entidad->save();

    header("location:index.php?page=admin/convenio/convenio_editar&id=$convenio_entidad->id_convenio#entidades");
    exit();
}

header("location:index.php?page=admin/convenio/convenio_listar");
exit();
