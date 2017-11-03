{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card">
            <form method="post" action="index.php?page=admin/convenio/objeto_grabar">
                <input type="hidden" name="id" value="{$objeto->id}">
                <div class="card-header">
                    <strong>{#Object#}</strong>
                    <small>{#Edit#}</small>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="nombre">{#Name#}</label>
                                <input class="form-control" name="nombre" value="{$objeto->nombre}">
                            </div>

                            <div class="form-group">
                                <label>{#CreatedAt#}</label>
                                <input class="form-control" value="{$objeto->created_at}" disabled>
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