{extends file='layout/layout_admin.tpl'}

{block name=css}
    {$smarty.block.parent}
{/block}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title">{#ConventionsQuery#}</span>
            <form class="form form-inline float-right" method="post" action="index.php?page=convenio/convenio_listar">
                <input name="busqueda">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="card-body">
            <div class="table">
                <div class="row header">
                    <div class="cell">{#Id#}</div>
                    <div class="cell">{#Period#}</div>
                    <div class="cell">{#Title#}</div>
                    <div class="cell">{#Status#}</div>
                    <div class="cell flex-nowrap">{#SignatureDate#}</div>
                    <div class="cell flex-nowrap">{#EndDate#}</div>
                </div>
                {foreach $convenios as $convenio}
                    <div class="row">
                        <div class="cell d-print-none">
                            <span class="tag tag-primary"><a
                                        href="index.php?page=convenio/convenio_mostrar&id={$convenio->id}">{$convenio->id}</a>
                            </span>
                        </div>
                        <div class="cell">
                            <a href="index.php?page=convenio/convenio_mostrar&id={$convenio->id}">{$convenio->titulo}</a>
                        </div>
                        <div class="cell" data-title="{#Period#}">{$convenio->ejercicio}</div>
                        <div class="cell"
                             data-title="{#Status#}">{if $convenio->estado}{$convenio->estado->nombre}{/if}</div>
                        <div class="cell" data-title="{#SignatureDate#}"
                             nowrap>{$convenio->fecha_firma|date_format:"d/m/Y"}</div>
                        <div class="cell" data-title="{#EndDate#}"
                             nowrap>{$convenio->fecha_fin|date_format:"d/m/Y"}</div>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
{/block}