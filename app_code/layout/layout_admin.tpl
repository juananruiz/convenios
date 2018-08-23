<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{#SiteDescription#}">
    <link rel="shortcut icon" href="favicon.ico">
    <title>{#SiteTitle#} - {#SiteOrganization#}</title>
    {block name=css}
        <link href="assets/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/fontawesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link href="assets/css/coreui.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/convenios.css" rel="stylesheet" type="text/css">
    {/block}
</head>

<body class="app header-fixed sidebar-fixed">
<header class="app-header navbar">
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">☰</button>
    <a class="navbar-brand" href="index.php"></a>
    <h1>{#SiteTitle#}</h1>
    <ul class="nav navbar-nav float-xs-right hidden-md-down">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle nav-link" data-toggle="dropdown" href="#" aria-haspopup="true"
               aria-expanded="false">
                <img src="assets/img/{$_usuario->sexo}.png" class="img-avatar" alt="">
                <span class="hidden-md-down">{$_usuario->nombre}</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="index.php?page=admin/persona/persona_editar&id={$_usuario->id}"><i
                            class="fa fa-user"></i> {#Profile#}</a>
                <a class="dropdown-item" href="index.php?page=login/logout"><i class="fa fa-lock"></i> {#Logout#}
                </a>
            </div>
        </li>
    </ul>
</header>
<div class="app-body">
    <div class="sidebar d-print-none navbar">
        <nav class="sidebar-nav">

            <ul class="nav">
                <li class="nav-title">{#Query#}</li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=convenio/convenio_listar"><i
                                class="icon-docs"></i>{#Conventions#}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=entidad/entidad_listar"><i
                                class="icon-home"></i>{#Entities#}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=persona/persona_listar"><i
                                class="icon-people"></i> {#People#}</a>
                </li>

                <li class="nav-divider"></li>
                <li class="nav-title">{#Administration#}</li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=admin/convenio/convenio_listar"><i
                                class="icon-docs"></i>{#Conventions#}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=admin/entidad/entidad_listar"><i
                                class="icon-home"></i>{#Entities#}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=admin/persona/persona_listar"><i
                                class="icon-people"></i> {#People#}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=admin/convenio/objeto_listar"><i
                                class="icon-basket-loaded"></i> {#Objects#}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?page=admin/convenio/forma_listar"><i
                                class="icon-bag"></i> {#Formalisations#}</a>
                </li>
            </ul>
        </nav>
    </div>
    <main class="main">
        <div class="container-fluid">
            {block name=contenido}{/block}
        </div>
    </main>
</div>

{include file="layout/footer.tpl"}

{block name=javascript}
    <script src="assets/plugins/jquery/dist/jquery.min.js"></script>
    <script src="assets/plugins/tether/dist/js/tether.min.js"></script>
    <script src="assets/plugins/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/plugins/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/plugins/pace/pace.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/views/layout_admin.js" type="text/javascript"></script>
{/block}
</body>
</html>