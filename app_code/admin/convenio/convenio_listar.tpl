{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title"><i class="fa fa-pencil-square-o"></i> {#ConventionsAdministration#}</span>
            <form class="form form-inline float-right" method="post"
                  action="index.php?page=admin/convenio/convenio_listar">
                <input name="search" value="{$search}">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
            <a href="index.php?page=admin/convenio/convenio_crear"
               class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewConvention#}</a>
        </div>
        <div class="card-body">
            <div class="table">
                <div class="row header">
                    <div class="cell">{#Id#}</div>
                    <div class="cell">{#Period#}</div>
                    <div class="cell">{#Title#}</div>
                    <div class="cell">{#Status#}</div>
                    <div class="cell nowrap">{#SignatureDate#}</div>
                    <div class="cell nowrap">{#EndDate#}</div>
                </div>
                {foreach $convenios as $convenio}
                    <div class="row">
                        <div class="cell d-print-none">
                            <span class="tag tag-primary"><a
                                        href="index.php?page=admin/convenio/convenio_editar&id={$convenio->id}">{$convenio->id}</a>
                            </span>
                        </div>
                        <div class="cell">
                            <a href="index.php?page=admin/convenio/convenio_editar&id={$convenio->id}">{$convenio->titulo}</a>
                        </div>
                        <div class="cell" data-title="{#Period#}">{$convenio->ejercicio}</div>
                        <div class="cell"
                             data-title="{#Status#}">{if $convenio->estado}{$convenio->estado->nombre}{/if}</div>
                        <div class="cell nowrap"
                             data-title="{#SignatureDate#}">{$convenio->fecha_firma|date_format:"d/m/Y"}</div>
                        <div class="cell nowrap"
                             data-title="{#EndDate#}">{$convenio->fecha_fin|date_format:"d/m/Y"}</div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/block}
