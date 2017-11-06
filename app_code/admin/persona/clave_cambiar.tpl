{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card">
            <form method="post" action="index.php?page=admin/persona/clave_grabar">
                <input type="hidden" name="id" value="{$persona->id}">
                <div class="card-header">
                    <strong>{$persona->nombre} {$persona->apellidos}</strong>
                    <small>{$persona->correo}</small>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group col-sm-6">
                                <label for="clave">{#Password#}</label>
                                <input class="form-control" name="clave" id="password" type="password">
                            </div>
                            <div class="form-group col-sm-6">
                                <label>{#RepeatPassword#}</label>
                                <input class="form-control" id="password-bis" type="password">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-sm btn-primary"><i class="fa fa-disk"></i> {#Save#}</button>
                    <a class="btn btn-sm btn-warning float-right" href="index.php?page=admin/persona/persona_listar"><i
                                class="fa fa-minus-circle"></i> {#Cancel#}</a>
                </div>
            </form>
        </div>
    </div>
{/block}

