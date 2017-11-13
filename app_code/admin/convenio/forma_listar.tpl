{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title"><i class="fa fa-align-justify"></i> {#ConventionFormalisationList#}</span>
            <a href="index.php?page=admin/convenio/forma_crear"
               class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewFormalisation#}
            </a>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Id#}</th>
                    <th>{#Name#}</th>
                    <th>{#CreatedAt#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $formas as $forma}
                    <tr>
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=admin/convenio/forma_editar&id={$forma->id}">{$forma->id}</a></span>
                        </td>
                        <td><a href="index.php?page=admin/convenio/forma_editar&id={$forma->id}">{$forma->nombre}</a>
                        </td>
                        <td>{$forma->created_at|date_format:"m/d/Y"}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
