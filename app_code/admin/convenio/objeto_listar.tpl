{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> {#ConventionObjectList#}
            <button href="index.php?page=admin/convenio/objeto_crear" type="button"
                    class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewObject#}
            </button>
        </div>
        <div class="card">
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
                        <td>{$objeto->nombre}</td>
                        <td>{$objeto->created_at}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
