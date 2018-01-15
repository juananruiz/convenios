{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title">{$convenio->titulo}</span>
            {if $convenio->id_convenio_marco > 0}
                <span>{#FrameworkConvention#}:
            <a href="index.php?page=convenio/convenio_mostrar&id={$convenio->convenio_marco->id}">{$convenio->convenio_marco->titulo}</a>
            </span>
            {/if}
        </div>
        <div class="card-body">
            <div class="row section">
                <div class="col-sm-12">
                    <h6 class="section-title">Entidades participantes</h6>
                </div>
                <div class="col-sm-4">
                    <div><b>Universidad de Sevilla</b></div>
                    <div><b>{if $convenio->responsable}{$convenio->responsable->destino}{/if}</b></div>
                    <div>
                        <b>Responsable:</b> {if $convenio->responsable}{$convenio->responsable->nombre} {$convenio->responsable->apellidos}{/if}
                    </div>
                    <div>{if $convenio->responsable}{$convenio->responsable->correo}{/if}</div>
                </div>
                {foreach $convenio->entidades as $entidad}
                    <div class="col-sm-4">
                        <div>
                            <b>{$entidad->nombre}</b>
                        </div>
                        <div><b>CIF: </b>{$entidad->cif}</div>
                        <div>Entidad {if $entidad->tipo}{$entidad->tipo->nombre}{/if}</div>
                    </div>
                {/foreach}
            </div>

            <div class="row section">
                <div class="col-sm-4">
                    <h6 class="section-title">Detalles</h6>
                    <div><b>{#Period#}:</b> {$convenio->ejercicio}</div>
                    <div><b>{#Status#}:</b> {if $convenio->estado}{$convenio->estado->nombre}{/if}</div>
                    <div><b>{#Renewable#}:</b> {if $convenio->es_prorrogable}Sí{else}No{/if}</div>
                    <div><b>{#SignatureDate#}:</b> {$convenio->fecha_firma}</div>
                    <div><b>{#EndDate#}:</b> {$convenio->fecha_fin}</div>
                    <div><b>{#Object#}:</b> {if $convenio->objeto}{$convenio->objeto->nombre}{/if}</div>
                    <div><b>{#Status#}:</b>{if $convenio->estado}{$convenio->estado->nombre}{/if}</div>
                </div>
                <div class="col-sm-4">
                    <h6 class="section-title">Datos económicos</h6>
                    <div><b>{#Formalisation#}:</b> {if $convenio->forma}{$convenio->forma->nombre}{/if}</div>
                    <div><b>{#Organic#}:</b> {$convenio->organica}</div>
                    <div><b>{#Economic#}:</b> {$convenio->economica}</div>
                    <div><b>{#Amount#}:</b> {$convenio->importe}</div>
                    <div><b>{#Income#}:</b> {if $convenio->es_ingreso}Sí{else}No{/if}</div>
                    <div><b>{#Charge#}:</b> {if $convenio->es_gasto}Sí{else}No{/if}</div>
                </div>
                <div class="col-sm-4">
                    <h6 class="section-title">Documentos</h6>
                    {foreach $ficheros as $fichero}
                        <div>
                            <i class="fa fa-file-o"></i> <a
                                    href="index.php?page=fichero/descargar&id={$fichero->id}">{$fichero->descripcion}</a>
                        </div>
                    {/foreach}
                </div>
            </div>
        </div>
        <div class="card-footer">
            <a class="btn btn-primary btn-sm float-right"
               href="index.php?page=admin/convenio/convenio_editar&id={$convenio->id}"><i class="fa fa-pencil"></i>
                {#ConventionEdit#}</a>
        </div>
    </div>
{/block}