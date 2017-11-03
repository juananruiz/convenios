{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card">
            <form method="post" action="index.php?page=admin/persona/persona_grabar">
                <input type="hidden" name="id" value="{$persona->id}">
                <div class="card-header">
                    <strong>{#Person#}</strong>
                    <small>{#Edit#}</small>
                </div>
                <div class="card-block">
                    <div class="form-group col-sm-12">
                        <label for="nombre">{#FirstName#}</label>
                        <input class="form-control" name="nombre" value="{$persona->nombre}">
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="apellidos">{#LastName#}</label>
                        <input class="form-control" name="apellidos" value="{$persona->apellidos}">
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="id_entidad">{#Entity#}</label>
                        <select class="form-control" name="id_entidad">
                            {foreach $entidades as $entidad}
                                <option value="{$entidad->id}"{if $persona->id_entidad == $entidad->id} selected{/if}>{$entidad->nombre}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="destino">{#Position#}</label>
                        <input class="form-control" name="destino" value="{$persona->destino}">
                    </div>
                    <div class="form-group col-sm-12">
                        <label for="correo">{#Email#}</label>
                        <input class="form-control" name="correo" value="{$persona->correo}">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="nif">{#Nif#}</label>
                        <input class="form-control" name="nif" value="{$persona->nif}">
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="sexo">{#Gender#}</label>
                        <select class="form-control" name="sexo">
                            <option value="mujer"{if $persona->sexo == 'mujer'} selected{/if}>Mujer</option>
                            <option value="hombre"{if $persona->sexo == 'hombre'} selected{/if}>Hombre</option>
                        </select>
                    </div>
                    <div class="form-group col-sm-12">
                        <label>{#CreatedAt#}</label>
                        <input class="form-control" value="{$persona->fecha_alta|date_format:"m/d/Y H:i"}"
                               disabled>
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