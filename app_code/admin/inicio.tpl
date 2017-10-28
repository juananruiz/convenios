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
            <strong>Options</strong>
        </div>
        <div class="card-body">
            <ul>
                {foreach $personas as $persona}
                    <li>{$persona->nombre}</li>
                {/foreach}
            </ul>
        </div>
    </div>
{/block}