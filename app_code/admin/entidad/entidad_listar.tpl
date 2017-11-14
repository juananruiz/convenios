{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title"><i class="fa fa-pencil-square-o"></i> {#EntitiesAdministration#}</span>
            <a href="index.php?page=admin/entidad/entidad_crear"
               class="btn btn-mary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewEntity#}</a>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Id#}</th>
                    <th>{#Name#}</th>
                    <th>{#Cif#}</th>
                    <th>{#Type#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $entidades as $entidad}
                    <tr>
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=admin/entidad/entidad_editar&id={$entidad->id}">{$entidad->id}</a></span>
                        </td>
                        <td>
                            <a href="index.php?page=admin/entidad/entidad_editar&id={$entidad->id}">{$entidad->nombre}</a>
                        </td>
                        <td>{$entidad->cif}</td>
                        <td>{$entidad->tipo->nombre}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
