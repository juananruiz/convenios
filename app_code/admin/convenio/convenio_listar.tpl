{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-12">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> <strong>{#ConventionList#}</strong>
            <a href="index.php?page=admin/convenio/objeto_crear"
               class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewConvention#}</a>
        </div>
        <div class="card">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Id#}</th>
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
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=admin/convenio/convenio_editar&id={$convenio->id}">{$convenio->id}</a></span>
                        </td>
                        <td>{$convenio->ejercicio}</td>
                        <td>{$convenio->titulo}</td>
                        <td>{$convenio->estado}</td>
                        <td>{$convenio->fecha_firma}</td>
                        <td>{$convenio->fecha_fin}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
