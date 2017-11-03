{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card">
            <form method="post" action="index.php?page=admin/entidad/entidad_grabar">
                <input type="hidden" name="id" value="{$objeto->id}">
                <div class="card-header">
                    <strong>{#Entity#}</strong>
                    <small>{#Edit#}</small>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="nombre">{#Name#}</label>
                                <input class="form-control" name="nombre" value="{$entidad->nombre}">
                            </div>
                            <div class="form-group">
                                <label for="cif">{#Cif#}</label>
                                <input class="form-control" name="cif" value="{$entidad->cif}">
                            </div>
                            <div class="form-group">
                                <label for="id_tipo_entidad">{#EntityType#}</label>
                                <select class="form-control" name="id_tipo_entidad">
                                    {foreach $tipos as $tipo}
                                        <option value="{$tipo->id}"{if $entidad->id_tipo_entidad == $tipo->id} selected{/if}>{$tipo->nombre}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-sm btn-primary">
                        <i class="fa fa-dot-circle-o"></i> {#Save#}
                    </button>
                </div>
            </form>
        </div>
    </div>
{/block}
