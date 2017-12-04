{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
    <div class="card-header">
        <span class="card-title">{#ConventionEdit#}</span>
    </div>
    <div class="card-block">
        <div class="mb-4">
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#datos" role="tab"
                       aria-controls="datos">Datos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#ficheros" role="tab" aria-controls="ficheros"
                       aria-expanded="false">Ficheros</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="datos" role="tabpanel">
                    <form method="post" action="index.php?page=admin/convenio/convenio_grabar">
                        <input type="hidden" name="id" value="{$convenio->id}">
                        <div class="form-group col-sm-12">
                            <label for="titulo">{#Title#}</label>
                            <textarea class="form-control" name="titulo">{$convenio->titulo}</textarea>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="id_convenio_marco">{#FrameworkConvention#}</label>
                            <select class="form-control" name="id_convenio_marco">
                                <option value="">{#WithoutFrameworkConvention#}</option>
                                {foreach $marcos as $marco}
                                    <option value="{$marco->id}" {if
                                    $convenio->id_convenio_marco == $marco->id}selected{/if}>{$marco->titulo}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="id_responsable">{#Responsible#}</label>
                            <select class="form-control" name="id_responsable">
                                <option value="">{#SelectResponsible#}</option>
                                {foreach $responsables as $persona}
                                    <option value="{$persona->id}" {if
                                    $convenio->id_responsable == $persona->id}selected{/if}>{$persona->apellidos},
                                        {$persona->nombre} - {$persona->destino}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="id_objeto">{#Object#}</label>
                            <select class="form-control" name="id_objeto">
                                <option value="">{#WithoutObject#}</option>
                                {foreach $objetos as $objeto}
                                    <option value="{$objeto->id}" {if
                                    $convenio->id_objeto == $objeto->id}selected{/if}>{$objeto->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="id_forma">{#Formalisation#}</label>
                            <select class="form-control" name="id_forma">
                                <option value="">{#WithoutFormalisation#}</option>
                                {foreach $formas as $forma}
                                    <option value="{$forma->id}" {if
                                    $convenio->id_forma == $forma->id}selected{/if}>{$forma->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="organica">{#Organic#}</label>
                            <input class="form-control" name="organica" value="{$convenio->organica}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="economica">{#Economic#}</label>
                            <input class="form-control" name="economica" value="{$convenio->economica}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="fecha_firma">{#SignatureDate#}</label>
                            <input class="form-control" name="fecha_firma"
                                   value="{$convenio->fecha_firma}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="fecha_fin">{#EndDate#}</label>
                            <input class="form-control" name="fecha_fin" value="{$convenio->fecha_fin}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="ejercicio">{#Period#}</label>
                            <input class="form-control" name="ejercicio" value="{$convenio->ejercicio}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="importe">{#Amount#}</label>
                            <input class="form-control" name="importe" value="{$convenio->importe}">
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="es_prorrogable">{#Renewable#}</label>
                            <select class="form-control" name="es_prorrogable">
                                <option value="">{#SelectIfRenewable#}</option>
                                <option value="0"{if !$convenio->es_prorrogable} selected{/if}>No</option>
                                <option value="1"{if $convenio->es_prorrogable} selected{/if}>Sí</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="id_estado">{#Status#}</label>
                            <select class="form-control" name="id_estado">
                                <option value="">{#SelectStatus#}</option>
                                {foreach $estados as $estado}
                                    <option value="{$estado->id}" {if
                                    $convenio->id_estado == $estado->id}selected{/if}>{$estado->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="es_ingreso">{#Income#}</label>
                            <select class="form-control" name="es_ingreso">
                                <option value="0"{if !$convenio->es_ingreso} selected{/if}>No</option>
                                <option value="1"{if $convenio->es_ingreso} selected{/if}>Sí</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="es_gasto">{#Charge#}</label>
                            <select class="form-control" name="es_gasto">
                                <option value="0"{if !$convenio->es_gasto} selected{/if}>No</option>
                                <option value="1"{if $convenio->es_gasto} selected{/if}>Sí</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="id_tipo_entidad">{#EntityType#}</label>
                            <select class="form-control" name="id_tipo_entidad">
                                {foreach $tipos_entidades as $tipo_entidad}
                                    <option value="{$tipo_entidad->id}" {if
                                    $convenio->id_tipo_entidad == $tipo_entidad->id}selected{/if}>{$tipo_entidad->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                        {*<div class="form-group col-sm-12">*}
                        {*<label for="id_entidad">{#Entity#}</label>*}
                        {*<select class="form-control" name="id__entidad">*}
                        {*{foreach $entidades as $entidad}*}
                        {*<option value="{$entidad->id}" {if*}
                        {*$convenio->entidad[0]->id == $entidad->id}selected{/if}>{$entidad->nombre}</option>*}
                        {*{/foreach}*}
                        {*</select>*}
                        {*</div>*}

                        {*<div class="form-group col-sm-12">*}
                        {*<label for="fichero">{#FileAttachment#}</label>*}
                        {*<input class="form-control" type="file" name="fichero">*}
                        {*</div>*}

                        <div class="form-actions">
                            <button class="formbtn btn-sm btn-primary pull-right">
                                <i class="fa fa-save"></i> {#Save#}
                            </button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane" id="ficheros" role="tabpanel" aria-expanded="false">
                    <form method="post" action="index.php?page=admin/convenio/fichero_grabar">
                        <input type="hidden" name="id" value="{$convenio->id}">
                        <div class="form-group col-sm-4">
                            <label for="ficheros">Fichero</label>
                            <input class="form-control" type="file" id="fichero" name="fichero">
                        </div>
                        <div class="form-group col-sm-4">
                            <label for="descripcion">Descripción</label>
                            <input class="form-control" name="descripcion" value="">
                        </div>
                        <div class="form-group col-sm-2">
                            <label for="visibilidad">Visibilidad</label>
                            <select class="form-control" name="es_privado">
                                <option value="0">Público</option>
                                <option value="1">Restringido</option>
                            </select>
                        </div>
                        <div class="form-group col-sm-2" style="padding-top: 30px;">
                            <button class="btn btn-sm btn-primary">
                                <i class="fa fa-save"></i> Añadir fichero
                            </button>
                        </div>
                    </form>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Visibilidad</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><span class="tag tag-primary"><a href="">234</a></span></td>
                            <td><a href="">convenio_237_marzo2016.pdf</a></td>
                            <td>Documento del convenio</td>
                            <td><i class="fa fa-globe"></i></td>
                        </tr>
                        <tr>
                            <td><span class="tag tag-primary"><a href="">533</a></span></td>
                            <td><a href="">visto_bueno_rector.pdf</a></td>
                            <td>Visto bueno del rector</td>
                            <td><i class="fa fa-lock"></i></td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
{/block}