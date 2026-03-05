            <div class="auth-box">
                <div id="loginform">
                    <div class="logo">
                        <span class="db"><img src="./assets/images/logo1.png" style="width:100%" alt="logo"></span>
                        <h5 class="font-medium mb-2 mt-4">Informe sua senha para login</h5>
                    </div>
                    <!-- Form -->
                    <div class="row">
                        <div class="col-12">
                            <form method="post" id="frmSenha" action="index.php?controle=usuario&acao=definirSenha&token=<?php echo $_GET['token']; ?>" >
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password" id="senha" class="form-control form-control-lg" placeholder="Senha" required name="senha">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon2"><i class="ti-pencil"></i></span>
                                    </div>
                                    <input type="password"  id="confirmarSenha" class="form-control form-control-lg" placeholder="Confirmar senha" required name="confirmarSenha">
                                </div>
                                 <div id="erro-senha" class="text-danger small mt-1"></div>
                                <div class="form-group text-center">
                                    <div class="col-xs-12 pb-3">
                                        <button class="btn btn-block btn-lg btn-info" type="submit">Salvar senha</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
<script>
    $("#frmSenha").on("submit", function(e) {
        var senha = $("#senha").val();
        var confirmarSenha = $("#confirmarSenha").val();

        if (senha !== confirmarSenha) {
            e.preventDefault();
            $("#erro-senha").text("As senhas não coincidem.");
        } else {
            $("#erro-senha").text("");
        }
    });
</script>
