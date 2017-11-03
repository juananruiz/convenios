{extends file='layout/layout_admin.tpl'}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div class="col-sm-12">
        <div class="card-header">
            <i class="fa fa-align-justify"></i> <strong>{#PeopleList#}</strong>
            <button href="index.php?page=admin/persona/persona_crear" type="button"
                    class="btn btn-primary btn-sm float-right"><i class="fa fa-plus-circle"></i>&nbsp; {#NewPerson#}
            </button>
        </div>
        <div class="card">
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
                        <td>{$persona->nombre} {$persona->apellidos}</td>
                        <td>{$persona->correo}</td>
                        <td>{$persona->id_rol}</td>
                        <td>{$persona->destino}</td>
                        <td>{$persona->id_entidad}</td>
                        <td>{$persona->ultimo_inicio_sesion}</td>
                    </tr>
                {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/block}