{extends file='../layout/layout_mini.tpl'}

{block name=contenido}
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card-group mb-0">
                    <div class="card p-4">
                        <div class="card-body">
                            <form method="POST" action="index.php?page=persona/login_validar">
                                <h1>{#Access#}</h1>
                                <p class="text-muted">{#AccessWithUserAndPassword#}</p>
                                <div class="input-group mb-3">
                                    <span class="input-group-addon"><i class="icon-user"></i></span>
                                    <input name="correo" class="form-control" placeholder="{#Mail#}">
                                </div>
                                <div class="input-group mb-4">
                                    <span class="input-group-addon"><i class="icon-lock"></i></span>
                                    <input type="password" name="clave" class="form-control" placeholder="{#Password#}">
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <button class="btn btn-primary px-4">{#Login#}</button>
                                    </div>
                                    <div class="col-6 text-right">
                                        <button type="button" class="btn btn-link px-0">{#ForgotPassWord#}</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card text-white bg-primary py-5 d-md-down-none" style="width:44%">
                        <div class="card-body text-center">
                            <div>
                                <h2>{#Warning#}</h2>
                                <p>{#PreAccessMessage#} {#AskForPermission#}
                                    <a href="mailto:{#OrganizationEmail#}">{#OrganizationEmail#}</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{/block}
