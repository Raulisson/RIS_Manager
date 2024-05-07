<div class="page-breadcrumb bg-white p-4">
	<div class="row align-items-center">
		<div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
			<h4 class="page-title text-uppercase font-medium font-14">Formulário</h4>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12 col-xlg-12 col-md-12">
			<div class="white-box">
				<div class="table-responsive">

					<!-- Form -->
					<form id="frmUsuario" method="post" action="index.php?controle=usuario&acao=salvar" autocomplete="off">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3"> <?php echo (isset($this->usuario)) ? "Edição" : "Cadastro" ?></div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->usuario))
																						echo $this->usuario['id'] ?>" />

											<!-- Nome -->
											<div class="form-group col-md-6">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Nome:</label>
												<input type="text" class="form-control" name="nome" id="nome" value="<?php if (isset($this->usuario))
																															echo $this->usuario['nome'] ?>" required maxlength="50">
											</div>

											<!-- E-mail -->
											<div class="form-group col-md-6">
												<label for="email" class="ul-form__label p-0"><span>*</span> E-mail:</label>
												<input type="email" class="form-control" name="email" id="email" value="<?php if (isset($this->usuario))
																															echo $this->usuario['email'] ?>" required maxlength="100">
											</div>
										</div>

										<div class="row mt-3">
											<!-- Senha -->
											<div class="form-group col-md-6 campo-senha" <?php if (isset($this->usuario))
																								echo "style='display:none'" ?>>
												<label for="senha" class="ul-form__label p-0">
													<span>*</span> Senha:
												</label>
												<input type="password" class="form-control" name="senha" id="senha" value="" autocomplete="new-password">
											</div>

											<!-- Confirmação da senha -->
											<div class="form-group col-md-6 campo-senha" <?php if (isset($this->usuario))
																								echo "style='display:none'" ?>>
												<label for="confirmarSenha" class="ul-form__label p-0">
													<span>*</span> Confirmação da senha:
												</label>
												<input type="password" class="form-control" name="confirmarSenha" id="confirmarSenha" value="" autocomplete="new-password">
											</div>
										</div>


										<div class="row">

											<!-- Grupos de permissões -->
											<div class="form-group col-md-6 campo-grupo">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Grupos de permissões:</label>

												<?php if (isset($this->usuario) && $this->usuario['perfil'] == "1") : ?>
													<!-- Admin -->
													<span class="badge badge-primary m-1" style="font-size: 12px">Administrador</span>
												<?php else : ?>
													<select name="perfil" id="perfil" class="form-control" required autocomplete="off">
														<?php if($usuario['perfil'] = "1") {
															echo "<option value='1'>Administrador</option>";
														}
														echo "<option value='0'>Usuário</option>";
														?>
													</select>
												<?php endif; ?>
											</div>
										</div>
									</div>
									
									<!-- Botões -->
									<div class="card-footer bg-transparent">
										<div class="mc-footer">
											<div class="row">
												<div class="col-lg-12">
													<button type="submit" id="salvarDados" class="btn btn-primary ladda-button m-1" data-style="expand-left">
														<span class="ladda-label">Salvar</span>
													</button>
													<a type="button" href="javascript:history.go(-1)" class="btn btn-secondary m-1">Cancelar</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	// Submete o formulário
	$("#frmUsuario").on("submit", function(e) {

		// Valida a senha
		if ($("#senha").val() != $("#confirmarSenha").val()) {
			e.preventDefault();
			toastr.warning("As senhas devem ser iguais", "Atenção");
		}

		// Valida a unicidade do e-mail
		var usuarioId = null;
		<?php if (isset($this->usuario)) echo "usuarioId = " . $this->usuario["id"] . ";\n"; ?>
		$.ajax({
			url: "?controle=usuario&acao=checar-email",
			method: "get",
			async: false,
			data: {
				id: usuarioId,
				email: $("[name=email]").val()
			},
			success: function(rs) {
				if (rs == "0") {

					// E-mail em uso
					e.preventDefault();
					toastr.warning("Esse e-mail já está cadastrado. Utilize outro.", "Atenção");
				}
			}
		});
	});
</script>