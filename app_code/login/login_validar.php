<?php

global $app;

use UniSevilla\Convenios\Persona\Persona;

if (filter_has_var(INPUT_POST, 'correo') && filter_has_var(INPUT_POST, 'clave')) {
    $persona = new Persona();
    $correo = filter_input(INPUT_POST, 'correo', FILTER_SANITIZE_EMAIL);
    $clave = filter_input(INPUT_POST, 'clave', FILTER_SANITIZE_STRING);
    $condicion = "correo = '" . $correo . "' AND id_rol > 1";
    if ($persona->Load($condicion) AND password_verify($clave, $persona->clave)) {
        $persona->ultimo_inicio_sesion = date('Y-m-d H:i:s');
        $persona->Save();
        $_SESSION['usuario'] = $persona;
        header("location: index.php?page=inicio");
        exit();
    } else {

        header("location: index.php?page=login/login&error=acceso_incorrecto");
        exit();
    }
} else {

    header("location: index.php?page=login/login&error=faltan_datos");
    exit();
}