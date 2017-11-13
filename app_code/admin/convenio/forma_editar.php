<?php

global $app;

use UniSevilla\Convenios\Convenio\Forma;

if (filter_has_var(INPUT_GET, 'id')) {
    $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $forma = new Forma();
    if ($forma->Load("id=$id")) {
        $app->smarty->assign('forma', $forma);
    } else {

        header("location:index.php?page=error/error&text='Identificador no valido'");
    }
} else {

    header("location:index.php?page=error/error&text='Se necesita un identificador'");
}