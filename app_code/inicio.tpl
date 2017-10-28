{extends file='layout/layout_admin.tpl'}

{block name=css}
    {$smarty.block.parent}
{/block}

{block name=javascript}
    {$smarty.block.parent}
{/block}

{block name=contenido}
    <div id="ui-view" style="opacity: 1;">
        <div class="animated fadeIn">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Options</strong>
                        </div>
                        <div class="card-body">
                            {foreach $roles as $rol}
                                <li>{$rol->descripcion}</li>
                            {/foreach}
                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <strong>{#People#}</strong>
                        </div>
                        <div class="card-body">
                            {foreach $personas as $persona}
                                <li>{$persona->nombre} {$persona->apellidos} {$persona->correo} {$persona->clave}</li>
                            {/foreach}
                        </div>
                    </div>
                </div>
                <!--/.col-->

                <div class="col-md-6">

                    <div class="card">
                        <div class="card-header">
                            <strong>Options</strong>
                        </div>
                        <div class="card-body">
                            <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                            <button type="button" class="btn btn-outline-primary">Primary</button>

                            <!-- Secondary, outline button -->
                            <button type="button" class="btn btn-outline-secondary">Secondary</button>

                            <!-- Indicates a successful or positive action -->
                            <button type="button" class="btn btn-outline-success">Success</button>

                            <!-- Indicates caution should be taken with this action -->
                            <button type="button" class="btn btn-outline-warning">Warning</button>

                            <!-- Indicates a dangerous or potentially negative action -->
                            <button type="button" class="btn btn-outline-danger">Danger</button>

                        </div>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <strong>With Icons</strong>
                        </div>
                        <div class="card-body">
                            <button type="button" class="btn btn-outline-primary"><i class="fa fa-star"></i>&nbsp;
                                Primary
                            </button>
                            <button type="button" class="btn btn-outline-secondary"><i class="fa fa-lightbulb-o"></i>&nbsp;
                                Secondary
                            </button>
                            <button type="button" class="btn btn-outline-success"><i class="fa fa-magic"></i>&nbsp;
                                Success
                            </button>
                            <button type="button" class="btn btn-outline-warning"><i class="fa fa-map-marker"></i>&nbsp;
                                Warning
                            </button>
                            <button type="button" class="btn btn-outline-danger"><i class="fa fa-rss"></i>&nbsp; Danger
                            </button>
                        </div>
                    </div>

                </div>
                <!--/.col-->
            </div>
            <!--/.row-->
        </div>
    </div>
{/block}