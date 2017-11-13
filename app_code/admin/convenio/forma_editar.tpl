{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card">
            <form method="post" action="index.php?page=admin/convenio/forma_grabar">
                <input type="hidden" name="id" value="{$forma->id}">
                <div class="card-header">
                    <span class="card-title">{#FormalisationEdit#}</span>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="nombre">{#Name#}</label>
                                <input class="form-control" name="nombre" value="{$forma->nombre}">
                            </div>

                            <div class="form-group">
                                <label>{#CreatedAt#}</label>
                                <input class="form-control" value="{$forma->created_at}" disabled>
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