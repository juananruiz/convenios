{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="card">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> <strong>{#PeopleList#}</strong>
            <a href="index.php?page=admin/persona/persona_crear"
               class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewPerson#}</a>
        </div>
        <div class="card-body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>{#Id#}</th>
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
                        <td><span class="tag tag-primary"><a
                                        href="index.php?page=admin/persona/persona_editar&id={$persona->id}">{$persona->id}</a></span>
                        </td>
                        <td>
                            <a href="index.php?page=admin/persona/persona_editar&id={$persona->id}">{$persona->nombre} {$persona->apellidos}</a>
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
