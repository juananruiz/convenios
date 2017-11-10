{extends file='layout/layout_admin.tpl'}

{block name=css}
    {$smarty.block.parent}
{/block}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <strong>{#ConventionList#}</strong>
            <form class="form form-inline float-right" method="post" action="index.php?page=convenio/convenio_listar">
                <input name="busqueda">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Period#}</th>
                    <th>{#Title#}</th>
                    <th>{#Status#}</th>
                    <th>{#SignatureDate#}</th>
                    <th>{#EndDate#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $convenios as $convenio}
                    <tr>
                        <td>{$convenio->ejercicio}</td>
                        <td><a href="index.php?page=convenio_mostrar&id={$convenio->id}">{$convenio->titulo}</a></td>
                        <td>{$convenio->estado}</td>
                        <td>{$convenio->fecha_firma|date_format:"d-m-Y"}</td>
                        <td>{$convenio->fecha_fin|date_format:"d-m-Y"}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}