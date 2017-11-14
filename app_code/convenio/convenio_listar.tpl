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
            <span class="card-title">{#ConventionsQuery#}</span>
            <form class="form form-inline float-right" method="post" action="index.php?page=convenio/convenio_listar">
                <input name="busqueda">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Id#}</th>
                    <th>{#Period#}</th>
                    <th>{#Title#}</th>
                    <th>{#Status#}</th>
                    <th nowrap>{#SignatureDate#}</th>
                    <th nowrap>{#EndDate#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $convenios as $convenio}
                    <tr>
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=convenio/convenio_mostrar&id={$convenio->id}">{$convenio->id}</a></span>
                        </td>
                        <td>
                            <a href="index.php?page=convenio/convenio_mostrar&id={$convenio->id}">{$convenio->titulo}</a>
                        </td>
                        <td>{$convenio->ejercicio}</td>
                        <td>{if $convenio->estado}{$convenio->estado->nombre}{/if}</td>
                        <td nowrap>{$convenio->fecha_firma|date_format:"d/m/Y"}</td>
                        <td nowrap>{$convenio->fecha_fin|date_format:"d/m/Y"}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}