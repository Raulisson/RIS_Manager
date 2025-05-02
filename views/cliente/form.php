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
					<form id="frmcliente" method="post" action="index.php?controle=cliente&acao=salvar" autocomplete="off">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3"> <?php echo (isset($this->cliente)) ? "Edição" : "Cadastro" ?></div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->cliente))
																						echo $this->cliente['id'] ?>" />

											<!-- Nome -->
											<div class="form-group col-md-6">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Nome:</label>
												<input type="text" class="form-control" name="nome" id="nome" value="<?php if (isset($this->cliente))
																															echo $this->cliente['nome'] ?>" required maxlength="50">
											</div>

											<!-- E-mail -->
											<div class="form-group col-md-6">
												<label for="email" class="ul-form__label p-0"><span>*</span> E-mail:</label>
												<input type="email" class="form-control" name="email" id="email" value="<?php if (isset($this->cliente)) echo $this->cliente['email'] ?>" required maxlength="100">
												<div id="erro-email" class="text-danger small mt-1"></div>
											</div>
										</div>

										<div class="row mt-3">
											
											<!-- Número -->
											<div class="form-group col-md-6">
												<label for="numero" class="ul-form__label p-0"><span>*</span> Número:</label>
												<input type="text" class="form-control" name="numero" id="numero" value="<?php if (isset($this->cliente))
																															echo $this->cliente['numero'] ?>" required maxlength="50">
											</div>

											<!-- Empresa -->
											<div class="form-group col-md-6">
												<label for="empresa" class="ul-form__label p-0"><span>*</span> Empresa:</label>
												<input type="empresa" class="form-control" name="empresa" id="empresa" value="<?php if (isset($this->cliente))
																															echo $this->cliente['empresa'] ?>" required maxlength="100">
											</div>
										</div>



										<div class="row">

											<!-- Vendedor -->
											<div class="form-group col-md-6 campo-grupo">
												<label for="vendedor_id" class="ul-form__label p-0"><span>*</span> Vendedor:</label>
												<select name="vendedor_id" id="vendedor_id" class="form-control"  autocomplete="off">
													<option value="">Sem vendedor</option>
													<?php foreach($this->vendedores as $vendedor): ?>
														<option value="<?= htmlspecialchars($vendedor['id']) ?>" 
															<?= isset($cliente['vendedor_id']) && $cliente['vendedor_id'] == $vendedor['id'] ? 'selected' : '' ?>>
															<?= htmlspecialchars($vendedor['nome']) ?>
														</option>
													<?php endforeach; ?>
												</select>
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
	$("#frmcliente").on("submit", function(e) {
		var clienteId = null;
		<?php if (isset($this->cliente)) echo "clienteId = " . $this->cliente["id"] . ";\n"; ?>

		// Limpa mensagem anterior
		$("#erro-email").text("");

		$.ajax({
			url: "?controle=cliente&acao=checar-email",
			method: "get",
			async: false,
			data: {
				id: clienteId,
				email: $("[name=email]").val()
			},
			success: function(rs) {
				if (rs == "0") {
					e.preventDefault();
					$("#erro-email").text("Esse e-mail já está cadastrado. Utilize outro.");
				}
			}
		});
	});
</script>
