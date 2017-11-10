<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="{#SiteDescription#}">
    <link rel="shortcut icon" href="favicon.ico">
    <title>{#SiteName#} - {#OrganizationName#}</title>
    {block name=css}
        <link href="assets/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/fontawesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/plugins/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
        <link href="assets/css/coreui.min.css" rel="stylesheet" type="text/css" media="screen">
        <link href="assets/css/convenios.css" rel="stylesheet" type="text/css" media="screen">
    {/block}
</head>

<body class="app header-fixed sidebar-fixed">
    <header class="app-header navbar">
        <button class="navbar-toggler mobile-sidebar-toggler d-lg-none mr-auto" type="button">☰</button>
        <a class="navbar-brand" href="index.php"></a>
        <h1>{#SiteName#} - {#OrganizationName#}</h1>
        <div class="float-left">{$_usuario->nombre} - <a href="index.php?page=persona/logout">{#Logout#}</a></div>
    </header>
    <div class="app-body">
        <div class="sidebar">
            <nav class="sidebar-nav">

                <ul class="nav">
                    <li class="nav-title">Consulta</li>
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

                    <li class="nav-divider"></li>
                    <li class="nav-title">Edición</li>
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
                        <a class="nav-link" href="index.php?page=admin/convenio/formalizacion_listar"><i
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