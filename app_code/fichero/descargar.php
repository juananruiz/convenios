<?php

global $app;

use UniSevilla\Convenios\Fichero\Fichero;

if (filter_has_var(INPUT_GET, "id")) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $fichero = new Fichero();
    $fichero->Load("id = $id");
    if (!$fichero->es_privado || $app->usuario->rol->nombre = 'admin') {
        $ruta_completa = DIR_BASE . "/private/$fichero->tipo_contenedor/$fichero->id_contenedor/$fichero->nombre";
        header('Content-Description: File Transfer');
        $tipo_mime = Fichero::mime($fichero->nombre);
        header("Content-Type: $tipo_mime");
        header('Content-Disposition: attachment; filename=' . basename($ruta_completa));
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        header('Content-Length: ' . filesize($ruta_completa));
        readfile($ruta_completa);
    } else {
        $error = "No tiene permiso para descargar este fichero";
    }
}
