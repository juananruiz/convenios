{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> <strong>{#EntityList#}</strong>
            <a href="index.php?page=admin/entidad/entidad_crear"
               class="btn btn-mary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewEntity#}</a>
        </div>
        <div class="card">
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
                        <td>{$entidad->nombre}</td>
                        <td>{$entidad->cif}</td>
                        <td>{$entidad->id_tipo_entidad}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
