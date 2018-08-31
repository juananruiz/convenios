{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title"><i class="fa fa-align-justify"></i> {#ConventionObjectList#}</span>
            <a href="index.php?page=admin/convenio/objeto_crear"
               class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewObject#}
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
                {foreach $objetos as $objeto}
                    <tr>
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=admin/convenio/objeto_editar&id={$objeto->id}">{$objeto->id}</a></span>
                        </td>
                        <td><a href="index.php?page=admin/convenio/objeto_editar&id={$objeto->id}">{$objeto->nombre}</a>
                        </td>
                        <td>{$objeto->created_at|date_format:"m/d/Y"}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
