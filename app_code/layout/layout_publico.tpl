<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{#SiteName#} - {#OrganizationName#}</title>
    {block name=css}
        <link href="assets/plugins/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/plugins/fontawesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="assets/css/coreui.css" rel="stylesheet" type="text/css" media="screen">
        <link href="assets/css/convenios.css" rel="stylesheet" type="text/css" media="screen">
    {/block}
</head>
<body>
<div class="modal">
    <div class="modal-header">{block name=modal-header}{/block}</div>
    <div class="modal-body">{block name=modal-body}{/block}</div>
    <div class="modal-footer">{block name=modal-footer}{/block}</div>
</div>

{include file="layout/menu_publico.tpl"}

{block name=contenido}{/block}

<div class="divide40"></div>

{include file="layout/footer.tpl"}

{block name=javascript}
    <script src="assets/plugins/jquery/dist/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/plugins/popper.js/dist/umd/popper.min.js"></script>
    <script src="assets/plugins/pace/pace.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script src="assets/views/layout_public.js" type="text/javascript"></script>
{/block}
</body>
</html>
