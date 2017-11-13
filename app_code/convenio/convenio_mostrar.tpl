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
                    <h6 class="section-title">Entidades</h6>
                </div>
                <div class="col-sm-4">
                    <div><strong>Universidad de Sevilla</strong></div>
                    <div><b>{$convenio->responsable->destino}</b></div>
                    <div><b>Responsable:</b> {$convenio->responsable->nombre} {$convenio->responsable->apellidos}</div>
                    <div>{$convenio->responsable->correo}</div>
                </div>
                {foreach $convenio->entidades as $entidad}
                    <div class="col-sm-4">
                        <div>
                            <strong>{$entidad->nombre}</strong>
                        </div>
                        <div><b>CIF: </b>{$entidad->cif}</div>
                        <div>Entidad {$entidad->tipo->nombre}</div>
                    </div>
                {/foreach}
            </div>

            <div class="row section">
                <div class="col-sm-4">
                    <h6 class="section-title">Detalles</h6>
                    <div><b>{#Period#}:</b> {$convenio->ejercicio}</div>
                    <div><b>{#Status#}:</b> {$convenio->estado->nombre}</div>
                    <div><b>{#Renewable#}:</b> {if $convenio->es_prorrogable}Sí{else}No{/if}</div>
                    <div><b>{#SignatureDate#}:</b> {$convenio->fecha_firma}</div>
                    <div><b>{#EndDate#}:</b> {$convenio->fecha_fin}</div>
                    <div><b>{#Object#}:</b> {$convenio->objeto->nombre}</div>
                    <div><b>{#Status#}:</b>{$convenio->estado->nombre}</div>
                </div>
                <div class="col-sm-4">
                    <h6 class="section-title">Datos económicos</h6>
                    <div><b>{#Formalisation#}:</b> {$convenio->forma->nombre}</div>
                    <div><b>{#Organic#}:</b> {$convenio->organica}</div>
                    <div><b>{#Economic#}:</b> {$convenio->economica}</div>
                    <div><b>{#Amount#}:</b> {$convenio->importe}</div>
                    <div><b>{#Income#}:</b> {if $convenio->es_ingreso}Sí{else}No{/if}</div>
                    <div><b>{#Charge#}:</b> {if $convenio->es_gasto}Sí{else}No{/if}</div>
                </div>
                <div class="col-sm-4">
                    <h6 class="section-title">Documentos</h6>
                    <div><i class="fa fa-file-pdf-o"></i> <a href="">Documento del convenio</a>
                        <div><i class="fa fa-file-pdf-o"></i> <a href="">Documentación anexa económica</a>
                        </div>
                    </div>
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