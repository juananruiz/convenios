{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title"><i class="fa fa-align-justify"></i> {#ConventionsAdministration#}</span>
            <form class="form form-inline float-right" method="post" action="index.php?page=convenio/convenio_listar">
                <input name="busqueda">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
            <a href="index.php?page=admin/convenio/convenio_crear"
               class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewConvention#}</a>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Id#}</th>
                    <th>{#Title#}</th>
                    <th>{#Period#}</th>
                    <th>{#Status#}</th>
                    <th nowrap="">{#SignatureDate#}</th>
                    <th nowrap="">{#EndDate#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $convenios as $convenio}
                    <tr>
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=admin/convenio/convenio_editar&id={$convenio->id}">{$convenio->id}</a></span>
                        </td>
                        <td>
                            <a href="index.php?page=admin/convenio/convenio_editar&id={$convenio->id}">{$convenio->titulo}</a>
                        </td>
                        <td>{$convenio->ejercicio}</td>
                        <td>{if $convenio->estado}{$convenio->estado->nombre}{/if}</td>
                        <td>{$convenio->fecha_firma}</td>
                        <td>{$convenio->fecha_fin}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
