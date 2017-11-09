<?php

// Canta los errores por soleares
ini_set('display_errors', '1');
error_reporting(E_ALL);

require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../app_config.php';
//require_once __DIR__ . '/../app_version.php';
require_once('../vendor/adodb/adodb-php/adodb-active-record.inc.php');
include("../vendor/adodb/adodb-php/adodb-exceptions.inc.php");

use UniSevilla\Convenios\App;
use UniSevilla\Convenios\Persona\Persona;

$app = new App();
$app->adodb = ADONewConnection('pdo');
$app->adodb->Connect('sqlite:' . __DIR__ . '/../convenios.db');
ADODB_Active_Record::SetDatabaseAdapter($app->adodb);

date_default_timezone_set('Europe/Madrid');
setlocale(LC_ALL, 'es_ES.UTF-8');

session_start();
// Lanzamos y configuramos smarty
$app->smarty = new \Smarty();
$app->smarty->setTemplateDir('../app_code');
$app->smarty->setCompileDir('../var/templates_c');
$app->smarty->setConfigDir('../intl');
if (isset($_SESSION['idioma'])) {
    $app->idioma = $_SESSION['idioma'];
} else {
    $app->idioma = "spanish";
}
$app->smarty->assign('_idioma', $app->idioma);
$app->smarty->clearConfig();
$app->smarty->configLoad($app->idioma . '.conf');

if (filter_has_var(INPUT_GET, 'page')) {
    $app->page = filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING);
} else {
    $app->page = 'inicio';
}

if (isset($_SESSION['usuario'])) {
    $condicion = "id = '" . $_SESSION['usuario']->id . "'";
    $app->usuario = new Persona();
    $app->usuario->Load($condicion);
    $app->smarty->assign('_usuario', $app->usuario);
}

if (strpos($app->page, 'admin') === 0 AND !isset($_SESSION['usuario'])) {
    header("location:index.php?page=persona/login");
    exit();
}

// Carga la página solicitada ($_GET['page']) o la pagina por defecto ('inicio' en nuestro caso)
if (file_exists("../app_code/" . $app->page . ".php")) {
    require_once("../app_code/" . $app->page . ".php");
} else if (file_exists("../app_code/" . $app->page . ".tpl")) {
    $app->plantilla = $app->page . ".tpl";
} else if (file_exists("../app_code/" . $app->page . "/inicio.php")) {
    require_once("../app_code/" . $app->page . "/inicio.php");
    $app->page = $app->page . "/inicio";
//    $app->plantilla = $app->page . ".tpl";
} else if (file_exists("../app_code/" . $app->page . "/inicio.tpl")) {
    $app->plantilla = $app->page . "/inicio.tpl";
} else if (strpos($app->page, 'admin/') === 0) {
    $app->plantilla = "admin/error404.tpl";
} else {
    $app->plantilla = "error/error404.tpl";
}
// Si tras cargar el controlador no tenemos plantilla intentamos cargar por defecto
// una que se llame como el controlador, si no, vamos a error
if ($app->plantilla == '') {
    $app->plantilla = $app->page . ".tpl";
}
if (!file_exists("../app_code/" . $app->plantilla)) {
    $app->plantilla = "error/error404.tpl";
}
$app->smarty->assign('_page', $app->page);

// Avisos y errores
if (isset($_GET['aviso'])) {
    $app->smarty->assign('aviso', $_GET['aviso']);
}
if (isset($_GET['error'])) {
    $app->smarty->assign('error', $_GET['error']);
}

$app->smarty->display('../app_code/' . $app->plantilla);

