{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-8">
        <div class="card">
            <form method="post" action="index.php?page=admin/convenio/convenio_grabar">
                <input type="hidden" name="id" value="{$convenio->id}">
                <div class="card-header">
                    <strong>{#Convention#}</strong>
                    <small>{#Edit#}</small>
                </div>
                <div class="card-block">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="titulo">{#Title#}</label>
                                <input type="text" class="form-control" name="titulo" value="{$convenio->titulo}">
                            </div>

                            <div class="form-group">
                                <label for="id_objeto">{#Object#}</label>
                                <input type="text" class="form-control" name="id_objeto" value="{$convenio->id_objeto}">
                            </div>

                            <div class="form-group">
                                <label for="id_formalizacion">{#Formalisation#}</label>
                                <input type="text" class="form-control" name="id_formalizacion" value="{$convenio->id_formalizacion}">
                            </div>

                            <div class="form-group">
                                <label for="organica">{#Organic#}</label>
                                <input type="text" class="form-control" name="organica" value="{$convenio->organica}">
                            </div>

                            <div class="form-group">
                                <label for="economica">{#Economic#}</label>
                                <input type="text" class="form-control" name="economica" value="{$convenio->economica}">
                            </div>

                            <div class="form-group">
                                <label for="importe">{#Amount#}</label>
                                <input type="text" class="form-control" name="importe" value="{$convenio->importe}">
                            </div>

                            <div class="form-group">
                                <label for="fecha_fin">{#EndDate#}</label>
                                <input type="text" class="form-control" name="fecha_fin" value="{$convenio->fecha_fin}">
                            </div>

                            <div class="form-group">
                                <label for="ejercicio">{#Period#}</label>
                                <input type="text" class="form-control" name="ejercicio" value="{$convenio->ejercicio}">
                            </div>

                            <div class="form-group">
                                <label for="id_estado">{#Status#}</label>
                                <input type="text" class="form-control" name="id_estado" value="{$convenio->id_estado}">
                            </div>

                            <div class="form-group">
                                <label for="id_tipo_entidad">{#EntityType#}</label>
                                <input type="text" class="form-control" name="id_tipo_entidad" value="{$convenio->id_tipo_entidad}">
                            </div>

                            <div class="form-group">
                                <label for="id_responsable">{#Responsible#}</label>
                                <input type="text" class="form-control" name="id_responsable" value="{$convenio->id_responsable}">
                            </div>

                            <div class="form-group">
                                <label for="es_ingreso">{#Income#}</label>
                                <input type="text" class="form-control" name="es_ingreso" value="{$convenio->es_ingreso}">
                            </div>

                            <div class="form-group">
                                <label for="es_gasto">{#Charge#}</label>
                                <input type="text" class="form-control" name="es_gasto" value="{$convenio->es_gasto}">
                            </div>

                            <div class="form-group">
                                <label for="fecha_firma">{#SignatureDate#}</label>
                                <input type="text" class="form-control" name="fecha_firma" value="{$convenio->fecha_firma}">
                            </div>

                            <div class="form-group">
                                <label for="es_prorrogable">{#Renewable#}</label>
                                <input type="text" class="form-control" name="es_prorrogable" value="{$convenio->es_prorrogable}">
                            </div>

                            <div class="form-group">
                                <label for="id_convenio_marco">{#FrameworkConvention#}</label>
                                <input type="text" class="form-control" name="id_convenio_marco" value="{$convenio->id_convenio_marco}">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button type="submit" class="btn btn-sm btn-primary"><i class="fa fa-dot-circle-o"></i> {#Save#}</button>
                </div>
            </form>
        </div>
    </div>
{/block}