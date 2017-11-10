{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-12">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> <strong>{#PeopleList#}</strong>
            <form class="form form-inline float-right" method="post" action="index.php?page=persona/persona_listar">
                <input name="busqueda">
                <button><i class="fa fa-search"></i></button>
            </form>
        </div>
        <div class="card">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#FirstName#}</th>
                    <th>{#Email#}</th>
                    <th>{#Rol#}</th>
                    <th>{#Position#}</th>
                    <th>{#Entity#}</th>
                    <th>{#LastLogin#}</th>
                </tr>
                </thead>
                <tbody>
                {foreach $personas as $persona}
                    <tr>
                        <td>
                            <a href="index.php?page=persona/persona_mostrar&id={$persona->id}">{$persona->nombre} {$persona->apellidos}</a>
                        </td>
                        <td>{$persona->correo}</td>
                        <td><i class="fa {$persona->rol->icono}"></i></td>
                        <td>{$persona->destino}</td>
                        <td>{$persona->entidad->nombre}</td>
                        <td>{$persona->ultimo_inicio_sesion|date_format:"d/m/Y H:i:s"}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}
