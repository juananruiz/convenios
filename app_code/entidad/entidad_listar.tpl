{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <span class="card-title"><i class="fa fa-align-justify"></i> {#EntityList#}</span>
            <form class="form form-inline float-right" method="post" action="index.php?page=entidad/entidad_listar">
                <input name="busqueda">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Name#}</th>
                    <th>{#Cif#}</th>
                    <th>{#Type#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $entidades as $entidad}
                    <tr>
                        <td><a href="#">{$entidad->nombre}</a></td>
                        <td>{$entidad->cif}</td>
                        <td>{$entidad->tipo->nombre}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
