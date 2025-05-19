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
					<form id="frmvendedor" method="post" action="index.php?controle=vendedor&acao=salvar" autocomplete="off">
						<div class="row">
							<div class="col-md-12">
								<div class="card mb-4">
									<div class="card-body">
										<div class="card-title mb-3"> <?php echo (isset($this->vendedor)) ? "Adicionando Venda / Edição de cadastro" : "Cadastro" ?></div>
										<div class="row mt-3">
											<input type="hidden" name="id" value="<?php if (isset($this->vendedor))
																						echo $this->vendedor['id'] ?>" />

											<!-- Nome -->
											<div class="form-group col-md-6">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Nome:</label>
												<input   type="text" placeholder="Nome do vendedor" class="form-control" name="nome" id="nome" value="<?php if (isset($this->vendedor))
																															echo $this->vendedor['nome'] ?>" required maxlength="50">
											</div>
											<!-- Usuario -->
											<div class="form-group col-md-6 campo-grupo">
												<label for="usuario_id" class="ul-form__label p-0"><span>*</span> Selecione o usuario do vendedor:</label>
												<select  name="usuario_id" id="usuario_id" class="form-control"  autocomplete="off">
													
													<?php foreach($this->usuarios as $usuario): ?>
														<option value="<?= htmlspecialchars($usuario['id']) ?>" 
															<?= isset($this->vendedor['id_usuario']) && $this->vendedor['id_usuario'] == $usuario['id'] ? 'selected' : '' ?>>
															<?= htmlspecialchars($usuario['nome']) ?>
														</option>
													<?php endforeach; ?>
												</select>
											</div>

											<!-- Dias para pos venda -->
											<div class="form-group col-md-5">
												<label for="nome" class="ul-form__label p-0"><span>*</span> Quantidade de dias para entrar em contato na pós venda:</label>
												<input   type="number"  class="form-control" name="dias_pos_venda" id="dias_pos_venda" value="<?php if (isset($this->vendedor))
																															echo $this->vendedor['dias_pos_venda'] ?>" required maxlength="50">
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
	$("#frmvendedor").on("submit", function(e) {
		var vendedorId = null;
		<?php if (isset($this->vendedor)) echo "vendedorId = " . $this->vendedor["id"] . ";\n"; ?>

		// Limpa mensagem anterior
		$("#erro-email").text("");

		$.ajax({
			url: "?controle=vendedor&acao=checar-email",
			method: "get",
			async: false,
			data: {
				id: vendedorId,
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
<script>
$(document).ready(function() {
	function toggleDataEncerramento() {
		let situacao = $('#situacao').val();
		if (situacao === "1") {
			$('#encerramento-wrapper').slideDown();
		} else {
			$('#encerramento-wrapper').slideUp();
			$('#data_encerramento').val('');
		}
	}

	// Executa ao carregar a página
	toggleDataEncerramento();

	// Executa ao mudar o select
	$('#situacao').on('change', toggleDataEncerramento);
});
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js"></script>
<script>
    $(document).ready(function(){
        $('#cnpj').mask('00.000.000/0000-00');
    });
	$(document).ready(function(){
        $('#numero').mask('(00)00000-0000');
    });
</script>

